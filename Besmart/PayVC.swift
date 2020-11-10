//
//  PayVC.swift
//  Besmart
//
//  Created by mac on 2/27/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class PayVC: UIViewController {

    @IBOutlet weak var lbl_amount: UILabel!
    @IBOutlet weak var lbl_yourBalance: UILabel!
    
    var walletData:stWalletOB!
    var Id = 0
    var myPoint = 0
    var type = ""

    
    
    var price = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lbl_amount.text = "\(price)"
        
        GetProfile()
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dissBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func payBtn(_ sender: Any) {
        
        if Int(price) ?? 0 > myPoint {
            self.errorAlert(title: "تنبيه", body: "رصيد محفظتك لايكفي")
        }else{
            
          PayNow(id:Id)
        }
        
    }
    
    
    func GetProfile(){
              
              DataClient.GetStudProfile(success: { (dict) in
                  print("cities Success")
                  print(dict)
                  self.walletData = dict.wallet

                  
                  
             
                  
                  self.lbl_yourBalance.text =  "رصيدك \(self.walletData.points ?? "")"
          
                self.myPoint = Int(self.walletData.points ?? "") ?? 0
                  
                  
              }, failure: { (err) in
              })
              
              
              
              
          }
    
    
    func PayNow(id:Int){
                 
        DataClient.PayNow(id: id, type: type, success: { (dict) in
                     print("cities Success")
                     print(dict)
            
            self.errorAlert(title: "تم", body: "تم الدفع بنجاح")
            

                     
                     
            self.GetProfile()
                     
                     
                 }, failure: { (err) in
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
