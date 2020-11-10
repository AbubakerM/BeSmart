//
//  CorsessVC.swift
//  Besmart
//
//  Created by mac on 2/11/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class CorsessVC: UIViewController {
    
    @IBOutlet weak var txt_search: UITextField!
    
     @IBOutlet weak var tableView: UITableView!
    
    var corseArry:[CoursesOB]=[]
    var iD =  0
    
    var isshowAll = false
    var isSub = false
    var isTeacher = false
        override func viewDidLoad() {
            super.viewDidLoad()

            if isTeacher != true {
            
            if isSub == true {
                GetCorseSp()
            }else if isshowAll == true {
GetSlider()
            }else{
                GetSp()

                }
            }
        }
        
    
     func GetSlider(){
         
         DataClient.GetSlider(success: { (dict) in
             print("cities Success")
             print(dict)

             
       
             self.corseArry = dict.corsesArry
       
             self.tableView.reloadData()
             
             
         }, failure: { (err) in
         })
         
         
         
         
     }
    
    
    func GetCorseSp(){
                        
                        DataClient.GetSubCorse( success: { (dict) in
                            print("cities Success")
                            print(dict)
                            self.corseArry = dict
                            
                            self.tableView.reloadData()
                            
                        }, failure: { (err) in
                        })
                        
                        
                        
                        
                    }
                    
    func GetSp(){
                      
                      DataClient.GetCorse(materialId: iD, success: { (dict) in
                          print("cities Success")
                          print(dict)
                          self.corseArry = dict
                          
                          self.tableView.reloadData()
                          
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




    extension CorsessVC:UITableViewDelegate,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return corseArry.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCelll") as? CourseTableCell
            
            let obj  = corseArry[indexPath.row]
            cell?.lbl_title.text = obj.courseName
            cell?.lbl_jop.text = obj.material_name
            cell?.lbl_course.text = obj.division_name
            cell?.lbl_name.text = obj.teacher_name
            cell?.lbl_internt.text = obj.country_name
            cell?.pricee.text = "\(obj.price!)$"
            if obj.is_favoraite == true {
                
                cell?.favImg.setImage(UIImage(named: "heartGreen"), for: .normal)
            }else{
               cell?.favImg.setImage(UIImage(named: "heart"), for: .normal)
            }
            
            
            if obj.is_purchased == true {
                
                cell?.priceView.isHidden = true
                
            }else{
                cell?.priceView.isHidden = false

              

                
            }
            
            let url = URL(string: obj.image_link ?? "" )
            cell?.img.sd_setImage(with: url)
            return cell!
        }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              let obj = corseArry[indexPath.row]
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                     let vc = storyboard.instantiateViewController(withIdentifier: "VideoDetialVC") as! VideoDetialVC

                                  vc.obj = obj

                                      navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
        
        
        
    }
