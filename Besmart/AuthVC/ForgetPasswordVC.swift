//
//  ForgetPasswordVC.swift
//  Besmart
//
//  Created by mac on 12/7/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import AnimatedGradientView

class ForgetPasswordVC: UIViewController {
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var foregtButtView: AnimatedGradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foregtButtView.colorStrings = [["#BCED4A", "#A6D141"]]
        
        foregtButtView.direction = .right
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var forgetButt: AnimatedGradientView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
