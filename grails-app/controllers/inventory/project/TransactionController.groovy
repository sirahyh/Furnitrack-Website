package inventory.project

import model.request.ReqTransactionCommand
import model.response.transactionList

class TransactionController {

    def transactionService

    def index() {
        List<transactionList> transaction = transactionService.getListTransaction()
        [transactions: transaction]
    }

    def addTransaction(ReqTransactionCommand transactionCommand) {
        def result = transactionService.addTransactionOfItem(transactionCommand)
        if (result == "Outgoing items must be less than available items") {
            flash.errorMessage = result
            render(view: 'error', model: [message: result])
            return
        }

        redirect(action: "index")
    }
}
