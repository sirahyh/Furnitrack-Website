package inventory.project

import grails.transaction.Transactional

@Transactional
class TransactionService {

    // get data transaction
    def getAllTransaction(){
        return Transaction.list()
    }
}
