//
//  CreatePassVC.swift
//  Besmart
//
//  Created by mac on 12/7/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class CreatePassVC: UIViewController {

    @IBOutlet weak var Repass: UITextField!
    @IBOutlet weak var txt_confirmPass: UITextField!
    @IBOutlet weak var txt_pass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButt(_ sender: Any) {
        
        
        EsitPass()
        
        
        
    }
    
     func EsitPass(){
        
        
        if txt_pass.text == "" {
            
            errorAlert(title: "تنبيه", body: "الرجاء ملىء الحقول")
            
            return
        }else if txt_confirmPass.text == "" {
            
            errorAlert(title: "تنبيه", body: "الرجاء ملىء الحقول")
            
            return
        }else if txt_pass.text != Repass.text {
            
            errorAlert(title: "تنبيه", body: "كلمة المرور غير متطابقة")
                       
            return
        } else if self.txt_confirmPass.text!.count < 6 {
              errorAlert(title: "تنبيه", body: "كلمة المرور يجب ان تكون اكبر او يساوي ٦ ")
        }
        
               
        DataClient.EditPass(oldPass: self.txt_confirmPass.text!, newPass: self.txt_pass.text!, rePass: self.Repass.text!, success: { (dict) in
                   print("cities Success")
                   print(dict)
            
            self.errorAlert(title: "تم", body: "تم تعديل كلمة المرور بنجاح")

                   
               }, failure: { (err) in
                
                
                self.errorAlert(title: "تنبيه", body: err)
               })
               
               
               
               
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
