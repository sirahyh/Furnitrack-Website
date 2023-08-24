package inventory.project


import model.request.ReqItemCommand
import model.response.itemListItem

class ItemController {

    def itemService

    def create() {
    }

    def insert(){

    }

    def index() {
        List<itemListItem> items = itemService.getListItems()
        [items: items]
    }

    def addItems() {
        render(view: "create")
    }

    def saveItems() {
        def formData = request.JSON
        println "isi dari formData: ${formData}"

        def uploadedFiles = request.getUploadedFiles("itemImages")
        println "isi dari uploadFiles: ${uploadedFiles}"
        println "isi form data: ${formData}"
        formData.each {itemData ->
            itemService.addNewItem(itemData.category, itemData.name, itemData.description, itemData.quantity as int)
        }

        redirect(action: "index")

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

    def saveOneItem(ReqItemCommand itemCommand) {

        def response = itemService.addNewItem(itemCommand, request)
        if (response) {
            flash.message = response
            redirect(action: 'index')
        }
    }

    def update(ReqItemCommand itemCommand) {
        def result = itemService.editItem(itemCommand, request)
        flash.message = result

        redirect(action: "index")
    }

    def deleteConfirmed(ReqItemCommand itemCommand) {
        def result = itemService.deleteItem(itemCommand.id)
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
