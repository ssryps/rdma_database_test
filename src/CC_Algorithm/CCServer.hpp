//
// Created by mason on 11/20/18.
//

#ifndef RDMA_MEASURE_CCSERVER_HPP
#define RDMA_MEASURE_CCSERVER_HPP

#include <utils.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <zconf.h>
#include <iostream>

class CCServer {
public:
//    CCServer(){}
    virtual TransactionResult handle(Transaction* transaction) = 0;
    virtual int run() = 0;


protected:
    // primitive

    int server_id;
    int buf_sz;



    virtual bool write  (int mach_id, int type, idx_key_t key, char* value, int sz){}
    virtual bool read(int mach_id, int type, idx_key_t key, char *value, int *sz){}
    virtual bool send_i(int mach_id, int type, char *buf, int sz, comm_identifer ident) {}
    virtual bool recv_i(int *mach_id, int *type, char **buf, int *sz, comm_identifer ident) {}
    virtual bool compare_and_swap(int mach_id, int type, idx_key_t key, idx_value_t old_value, idx_value_t new_value){}



    bool checkGrammar(Transaction* transaction){
        int *vali = new int[transaction->commands.size()];
        memset(vali, 0, transaction->commands.size() * sizeof(int));

        for(int i = 0; i < transaction->commands.size(); i++){
            Command command = transaction->commands[i];
            switch(command.operation){
                case ALGO_READ: {
                    vali[i] = 1;
                    break;
                }
                case ALGO_WRITE: {
                    bool r_1 = (command.read_result_index_1 < 0 || (command.read_result_index_1 < i && vali[command.read_result_index_1] == 1));
                    if(!r_1)return false;
                    break;
                }
                case ALGO_SUB:
                case ALGO_ADD: {
                    bool r_1 = (command.read_result_index_1 < 0 || (command.read_result_index_1 < i && vali[command.read_result_index_1] == 1)),
                         r_2 = (command.read_result_index_2 < 0 || (command.read_result_index_2 < i && vali[command.read_result_index_2] == 1));
                    if(!r_1 || !r_2)return false;
                    vali[i] = 1;
                    break;
                }
            }
        }
        return true;
    }




};

#endif //RDMA_MEASURE_CCSERVER_HPP
