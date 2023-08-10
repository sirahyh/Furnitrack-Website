package inventory.project

class Category {

    String categoryName

    static hasMany = [items: Item]
    
    static constraints = {
        categoryName inList: ['Chair', 'Table', 'Cupboard']
    }
}
