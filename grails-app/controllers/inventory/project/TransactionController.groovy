package inventory.project

import model.response.itemListItem
import model.response.transactionList

class TransactionController {

    def transactionService

    def index() {
//        def transactions = transactionService.getTransactionsWithItemNames()
        List<transactionList> transaction = transactionService.getListTransaction()
        [transactions: transaction]
    }


    def addTransaction() {
        def itemId = params.inputItemId
        def transactionType = params.transactionType
        def transactionQuantity = params.transactionQuantity

        def result = transactionService.addTransactionOfItem(itemId as Long, transactionType, transactionQuantity as int)
        if (result == "Outgoing items must be less than available items") {
            flash.errorMessage = result
            render(view: 'error', model: [message: result])
            return
        }

        redirect(action: "index")
    }
}
