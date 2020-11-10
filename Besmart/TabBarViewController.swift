//
//  TabBarViewController.swift
//  Besmart
//
//  Created by mac on 12/7/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    

 
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: view.frame.width, height: tabBar.frame.height), cornerRadius: 15)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        tabBar.layer.mask = mask
        
    }
    
    override func viewDidLoad() {
      
    }
    
//    
//    func sendDataToFirstViewController(myData: Int) {
//        tabBarController?.selectedIndex = 1
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
