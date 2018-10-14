//
// Created by mason on 10/09/18.
//

#include "../Twopl/Twopl.h"
#include "rdma_utils.h"


void handleTransaction(struct ibv_qp *qp, struct ibv_mr *mr, struct ibv_cq *txcq, char *txbuf, size_t txbufsize, TwoplServer* twoplServer, Transaction transaction){
    TransactionResult result = twoplServer->handle(transaction);
    size_t t = putResultToBuffer(result, txbuf);
    ibPostSendAndWait(qp, mr, txbuf, t, txcq);
}

static void RdmaTwoplClient(struct ibv_qp *qp, struct ibv_mr *mr, struct ibv_cq *rxcq, char *rxbuf, size_t rxbufsize, struct ibv_cq *txcq, char *txbuf, size_t txbufsize)
{
    Transaction *transaction = new Transaction;
    std::string outputString;
    srand(time(NULL));
    for(int i = 0; i < COMMMAND_PER_TRANSACTION; i ++){
        Command command = generateCommand();
        transaction->commands.push_back(command);
        char buffer[1024];
        sprintf(buffer, " %s: , key: %s, value: %s \n", (command.operation == WRITE? "WRITE": "READ"), command.key.c_str(), command.value.c_str());
        outputString += std::string(buffer);
    }
    printf("%s", outputString.c_str());

    int size = putTransactionToBuffer(transaction, txbuf);
    ibPostSendAndWait(qp, mr, txbuf, size, txcq);
    struct ibv_wc iwc;
    while (ibv_poll_cq(rxcq, 1, &iwc) < 1)
        ;
    std::cout << "GET RESULT" << std::endl;
    if (iwc.status != IBV_WC_SUCCESS) {
        fprintf(stderr, "ibv_poll_cq returned failure\n");
        exit(1);
    }
    TransactionResult result = getResultFromBuffer(rxbuf, iwc.byte_len);
    for(auto i : result.results){
        std::printf("result: %s \n", i.c_str());
    }

}



static void RdmaTwoplServer(struct ibv_qp *qp, struct ibv_mr *mr, struct ibv_cq *rxcq, char *rxbuf, size_t rxbufsize, struct ibv_cq *txcq, char *txbuf, size_t txbufsize)
{
    TwoplServer *twoplServer = new TwoplServer;

    while (1) {
        // receive first
        struct ibv_wc iwc;
        while (ibv_poll_cq(rxcq, 1, &iwc) < 1)
            ;
        if (iwc.status != IBV_WC_SUCCESS) {
            fprintf(stderr, "ibv_poll_cq returned failure\n");
            exit(1);
        }

        // now respond
        std::cout << "receive : \n" << rxbuf;
        Transaction transaction = getTransactionFromBuffer(rxbuf, iwc.byte_len);
        std::thread t1(handleTransaction, qp, mr, txcq, txbuf, txbufsize, twoplServer, transaction);
        t1.detach();
    }

    printf("server exiting...\n");
}

void RdmaTwoplTest(int argv, char* args[]){
    rdma_test(argv, args, RdmaTwoplServer, RdmaTwoplClient);
}