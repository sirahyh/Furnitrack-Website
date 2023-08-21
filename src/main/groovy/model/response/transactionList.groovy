package model.response

import grails.validation.Validateable

class transactionList implements  Validateable{

    String itemName
    String transactionType
    int quantity
    Date transactionDate

}
