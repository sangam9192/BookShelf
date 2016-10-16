struct Constants {
 
    static let BASE_URL = "http://ec2-52-38-174-68.us-west-2.compute.amazonaws.com:3000"
    
    static let LOGIN_URL = BASE_URL + "/api/authenticate/login"
    static let LOGOUT_URL = BASE_URL + "/api/authenticate/logout"
    static let FORGOT_PASSWORD_URL = BASE_URL + "/api/authenticate/forgot-password/"
    static let RESET_PASSWORD_URL = BASE_URL + "/api/authenticate/reset-password/"

}
