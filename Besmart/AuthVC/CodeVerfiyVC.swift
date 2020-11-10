//
//  CodeVerfiyVC.swift
//  Besmart
//
//  Created by mac on 12/7/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import KWVerificationCodeView
import AnimatedGradientView

class CodeVerfiyVC: UIViewController {

    @IBOutlet weak var nextButtView: AnimatedGradientView!
    @IBOutlet weak var txt_code: KWVerificationCodeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButtView.colorStrings = [["#BCED4A", "#A6D141"]]
        nextButtView.direction = .right
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
