//
//  EngStudentVc.swift
//  Besmart
//
//  Created by mac on 12/8/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class EngStudentVc: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let spacing:CGFloat = 16.0
    
    var corsesArry: [CoursesOB] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.reloadData()
//        GetCorses()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
    
    
    
//    func GetCorses(){
//        
//        DataClient.GetCoreses(success: { (dict) in
//            print("cities Success")
//            print(dict)
//            self.corsesArry = dict
//            self.collectionView.reloadData()
//        }, failure: { (err) in
//        })
//        
//    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}



extension EngStudentVc:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return corsesArry.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 16
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }else{
            return CGSize(width: 153, height: 199)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "engCell", for: indexPath) as? EngStudentCell
        
        
        
        let obj = corsesArry[indexPath.row]
        let url = URL(string: obj.image_link!)
        cell?.img.sd_setImage(with: url)
        
        cell?.title.text = obj.courseName
        
        
        
        
        return cell!
        
        
        
        
}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let obj = corsesArry[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VideoDetialVC") as? VideoDetialVC
        
        
        //        navigationItem.backBarButtonItem = UIBarButtonItem(title: "مهندسين حديثي التخرج", style: .plain, target: nil, action: nil)
        
        
        vc?.obj = obj
        navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    





}
