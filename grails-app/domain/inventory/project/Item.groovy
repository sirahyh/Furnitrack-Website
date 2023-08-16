package inventory.project

class Item {

    String itemName
    String description
    int quantity

    static belongsTo = [category: Category]
    static hasMany = [transaction: Transaction]

    static constraints = {
        itemName blank: false
        quantity min: 0
    }
}




