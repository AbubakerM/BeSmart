//
//  MyVediosVC.swift
//  Besmart
//
//  Created by mac on 12/8/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class MyVediosVC: UIViewController {

  
    
    @IBOutlet weak var collectionView: UICollectionView!
    var Id = 0
    var type = ""
    var VideosArry:SbscribeOB!
    
    
    var ToptitleArry = ["الفيديوهات","كورس","أسئلة وأجوبة","فيديو أون لاين","مذكرات"]
    
    var colorView = ["A6D141","D16D41","41C7D1","D14141","A6D141"]
    
    
    var imgArry = ["playB","video-player","ic5","icon6","icon7"]

    
    private let spacing:CGFloat = 16.0

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let id = UserDefaults.standard.integer(forKey: "userId")
               
               
               if id != -1 {
                           GetVid()
               }
        
        
        let layout = UICollectionViewFlowLayout()
                  layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
                  layout.minimumLineSpacing = spacing
                  layout.minimumInteritemSpacing = spacing
                  self.collectionView?.collectionViewLayout = layout

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         let id = UserDefaults.standard.integer(forKey: "userId")
         
         
         if id == -1 {
             showSimpleAlert()
         }
     }
     
    
    
    func GetVid(){
                
                DataClient.Getsub(success: { (dict) in
                  
                    
                    self.VideosArry = dict
                    
                    
        self.collectionView.reloadData()
                    
                }, failure: { (err) in
                })
                
            }
//    func GetVideos(Id:Int,type:String){
//
//        DataClient.GetTeacherVideo(Id: Id, type: type, success: { (dict) in
//
//
//            print("cities Success")
//            print(dict)
//            self.VideosArry = dict
//
//
//
//
//
//        }, failure: { (err) in
//        })
//
//
//
//
//    }
    

    

}




extension MyVediosVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ToptitleArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Vcell", for: indexPath) as? CatVideoCell
        
        
        
        if VideosArry != nil {
        
       if    indexPath.row == 0 {
           
        cell?.lbl_noTitle.text = "\(VideosArry.videos ?? 0)"

            
            
        } else  if indexPath.row == 1 {
            
            
            cell?.lbl_noTitle.text = "\(VideosArry.courses ?? 0)"


            
        } else  if indexPath.row == 2 {
            
            
            cell?.lbl_noTitle.text = "\(VideosArry.qas ?? 0)"

            
            
            
        }else  if indexPath.row == 3 {
            
            
            cell?.lbl_noTitle.text = "\(VideosArry.onlineVideos ?? 0)"

            
        }else  if indexPath.row == 4 {
            cell?.lbl_noTitle.text = "\(VideosArry.notes ?? 0)"

            
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
                
                
                        vc.isSub = true
                
                        navigationController?.pushViewController(vc, animated: true)

                
            }else if indexPath.row == 1 {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                             let vc = storyboard.instantiateViewController(withIdentifier: "CorsessVC") as! CorsessVC


                             vc.isSub = true

                             navigationController?.pushViewController(vc, animated: true)
                
            }else if indexPath.row == 2 {
                
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                let vc = storyboard.instantiateViewController(withIdentifier: "QuestionsVC") as! QuestionsVC


                           vc.isSub = true

                                                navigationController?.pushViewController(vc, animated: true)

             
            }else if indexPath.row == 3 {
                
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                              let vc = storyboard.instantiateViewController(withIdentifier: "explianOnlineVC") as! explianOnlineVC


                    vc.isSub = true

                                              navigationController?.pushViewController(vc, animated: true)
                
            }else{
                
                



                         let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                              let vc = storyboard.instantiateViewController(withIdentifier: "NotesVC") as! NotesVC


                         vc.isSub = true

                                              navigationController?.pushViewController(vc, animated: true)


                
            }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             
             let numberOfItemsPerRow:CGFloat = 2
             let spacingBetweenCells:CGFloat = 27
             
             let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
             
             if let collection = self.collectionView{
                 let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                 return CGSize(width: width, height: width)
             }else{
                 return CGSize(width: 150, height: 135)
             }
         }
      
      
    
    
    
    
    
    
    
    
    
    
    
}
