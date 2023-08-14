package inventory.project

import grails.transaction.Transactional

class ItemController {

    def itemService

    def create() {
    }

    def index() {
        def items = itemService.getAllItems()
        [items: items]
    }

    // add multiple items
    def addItems() {
        render(view: "addItemForm")
    }

    def saveItems() {
        def params = params
        itemService.saveItemsWithTransactions(params)

        redirect action: "index"
    }

    def save() {
        def categoryName = params.categoryName
        def itemName = params.itemName
        def description = params.itemDescription
        def quantity = params.itemQuantity

        def result = itemService.addNewItem(categoryName, itemName, description, quantity)
        flash.message = result

        redirect(action: "index")
    }

    def edit(Long id) {
        def item = Item.get(id)
        [items: item]
    }

    def update(Long id) {
        def itemName = params.itemName
        def description = params.itemDescription
        def quantity = params.itemQuantity as int

        def result = itemService.editItem(id, itemName, description, quantity)
        flash.message = result

        redirect(action: "index")
    }

    def delete(Long id) {
        def item = Item.get(id)
        render(view: "delete", model: [item: item])
    }

    def deleteConfirmed(Long id) {
        def result = itemService.deleteItem(id)
        flash.message = result

        redirect(action: "index")
    }

    def inout(Long id) {
        def item = Item.get(id)
        [items: item]
    }

}
