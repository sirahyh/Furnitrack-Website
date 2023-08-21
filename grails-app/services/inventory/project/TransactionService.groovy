package inventory.project

import grails.transaction.Transactional
import model.response.transactionList
import org.hibernate.transform.Transformers

@Transactional
class TransactionService {

    // GET TRANSACTION DATA
    List<transactionList> getListTransaction() {
        List<transactionList> transactions = Transaction.createCriteria().list {
            resultTransformer(Transformers.aliasToBean(transactionList))
            createAlias("item", "i")
            projections {
                property("i.itemName", "itemName")
                property("transactionType", "transactionType")
                property("transactionDate", "transactionDate")
                property("quantity", "quantity")
            }
        } as List<transactionList>
        return transactions
    }

    // ADD TRANSACTION
    def addTransactionOfItem(Long idItem, String transactionType, int transactionQuantity) {

        def item = Item.get(idItem)

        if (item) {
            def transaction = new Transaction(item: idItem, transactionType: transactionType, quantity: transactionQuantity, transactionDate: new Date())

            if (transactionType == "IN") {
                println "transaksi termasuk masuk"
                item.quantity += transactionQuantity
                item.save()
                transaction.save()
            } else if (transactionType == "OUT") {
                if (item.quantity >= transactionQuantity) {
                    item.quantity -= transactionQuantity
                    item.save()
                    transaction.save()
                } else {
                    return "Outgoing items must be less than available items"
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
