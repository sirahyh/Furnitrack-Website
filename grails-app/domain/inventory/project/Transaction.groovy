package inventory.project

class Transaction {

    String transactionType
    int quantity
    Date transactionDate = new Date()

    static belongsTo = Item
    static hasMany = [item: Item]

    static constraints = {
        transactionType inList: ['masuk', 'keluar']
        quantity min: 0
    }
}