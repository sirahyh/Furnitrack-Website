package inventory.project

class TransactionController {

    def transactionService

    def index() {
        def transaction = transactionService.getAllTransaction()
        [transactions : transaction]
    }

    def addTransactionData(){
        def transactionType = params.transactionType
        def quantity = params.itemQuantity

        def result = transactionService.addTransaction(transactionType as String, quantity as int)
        flash.message = result

        redirect(action: "index")
    }
}
