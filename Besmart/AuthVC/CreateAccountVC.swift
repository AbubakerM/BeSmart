//
//  CreateAccountVC.swift
//  Besmart
//
//  Created by mac on 12/7/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import AnimatedGradientView
import CheckBox
import ActionSheetPicker_3_0
import FirebaseInstanceID


class CreateAccountVC: UIViewController {
    @IBOutlet weak var createButtView: AnimatedGradientView!
    
    @IBOutlet weak var txt_password: UITextField!
    @IBOutlet weak var checkBox: CheckBox!
    @IBOutlet weak var lbl_country: UILabel!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_lastname: UITextField!
    @IBOutlet weak var txt_firstname: UITextField!
    @IBOutlet weak var lbl_level: UILabel!
    
    
    var selectCountryID = 1
    var selectLevelID = 0
    
    
    var  countriesArry: [ContriesOB] = []
    var countriesTitle = [String]()
    
    var  levelsArry: [sectionsOB] = []
    var LevelTitle = [String]()
    
    var userData:ISData!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButtView.colorStrings = [["#BCED4A", "#A6D141"]]
        
        createButtView.direction = .right
        getCountries()
        GetSlider()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func creuateButt(_ sender: Any) {
    }
    
    @IBAction func countryListButt(_ sender: Any) {
                let acp = ActionSheetStringPicker(title: "", rows: countriesTitle, initialSelection: 0, doneBlock: { (picker : ActionSheetStringPicker?, selectedIndex : Int, selectedItem :
                    Any?) in
        
                    self.lbl_country.text = selectedItem as? String
                                self.selectCountryID = self.countriesArry[selectedIndex].id
                    
                    self.GetSlider()
        
                }, cancel: { (picker : ActionSheetStringPicker?) in
        
                }, origin: sender)
        
        acp?.toolbarButtonsColor = UIColor.black
        acp?.toolbarBackgroundColor =  UIColor.gray
        acp?.setTextColor(UIColor.black)
                acp?.setCancelButton(UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil))
        
        
                acp?.setDoneButton(UIBarButtonItem(title: "Done", style: .plain, target: nil, action: nil))

                acp?.show()
    }
    @IBAction func levelListButt(_ sender: Any) {
        
        let acp = ActionSheetStringPicker(title: "", rows: LevelTitle, initialSelection: 0, doneBlock: { (picker : ActionSheetStringPicker?, selectedIndex : Int, selectedItem :
            Any?) in

            self.lbl_level.text = selectedItem as? String
                        self.selectLevelID = self.levelsArry[selectedIndex].id

        }, cancel: { (picker : ActionSheetStringPicker?) in

        }, origin: sender)
        acp?.toolbarBackgroundColor =  UIColor.gray

        acp?.toolbarButtonsColor = UIColor.black
        
        acp?.setTextColor(UIColor.black)

        acp?.setCancelButton(UIBarButtonItem(title: "الغاء", style: .plain, target: nil, action: nil))
    
        acp?.setDoneButton(UIBarButtonItem(title: "Done", style: .plain, target: nil, action: nil))

        acp?.show()
    }
    
    
     func GetSlider(){
            
        DataClient.GetSectionByCountries(Id: selectCountryID, success: { (dict) in
                print("cities Success")
                print(dict)

                
                self.levelsArry = dict
                
                for i in self.levelsArry {
                              
                              self.LevelTitle.append(i.sectionName)
                          }
                          
            self.lbl_level.text = self.LevelTitle.first
            self.selectLevelID = self.levelsArry.first?.id ?? 0
                          
                          

                
            }, failure: { (err) in
            })
            
            
            
            
        }
        
    
    @IBAction func signUpButt(_ sender: Any) {
        
        if ((txt_email.text?.isEmpty)! || (txt_lastname.text?.isEmpty)!) || (txt_firstname.text!.isEmpty)
        
        {
            self.errorAlert(title: "تنبيه ", body:  "الرجاء إدخال بيانات الاسم")
            
        }else if(txt_password.text?.isEmpty)!{
            self.errorAlert(title: "تنبيه ", body:  "الرجاء ادخال كلمة المرور")
            
        }else{
            InstanceID.instanceID().instanceID { (result, err) in

                DataClient.UserRegister(firstName: self.txt_firstname.text! , lastName: self.txt_lastname.text!, email:self.txt_email.text!, password: Int(self.txt_password.text!)!, country: self.selectCountryID, degree: self.selectLevelID, token: Int(result!.instanceID) ?? 0,  success: { (dict) in
                    print("Login Success")
                    
                    self.userData = dict
                    
                    UserDefaults.standard.set(self.userData.token, forKey: "token")

                    UserDefaults.standard.set(true, forKey: "status")
                    
                    UserDefaults.standard.set(self.userData.firstName, forKey: "Firstname")
                    UserDefaults.standard.set(self.userData.lastName, forKey: "Lastname")
                    UserDefaults.standard.set(self.userData.email, forKey: "Email")
                    UserDefaults.standard.set(self.userData.id, forKey: "userId")
                    UserDefaults.standard.synchronize()
//                    UserDefaults.standard.set(self.userData.country, forKey: "countryID")
                    
                    
                    
                    Switcher.updateRootVC()

//                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                    let startingView = storyboard.instantiateViewController(withIdentifier: "tab")
//                    
//                    
//                    startingView.modalPresentationStyle = .fullScreen
//                    self.present(startingView, animated: true, completion: nil)

                }, failure: { (err) in
                    self.errorAlert(title: "تنبيه | تسجيل الدخول", body:  err)
                })
            
            
            
        }
            
        }
    }
    
    
    
    
    
    func getCountries(){
        
        DataClient.GetCountries(success: { (dict) in
            print("cities Success")
            print(dict)
            self.countriesArry = dict
            
            
            for i in self.countriesArry {
                
                self.countriesTitle.append(i.countryName)
            }
            
            self.lbl_country.text = self.countriesTitle[0]
            self.selectCountryID = self.countriesArry[0].id
            
            
            
            
        }, failure: { (err) in
        })
        
        
        
        
    }
    
   
    
    
    
 

}





