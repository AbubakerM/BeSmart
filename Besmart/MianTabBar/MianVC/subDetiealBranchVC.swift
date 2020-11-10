//
//  subDetiealBranchVC.swift
//  Besmart
//
//  Created by mac on 2/6/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class subDetiealBranchVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var iDD = 0
    
    var imgAryy = ["t1","t2","t3","t4","t5"]
    var iconArry = ["bt1","bt2","bt3","bt4","bt5"]

    var titleArry = ["فيديو","كورس","شرح أون لاين","أسئلة وأجوبة","مذكرات"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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


extension subDetiealBranchVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgAryy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subDetiealCell") as? subDetiealBranCell
        
        if indexPath.row%2 == 0 {
            cell?.leftImg.isHidden = true
            cell?.rightImg.isHidden = false
        }else{
            
            cell?.rightImg.isHidden = true
            cell?.leftImg.isHidden = false

            
        }
        

        cell?.icImg.image = UIImage(named: iconArry[indexPath.row])
        
        cell?.icTitle.text = titleArry[indexPath.row]
        cell?.leftImg.image = UIImage(named: imgAryy[indexPath.row])
        cell?.rightImg.image = UIImage(named: imgAryy[indexPath.row])

        
        
        
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {

                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "VideossVC") as! VideossVC
            
            
                    vc.iD = iDD
            vc.title = "فيديو"

            
                    navigationController?.pushViewController(vc, animated: true)

            
        }else if indexPath.row == 1 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                         let vc = storyboard.instantiateViewController(withIdentifier: "CorsessVC") as! CorsessVC
                 
                 
                         vc.iD = iDD
                 vc.title = "كورس"

                         navigationController?.pushViewController(vc, animated: true)
            
        }else if indexPath.row == 2 {
            

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                 let vc = storyboard.instantiateViewController(withIdentifier: "explianOnlineVC") as! explianOnlineVC
                         
                         
                                 vc.iD = iDD
                         vc.title = "شرح أون لاين"

                                 navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 3 {
            
            
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                 let vc = storyboard.instantiateViewController(withIdentifier: "QuestionsVC") as! QuestionsVC
                         
                         
            vc.Id = iDD
                         vc.title = "أسئلة وأجوبة"

                                 navigationController?.pushViewController(vc, animated: true)
            
        }else{
            
            
            
                     
                     
                     let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                          let vc = storyboard.instantiateViewController(withIdentifier: "NotesVC") as! NotesVC
                                  
                                  
                     vc.Id = iDD
                                  vc.title = "مذكرات"

                                          navigationController?.pushViewController(vc, animated: true)
                     
            
            
        }
    }
    
    
    
    
    
}
