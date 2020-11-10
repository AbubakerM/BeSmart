//
//  TeahcerInfoVC.swift
//  Besmart
//
//  Created by mac on 3/1/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class TeahcerInfoVC: UIViewController {

    @IBOutlet weak var lbl_text: UITextView!
    @IBOutlet weak var lbl_date: UILabel!
    @IBOutlet weak var counrtyImg: UIImageView!
    @IBOutlet weak var lbl_country: UILabel!
    @IBOutlet weak var lbl_work: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var proImg: UIImageView!
    
    
    var Id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
getInfo()
        // Do any additional setup after loading the view.
    }
    

    
    func getInfo(){
           
        DataClient.ShowTeacherPro(id: Id, success: { (dict) in
               print("cities Success")
               print(dict)
            
            
       
            self.lbl2.text = "@\(dict.employmentNumber ?? "" )"
            self.teacherName.text = "\(dict.firstName ?? "") \(dict.lastName ?? "" )"
            
            let url1 = URL(string: dict.image_link ?? "" )
            let url2 = URL(string: dict.country_image ?? "" )

            self.counrtyImg.sd_setImage(with: url2)
            self.proImg.sd_setImage(with: url1)
            
            self.lbl_country.text = dict.country_name ?? ""
            self.lbl_work.text = dict.speciality_name ?? ""
            self.lbl_date.text = dict.join_date ?? ""
            
            
            
            
             
               
               
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
