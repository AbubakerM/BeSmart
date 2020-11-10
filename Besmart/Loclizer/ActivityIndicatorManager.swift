//
//  ActivityIndicatorManager.swift
//  kindergarten
//
//  Created by Amar Amassi  on 4/17/18.
//  Copyright © 2018 Amar Amassi . All rights reserved.
//

import Foundation
import SVProgressHUD

class ActivityIndicatorManager: NSObject {
    
    public class func start(_ title: String = ""){
        SVProgressHUD.setForegroundColor(UIColor(hexString: "BAEA49"))

        SVProgressHUD.show(withStatus: title)
    }
    public class func stop(){
        SVProgressHUD.dismiss();
        
    }
    
    public class func showProgress(progress :  Float){
        SVProgressHUD.showProgress(progress);
    }
}
