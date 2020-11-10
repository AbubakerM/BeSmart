//
//  NoesVC.swift
//  Besmart
//
//  Created by mac on 12/9/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class NotesVC: UIViewController {

    @IBOutlet weak var stckV: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var isSub = false
    var Id = Int()
    var type = ""
    var isfave = false
    var isTeacher = false
    var notesArry : [NotesOB] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if isTeacher != true {
        print("xxxxxx",isfave)
            if isfave == true {
                
                self.stckV.viewWithTag(1)?.isHidden = true
                 GetVid()
            }else if isSub == true {
                
                GetSubNote()

            }else{
                GetNotes(id:Id, type: type)

        }
            
        }
            
    }
    func GetSubNote(){
               
               DataClient.GetSubNote(success: { (dict) in
                 
                   
                   self.notesArry = dict
                   
                   
       self.tableView.reloadData()
                   
               }, failure: { (err) in
               })
               
           }
    
    func GetVid(){
            
            DataClient.GetFave(success: { (dict) in
              
                
                self.notesArry = dict.favNote
                
                
    self.tableView.reloadData()
                
            }, failure: { (err) in
            })
            
        }

    func GetNotes(id:Int,type:String){
        
        DataClient.GetNotes( materialId: 52, success: { (dict) in
            print("cities Success")
            print(dict)
            self.notesArry = dict
self.tableView.reloadData()
            
        }, failure: { (err) in
        })
        
    }
    

}




extension NotesVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "noteCell") as? NotesCell
        
        
        let obj = notesArry[indexPath.row]
        
        
        
        cell?.lbl_title.text = obj.noteName
        cell?.lbl_filename.text = obj.noteName
        
        cell?.lbl_techName.text = obj.teacher_name
        cell?.lbl_country.text = obj.section_name
        cell?.lbl_subject.text = obj.material_name

        cell?.lbl_price.text = "\(obj.price )$"
        if obj.is_purchased == true {
                
            cell?.downloadBtn.setImage(#imageLiteral(resourceName: "cloud-storage-download"), for: .normal)
            cell?.buyNow.isHidden = true

                cell?.priceView.isHidden = true
            }else{
               
            
            cell?.downloadBtn.isHidden = true
                   cell?.buyNow.isHidden = false
                cell?.downloadBtn.setTitleColor(UIColor(hexString: "BCED4A"), for: .normal)

                cell?.priceView.isHidden = false
            }
        return cell!
    }
    
    
    
    
    
    
    
    
}
