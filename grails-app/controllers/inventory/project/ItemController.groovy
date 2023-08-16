package inventory.project

import grails.transaction.Transactional

class ItemController {

    def itemService
    def transactionService

    def create() {
    }

    def insert(){

    }

    def index() {
        def items = itemService.getAllItems()
        model: [items: items]
    }

    // add multiple items
//    def addItems() {
//        render(view: "addItemForm")
//    }

//    def saveItems() {
//        def params = params
//        itemService.saveItemsWithTransactions(params)
//
//        redirect action: "index"
//    }

    def addItems() {
        render(view: "create")
    }

    def saveItems() {
        def formData = request.JSON

        itemService.saveItemsFromFormData(formData)
        redirect action: 'index'
    }

    def saveOneItem() {
        def categoryName = params.categoryName
        def itemName = params.itemName
        def description = params.itemDescription
        def quantity = params.itemQuantity

        def result = itemService.addNewItem(categoryName, itemName, description, quantity as int)
        flash.message = result

        redirect(action: "index")
    }

    def edit(Long id) {
        def item = Item.get(id)
        model: [items: item]
    }

    def update() {
        def itemId = params.id
        def itemName = params.itemName
        def description = params.itemDescription

        def result = itemService.editItem(itemId as Long, itemName, description)
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

//     Input Transaction
    def inputTransaction() {
        def itemName = params.itemName
        def transactionType = params.categoryName
        def quantity = params.itemQuantity.toInteger()

        def result = transactionService.createTransaction(itemName, transactionType, quantity)

        if (result) {
            flash.message = "Transaksi berhasil disimpan."
        } else {
            flash.message = "Gagal menyimpan transaksi."
        }

        redirect(action: 'index')
    }

}
