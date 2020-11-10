//
//  OnlineCourseVC.swift
//  Besmart
//
//  Created by mac on 12/9/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class OnlineCourseVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var Id = Int()
    var isFave = false
    var type = ""
    var OnlineCourseArry: [CoursesOB] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()


        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isFave == true {
            GetVid()
        }else{
                   GetOnlineCourse(Id:Id, type: type)

        }
        
    }
    
    
    func GetVid(){
            
            DataClient.GetFave(success: { (dict) in
              
                
                self.OnlineCourseArry = dict.favCorse
                
                
    self.tableView.reloadData()
                
            }, failure: { (err) in
            })
            
        }

    
    
    func GetOnlineCourse(Id:Int,type:String){
        
        DataClient.GetTeacherCourse(Id: Id, type: type, success: { (dict) in
            
            
            print("cities Success")
            print(dict)
            self.OnlineCourseArry = dict
            
            
            self.tableView.reloadData()
            
            
            
        }, failure: { (err) in
        })
        
        
        
        
    }
    
    
}




extension OnlineCourseVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OnlineCourseArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videosCell") as? onlineCell
        
        let obj = OnlineCourseArry[indexPath.row]


        let url = URL(string: obj.image_link!)

        
        
//        cell?.img.sd
        
              cell?.title.text = obj.courseName
              cell?.lbl_divison.text = obj.section_name
              cell?.lbl_teacherName.text = obj.teacher_name
              cell?.lbl_subSubject.text = obj.material_name
              cell?.lbl_duration.text = obj.lesson_time
              
              cell?.lbl_price.text = "\(obj.price ?? "")$"
              
              
        cell?.buyBtn.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)

            
              cell?.buyBtn.tag = indexPath.row
        if obj.is_favoraite == true {
            cell?.img.image =  #imageLiteral(resourceName: "Path 4937")
        }else{

            cell?.img.image =  #imageLiteral(resourceName: "heart")


        }
        
        
        if obj.is_purchased == true {
            cell?.priceView.isHidden = true               }else{

                   cell?.priceView.isHidden = false
            
            
            
        }
               
        
        
        
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "PlayVideosVC") as! PlayVideosVC
//        
//        
//        vc.obj = OnlineCourseArry[indexPath.row]
//        vc.isTeacherCorse = true
//        navigationController?.pushViewController(vc, animated: true)
//        
        
    }
    
    
    @objc func connected(sender: UIButton){
            let buttonTag = sender.tag
            
            
            let obj = OnlineCourseArry[buttonTag]
            
            if obj.is_purchased == true {
         
    
                                     let obj = OnlineCourseArry[buttonTag]
                                     let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                        let vc = storyboard.instantiateViewController(withIdentifier: "PlayVideosVC") as! PlayVideosVC
    
                                     vc.isOnline = true
                                     vc.vidId = obj.id
    
                                         navigationController?.pushViewController(vc, animated: true)
                
                
                }else{
                
                
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "PayVC") as? PayVC
                     
                controller?.Id = obj.id
                
                controller?.type = "onlineVideo"
                                       controller?.modalTransitionStyle   = .crossDissolve;
                                       controller?.modalPresentationStyle = .overCurrentContext
                                       controller?.modalPresentationStyle = .overCurrentContext
                                       present(controller!, animated: true, completion: nil)
                
                  
                }
            
            
            
        }
        
    
    
    
    
}
