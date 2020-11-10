//
//  QuestionsVC.swift
//  Besmart
//
//  Created by mac on 12/9/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class QuestionsVC: UIViewController {

    @IBOutlet weak var stacV: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    var isFave = false
var isSub = false
    var isTeacher = false
    var Id = Int()
    var type = String()
    var questionArry: [quetionsOB] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        
        
        
        if isTeacher != true {
        
        
        if isFave == true {
            stacV.viewWithTag(1)?.isHidden = true
            GetVid()
        }else if isSub == true {
GetSubQa()
        }else{
            GetQuestion(id:Id)

        }
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    func GetSubQa(){
                  
                  DataClient.GetSubQa(success: { (dict) in
                    
                      
                      self.questionArry = dict
                      
                      
          self.tableView.reloadData()
                      
                  }, failure: { (err) in
                  })
                  
              }
       func GetVid(){
               
               DataClient.GetFave(success: { (dict) in
                 
                   
                   self.questionArry = dict.faveQa
                   
                   
       self.tableView.reloadData()
                   
               }, failure: { (err) in
               })
               
           }

    func GetQuestion(id:Int){
        
        DataClient.GetQA(materialId: Id, success: { (dict) in
            print("cities Success")
            print(dict)
            self.questionArry = dict
            self.tableView.reloadData()
            
        }, failure: { (err) in
        })
        
    }
    
    
}




extension QuestionsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "qCell") as? QuestionsCell
        let obj = questionArry[indexPath.row]
        
        cell?.lbl_title.text = obj.question
        cell?.lbl_desc.text = obj.answer
        cell?.lbl_teacherName.text = obj.teacher_name
        cell?.lbl_country.text = obj.country_name
        cell?.lbl_subject.text = obj.material_name
        cell?.lbl_country.text = obj.section_name
        cell?.lbl_price.text = "\(obj.price ?? "")$"
        
        if obj.is_purchased == true {
            
            cell?.shwoMore.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)

            cell?.shwoMore.setTitle("عرض المزيد", for: .normal)
            cell?.priceView.isHidden = true
        }else{
           
            cell?.shwoMore.setTitle("شراء الان", for: .normal)
            cell?.shwoMore.setTitleColor(UIColor(hexString: "BCED4A"), for: .normal)

            cell?.priceView.isHidden = false
        }

        
        return cell!
    }
    
    
    
    
    
    
    
    
}
