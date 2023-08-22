package inventory.project

import com.AppUtil

class AuthenticationController {

    AuthenticationService authenticationService
    UserService userService

    def login() {
        if (authenticationService.isAuthenticated()) {
            redirect(controller: "item", action: "index")
        }
    }

    def doLogin() {
        if (authenticationService.doLogin(params.email, params.password)) {
            redirect(controller: "item", action: "index")
        } else {
            flash.message = AppUtil.infoMessage("Email Address or Password not Valid.", false)
            redirect(controller: "authentication", action: "login")
        }
    }

    def logout() {
        session.invalidate()
        redirect(controller: "authentication", action: "login")
    }

    def register() {
        [user: flash.redirectParams]
    }

//    def doRegistration() {
//        def response = userService.save(params)
//        if (response.isSuccess) {
//            authenticationService.setUserAuthorization(response.model)
//            redirect(controller: "item", action: "index")
//        } else {
//            flash.redirectParams = response.model
//            redirect(controller: "authentication", action: "login")
//        }
//    }

    def doRegistration() {
        def userName = params.username
        def email = params.email
        def password = params.password

        def result = userService.save(userName as String, email as String, password as String)
        println "isi Result: ${result}"
        render(view: "login")
        if (result == "Email is already exist") {
            render(view: 'error', model: [message: result])
        } else {
            render(view: "login")
        }
    }
}
