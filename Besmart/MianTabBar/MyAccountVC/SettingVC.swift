//
//  SettingVC.swift
//  Besmart
//
//  Created by mac on 2/2/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
    
    
    
    var titleArry = ["سياسة الخصوصية","شروط الاستخدام","اتصل بنا","اللغة","مشاركة","تسجيل خروج"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
}



extension SettingVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") as? SettingCell
        
        
        cell?.lbl_text.text  = titleArry[indexPath.row]
        
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("xx")
        case 1:
            print("xx")
            
        case 2:
            print("xx")
        case 3:
            
            print("xx")
            
        case 4:
            
            print("xx")
            
        case 5:
            UserDefaults.standard.set(false, forKey: "status")
            Switcher.updateRootVC()

        default:
            print("xx")
            
        }
    }
    
    
    
    
    
    
    
    
}




class SettingCell:UITableViewCell{
    
    @IBOutlet weak var lbl_text: UILabel!
    
    
    
    
}
