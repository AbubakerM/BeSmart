//
//  EditProfileVC.swift
//  Besmart
//
//  Created by mac on 2/24/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

protocol MasterToConiner {
    func changeLabel(imge:String)
}
class EditProfileVC: UIViewController {
    @IBOutlet weak var txt_pass: UITextField!
    
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_lastName: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var txt_name: UITextField!
    
//    var selectedImg:UIImage()
    
    
    static var selectedImg = UIImage()
    var  countriesArry: [ContriesOB] = []
    var countriesTitle = [String]()
    
    var selectCountryID = 0
 
var t = ""
    
    var delegate:MasterToConiner?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
GetVideoData()
        getCountries()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
                print("here",t)

    }
    @IBAction func pickView(_ sender: Any) {
        
        let acp = ActionSheetStringPicker(title: "", rows: countriesTitle, initialSelection: 0, doneBlock: { (picker : ActionSheetStringPicker?, selectedIndex : Int, selectedItem :
                  Any?) in
                  
            self.location.text = selectedItem as? String
                  self.selectCountryID = self.countriesArry[selectedIndex].id
                  
              }, cancel: { (picker : ActionSheetStringPicker?) in
                  
              }, origin: sender)
              
              
              acp?.setCancelButton(UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil))
              
              
              acp?.setDoneButton(UIBarButtonItem(title: "Done", style: .plain, target: nil, action: nil))
              
              acp?.show()
        
        
    }
    
     func GetVideoData(){
           
         DataClient.ShowProgfile(success: { (dict) in
               print("cities Success")
               print(dict)

        
            self.txt_name.text = "\(dict.firstName ?? "")"
            
            self.txt_lastName.text = "\(dict.lastName ?? "" )"
            self.txt_email.text = "\(dict.email ?? "" )"
            self.location.text = dict.country_name ?? ""
            self.mobile.text = "\(dict.mobile ?? "" )"
            
            
            self.delegate?.changeLabel(imge: dict.image_link ?? "")
//            self.location.text = dict.l
               
               
           }, failure: { (err) in
           })
           
           
           
           
       }
    
    
    
     
      
    
    @IBAction func saveBtn(_ sender: Any) {
        
        
              
        DataClient.EditProgfile( firstName: self.txt_name.text!, lastName: self.txt_lastName.text!, email: self.txt_email.text!, country: self.selectCountryID, image: EditProfileVC.selectedImg, success: { (dict) in
                    print("Reg Success")
  
            
            self.GetVideoData()
            self.errorAlert(title: "تم", body: "تم التعديل بنجاح")
                    
                    
                }, failure: { (err) in
                    
                    
//                    self.showAlert(title: "تم", message: "تم تحديث البيانات بنجاح")
                    
                })
                
                

                
        
        
        
    }
    
    
    func getCountries(){
      
              DataClient.GetCountries(success: { (dict) in
                  print("cities Success")
                  print(dict)
                  self.countriesArry = dict
      
      
                  for i in self.countriesArry {
      
                      self.countriesTitle.append(i.countryName)
                  }
      
                  self.selectCountryID = self.countriesArry[0].id
      
//        let indexNo = self.countriesArry.firstIndex{$0.countryName == self.userData.country_name} // 0
      
                  //
                  //            self.country_lbl.text = self.countriesTitle[indexNo!]
                  //            self.top_country.text = self.countriesTitle[indexNo!]
      
      
      
      
              }, failure: { (err) in
              })
      
      
      
      
          }
    
    @IBAction func editPass(_ sender: Any) {
        
          let controller = self.storyboard?.instantiateViewController(withIdentifier: "CreatePassVC") as? CreatePassVC
      
                        controller?.modalTransitionStyle   = .crossDissolve;
                        controller?.modalPresentationStyle = .overCurrentContext
                        controller?.modalPresentationStyle = .overCurrentContext
                        present(controller!, animated: true, completion: nil)

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
