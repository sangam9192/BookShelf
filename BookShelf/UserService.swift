
import Foundation
import Alamofire
import SwiftyJSON

protocol UserService {
    
    func login(username:String, password:String, completion: @escaping(Bool, String)->Void)
    func signUp(name:String, email:String, password:String, completion:@escaping (Bool, String)->Void)
    func resetPassword(email:String, completion:@escaping (Bool, String)->Void)
    static func isUserLoggedIn()->Bool
    static func logout()
}

class UserServiceImpl:UserService {
   
    let keychain = KeychainSwift()
    
    internal func resetPassword(email: String, completion:@escaping (Bool, String)->Void) {
        print("Resetting password for \(email)")
        Alamofire.request(Constants.FORGOT_PASSWORD_URL + email, method: .post, encoding: JSONEncoding.default).responseJSON{
            response in
            
            print(response)
            guard response.result.isSuccess else {
                completion(false, "Error while resetting password. \(response.result.error)")
                return
            }
            
            let json = JSON(response.result.value)
            
            guard response.response?.statusCode == 200 else{
                guard let message = json["message"].string else{
                    completion(false, "Unknown response from server")
                    return
                }
                completion(false, message)
                return
            }
            completion(true, json["message"].string!)
        }
    }

    internal func signUp(name: String, email: String, password: String, completion:@escaping (Bool, String)->Void) {
        print("Signing up new user name=\(name), email=\(email)")
        Alamofire.request(Constants.BASE_URL).response(completionHandler: {
            response in
            
            print(response)
            completion(false, "Not yet Implemented")
        })
    }

    internal func login(username: String, password: String, completion:@escaping (Bool, String)->Void){
        let params = ["username" : username, "password" : password]
        print("Logging in username = \(username)")
        Alamofire.request(Constants.LOGIN_URL, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON{
            response in
            
            guard response.result.isSuccess else {
                print("Error while logging in. \(response.result.error)")
                completion(false, "Error while logging in")
                return
            }
            
            let json = JSON(response.result.value)
            
            guard json["status"].boolValue else {
                
                guard let message = json["message"].string else{
                    completion(false, "Unknown response from server")
                    return
                }
                print("Message =\(json["message"])")
                completion(false, message)
                return
            }
            
            UserDefaults.standard.set(username, forKey: "username")
            guard let token = json["data"].string else{
                completion(false, "Could not get auth token")
                return
            }
            self.keychain.set(token , forKey: "token")
            
            print("User Successfully Logged in")
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
