
import Foundation

class SignUpVC:UIViewController{
    
    var signUp = true
    let userService:UserService = UserServiceImpl()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var resetPasswordEmailField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if signUp {
            view.viewWithTag(2)?.isHidden = true
            view.viewWithTag(1)?.isHidden = false
        }else {
            view.viewWithTag(2)?.isHidden = false
            view.viewWithTag(1)?.isHidden = true
        }
    }
    
    
    
    
    @IBAction func resetPassword(_ sender: AnyObject) {
        userService.resetPassword(email: resetPasswordEmailField.text!,  completion: {(status, message) in
            let okAction:UIAlertAction  = UIAlertAction(title: "OK", style: .default){
                _ in
                self.dismiss(animated: true, completion: nil)
            }
            let retryAction:UIAlertAction  = UIAlertAction(title: "Retry", style: .default)
            let cancelAction:UIAlertAction  = UIAlertAction(title: "Cancel", style: .default){
                _ in
                self.dismiss(animated: true, completion: nil)
            }
            print(status)
            if status {
                UIUtil.displayAlert(self, title: "Success", message: message, actions: [okAction])
            }else{
                UIUtil.displayAlert(self, title: "Error", message: message, actions: [retryAction, cancelAction])
            }
        })
    }
    
    @IBAction func signUp(_ sender: AnyObject) {
        userService.signUp(name: nameField.text!, email: emailField.text!, password: passwordField.text!, completion: {(status, message) in
            let okAction:UIAlertAction  = UIAlertAction(title: "OK", style: .default){
                _ in
                self.dismiss(animated: true, completion: nil)
            }
            let retryAction:UIAlertAction  = UIAlertAction(title: "Retry", style: .default)
            let cancelAction:UIAlertAction  = UIAlertAction(title: "Cancel", style: .default){
                _ in
                self.dismiss(animated: true, completion: nil)
            }
            print(status)
            if status {
                UIUtil.displayAlert(self, title: "Success", message: message, actions: [okAction])
            }else{
                UIUtil.displayAlert(self, title: "Error", message: message, actions: [retryAction, cancelAction])
            }
        })
    }
}
