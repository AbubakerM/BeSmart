//
//  SecoundryLevelVC.swift
//  Besmart
//
//  Created by mac on 2/6/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class SecoundryLevelVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
       private let spacing:CGFloat = 16.0

    var iD = 0
    
    var spec : [specialitiesOB]=[]

    
    
       override func viewDidLoad() {
           super.viewDidLoad()
           
           
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
            self.collectionView?.collectionViewLayout = layout
//GetDiv()
        GetSp()
           // Do any additional setup after loading the view.
       }
       

    func GetSp(){
        
        DataClient.GetSpecialities(id: iD, success: { (dict) in
            print("cities Success")
            print(dict)
            self.spec = dict
            
            self.collectionView.reloadData()
            
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



   extension SecoundryLevelVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spec.count
       }
       
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
           let numberOfItemsPerRow:CGFloat = 2
           let spacingBetweenCells:CGFloat = 16
           
           let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
           
           if let collection = self.collectionView{
               let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
               return CGSize(width: width, height: width)
           }else{
               return CGSize(width: 156, height: 189)
           }
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secCell", for: indexPath) as? BranchCell
        
        let obj = spec[indexPath.row]
        
        cell?.lblTitle.text = obj.specialityName
        let url = URL(string: obj.image_link)
        cell?.img.sd_setImage(with: url)
           
   //     let obj = CienmaArry[indexPath.row]
   //
   //        let url = URL(string: obj.image_link!)
   //        cell?.img.sd_setImage(with: url)
   //        cell?.title.text = obj.lessonName
   //        cell?.lbl_work.text = obj.speciality_name
   //        cell?.lbl_subject.text = obj.material_name
   //        cell?.lbl_profile.text = obj.teacher_name
   //        cell?.lbl_time.text = obj.video_duration
   //        cell?.lbl_price.text = obj.price
   //
   //        if obj.is_favoraite == true {
   //            cell?.img.image =  #imageLiteral(resourceName: "Path 4937")
   //        }else{
   //
   //            cell?.img.image =  #imageLiteral(resourceName: "heart")
   //
   //
   //        }

           
           
           
           
           return cell!
       }
       
       
       
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let vc = storyboard.instantiateViewController(withIdentifier: "BranchesVC") as! BranchesVC
   let backButton = UIBarButtonItem()

   backButton.title = "name"

   self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        let obj = spec[indexPath.row]

        vc.iD = obj.id
        vc.title = obj.specialityName

   
           navigationController?.pushViewController(vc, animated: true)

           
       }
       
       
       
       
   }


