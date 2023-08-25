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

    void validate() {
        if (!itemName || itemName.trim().isEmpty()) {
            errors.rejectValue("itemName", "reqItemCommand.itemName.blank")
        }
        if (!description || description.trim().isEmpty()) {
            errors.rejectValue("itemDescription", "reqItemCommand.itemDescription.blank")
        }
    }
}
