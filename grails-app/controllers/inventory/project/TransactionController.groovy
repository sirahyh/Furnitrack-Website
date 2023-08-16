package inventory.project

class TransactionController {

    def transactionService

    def index() {
        def transactions = transactionService.getTransactionsWithItemNames()
        [transactions: transactions]
    }


    def addTransaction() {
        def itemId = params.inputItemId
        def transactionType = params.transactionType
        def transactionQuantity = params.transactionQuantity

        def result = transactionService.addTransactionOfItem(itemId as Long, transactionType, transactionQuantity as int)
        flash.message = result

        redirect(action: "index")
    }

}
