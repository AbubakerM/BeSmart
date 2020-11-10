//
//  WellcomeVC.swift
//  Besmart
//
//  Created by mac on 12/7/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import AnimatedGradientView

class WellcomeVC: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBOutlet weak var logView: AnimatedGradientView!
    
    @IBOutlet weak var hideBtn: UIButton!
    @IBOutlet weak var txt_email: UITextField!
    
    @IBOutlet weak var txt_password: UITextField!
    
    
    
    var  userData:ISData!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        logView.colorStrings = [["#BCED4A", "#A6D141"]]
        logView.direction = .right
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func gestLogin(_ sender: Any) {
            UserDefaults.standard.set(false, forKey: "status")
                     
                       UserDefaults.standard.set(-1, forKey: "userId")
  



                  
                       
                                               let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                               let startingView = storyboard.instantiateViewController(withIdentifier: "tab")
                               startingView.modalPresentationStyle = .fullScreen

                                               self.present(startingView, animated: true, completion: nil)
    }
    
    
    
    @IBAction func showHideButt(_ sender: Any) {
        
        if txt_password.isSecureTextEntry == true {
            
            txt_password.isSecureTextEntry = false
            
            self.hideBtn.setImage(#imageLiteral(resourceName: "iconfinder_icon-21-eye-hidden_315219-2"), for: .normal)
        }else{
            txt_password.isSecureTextEntry = true
            self.hideBtn.setImage(#imageLiteral(resourceName: "iconfinder_icon-22-eye_315220-2"), for: .normal)

        }
        
        
        
    }
    @IBAction func loginButt(_ sender: Any) {

        
        
        if  txt_email.text == ""
            
        {
            self.errorAlert(title: "تنبيه ", body:  "الرجاء إدخال الايميل")
            
        }else if(txt_password.text?.isEmpty)!{
            self.errorAlert(title: "تنبيه ", body:  "الرجاء ادخال كلمة المرور")
            
        }else{
          
            UserDefaults.standard.set(self.txt_email.text!, forKey: "Email")
            
            DataClient.Userlogin( email:self.txt_email.text!, password: Int(self.txt_password.text!)!, success: { (dict) in
                    print("Login Success")
                
                
                self.userData = dict
                
                
                 UserDefaults.standard.set(true, forKey: "status")
                UserDefaults.standard.set(self.userData.token, forKey: "token")

                
                UserDefaults.standard.set(self.userData.firstName, forKey: "Firstname")
                UserDefaults.standard.set(self.userData.lastName, forKey: "Lastname")
                UserDefaults.standard.set(self.txt_email.text!, forKey: "Email")
                UserDefaults.standard.set(self.userData.id, forKey: "userId")
                UserDefaults.standard.set(self.userData.mobile, forKey: "mobile")


           
                
                                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                        let startingView = storyboard.instantiateViewController(withIdentifier: "tab")
                        startingView.modalPresentationStyle = .fullScreen

                                        self.present(startingView, animated: true, completion: nil)
                }, failure: { (err) in
                    self.errorAlert(title: "تنبيه | تسجيل الدخول", body:  err)
                })
                
                
                
            
            
        }
        
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "tab")
//
//        self.present(vc, animated: true, completion: nil)
//        navigationController?.pushViewController(vc, animated: true)
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


class MainNavigationController: UINavigationController { }
