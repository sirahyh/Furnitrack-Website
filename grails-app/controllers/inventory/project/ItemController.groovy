package inventory.project

import grails.transaction.Transactional
import model.request.ReqItem
import model.response.itemListItem
import org.springframework.http.HttpStatus

class ItemController {

    def itemService

    def create() {
    }

    def insert(){

    }

    def index() {
//        def items = itemService.getAllItems()
        List<itemListItem> items = itemService.getListItems()
        [items: items]
    }

    def addItems() {
        render(view: "create")
    }

//    def saveItems() {
//        def formData = request.JSON
//
//        println "isi form data: ${formData}"
//        formData.each {itemData ->
//            itemService.addNewItem(itemData.category, itemData.name, itemData.description, itemData.quantity as int)
//        }
//
//        redirect(action: "index")
//
//
//    }

//    def saveOneItem() {
//        def categoryName = params.categoryName
//        def itemName = params.itemName
//        def description = params.itemDescription
//        def quantity = params.itemQuantity
//
//        def result = itemService.addNewItem(categoryName, itemName, description, quantity as int)
//        flash.message = result
//
//        redirect(action: "index")
//    }

    def saveOneItem() {

        def categoryName = params.categoryName
        def itemName = params.itemName
        def description = params.itemDescription
        def quantity = params.itemQuantity

        def response = itemService.addNewItem(categoryName, itemName, description, quantity as int, request)
        if (response) {
            redirect(action: 'index')
        }
//        if (response.isSuccess) {
//            flash.message = AppUtil.infoMessage(g.message(code: "saved"))
//            redirect(controller: "item", action: "index")
//        } else {
//            flash.redirectParams = response.model
//            flash.message = AppUtil.infoMessage(g.message(code: "unable.to.save"), false)
//            redirect(controller: "item", action: "insert")
//        }

    }

    def edit(Long id) {
        def item = Item.get(id)
        model: [items: item]
    }

    // Kode Update Kak Ilham
//    def update(ReqItem reqItem) {
//        def itemId = params.id
//        def itemName = params.itemName
//        def description = params.itemDescription
//        if (reqItem.hasErrors()) {
//            render status: HttpStatus.BAD_REQUEST
//            return
//        }
//
//        def result = itemService.editItem(reqItem.id, reqItem.itemName, reqItem.description)
//        flash.message = result
//
//        redirect(action: "index")
//    }

    def update() {
        def itemId = params.id
        def itemName = params.itemName
        def description = params.itemDescription

        def result = itemService.editItem(itemId as Long, itemName, description, request)
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

    // Search Data By Category
    def search() {
        def keyword = params.keyword

        def items = itemService.searchData(keyword as String)

        if (items == "Category not found") {
            render(view: '/transaction/error', model: [message: items])
        } else {
            render(view: 'index', model: [items: items])
        }

    }
}
