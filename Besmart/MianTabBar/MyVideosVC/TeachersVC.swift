//
//  TeachersVC.swift
//  Besmart
//
//  Created by mac on 2/18/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class TeachersVC: UIViewController {

    
    var imgArry = ["playB","video-player","ic5","icon6","icon7","starr"]
    var ToptitleArry = ["الفيديوهات","كورس","أسئلة وأجوبة","فيديو أون لاين","مذكرات","التقييم"]
    var colorView = ["A6D141","D16D41","41C7D1","D14141","A6D141","FFE622"]


    @IBOutlet weak var proImg: UIImageView!
    
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_Work: UILabel!
    
    @IBOutlet weak var backV: UIView!
    @IBOutlet weak var foloowerCount: UILabel!
    @IBOutlet weak var lbl_follow: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var followImg: UIImageView!
    private let spacing:CGFloat = 16.0
    var Id = 0
    
    var TeacherData:TeacherOB!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let layout = UICollectionViewFlowLayout()
                       layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
                       layout.minimumLineSpacing = spacing
                       layout.minimumInteritemSpacing = spacing
                       self.collectionView?.collectionViewLayout = layout
        
        
        backV.roundCorners([.layerMaxXMaxYCorner,.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner], radius: 8)
        backV.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.1, x: 0, y: 0, blur: 5, spread: 0)

              
        GetTeachers()
        // Do any additional setup after loading the view.
    }
    
    func GetTeachers(){
        
        DataClient.GetOneTeacher(Id: Id, success: { (dict) in
            print("cities Success")
            print(dict)
            self.TeacherData = dict
            
            
            self.lbl_name.text = "\(dict.firstName ?? "" ) \(dict.lastName ?? "")"
            
            
            let url = URL(string:dict.image_link ?? "" )
            
            self.proImg.sd_setImage(with: url)
            
            self.foloowerCount.text  = "\(dict.teacher_followers ?? 0)"
            
            
            if dict.is_favoraite == true {
                self.lbl_follow.text = "الغاء متابعة"

                
                self.lbl_follow.textColor = UIColor(hexString: "BCED4A")

                
                self.followImg.image =  self.followImg.changeImageColor(color: UIColor(hexString: "BCED4A"))

                
                self.lbl_Work.text = dict.speciality_name
                
                
                
//
//                self.followImg.image!.withRenderingMode(.alwaysTemplate)
//                              self.followImg.tintColor = UIColor(hexString: "BCED4A")
            }else{
                self.lbl_follow.text = "متابعة"
                            
                self.lbl_follow.textColor = UIColor(hexString: "A5A6AD")


        self.followImg.image =  self.followImg.changeImageColor(color: UIColor(hexString: "A5A6AD"))

            }
            self.collectionView.reloadData()
            
            
        }, failure: { (err) in
        })
        
        
        
        
    }
    
    func Like(){
           
           DataClient.FollowTeach(Id: Id, success: { (dict) in
               print("cities Success")
               print(dict)
            
            
            
            if dict == "Like" {
                self.lbl_follow.text = "الغاء متابعة"
                self.lbl_follow.textColor = UIColor(hexString: "BCED4A")
                  self.followImg.image =   self.followImg.changeImageColor(color: UIColor(hexString: "BCED4A"))

                
            }else{
                
               self.lbl_follow.text = "متابعة"
                
                self.lbl_follow.textColor = UIColor(hexString: "A5A6AD")

                  self.followImg.image =  self.followImg.changeImageColor(color: UIColor(hexString: "A5A6AD"))

                
            }
               
             
               
               
           }, failure: { (err) in
           })
           
           
           
           
       }
    
    @IBAction func MesaagesBtn(_ sender: Any) {
        
        
        
        
        
        
    }
    @IBAction func aboutMeBtn(_ sender: Any) {
        
        let obj = TeacherData

               
               
               
                     let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                              let vc = storyboard.instantiateViewController(withIdentifier: "TeahcerInfoVC") as! TeahcerInfoVC

        vc.Id = obj?.id ?? 0

                                               navigationController?.pushViewController(vc, animated: true)
        
        
        
        
        
    }
    
    @IBAction func followBtn(_ sender: Any) {
        Like()
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



extension TeachersVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Vcelll", for: indexPath) as? CatVideoCell
        
        if TeacherData != nil {
       if    indexPath.row == 0 {
           
        cell?.lbl_noTitle.text = "\(TeacherData.teacher_videos.count )"

            
            
        } else  if indexPath.row == 1 {
            
            
            cell?.lbl_noTitle.text = "\(TeacherData.teacher_courses.count ?? 0)"


            
        } else  if indexPath.row == 2 {
            
            
            cell?.lbl_noTitle.text = "\(TeacherData.teacher_QAs.count ?? 0)"

            
            
            
        }else  if indexPath.row == 3 {
            
            
            cell?.lbl_noTitle.text = "\(TeacherData.teacher_online_videos.count ?? 0)"

            
        }else  if indexPath.row == 4 {
            cell?.lbl_noTitle.text = "\(TeacherData.teacher_notes.count ?? 0)"

            
        }else  if indexPath.row == 5 {
        
        let y = Double(round(1000*(TeacherData.teacher_rating ?? 0.0))/1000)

            cell?.lbl_noTitle.text = "\(y)"

            
        }
        }
        
        cell?.img.image = UIImage(named:imgArry[indexPath.row])
        cell?.lbl_title.text = ToptitleArry[indexPath.row]
        
        cell?.backgroundView?.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.3, x: 0, y: 3, blur: 5, spread: 0)

        cell?.botomView.backgroundColor = UIColor(hexString: colorView[indexPath.row])
        
        return cell!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {

                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "VideossVC") as! VideossVC
            let obj = TeacherData.teacher_videos
                
                        vc.videoArry = obj
                
                        navigationController?.pushViewController(vc, animated: true)

                
            }else if indexPath.row == 1 {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                             let vc = storyboard.instantiateViewController(withIdentifier: "CorsessVC") as! CorsessVC

            let obj = TeacherData.teacher_courses

                             vc.isTeacher = true

            vc.corseArry = obj
            navigationController?.pushViewController(vc, animated: true)
                
            }else if indexPath.row == 2 {
                
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                let vc = storyboard.instantiateViewController(withIdentifier: "QuestionsVC") as! QuestionsVC

            
            let obj = TeacherData.teacher_QAs

                             vc.isTeacher = true

            vc.questionArry = obj

                                                navigationController?.pushViewController(vc, animated: true)

             
            }else if indexPath.row == 3 {
                
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                              let vc = storyboard.instantiateViewController(withIdentifier: "explianOnlineVC") as! explianOnlineVC


            let obj = TeacherData.teacher_online_videos

                             vc.isTeacher = true

            vc.onlineArrt = obj
                                              navigationController?.pushViewController(vc, animated: true)
                
        }else if indexPath.row == 4{
                
                



                         let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                              let vc = storyboard.instantiateViewController(withIdentifier: "NotesVC") as! NotesVC


                         let obj = TeacherData.teacher_notes

                         vc.isTeacher = true

                         vc.notesArry = obj

                                              navigationController?.pushViewController(vc, animated: true)


                
        }else{


            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                 let vc = storyboard.instantiateViewController(withIdentifier: "RateVC") as! RateVC


            let obj = TeacherData.teacher_rate


            vc.rateData = obj

                                 navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             
             let numberOfItemsPerRow:CGFloat = 3
             let spacingBetweenCells:CGFloat = 27
             
             let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
             
             if let collection = self.collectionView{
                 let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                 return CGSize(width: width, height: 135)
             }else{
                 return CGSize(width: 150, height: 135)
             }
         }
      
      
    
    
    
    
    
    
    
    
    
    
    
}


extension UIImageView {
    func changeImageColor( color:UIColor) -> UIImage
    {
        image = image!.withRenderingMode(.alwaysTemplate)
        tintColor = color
        return image!
    }
}
