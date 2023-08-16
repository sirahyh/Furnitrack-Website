package inventory.project

class ItemService {

    // MULTIPLE ITEM
    def saveItemsFromFormData(List formData) {
        println "isi form data: ${formData}"
        formData.each { itemData ->

            def categoryName = itemData.category
            def category = Category.findOrCreateWhere(categoryName: categoryName)
            category.save()
            def item = new Item(
                    category: itemData.category,
                    itemName: itemData.name,
                    description: itemData.description,
                    quantity: itemData.quantity.toInteger()
            )
            item.category = category
            item.save(flush: true)

//            def category = Category.findByCategoryName(itemData.category)
//            def category = Category.findOrCreateWhere(itemData.category)
//            if (category) {
//                def item = new Item(
//                        category: category,
//                        itemName: itemData.name,
//                        description: itemData.description,
//                        quantity: itemData.quantity.toInteger()
//                )
//                item.save(flush: true)
//            } else {
//                println "Category not found for ${itemData.category}"
//            }
        }
    }

    // ADD ONE DATA ITEM
    def addNewItem(String categoryName, String itemName, String desc, int qty){
        def category = Category.findOrCreateWhere(categoryName: categoryName)
        category.save()

        def item = new Item(itemName: itemName, description: desc, quantity: qty)
        item.category = category

        if (item.save()) {
            def transaction = new Transaction(
                    transactionType: 'masuk',
                    quantity: qty,
                    transactionDate: new Date(),
                    item: item
            )

            if (transaction.save()) {
                return "Barang berhasil disimpan"
            } else {
                return "Gagal menyimpan transaksi"
            }
        } else {
            return "Gagal menyimpan barang"
        }
    }

    // get data item
    def getAllItems(){
        return Item.list()
    }

    // edit data item
    def editItem(Long id, String itemName, String description) {
        def item = Item.get(id)
        if (item) {
            item.itemName = itemName
            item.description = description
            item.save()
            return "Barang berhasil diupdate."
        } else {
            return "Barang tidak ditemukan."
        }
    }

    // delete data item
    def deleteItem(Long id) {
        def item = Item.get(id)

        if (item) {
            item.delete()
            return "Barang berhasil dihapus."
        } else {
            return "Barang tidak ditemukan."
        }
    }


}

