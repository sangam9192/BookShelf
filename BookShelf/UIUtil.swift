
import UIKit

struct UIUtil {
    
    static func displayAlert(_ viewController:UIViewController, title:String, message:String, animated:Bool=true, preferredStyle:UIAlertControllerStyle = .alert, actions:[UIAlertAction] =  [UIAlertAction(title: "OK", style: .default, handler: nil)],
                             completion:(()->Void)?=nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        for action in actions {
            alertController.addAction(action)
        }
        viewController.present(alertController, animated: animated, completion: completion)
    }
    
}

