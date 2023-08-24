package inventory.project

import com.FileUtil
import model.request.ReqItemCommand
import model.response.itemListItem
import org.hibernate.transform.Transformers

import javax.servlet.http.HttpServletRequest

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
                property("id", "id")
                property("itemName", "itemName")
                property("description", "description")
                property("quantity", "quantity")
                property("image", "image")
            }
        } as List<itemListItem>
        return items
    }

    // ADD ONE DATA ITEM
//    def addNewItem(String categoryName, String itemName, String desc, int qty){
//        def category = Category.findOrCreateWhere(categoryName: categoryName)
//        category.save()
//
//        def item = new Item(itemName: itemName, description: desc, quantity: qty)
//        item.category = category
//
//        if (item.save()) {
//            def transaction = new Transaction(
//                    transactionType: 'IN',
//                    quantity: qty,
//                    transactionDate: new Date(),
//                    item: item
//            )
//
//            if (transaction.save()) {
//                return "Barang berhasil disimpan"
//            } else {
//                return "Gagal menyimpan transaksi"
//            }
//        } else {
//            return "Gagal menyimpan barang"
//        }
//    }

//    def addNewItem(String categoryName, String itemName, String desc, int qty, HttpServletRequest request){
//        def category = Category.findOrCreateWhere(categoryName: categoryName)
//        category.save()
//
//        def item = new Item(itemName: itemName, description: desc, quantity: qty)
//        item.category = category
//
//        if (item.save()) {
//            if (!item.hasErrors()){
//                uploadImage(item, request)
//
//                def transaction = new Transaction(
//                        transactionType: 'IN',
//                        quantity: qty,
//                        transactionDate: new Date(),
//                        item: item
//                )
//
//                if (transaction.save()) {
//                    return "Barang berhasil disimpan"
//                } else {
//                    return "Gagal menyimpan transaksi"
//                }
//            }
//        } else {
//            return "Gagal menyimpan barang"
//        }
//    }

    def addNewItem(ReqItemCommand itemCommand, HttpServletRequest request){
        def category = Category.findOrCreateWhere(categoryName: itemCommand.category)
        category.save()

        def item = new Item(itemName: itemCommand.itemName, description: itemCommand.description, quantity: itemCommand.quantity)
        item.category = category

        if (item.save()) {
            if (!item.hasErrors()){
                uploadImage(item, request)

                def transaction = new Transaction(
                        transactionType: 'IN',
                        quantity: itemCommand.quantity,
                        transactionDate: new Date(),
                        item: item
                )

                if (transaction.save()) {
                    return "Barang berhasil disimpan"
                } else {
                    return "Gagal menyimpan transaksi"
                }
            }
        } else {
            return "Gagal menyimpan barang"
        }
    }

    def editItem(ReqItemCommand itemCommand, HttpServletRequest request) {
        def item = Item.get(itemCommand.id)
        if (item) {
            item.itemName = itemCommand.itemName
            item.description = itemCommand.description
            item.save()
            if (!item.hasErrors()) {
                uploadImage(item, request)
                return "Barang berhasil diupdate."
            }
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

    // Uploading Image
    def uploadImage(Item item, HttpServletRequest request) {
        if (request.getFile("itemImage") && !request.getFile("itemImage").filename.equals("")){
            String image = FileUtil.uploadItemImage(item.id as int, request.getFile("itemImage"))
            if (!image.equals("")){
                item.image = image
                item.save(flush:true)
            }
        }
    }

    // Find data by Category
    def searchData(String keyword){
        def category = Category.findByCategoryName(keyword)

        def itemsInfo
        if (category) {
            itemsInfo = category.items.collect { [itemName: it.itemName, description: it.description, quantity: it.quantity, image: it.image] }
            return itemsInfo
        } else {
            return "Category not found"
        }
    }
}

