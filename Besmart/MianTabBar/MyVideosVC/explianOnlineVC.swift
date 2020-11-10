//
//  explianOnlineVC.swift
//  Besmart
//
//  Created by mac on 2/12/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class explianOnlineVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var iD =  0
    var isSub = false
    var isTeacher = false
    

    var onlineArrt:[vidoesOB]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isTeacher != true {
        if isSub == true {
            GetOnlineSp()
        }else{
            GetSp()

        }
            
        }
    }
    
    
    func GetOnlineSp(){
           
           DataClient.GetSubOnline( success: { (dict) in
               print("cities Success")
               print(dict)
               self.onlineArrt = dict
               
               self.tableView.reloadData()
               
           }, failure: { (err) in
           })
           
           
           
           
       }
    
    func GetSp(){
        
        DataClient.GetOnlinVid(materialId: 2, success: { (dict) in
            print("cities Success")
            print(dict)
            self.onlineArrt = dict
            
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





extension explianOnlineVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        onlineArrt.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "onlineCelll") as? onlineCell
        
        let obj = onlineArrt[indexPath.row]
        
        cell?.title.text = obj.lessonName
        cell?.lbl_divison.text = obj.section_name
        cell?.lbl_teacherName.text = obj.teacher_name
        cell?.lbl_subSubject.text = obj.material_name
        cell?.lbl_duration.text = obj.lesson_time
        
        cell?.lbl_price.text = "\(obj.price ?? "" )$"
        if obj.is_purchased == true {
            cell?.lbl_w.text = "مشاهدة"
            cell?.priceView.isHidden = true
        }else{
            cell?.lbl_w.text = "شراءالان"
            cell?.priceView.isHidden = false
        }
        
        cell?.buyBtn.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)

        
          cell?.buyBtn.tag = indexPath.row

        if obj.is_favoraite == true {
                       
                       cell?.favImg.setImage(UIImage(named: "heartGreen"), for: .normal)
                   }else{
                      cell?.favImg.setImage(UIImage(named: "heart"), for: .normal)
                   }
        

        
        return cell!
    }
    
    
    @objc func connected(sender: UIButton){
        let buttonTag = sender.tag
        let id = UserDefaults.standard.integer(forKey: "userId")

        if id == -1 {
                        showSimpleAlert()
                                                              
                                                              return
                                }
        let obj = onlineArrt[buttonTag]
        
        if obj.is_purchased == true {
     
let obj = onlineArrt[buttonTag]
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
