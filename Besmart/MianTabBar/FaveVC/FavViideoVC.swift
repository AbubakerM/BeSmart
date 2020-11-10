//
//  FavViideoVC.swift
//  Besmart
//
//  Created by mac on 2/5/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class FavViideoVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private let spacing:CGFloat = 16.0
    
    
    var iD = 0
    var type = ""
    var isCinema = false
    var videoArry:[vidoesOB]=[]
    var videoCinemaArry:[CinemaOB]=[]

var isFave = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         let layout = UICollectionViewFlowLayout()
         layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
         layout.minimumLineSpacing = spacing
         layout.minimumInteritemSpacing = spacing
         self.collectionView?.collectionViewLayout = layout
        
        
        if isCinema == true {
             GetCineamSp()
        }else{
//            GetSp()
            GetVid()
        }

        // Do any additional setup after loading the view.
    }
    
    
    func GetSp(){
        
        DataClient.GetVideos(materialId: iD, success: { (dict) in
            print("cities Success")
            print(dict)
            self.videoArry = dict
            
            self.collectionView.reloadData()
            
        }, failure: { (err) in
        })
        
        
        
        
    }
    
    func GetCineamSp(){
        
        DataClient.GetCinemaVideos(country_id: 0, material_id: 0, speciality_id: 0, section_id: 0, teacher_id: 0, success: { (dict) in
            print("cities Success")
            print(dict)
            self.videoCinemaArry = dict
            
            self.collectionView.reloadData()
            
        }, failure: { (err) in
        })
        
        
        
        
    }
    
    
    func GetVid(){
            
            DataClient.GetFave(success: { (dict) in
              
                
                self.videoArry = dict.favVideo
                
                
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



extension FavViideoVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isCinema == true {
            
            return videoCinemaArry.count

            
            
        }else{
            return videoArry.count

        }
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favViedoCell", for: indexPath) as? CategoryDetialsCell
        
        
        
        if isCinema == true {
            
            let obj = videoCinemaArry[indexPath.row]

            cell?.title.text = obj.lessonName
                 cell?.lbl_duration.text = obj.video_duration
                 cell?.lbl_teacherName.text = obj.teacher_name
            cell?.lbl_Subject.text = obj.section_name
                 cell?.lbl_subj.text = obj.material_name
                 
                 let url = URL(string: obj.image_link!)
                 
                 cell?.img.sd_setImage(with: url)
        }else{
            
            let obj = videoArry[indexPath.row]

            cell?.title.text = obj.lessonName
                 cell?.lbl_duration.text = obj.video_duration
                 cell?.lbl_teacherName.text = obj.teacher_name
            
            
            cell?.lbl_price.text = "\(obj.price ?? "")$"
                 cell?.lbl_Subject.text = obj.division_name
                 cell?.lbl_subSubject.text = obj.material_name
                 
                 let url = URL(string: obj.image_link!)
                 
                 cell?.img.sd_setImage(with: url)
            
            
            if obj.is_favoraite == true {
                cell?.favImg.image = #imageLiteral(resourceName: "heartGreen")
                
            }else{
                cell?.favImg.image = #imageLiteral(resourceName: "heart")

            }
            
            
            if obj.is_purchased == true {
                cell?.priceV.isHidden = true
            }else{
                cell?.priceV.isHidden = false

            }
            
            
        }
        
        
        
     
        
        
        
        return cell!
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PlayVideosVC") as! PlayVideosVC

        
        navigationController?.pushViewController(vc, animated: true)

        
    }
    
    
    
    
}

