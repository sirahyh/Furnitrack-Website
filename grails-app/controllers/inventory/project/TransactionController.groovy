package inventory.project

class TransactionController {

    def transactionService

    def index() {
        def transaction = transactionService.getAllTransaction()
        model : [transactions : transaction]
    }
}
