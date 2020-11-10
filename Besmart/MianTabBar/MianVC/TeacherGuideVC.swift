//
//  TeacherGuideVC.swift
//  Besmart
//
//  Created by mac on 12/8/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class TeacherGuideVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var TechaerArry: [TeacherOB] = []
    var delegate: MyDataSendingDelegateProtocol? = nil

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        GetTeach()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func filterButt(_ sender: Any) {
        
        
        
        
        
        
    }
    
    func GetTeach(){
        
        DataClient.GetTeacher(success: { (dict) in
            print("cities Success")
            print(dict)
            self.TechaerArry = dict
            self.tableView.reloadData()
        }, failure: { (err) in
        })
        
        
        
        
    }
    
    
}




extension TeacherGuideVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TechaerArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teachCell") as? TeacherGuideCell
        let obj = TechaerArry[indexPath.row]
        
        
        let url = URL(string: obj.image_link!)
        cell?.back_img.sd_setImage(with: url)
        cell?.lbl_title.text = "\(obj.firstName!) \(obj.lastName!)"
        cell?.lbl_country.text = obj.country_name
        cell?.lbl_level.text = obj.section_name
        cell?.lbl_university.text = obj.material_name
        cell?.lbl_profile.text = obj.speciality_name
        
        if obj.is_favoraite == true {
            cell?.img.image =  #imageLiteral(resourceName: "Path 4937")
        }else{
            
            cell?.img.image =  #imageLiteral(resourceName: "heart")
            
            
        }
        return cell!
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let obj = TechaerArry[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TeachersAccountVC") as! TeachersAccountVC
        vc.obj = obj
//        self.delegate?.sendDataToFirstViewController(myData: obj)
        
        
       self.navigationController?.pushViewController(vc, animated: true)

        
    }
    
    
    
}


protocol MyDataSendingDelegateProtocol {
    func sendDataToFirstViewController(myData: TeacherOB)
}
