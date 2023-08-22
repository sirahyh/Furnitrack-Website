package inventory.project

import com.AppUtil
import com.GlobalConfig
import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

import java.lang.reflect.Member

@Transactional
class UserService {

//    def save(GrailsParameterMap params) {
//        User user = new User(params)
//        def response = AppUtil.saveResponse(false, user)
//        if (user.validate()) {
//            user.save(flush: true)
//            if (!user.hasErrors()){
//                response.isSuccess = true
//            }
//        }
//        return response
//    }

    def save(String username, String email, String password){


        def isEmailExist = User.findByEmail(email)

        if (!isEmailExist) {
            def user = new User(userName: username, email: email, password: password)
            if (user.save()) {
                return "Data berhasil disimpan"
            }
            return "Data tidak disimpan"
        }
        return "Email is already exist"
    }

    def update(User user, GrailsParameterMap params) {
        user.properties = params
        def response = AppUtil.saveResponse(false, member)
        if (user.validate()) {
            user.save(flush: true)
            if (!user.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }

    def getById(Serializable id){
        return User.get(id)
    }

    def list(GrailsParameterMap params) {
        params.max = params.max ?: GlobalConfig.itemsPerPage()
        List<User> userList = User.createCriteria().list(params) {
            if (params?.colName && params.colValue) {
                like(params.colName, "%" + params.colValue + "%")
            }
            if (!params.sort) {
                order("id", "desc")
            }
        }
        return [list: userList, count: userList.totalCount]
    }

    def delete(User user) {
        try {
            user.delete(flush: true)
        } catch (Exception e) {
            println(e.getMessage())
            return false
        }
        return true
    }
}
