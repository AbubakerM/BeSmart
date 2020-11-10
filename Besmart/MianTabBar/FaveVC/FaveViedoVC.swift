//
//  FaveViedoVC.swift
//  Besmart
//
//  Created by mac on 2/5/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class FaveViedoVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var isFave = false
    var corseArray:[CoursesOB]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GetVid()
    }
    
    func GetVid(){
            
            DataClient.GetFave(success: { (dict) in
              
                
                self.corseArray = dict.favCorse
                
                
    self.tableView.reloadData()
                
            }, failure: { (err) in
            })
            
        }
    


}




extension FaveViedoVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return corseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favVideoCell") as? CourseTableCell
        
        let obj = corseArray[indexPath.row]
        
        
        
        let url = URL(string: obj.image_link ?? "")
        cell?.img.sd_setImage(with: url)
        
        
        cell?.lbl_title.text = obj.courseName
        cell?.pricee.text = "\(obj.price ?? "")$"
        cell?.lbl_jop.text = obj.material_name
        cell?.lbl_name.text = obj.teacher_name
        
        cell?.lbl_internt.text = obj.country_name
        
        
        cell?.lbl_course.text = obj.division_name

//        cell?.lbl_Rate.text = obj.ra
        
        
        if obj.is_favoraite == true {
            cell?.likeImg.image = #imageLiteral(resourceName: "heartGreen")
        }else{
            cell?.likeImg.image = #imageLiteral(resourceName: "heart")

        }
        
        
        if obj.is_purchased == true {
            cell?.priceView.isHidden = true
        }else{
            cell?.priceView.isHidden = false

        }
        
        return cell!
    }
    
    
    
    
    
    
    
    
}
