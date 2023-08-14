package inventory.project

class ItemService {


    // ADD MULTIPLE ITEMS
//        def saveItemsWithTransactions(params) {
//        def categories = params.category
//        def itemNames = params.itemName
//        def descriptions = params.description
//        def quantities = params.quantity
//        def transactionType = "in"
//
//        for (int i = 0; i < itemNames.size(); i++) {
//            def category = Category.findOrCreateByName(categories[i])
//            def item = new Item(
//                    itemName: itemNames[i],
//                    description: descriptions[i],
//                    quantity: quantities[i],
//                    category: category
//            )
//            item.save()
//
//            def transaction = new Transaction(
//                    transactionType: transactionType,
//                    quantity: quantities[i],
//                    transactionDate: new Date(),
//                    item: item
//            )
//            transaction.save()
//        }
//    }
//

    // MULTIPLE ITEM
    def saveItemsWithTransactions(params) {
        def categoryNames = params.list('categoryName')
        def itemNames = params.list('itemName')
        def descriptions = params.list('description')
        def quantities = params.list('quantity')
        def transactionType = "in"

        for (int i = 0; i < itemNames.size(); i++) {
            def categoryName = categoryNames[i]
            def itemName = itemNames[i]
            def description = descriptions[i]
            def quantity = quantities[i]

            def category = Category.findOrCreateWhere(name: categoryName)
            def item = new Item(
                    name: itemName,
                    description: description,
                    quantity: quantity
            ).save()

            def transaction = new Transaction(
                    transactionType: transactionType,
                    quantity: quantity,
                    transactionDate: new Date(),
                    item: item
            ).save()

            category.addToItems(item)
        }
    }

    // add data item
    def addNewItem(String categoryName, String itemName, String desc, int qty){
        def category = Category.findOrCreateWhere(categoryName: categoryName)
        category.save()

        def item = new Item(itemName: itemName, description: desc, quantity: qty)
        item.category = category

        if (item.save()) {
            return "Barang berhasil disimpan"
        } else {
            return "Gagal menyimpan barang"
        }
    }

    // get data item
    def getAllItems(){
        return Item.list()
    }

    // edit data item
    def editItem(Long id, String itemName, String description, int quantity) {
        def item = Item.get(id)
        if (item) {
            item.itemName = itemName
            item.description = description
            item.quantity = quantity
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
