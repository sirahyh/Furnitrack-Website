package inventory.project

import com.AppUtil
import com.GlobalConfig
import grails.transaction.Transactional

@Transactional
class AuthenticationService {

    private static final String AUTHORIZED = "AUTHORIZED"

    def setUserAuthorization(User user) {
        def authorization = [isLoggedIn: true, user: user]
        AppUtil.getAppSession()[AUTHORIZED] = authorization
    }

    def doLogin(String email, String password){
        password = password.encodeAsMD5()
        User user = User.findByEmailAndPassword(email, password)
        if (user){
            setUserAuthorization(user)
            return true
        }
        return false
    }

    boolean isAuthenticated(){
        def authorization = AppUtil.getAppSession()[AUTHORIZED]
        if (authorization && authorization.isLoggedIn){
            return true
        }
        return false
    }


    def getUser(){
        def authorization = AppUtil.getAppSession()[AUTHORIZED]
        return authorization?.user
    }


    def getUserName(){
        def user = getUser()
        return "${user.userName}"
    }

    def isAdministratorUser(){
        def user = getUser()
        if (user && user.memberType == GlobalConfig.USER_TYPE.ADMINISTRATOR){
            return true
        }
        return false
    }
}
