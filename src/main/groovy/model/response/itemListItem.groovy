package model.response

import grails.validation.Validateable

class itemListItem implements Validateable {
    Long id
    String itemName
    String description
    int quantity
}
