import com.UserPasswordEncoderListener
import inventory.project.CustomUserDetailsService

beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    userDetailsService(CustomUserDetailsService)
}
