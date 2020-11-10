import Foundation
import UIKit

class Switcher {
    
    static func updateRootVC(){
        
        let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC : UIViewController?
        
        print(status)
        
        
        if(status == true) {//UserID
            
            
            
            
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tab")
            
            
            
            
        } else {
            
            rootVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "MainNavigationController")
            
            
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        
    }
    
}



