package inventory.project

import model.response.itemListItem
import org.hibernate.sql.JoinType
import org.hibernate.transform.ResultTransformer
import org.hibernate.transform.Transformers

class ItemService {

//    List<itemListItem> getListItems() {
//        List<itemListItem> items = Item.createCriteria().list {
//            resultTransformer(Transformers.aliasToBean(itemListItem))
//            createAlias("transaction", "t", JoinType.LEFT_OUTER_JOIN)
//            projections {
//                property("t.id", "id")
//                property("itemName", "itemName")
//            }
//        } as List<itemListItem>
//        return items
//    }

    List<itemListItem> getListItems() {
        List<itemListItem> items = Item.createCriteria().list {
            resultTransformer(Transformers.aliasToBean(itemListItem))
            projections {
                property("itemName", "itemName")
                property("description", "description")
                property("quantity", "quantity")
            }
        } as List<itemListItem>
        return items
    }

    // ADD ONE DATA ITEM
    def addNewItem(String categoryName, String itemName, String desc, int qty){
        def category = Category.findOrCreateWhere(categoryName: categoryName)
        category.save()

        def item = new Item(itemName: itemName, description: desc, quantity: qty)
        item.category = category

        if (item.save()) {
            def transaction = new Transaction(
                    transactionType: 'IN',
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

    // Find data by Category
    def searchData(String keyword){
        def category = Category.findByCategoryName(keyword)

        def itemsInfo
        if (category) {
            itemsInfo = category.items.collect { [itemName: it.itemName, description: it.description, quantity: it.quantity] }
            return itemsInfo
        } else {
            return "Category not found"
        }
    }
}

