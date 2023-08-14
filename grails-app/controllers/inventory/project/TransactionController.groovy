package inventory.project

class TransactionController {

    def transactionService

    def index() {
        def transaction = transactionService.getAllTransaction()
        model : [transactions : transaction]
    }

    def addTransactionData(){
        def transactionType = params.transactionType
        def quantity = params.itemQuantity

        def result = transactionService.addTransaction(transactionType, quantity)
        flash.message = result

        redirect(action: "index")
    }
}
