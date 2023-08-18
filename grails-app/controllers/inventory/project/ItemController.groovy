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

    def addItems() {
        render(view: "create")
    }

    def saveItems() {
        def formData = request.JSON

        println "isi form data: ${formData}"
        formData.each {itemData ->
            itemService.addNewItem(itemData.category, itemData.name, itemData.description, itemData.quantity as int)
        }

        redirect(action: "index")


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

    def deleteConfirmed() {
        def itemId = params.hapusItemId
        def result = itemService.deleteItem(itemId as Long)
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

    // Search Data By Category
    def search() {
        def keyword = params.keyword

        def items = itemService.searchData(keyword as String)

        render(view: 'index', model: [items: items])
    }
}
