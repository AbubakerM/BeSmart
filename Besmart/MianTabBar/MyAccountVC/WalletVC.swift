//
//  WalletVC.swift
//  Besmart
//
//  Created by mac on 2/2/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class WalletVC: UIViewController {

    @IBOutlet weak var tableView: ContentSizedTableView!
        
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_salary: UILabel!
    
    @IBOutlet weak var tableHgih: NSLayoutConstraint!
    @IBOutlet weak var topView: UIView!
    
    var walletData:stWalletOB!
    
    var DataArry:[purchasedItemsOB]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
         topView.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 0, blur: 5, spread: 0)
          topView.layer.cornerRadius = 12
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(GetProfile), name: .updatePoints, object: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let id = UserDefaults.standard.integer(forKey: "userId")

        if id  != -1 {
            GetProfile()

        }
    }
    
    
    
    @objc func GetProfile(){
            
        DataClient.GetStudProfile(success: { (dict) in
            print("cities Success")
            print(dict)
            self.walletData = dict.wallet
            self.DataArry.removeAll()

            for i in dict.wallet.items {
                self.DataArry.append(i)
            }
            
            self.lbl_salary.text =  self.walletData.points ?? ""
            
            self.tableView.reloadData()
            
        }, failure: { (err) in
            
        })
            
    }
    
    
    override func viewWillLayoutSubviews() {
       super.updateViewConstraints()
       self.tableHgih?.constant = self.tableView.intrinsicContentSize.height

    }
    
    
    @IBAction func addBtt(_ sender: Any) {
//        if let url = URL(string: "https://besmartapp.com/student/charge") {
//            UIApplication.shared.open(url)
//        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentVC") as! PaymentVC
        
        self.present(vc, animated: true, completion: nil)
//        self.navigationController?.pushViewController(vc, animated: true)
        //self.paymentsTableView.isHidden = false
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




extension WalletVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return  self.DataArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellWallet") as? walletCell
        
        let obj = self.DataArry[indexPath.row]
        
        
        cell?.lbl_type.text = obj.type
        
        
        
        if  obj.type == "مذكرة"  {
            cell?.lbl_name.text = obj.noteName

        }else if  obj.type == "كورس" {
            cell?.lbl_name.text = obj.courseName

        }else{
            cell?.lbl_name.text = obj.lessonName

        }
        cell?.lbl_price.text = obj.price
        cell?.lbl_date.text = obj.created_at

        
        return cell!
    }

    
}
 

extension NSNotification.Name {
    static let updatePoints = Notification.Name("updatePoints")
}

