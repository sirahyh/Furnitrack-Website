package model.request

class ReqItemCommand {
    Long id
    String category
    String itemName
    String description
    int quantity

    static constraints = {
        itemName blank: false
        description blank: true
    }
}
