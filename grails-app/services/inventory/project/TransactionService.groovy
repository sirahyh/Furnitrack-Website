package inventory.project

import grails.transaction.Transactional

@Transactional
class TransactionService {

    // get data transaction
    def getAllTransaction(){
        return Transaction.list()
    }

    // add transaction
    def addTransaction(String transactionType, int qty) {

            def transaction = new Transaction(transactionType: transactionType, quantity: qty, transactionDate: new Date())

            if (transaction.save()) {
                return "Barang berhasil disimpan"
            } else {
                return "Gagal menyimpan barang"
            }

    }
}
