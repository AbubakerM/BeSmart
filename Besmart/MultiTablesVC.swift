//
//  MultiTablesVC.swift
//  Besmart
//
//  Created by mac on 2/23/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class MultiTablesVC: UIViewController {

    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var leftV: UIView!
    @IBOutlet weak var lbl_corse: UILabel!
    @IBOutlet weak var imageg: UIImageView!
    @IBOutlet weak var lbl_rate: UILabel!
    
    @IBOutlet weak var lbl_material: UILabel!
    @IBOutlet weak var lbl_contry: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    
    @IBOutlet weak var lbl_section: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var obj:CoursesOB!
    var types = ""
    
    var NoteData:[NotesOB]=[]
    var VideoData:[vidoesOB]=[]
    var QaData:[quetionsOB]=[]
    var OnlineData:[CoursesOB]=[]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let url = URL(string: obj.image_link ?? "" )
//        
//        imageg.sd_setImage(with: url)
        lbl_corse.text = obj.courseName
        
        lbl_contry.text = obj.country_name
        lbl_section.text = obj.division_name
        lbl_material.text = obj.material_name
        teacherName.text = obj.teacher_name
        
        let url = URL(string: obj.image_link ?? "" )
        imageg.sd_setImage(with: url)
        
        
    leftV.layer.cornerRadius = CGFloat(8)
        
  leftV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        
        
        if types == "Video"{
            
            
            self.lbl_title.text = "فيديو"
GetDataViedos()
               }else if types == "Online" {
                   self.lbl_title.text = "شرح أونلاين"

GetDataOnline()
               
               }else if types == "QA" {
            
            self.lbl_title.text = "أسئلة وأجوبة"

GetDataQA()
               }else if types == "Note" {
            
            self.lbl_title.text = "مذكرات"

GetDataNote()
               }

        // Do any additional setup after loading the view.
    }
 
    
    func GetDataViedos(){
                   
        DataClient.GetCorseVideo(id: obj.id, success: { (dict) in
                     
            
            
            self.VideoData = dict
            self.tableView.reloadData()
            
                       
                   }, failure: { (err) in
                   })
                   
               }



 
    func GetDataOnline(){
                   
        DataClient.GetCorseOnline(id: obj.id, success: { (dict) in

            
            self.OnlineData = dict
                    self.tableView.reloadData()
                    
                       
                   }, failure: { (err) in
                   })
                   
               }




 
    func GetDataQA(){
                   
        DataClient.GetCorseQA(id: obj.id, success: { (dict) in
                     self.QaData = dict
                             self.tableView.reloadData()
                             
                       
                   }, failure: { (err) in
                   })
                   
               }



 
    func GetDataNote(){
                   
        DataClient.GetCorseNote(id: obj.id, success: { (dict) in
                     
                   self.NoteData = dict
                           self.tableView.reloadData()
                           
                   }, failure: { (err) in
                   })
                   
               }

}




extension MultiTablesVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if types == "Video"{
            return VideoData.count

        }else if types == "Online" {
            
            return OnlineData.count
            
        
        }else if types == "QA" {
            return QaData.count

        }else if types == "Note" {
            return NoteData.count

        }else{
            return 0
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
                if types == "Video"{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCElll") as? FaveCell
                    
                    
                    
                    let obj = VideoData[indexPath.row]
                    
                    let url = URL(string: obj.image_link ?? "")
                                       cell?.img?.sd_setImage(with: url)
                    cell?.lbl_time.text = obj.video_duration
                    cell?.lbl_title.text = obj.lessonName
//                    cell?.lbl_views.text = obj.
                    
                    return cell!
                    
        }else if types == "Online" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "onlineCelll") as? onlineV
                    
                      let obj2 = OnlineData[indexPath.row]


                           

                            
                    let url = URL(string: obj2.image_link ?? "")
                    cell?.img?.sd_setImage(with: url)
                cell?.lbl_title.text = obj.lessonName
                cell?.lbl_time.text = obj.lesson_time
                                 
                            
                        
                            return cell!
                             
        
        }else if types == "QA" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "qCelll") as? QuestionsCell
                    
                    let obj = QaData[indexPath.row]
                           
                           cell?.lbl_title.text = obj.question
                           cell?.lbl_desc.text = obj.answer
                           
                    return cell!
                             
        }else if types == "Note" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "noteCelll") as? NotesCell
                    
                    
                    let obj = NoteData[indexPath.row]
                    
                    
                    
                    cell?.lbl_title.text = obj.noteName
                    cell?.lbl_filename.text = obj.noteName
                    
                 
            //
                    return cell!
                             
                }else{
                    return UITableViewCell()

        }
        


    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
                 if types == "Video"{
                          
                            let obj = VideoData[indexPath.row]
                            

                         
                             let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                    let vc = storyboard.instantiateViewController(withIdentifier: "PlayVideosVC") as! PlayVideosVC
                         
                         vc.Id = obj.id

                                    navigationController?.pushViewController(vc, animated: true)
                }else if types == "Online" {
//
//                    let cell = tableView.dequeueReusableCell(withIdentifier: "onlineCelll") as? onlineV
//
//                              let obj2 = OnlineData[indexPath.row]
//
//
//
//
//
//                            let url = URL(string: obj2.image_link ?? "")
//                            cell?.img?.sd_setImage(with: url)
//                        cell?.lbl_title.text = obj.lessonName
//                        cell?.lbl_time.text = obj.lesson_time
//
//
//
//                                    return cell!
                                     
                
                }else if types == "QA" {
//                    let cell = tableView.dequeueReusableCell(withIdentifier: "qCelll") as? QuestionsCell
//
//                            let obj = QaData[indexPath.row]
//
//                                   cell?.lbl_title.text = obj.question
//                                   cell?.lbl_desc.text = obj.answer
//
//                            return cell!
//
                }else if types == "Note" {
//                    let cell = tableView.dequeueReusableCell(withIdentifier: "noteCelll") as? NotesCell
//
//
//                            let obj = NoteData[indexPath.row]
//
//
//
//                            cell?.lbl_title.text = obj.noteName
//                            cell?.lbl_filename.text = obj.noteName
//
//
//                    //
//                            return cell!
                                     
                        }
    }
    
    
    
    
    
    
}
