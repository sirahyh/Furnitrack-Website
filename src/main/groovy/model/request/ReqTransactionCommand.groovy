package model.request

import grails.validation.Validateable

class ReqTransactionCommand implements Validateable {
    private Long itemId
    private String transactionType
    private int transactionQuantity

    static constraints = {
        itemId nullable: false
        transactionType inList: ['IN', 'OUT']
        transactionQuantity min: 1
    }

    void validate() {
        if (!transactionType in ['IN', 'OUT']) {
            errors.rejectValue("transactionType", "reqItemCommand.transactionType.invalid")
        }
        if (transactionQuantity <= 0) {
            errors.rejectValue("transactionQuantity", "reqItemCommand.transactionQuantity.invalid")
        }
    }

    // Add getter and setter for each property
    Long getItemId() {
        return itemId
    }

    void setItemId(Long itemId) {
        this.itemId = itemId
    }

    String getTransactionType() {
        return transactionType
    }

    void setTransactionType(String transactionType) {
        this.transactionType = transactionType
    }

    int getTransactionQuantity() {
        return transactionQuantity
    }

    void setTransactionQuantity(int transactionQuantity) {
        this.transactionQuantity = transactionQuantity
    }
}
