package inventory.project

import grails.transaction.Transactional

@Transactional
class TransactionService {

    // get data transaction
    def getAllTransaction(){
        return Transaction.list()
    }

    // ADD TRANSACTION
    def addTransactionOfItem(Long idItem, String transactionType, int transactionQuantity) {

        def item = Item.get(idItem)

        if (item) {
            def transaction = new Transaction(item: idItem, transactionType: transactionType, quantity: transactionQuantity, transactionDate: new Date())

            transaction.save()

            if (transactionType == "IN") {
                println "transaksi termasuk masuk"
                item.quantity += transactionQuantity
                item.save()
            } else if (transactionType == "OUT") {
                if (item.quantity >= transactionQuantity) {
                   item.quantity -= transactionQuantity
                    item.save()
                } else {
                    println("Barang keluar harus lebih kecil dari barang yang tersedia")
                    return "Barang keluar harus lebih kecil dari barang yang tersedia"
                }
            }
        }
    }

    // GET DATA FROM TABLE JOIN ITEM AND TRANSACTION
    def getTransactionsWithItemNames() {
        Transaction.createCriteria().list {
            createAlias('item', 'i')
            projections {
                property('i.itemName')
                property('transactionType')
                property('quantity')
                property('transactionDate')
            }
            order('transactionDate', 'desc')
        }
    }
}
