package model.request

import grails.validation.Validateable
import inventory.project.Item
import inventory.project.ItemService

class ReqItem implements Validateable {
    ItemService itemService

    Long id

    String itemName
    String description


//    static constraints = {
//        id nullable: false, validator: {
//            val, obj ->
//                if (val != null) {
//                    if (Item.exists(val)) {
//                        return "item exists"
//                    }
//                }
//        }
//    }
}
