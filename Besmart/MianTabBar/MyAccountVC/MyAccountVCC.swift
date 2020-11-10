//
//  MyAccountVCC.swift
//  Besmart
//
//  Created by mac on 12/12/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0




class MyAccountVCC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,MasterToConiner {
   
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var editImgg: UIButton!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_wallet: UILabel!
    @IBOutlet weak var walletIC: UIImageView!
    @IBOutlet weak var settingCO: UIView!
    @IBOutlet weak var mesagesCO: UIView!
    @IBOutlet weak var peopleCO: UIView!
    @IBOutlet weak var walletCO: UIView!
    
    @IBOutlet weak var lbl_setting: UILabel!
    @IBOutlet weak var lbl_mesaage: UILabel!
    @IBOutlet weak var peopelIC: UIImageView!
    
    @IBOutlet weak var lbl_people: UILabel!
    @IBOutlet weak var messageIC: UIImageView!
    
    
    @IBOutlet weak var settingIC: UIImageView!
    
    @IBOutlet weak var editCo: UIView!
    
    var EditCo:EditProfileVC!
    var userData:StudProOB!
    var selectedImg = UIImage()

    var selectCountryID = 0
    
    var  countriesArry: [ContriesOB] = []
    var countriesTitle = [String]()
    
    
    var delegate:MasterToConiner?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let id = UserDefaults.standard.integer(forKey: "userId")
              
              
              if id != -1 {
                  editBtn.isHidden = true
                       editImgg.isEnabled = false
                       
                                walletCO.alpha = 1
                                peopleCO.alpha = 0
                                mesagesCO.alpha = 0
                                settingCO.alpha = 0
                       editCo.alpha = 0
                                
                                lbl_wallet.textColor = UIColor(hexString: "A6D141")
                                lbl_people.textColor = UIColor(hexString: "A5A6AD")
                                lbl_mesaage.textColor = UIColor(hexString: "A5A6AD")
                                lbl_setting.textColor = UIColor(hexString: "A5A6AD")
                                
                                walletIC.setImageColor(color: UIColor(hexString: "A6D141"))
                                messageIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
                                settingIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
                                peopelIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
                                
                       
                       GetProfile()
                       
                           EditProfileVC.selectedImg = self.profileImg.image ?? UIImage()
                   topView.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 0, blur: 5, spread: 0)
                   topView.layer.cornerRadius = 6
                       
                                     }
     
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let id = UserDefaults.standard.integer(forKey: "userId")
        
        
        if id == -1 {
            showSimpleAlert()
        }
    }
    
    
   
    
    
    func changeLabel(imge: String) {
           let url = URL(string: imge)
        self.GetProfile()
        
//        self.profileImg.sd_setImage(with: url)
       }
       
   
    
    
    @IBAction func multView(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 1:
            walletCO.alpha = 1
            peopleCO.alpha = 0
            mesagesCO.alpha = 0
            settingCO.alpha = 0
            editCo.alpha = 0
            editBtn.isHidden = true
                  editImgg.isEnabled = false
            
            lbl_wallet.textColor = UIColor(hexString: "A6D141")
            lbl_people.textColor = UIColor(hexString: "A5A6AD")
            lbl_mesaage.textColor = UIColor(hexString: "A5A6AD")
            lbl_setting.textColor = UIColor(hexString: "A5A6AD")
            
            walletIC.setImageColor(color: UIColor(hexString: "A6D141"))
            messageIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            settingIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            peopelIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            
            
            
            
            
        // Change to English
        case 2:
            
            
            walletCO.alpha = 0
            peopleCO.alpha = 1
            mesagesCO.alpha = 0
            settingCO.alpha = 0
            editCo.alpha = 0
            editBtn.isHidden = true
                  editImgg.isEnabled = false
         
            
            EditProfileVC.selectedImg = self.profileImg.image!

            
            lbl_wallet.textColor = UIColor(hexString: "A5A6AD")
            lbl_people.textColor = UIColor(hexString: "A6D141")
            lbl_mesaage.textColor = UIColor(hexString: "A5A6AD")
            lbl_setting.textColor = UIColor(hexString: "A5A6AD")
            
            walletIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            peopelIC.setImageColor(color: UIColor(hexString: "A6D141"))

            messageIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            settingIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            
            
            
            
        // Change to Spanish
        case 3:
            
            editBtn.isHidden = false
                  editImgg.isEnabled = true
            walletCO.alpha = 0
            peopleCO.alpha = 0
            mesagesCO.alpha = 0
            editCo.alpha = 1
            
            let CVC = children.last as! EditProfileVC
            CVC.t  = "cccccc"
            
//            self.delegate?.changeLabel(imge:  profileImg.image!)
      

            settingCO.alpha = 0
           
            
            lbl_wallet.textColor = UIColor(hexString: "A5A6AD")
            lbl_people.textColor = UIColor(hexString: "A5A6AD")
            lbl_mesaage.textColor = UIColor(hexString: "A6D141")
            lbl_setting.textColor = UIColor(hexString: "A5A6AD")
            
            walletIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            messageIC.setImageColor(color: UIColor(hexString: "A6D141"))
            settingIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            peopelIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            
            
        case 4:
            
            
            walletCO.alpha = 0
            peopleCO.alpha = 0
            mesagesCO.alpha = 0
            settingCO.alpha = 1
            editCo.alpha = 0
            editBtn.isHidden = true
                  editImgg.isEnabled = false
            
            lbl_wallet.textColor = UIColor(hexString: "A5A6AD")
            lbl_people.textColor = UIColor(hexString: "A5A6AD")
            lbl_mesaage.textColor = UIColor(hexString: "A5A6AD")
            lbl_setting.textColor = UIColor(hexString: "A6D141")
            
            walletIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            messageIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            settingIC.setImageColor(color: UIColor(hexString: "A6D141"))
            peopelIC.setImageColor(color: UIColor(hexString: "A5A6AD"))
            
            
        // Change to French, etc
        default:
            print("Unknown language")
            return
        }
    }
    
    
    @IBAction func editImg(_ sender: Any) {
        
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        
        

    }
    
    
    
    
    
       func openCamera()
       {
           if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
               let imagePicker = UIImagePickerController()
               imagePicker.delegate = self
               imagePicker.sourceType = UIImagePickerController.SourceType.camera
               imagePicker.allowsEditing = false
               self.present(imagePicker, animated: true, completion: nil)
           }
           else
           {
               let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert, animated: true, completion: nil)
           }
       }
       
       
       func openGallery()
       {
           if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
               let imagePicker = UIImagePickerController()
               imagePicker.delegate = self
               imagePicker.allowsEditing = true
               imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
               self.present(imagePicker, animated: true, completion: nil)
           }
           else
           {
               let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert, animated: true, completion: nil)
           }
       }
       
       
       
       //MARK:-- ImagePicker delegate
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let pickedImage = info[.originalImage] as? UIImage {
               selectedImg = pickedImage
               
               
               
               
               self.profileImg.image = pickedImage
               EditProfileVC.selectedImg = self.profileImg.image!

           }
           picker.dismiss(animated: true, completion: nil)
       }
       
       
       
    
    @IBAction func editBtn(_ sender: Any) {
        
        
        
        
        
        
        
    }
    @IBAction func showCountries(_ sender: Any) {
        
        
        let acp = ActionSheetStringPicker(title: "", rows: countriesTitle, initialSelection: 0, doneBlock: { (picker : ActionSheetStringPicker?, selectedIndex : Int, selectedItem :
            Any?) in
            
            //            self.country_lbl.text = selectedItem as? String
            self.selectCountryID = self.countriesArry[selectedIndex].id
            
        }, cancel: { (picker : ActionSheetStringPicker?) in
            
        }, origin: sender)
        
        
        acp?.setCancelButton(UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil))
        
        
        acp?.setDoneButton(UIBarButtonItem(title: "Done", style: .plain, target: nil, action: nil))
        
        acp?.show()
    }
    
    
    @IBAction func editPage(_ sender: Any) {
        editCo.alpha = 1
        
        walletCO.alpha = 0
        peopleCO.alpha = 0
        mesagesCO.alpha = 0
        settingCO.alpha = 0
        editBtn.isHidden = false
        editImgg.isEnabled = true
        
    }
    
    @IBAction func editPass(_ sender: Any) {
    }
    
    
    
    
    
    @IBAction func saveEdit(_ sender: Any) {
        
        //        SaveEditData()
        
        
    }
    @IBAction func editButton(_ sender: Any) {
        
        
        
    }
    
    
    
    
    
    
    
    
//
//    func getCountries(){
//
//        DataClient.GetCountries(success: { (dict) in
//            print("cities Success")
//            print(dict)
//            self.countriesArry = dict
//
//
//            for i in self.countriesArry {
//
//                self.countriesTitle.append(i.countryName)
//            }
//
//            self.selectCountryID = self.countriesArry[0].id
//
//            let indexNo = self.countriesArry.firstIndex{$0.countryName == self.userData.country_name} // 0
//
//            //
//            //            self.country_lbl.text = self.countriesTitle[indexNo!]
//            //            self.top_country.text = self.countriesTitle[indexNo!]
//
//
//
//
//        }, failure: { (err) in
//        })
//
//
//
//
//    }
    
    func GetProfile(){
        
        DataClient.GetStudProfile(success: { (dict) in
            print("cities Success")
            print(dict)
            self.userData = dict
            
            
            self.lbl_name.text = "\(dict.genarll.firstName ?? "" ) \(dict.genarll.lastName ?? "" )"
            
            UserDefaults.standard.set(dict.genarll.firstName, forKey: "Firstname")
            UserDefaults.standard.set(dict.genarll.lastName, forKey: "Lastname")
            UserDefaults.standard.set(dict.genarll.id, forKey: "userId")
            
            let url = URL(string: dict.genarll.image_link ?? "" )
            
            self.profileImg.sd_setImage(with: url)
        

            
            
            
            
            
            
            
        }, failure: { (err) in
        })
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSeg" {
            let secondVC: EditProfileVC = segue.destination as! EditProfileVC
            secondVC.delegate = self
                EditCo = secondVC

                                EditCo.t = "ssssss"
            
          
         

            
        }    }

}



extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}










extension UIViewController
{
   func showSimpleAlert() {
          let alert = UIAlertController(title: "تنبيه", message: "يجب عليك تسجيل الدخول؟",         preferredStyle: UIAlertController.Style.alert)

       
           alert.addAction(UIAlertAction(title: "تسجيل دخول",
                                         style: UIAlertAction.Style.default,
                                         handler: {(_: UIAlertAction!) in
                                          UserDefaults.standard.set(false, forKey: "status")
                                              Switcher.updateRootVC()
                                           //Sign out action
           }))
           self.present(alert, animated: true, completion: nil)
       }
      
}
