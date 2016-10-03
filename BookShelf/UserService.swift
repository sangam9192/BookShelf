
import Foundation
import Alamofire
import SwiftyJSON

protocol UserService {
    
    func login(username:String, password:String, completion: @escaping(Bool, String)->Void)
    func signUp(name:String, email:String, password:String)
    func resetPassword(email:String)
    static func isUserLoggedIn()->Bool
    static func logout()
}

class UserServiceImpl:UserService {
   
    var loginUrl = "http://ec2-52-38-174-68.us-west-2.compute.amazonaws.com:3000/api/authenticate/login"
    var signUpUrl = ""
    var resetPasswordUrl = ""
    let keychain = KeychainSwift()
    
    internal func resetPassword(email: String) {
        print("Resetting password for \(email)")
        Alamofire.request(resetPasswordUrl).response(completionHandler: {
            response in
            
        })
    }

    internal func signUp(name: String, email: String, password: String) {
        print("Signing up new user name=\(name), email=\(email)")
        Alamofire.request(resetPasswordUrl).response(completionHandler: {
            response in
            
        })
    }

    internal func login(username: String, password: String, completion:@escaping (Bool, String)->Void){
        let params = ["username" : username, "password" : password]
        print("Logging in username = \(username)")
        Alamofire.request(loginUrl, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON{
            response in
            
            guard response.result.isSuccess else {
                print("Error while logging in. \(response.result.error)")
                completion(false, "Error while logging in")
                return
            }
            
            let json = JSON(response.result.value)
            
            guard json["status"].boolValue else {
                debugPrint(json["message"])
                completion(false, json["message"].string!)
                return
            }
            
            print("User Successfully Logged in")
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(json["data"].string, forKey: username+"_data")
            completion(true, "User Successfully Logged in")
        }
    }

    internal static func isUserLoggedIn() -> Bool {
        guard UserDefaults.standard.value(forKey: "username") != nil else{
            return false
        }
        return true
    }
    
    internal static func logout() {
        UserDefaults.standard.removeObject(forKey: "username")
    }

}
