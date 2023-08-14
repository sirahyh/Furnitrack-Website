package inventory.project

import grails.transaction.Transactional

@Transactional
class TransactionService {

    // get data transaction
    def getAllTransaction(){
        return Transaction.list()
    }

    // add transaction
    def addTransaction( String itemName, String transactionType, int qty) {
        def item = Item.findOrCreateWhere(itemName: itemName)
        item.save()

        def transaction = new Transaction(transactionType: transactionType, quantity: qty, transactionDate: new Date())
        transaction.item = item

        if (transaction.save()) {
            return "Barang berhasil disimpan"
        } else {
            return "Gagal menyimpan barang"
        }
    }
}
