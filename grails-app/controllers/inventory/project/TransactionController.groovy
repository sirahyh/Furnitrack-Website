package inventory.project

import grails.plugin.springsecurity.annotation.Secured
import model.request.ReqTransactionCommand
import model.response.transactionList

class TransactionController {

    def transactionService

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index() {
        List<transactionList> transaction = transactionService.getListTransaction()
        [transactions: transaction]
    }

    @Secured('ROLE_ADMIN')
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
