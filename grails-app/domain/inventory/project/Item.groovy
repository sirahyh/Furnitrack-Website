package inventory.project

class Item {

    String itemName
    String description
    int quantity
    String image

    static belongsTo = [category: Category]
    static hasMany = [transaction: Transaction]

    static constraints = {
        itemName blank: false
        quantity min: 0
        image(nullable: true, blank: true)
    }
}




