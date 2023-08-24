package inventory.project

import grails.transaction.Transactional
import model.request.ReqTransactionCommand
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
            order('transactionDate', 'desc')
        } as List<transactionList>
        return transactions
    }

    // ADD TRANSACTION
    def addTransactionOfItem(ReqTransactionCommand transactionCommand) {
        def item = Item.get(transactionCommand.itemId)

        if (item) {
            def transaction = new Transaction(
                    item: item,
                    transactionType: transactionCommand.transactionType,
                    quantity: transactionCommand.transactionQuantity,
                    transactionDate: new Date()
            )

            if (transaction.transactionType == "IN") {
                println "transaksi termasuk masuk"
                item.quantity += transactionCommand.transactionQuantity
                item.save()
                transaction.save()
            } else if (transaction.transactionType == "OUT") {
                if (item.quantity >= transactionCommand.transactionQuantity) {
                    item.quantity -= transactionCommand.transactionQuantity
                    item.save()
                    transaction.save()
                } else {
                    return "Outgoing items must be less than available items"
                }
            }
        }
    }

}
