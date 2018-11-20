//
// Created by mason on 9/30/18.
//

#include <assert.h>
#include "Twopl.h"

bool TwoplServer::write(int mach_id, int type, idx_key_t key, idx_value_t entry){
#ifdef RDMA
    return rdma_write(mach_id, type, key, entry);
#else
    return pthread_write(mach_id, type, key, entry);
#endif
}


bool TwoplServer::read(int mach_id, int type, idx_key_t key, idx_value_t* entry){
#ifdef RDMA
    return rdma_read(mach_id, type, key, entry);
#else
    return pthread_read(mach_id, type, key, entry);
#endif
}

bool TwoplServer::compare_and_swap  (int mach_id, int type, idx_key_t key, idx_value_t old_value, idx_value_t new_value){
#ifdef RDMA
    return rdma_compare_and_swap(mach_id, type, key, old_value, new_value);
#else
    return pthread_compare_and_swap(mach_id, type, key, old_value, new_value);
#endif

}

bool TwoplServer::send(int mach_id, int type, idx_key_t key, idx_value_t value){
#ifdef RDMA
    return rdma_send(mach_id, type, key, value);
#else
    return pthread_send(mach_id, type, key, value);
#endif
}

bool TwoplServer::recv(int mach_id, int type, idx_key_t key, idx_value_t* value){
#ifdef RDMA
    return rdma_recv(mach_id, type, key, value);
#else
    return pthread_recv(mach_id, type, key, value);
#endif
}


bool TwoplServer::rdma_read(int mach_id, int type, idx_key_t key, idx_value_t* value){
    *value =
    return true;
}

bool TwoplServer::rdma_write(int mach_id, int type, idx_key_t key, idx_value_t value){
    return true;
}


bool TwoplServer::rdma_compare_and_swap(int mach_id, int type, idx_key_t key, idx_value_t old_value, idx_value_t new_value){
    return true;
}

//bool TwoplServer::rdma_fetch_and_add(int mach_id, int type, idx_key_t key) {
//    return true;
//}

bool TwoplServer::pthread_read(int mach_id, int type, idx_key_t key, idx_value_t* value) {
    TwoplDataBuf* des_buf = reinterpret_cast<TwoplDataBuf*>(this->global_buf[mach_id]);
    switch (type) {
        case TWOPL_DATA_LOCK: {
            *value = des_buf->lockBuf[key % MAX_DATA_PER_MACH];
            break;
        }
        case TWOPL_DATA_VALUE: {
            *value = des_buf->valueBuf[key % MAX_DATA_PER_MACH];
            break;
        }
    }
}

bool TwoplServer::pthread_write(int mach_id, int type, idx_key_t key, idx_value_t value) {
    TwoplDataBuf* des_buf = reinterpret_cast<TwoplDataBuf*>(this->global_buf[mach_id]);
    switch (type) {
        case TWOPL_DATA_LOCK: {
            des_buf->lockBuf[key % MAX_DATA_PER_MACH] = value;
            break;
        }
        case TWOPL_DATA_VALUE: {
            des_buf->valueBuf[key % MAX_DATA_PER_MACH] = value;
            break;
        }
    }
}

bool TwoplServer::pthread_compare_and_swap(int mach_id, int type, idx_key_t key, idx_value_t old_value, idx_value_t new_value) {
    TwoplDataBuf* des_buf = reinterpret_cast<TwoplDataBuf*>(this->global_buf[mach_id]);
    switch (type) {
        case TWOPL_DATA_LOCK: {
            __sync_bool_compare_and_swap(&(des_buf->lockBuf[key % MAX_DATA_PER_MACH]), old_value, new_value);
            break;
        }
        case TWOPL_DATA_VALUE: {
            __sync_bool_compare_and_swap(&(des_buf->valueBuf[key % MAX_DATA_PER_MACH]), old_value, new_value);
            break;
        }
    }
}

//bool TwoplServer::pthread_fetch_and_add(int mach_id, int type, idx_key_t key) {
//
//}

bool TwoplServer::put(idx_key_t key, TwoplEntry *entry) {
#ifdef TWO_SIDE

#else
    return write(get_machine_index(key), 1, key % MAX_DATA_PER_MACH, entry->value);
#endif
}

bool TwoplServer::get(idx_key_t key, TwoplEntry* entry) {
#ifdef TWO_SIDE

#else
    return read(get_machine_index(key), 1, key % MAX_DATA_PER_MACH, &(entry->value));
#endif
}

bool TwoplServer::lock(idx_key_t key) {
#ifdef TWO_SIDE

#else
    idx_value_t lock;
    while(true) {
        if(!read(get_machine_index(key), TWOPL_DATA_LOCK, key % MAX_DATA_PER_MACH, &lock))return false;
        if(lock == 0){
            if(compare_and_swap(get_machine_index(key), TWOPL_DATA_LOCK, key % MAX_DATA_PER_MACH, 0, 1))break;
        }
    }
    return true;
#endif
}

bool TwoplServer::unlock(idx_key_t key) {
    #ifdef TWO_SIDE

    #else
        return compare_and_swap(get_machine_index(key), TWOPL_DATA_LOCK, key, 1, 0);
    #endif
}


#ifdef RDMA

#else
bool TwoplServer::init(int id, char **buf, size_t sz) {
    this->server_id = id;
    this->global_buf = buf;
    assert(sz >= sizeof(TwoplDataBuf));
    return OK;
}
#endif

TransactionResult TwoplServer::handle(Transaction transaction) {

    TransactionResult results;
    std::set<idx_key_t > keys;

    if(!checkGrammar(transaction)){
        results.isSuccess = false;
        return results;
    }


    for (Command command : transaction.commands) { keys.insert(command.key); }
    for(auto i = keys.begin(); i != keys.end(); i++){ lock(*i); }

    idx_value_t * temp_result = new idx_value_t[transaction.commands.size()];
    for (int i = 0; i < transaction.commands.size(); i++) {
        Command command = transaction.commands[i];
        TwoplEntry *entry;
        switch (command.operation) {
            case WRITE : {
                idx_value_t r = value_from_command(command, temp_result);
                entry->value = r;
                put(command.key, entry);
                results.results.push_back(r);
                break;
            }
            case READ: {
                get(command.key, entry);
                temp_result[i] = entry->value;
                results.results.push_back(entry->value);
                break;
            }
            case ALGO_ADD:
            case ALGO_SUB: {
                idx_value_t r = value_from_command(command, temp_result);
                temp_result[i] = r;
                results.results.push_back(r);
                break;
            }
        }
    }

    for(auto i = keys.begin(); i != keys.end(); i++){ unlock(*i); }

    results.isSuccess = true;

    return results;
}

int TwoplServer::run() {
#ifdef TWO_SIDE
#else


#endif
}