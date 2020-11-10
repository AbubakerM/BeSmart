//
//  VideosVC.swift
//  Besmart
//
//  Created by mac on 2/11/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class VideosVCC: UIViewController {

        @IBOutlet weak var collectionView: UICollectionView!
            private let spacing:CGFloat = 16.0
            
            
            var iD = 0
            var videoArry:[vidoesOB]=[]

            override func viewDidLoad() {
                super.viewDidLoad()
                
                
                 let layout = UICollectionViewFlowLayout()
                 layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
                 layout.minimumLineSpacing = spacing
                 layout.minimumInteritemSpacing = spacing
                 self.collectionView?.collectionViewLayout = layout
GetSp()
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
            

            /*
            // MARK: - Navigation

            // In a storyboard-based application, you will often want to do a little preparation before navigation
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                // Get the new view controller using segue.destination.
                // Pass the selected object to the new view controller.
            }
            */

        }



        extension VideosVCC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return videoArry.count
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
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favViedoCell2", for: indexPath) as? CategoryDetialsCell
                
                let obj = videoArry[indexPath.row]
                
                cell?.title.text = obj.lessonName
                cell?.lbl_duration.text = obj.video_duration
                cell?.lbl_teacherName.text = obj.teacher_name
                cell?.lbl_subject.text = obj.division_name
                cell?.lbl_subSubject.text = obj.material_name
                
                let url = URL(string: obj.image_link!)
                
                cell?.img.sd_setImage(with: url)
                
                
                
                return cell!
            }
            
            
            
            func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "PlayVideosVC") as! PlayVideosVC

                
                navigationController?.pushViewController(vc, animated: true)

                
            }
            
            
            
            
        }

