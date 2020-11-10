//
//  CategoryDetialsVCViewController.swift
//  Besmart
//
//  Created by mac on 12/8/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import SDWebImage

class CategoryDetialsVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let spacing:CGFloat = 16.0
    
    
    var CienmaArry: [CinemaOB] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.reloadData()
         GetCinema()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
    
    func GetCinema(){
        
        DataClient.GetCienma(success: { (dict) in
            print("cities Success")
            print(dict)
            self.CienmaArry = dict
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



extension CategoryDetialsVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CienmaArry.count
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath) as? CategoryDetialsCell
        
     let obj = CienmaArry[indexPath.row]
        
        let url = URL(string: obj.image_link!)
        cell?.img.sd_setImage(with: url)
        cell?.title.text = obj.lessonName
        cell?.lbl_work.text = obj.speciality_name
        cell?.lbl_subject.text = obj.material_name
        cell?.lbl_profile.text = obj.teacher_name
        cell?.lbl_time.text = obj.video_duration
        cell?.lbl_price.text = obj.price
        
        if obj.is_favoraite == true {
            cell?.img.image =  #imageLiteral(resourceName: "Path 4937")
        }else{
            
            cell?.img.image =  #imageLiteral(resourceName: "heart")

            
        }

        
        
        
        
        return cell!
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PlayVideosVC") as! PlayVideosVC

        
//        vc.obj = CienmaArry[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)

        
    }
    
    
    
    
}



