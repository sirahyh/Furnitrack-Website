package inventory.project


import model.request.ReqItemCommand
import model.response.itemListItem
import grails.plugin.springsecurity.annotation.Secured

class ItemController {

    def itemService

    @Secured('ROLE_ADMIN')
    def create() {
    }

    @Secured('ROLE_ADMIN')
    def insert(){

    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index() {
        List<itemListItem> items = itemService.getListItems()
        [items: items]
    }


    def addItems() {
        render(view: "create")
    }

    @Secured('ROLE_ADMIN')
    def saveItems() {
        def itemData = request.JSON // Mendapatkan data JSON dari permintaan

        // Mendapatkan nama file gambar dari data
        def imageName = itemData.image
        println "isi dari request.json : ${itemData}"
        println "isi dari imageName : ${imageName}"

        // Lakukan sesuatu dengan data (simpan ke database, dll.)

        def response = [message: "Data and image processed successfully"]


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


    @Secured('ROLE_ADMIN')
    def saveOneItem(ReqItemCommand itemCommand) {

        def response = itemService.addNewItem(itemCommand, request)
        if (response) {
            flash.message = response
            redirect(action: 'index')
        }
    }

    @Secured('ROLE_ADMIN')
    def update(ReqItemCommand itemCommand) {
        if (itemCommand.validate()) {
            def result = itemService.editItem(itemCommand, request)
            flash.message = result

            redirect(action: "index")
        } else {
            render view: 'itemForm', model: [itemCommand: itemCommand]
        }

    }

    @Secured('ROLE_ADMIN')
    def deleteConfirmed(ReqItemCommand itemCommand) {
        if (itemCommand.validate()) {
            def result = itemService.deleteItem(itemCommand.id)
            flash.message = result

            redirect(action: "index")
        }
    }

    // Search Data By Category
    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
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
