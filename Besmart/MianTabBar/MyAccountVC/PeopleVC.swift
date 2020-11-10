//
//  PeopleVC.swift
//  Besmart
//
//  Created by mac on 2/2/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class PeopleVC: UIViewController,SendData {
    func sendDataToFirstViewController2(countryId: Int, matId: Int, secId: Int, spId: Int, teacher: Int) {
        print("z")
    }
    
  
    
    private let spacing:CGFloat = 15
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var peopleData:[followTeacherOB]=[]
    var TeacherData:[TeacherOB]=[]
    var isTeachers = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
                        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
                        layout.minimumLineSpacing = spacing
                        layout.minimumInteritemSpacing = spacing
                        self.collectionView?.collectionViewLayout = layout

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        
        if isTeachers == true {
  GetTeachers(coountId: 0, spId: 0, matId: 0, secId: 0, rateId: 0)        }else{
            
            
            GetProfile()

        }
    }
    
    @IBAction func filterBtn(_ sender: Any) {
        
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController


        controller?.delegate = self

        controller?.isTeacher = true
                               controller?.modalTransitionStyle   = .crossDissolve;


                                                                 controller?.modalPresentationStyle = .overCurrentContext


                                                                 controller?.modalPresentationStyle = .overCurrentContext


                                                                 present(controller!, animated: true, completion: nil)
    }
    
    
    
    
    func GetTeachers(coountId:Int,spId:Int,matId:Int,secId:Int,rateId:Int){
               
        DataClient.GetTeachers(country_id: coountId, speciality_id: spId, material_id: matId, section_id: secId, rateId: rateId, success: { (dict) in
                   print("cities Success")
                   print(dict)
                   self.TeacherData = dict
                   
                   
                   
                   self.collectionView.reloadData()
                   
                   
               }, failure: { (err) in
               })
               
               
               
               
           }
       
    
    func sendDataToFirstViewController(countryId: Int, matId: Int, secId: Int, spId: Int, rateId: Int) {
          GetTeachers(coountId: countryId, spId: spId, matId: matId, secId: secId, rateId: rateId)
      }
    func GetProfile(){
            
            DataClient.GetStudProfile(success: { (dict) in
                print("cities Success")
                print(dict)
                self.peopleData = dict.followTeachArry
                
                
                
                self.collectionView.reloadData()
                
                
            }, failure: { (err) in
            })
            
            
            
            
        }
    
    

  

}



extension PeopleVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isTeachers == true {
            return TeacherData.count
        }else{
            return peopleData.count

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "peopleCell", for: indexPath) as? PeopleCCell
        
        
        
        if isTeachers == true {
                 let obj = TeacherData[indexPath.row]
            
             cell?.lbl_name.text = "\(obj.firstName ?? "") \(obj.lastName ?? "")"
             
             cell?.lbl_country.text = obj.country_name
             cell?.lbl_work.text = obj.speciality_name
             
            
            cell?.lbl_reveiw.text = "\(obj.teacher_rating?.rounded(toPlaces: 1) ?? 0.0 )"
            let url = URL(string:obj.image_link ?? "" )
            cell?.img.sd_setImage(with: url)
            
//            cell?.lbl_reveiw.text = "\(obj.)"

             }else{
                 let obj = peopleData[indexPath.row]
            
             cell?.lbl_name.text = "\(obj.firstName ?? "") \(obj.lastName ?? "")"
             
             cell?.lbl_country.text = obj.country_name
             cell?.lbl_work.text = obj.speciality_name
            cell?.lbl_reveiw.text = "\(obj.teacher_rating?.rounded(toPlaces: 1)  ?? 0.0)"

            
            let url = URL(string:obj.image_link ?? "" )
                       cell?.img.sd_setImage(with: url)
            cell?.lbl_reveiw.text = "\(obj.teacher_rating?.rounded(toPlaces: 1) ?? 0.0)"

             }
        
        
        
        
 
        return cell!
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
              
              let numberOfItemsPerRow:CGFloat = 2
              let spacingBetweenCells:CGFloat = 15
              
              let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
              
              if let collection = self.collectionView{
                  let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                  return CGSize(width: width, height: 217)
              }else{
                  return CGSize(width: 156, height: 217)
              }
          }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
        
        if isTeachers == true {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TeachersVC") as? TeachersVC
                                          
            //                              let backItem = UIBarButtonItem()
            //                                 backItem.title = "دليل المدرسين"
                                          
                                        
                    vc?.Id = TeacherData[indexPath.row].id
            //                                 navigationItem.backBarButtonItem = backItem
                                    navigationController?.pushViewController(vc!, animated: true)

        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "TeachersVC") as? TeachersVC
                                          
            //                              let backItem = UIBarButtonItem()
            //                                 backItem.title = "دليل المدرسين"
                                          
                                        
            vc?.Id = peopleData[indexPath.row].id ?? 0
            //                                 navigationItem.backBarButtonItem = backItem
                                    navigationController?.pushViewController(vc!, animated: true)

        }
                  

         
               
    }
               
           
       
    
    
    
    
}
