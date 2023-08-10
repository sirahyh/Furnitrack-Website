package inventory.project

class ItemService {

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
