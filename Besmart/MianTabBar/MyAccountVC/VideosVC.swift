//
//  VideosVC.swift
//  Besmart
//
//  Created by mac on 12/11/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class VideosVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var Id = Int()
    var type = ""
    var VideosArry: [TeacherVideosOB] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        GetVideos(Id: Id, type: type)
        // Do any additional setup after loading the view.
    }
    
    
    
    func GetVideos(Id:Int,type:String){
        
        DataClient.GetTeacherVideo(Id: Id, type: type, success: { (dict) in
            
            
            print("cities Success")
            print(dict)
            self.VideosArry = dict
            
            
           self.tableView.reloadData()
            
            
            
        }, failure: { (err) in
        })
        
        
        
        
    }
    
    
}




extension VideosVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VideosArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videosCell") as? VideosCell
        
        let obj = VideosArry[indexPath.row]
        
        
        let url = URL(string: obj.image_link!)
        
        cell?.back_img.sd_setImage(with: url)
        cell?.lbl_title.text = obj.lessonName
        cell?.lbl_country.text = obj.country_name
        cell?.lbl_level.text = obj.section_name
        cell?.lbl_university.text = obj.material_name
        cell?.lbl_profile.text = obj.speciality_name
        cell?.price.text = obj.price
        
        if obj.is_favoraite == true {
            cell?.img.image =  #imageLiteral(resourceName: "Path 4937")
        }else{
            
            cell?.img.image =  #imageLiteral(resourceName: "heart")
            
            
        }
        return cell!
    }
    
    
    
    
    
    
    
    
}
