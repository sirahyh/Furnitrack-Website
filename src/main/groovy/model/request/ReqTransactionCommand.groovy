package model.request

class ReqTransactionCommand {
    Long itemId
    String transactionType
    int transactionQuantity

    static constraints = {
        itemId nullable: false
        transactionType inList: ['IN', 'OUT']
        transactionQuantity min: 1
    }
}
