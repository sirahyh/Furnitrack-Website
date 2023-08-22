package inventory.project

class User {

    String userName
    String email
    String password

    static constraints = {
        userName(blank: false)
        email(email: true, nullable: false, unique: true, blank: false)
        password(blank: false)
    }

    def beforeInsert() {
        this.password = this.password.encodeAsMD5()
    }

    def beforeUpdate() {
        this.password = this.password.encodeAsMD5()
    }
}
