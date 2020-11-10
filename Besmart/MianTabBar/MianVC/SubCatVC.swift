//
//  SubCatVC.swift
//  Besmart
//
//  Created by mac on 2/6/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class SubCatVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var iD = 0
    
    var spec : [specialitiesOB]=[]
    
    var sectionsData: [sectionsOB] = []

    override func viewDidLoad() {
        super.viewDidLoad()
getCountries(Id: iD)
        
        // Do any additional setup after loading the view.
    }
    

    func GetSp(){
        
        DataClient.GetSpecialities(id: iD, success: { (dict) in
            print("cities Success")
            print(dict)
            self.spec = dict
            
            self.tableView.reloadData()
            
        }, failure: { (err) in
        })
        
        
        
        
    }
    
    func getCountries(Id:Int){
             
        DataClient.GetSectionByCountries(Id:Id,success: { (dict) in
                 print("cities Success")
                 print(dict)
                 self.sectionsData = dict
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



extension  SubCatVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sectionsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCEll") as? subCell
        
        let obj = sectionsData[indexPath.row]
        cell?.lbl_title.text = obj.sectionName
        
        
        let url = URL(string: obj.image_link)
        cell?.subImg.sd_setImage(with: url)

        
        
        
        
        
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
              let vc = storyboard?.instantiateViewController(withIdentifier: "SecoundryLevelVC") as? SecoundryLevelVC
             
        
        let obj = sectionsData[indexPath.row]
        
        
        vc?.iD = obj.id
        vc?.title = obj.sectionName

        navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    
    
    
    
    
    
}
