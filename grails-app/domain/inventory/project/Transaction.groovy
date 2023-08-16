package inventory.project

class Transaction {

    String transactionType
    int quantity
    Date transactionDate

    static belongsTo = [item: Item]

    static constraints = {
        quantity min: 0
    }
}
