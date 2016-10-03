
import Foundation

class SignUpVC:UIViewController{
    
    var signUp = false
    let userService:UserService = UserServiceImpl()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var resetPasswordEmailField: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
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
    
    @IBAction func signUp(sender: AnyObject) {
        userService.signUp(name: nameField.text!, email: emailField.text!, password: passwordField.text!)
    }
    
    @IBAction func resetPassword(sender: AnyObject) {
        userService.resetPassword(email: resetPasswordEmailField.text!)
    }
    
    
}
