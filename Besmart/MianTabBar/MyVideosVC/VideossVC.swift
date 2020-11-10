//
//  VideossVC.swift
//  Besmart
//
//  Created by mac on 2/11/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class VideossVC: UIViewController,SendData {
    
    
    func sendDataToFirstViewController(countryId: Int, matId: Int, secId: Int, spId: Int, rateId: Int) {
        print("xxxx")
    }
    
   
    
   
    
        @IBOutlet weak var collectionView: UICollectionView!
                private let spacing:CGFloat = 16.0
                
    var isSub = false
    var isCinema = false
    var isTeacher = false
    
    

                var videoCinemaArry:[CinemaOB]=[]

                var iD = 0
                var videoArry:[vidoesOB]=[]

                override func viewDidLoad() {
                    super.viewDidLoad()
                    
               
                 
                    // Do any additional setup after loading the view.
                }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
                        let layout = UICollectionViewFlowLayout()
                        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
                        layout.minimumLineSpacing = spacing
                        layout.minimumInteritemSpacing = spacing
                        self.collectionView?.collectionViewLayout = layout
                       if isTeacher != true {
                           
                           
                           
                       if isSub == true {
                           
                           
                           GetSubVid()
                       } else if isCinema == true {
                           
                        GetCineamSp(countId: 0, matId: 0, spId: 0, secId: 0, teacherId: 0)
                       }else{
                           GetSp()

                       }
                       }
        
    }
    
    
    func sendDataToFirstViewController2(countryId: Int, matId: Int, secId: Int, spId: Int, teacher: Int) {
        self.GetCineamSp(countId: countryId, matId: matId, spId: spId, secId: secId, teacherId: teacher)
       }
    
    func GetCineamSp(countId:Int,matId:Int,spId:Int,secId:Int,teacherId:Int){
         
        DataClient.GetCinemaVideos(country_id: countId, material_id: matId, speciality_id: spId, section_id: secId, teacher_id: teacherId, success: { (dict) in
             print("cities Success")
             print(dict)
             self.videoCinemaArry = dict
             
             self.collectionView.reloadData()
             
         }, failure: { (err) in
         })
         
         
         
         
     }
                
    
    @IBAction func filter(_ sender: Any) {
        
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController


        controller?.delegate = self

        controller?.isTeacher = false
                               controller?.modalTransitionStyle   = .crossDissolve;


                                                                 controller?.modalPresentationStyle = .overCurrentContext


                                                                 controller?.modalPresentationStyle = .overCurrentContext


                                                                 present(controller!, animated: true, completion: nil)
    }
    
    
    
    func GetSubVid(){
                     
                     DataClient.GetSubVideos( success: { (dict) in
                         print("cities Success")
                         print(dict)
                         self.videoArry = dict
                         
                         self.collectionView.reloadData()
                         
                     }, failure: { (err) in
                     })
                     
                     
                     
                     
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



            extension VideossVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
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
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favViedoCell2", for: indexPath) as? CategoryDetialsCell
                    
                    
                    
                          if isCinema == true {
                              
                              let obj = videoCinemaArry[indexPath.row]

                              cell?.title.text = obj.lessonName
                                   cell?.lbl_duration.text = obj.video_duration
                                   cell?.lbl_teacherName.text = obj.teacher_name
                              cell?.lbl_Subject.text = obj.section_name
                                   cell?.lbl_subj.text = obj.material_name
                                   
                                   let url = URL(string: obj.image_link!)
                                   
                                   cell?.img.sd_setImage(with: url)
                            
                            
                            if obj.is_purchased2 == 0 {
                                
                                cell?.priceV.isHidden = false
                                
                                cell?.lbl_W.text = "شراء"
                                
                                cell?.lbl_price.text = "\(obj.price ?? "")$"

                            }else{
                                cell?.priceV.isHidden = true
                                cell?.lbl_W.text = "مشاهدة"

                            }
                            
                            if obj.is_favoraite == true {
                                                              cell?.favImg.image = #imageLiteral(resourceName: "heartGreen")
                                                          }else{
                                                              cell?.favImg.image = #imageLiteral(resourceName: "heart")

                                                          }
                            
                             cell?.watchBtn.tag = indexPath.row

                            cell?.watchBtn.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)

                            
                          }else{
                              
                              let obj = videoArry[indexPath.row]

                              cell?.title.text = obj.lessonName
                                   cell?.lbl_duration.text = obj.video_duration
                                   cell?.lbl_teacherName.text = obj.teacher_name
                                   cell?.lbl_Subject.text = obj.division_name
                                   cell?.lbl_subj.text = obj.material_name
                                   
                                   let url = URL(string: obj.image_link!)
                                   
                                   cell?.img.sd_setImage(with: url)
                            
                            if obj.is_purchased == false {
                                                           
                                                           cell?.priceV.isHidden = false

                                                           cell?.lbl_W.text = "شراء"
                                                       }else{
                                                           cell?.priceV.isHidden = true
                                cell?.lbl_W.text = "مشاهدة"

                                                       }
                            
                            
                                  if obj.is_favoraite == true {
                                      cell?.favImg.image = #imageLiteral(resourceName: "heartGreen")
                                  }else{
                                      cell?.favImg.image = #imageLiteral(resourceName: "heart")

                                  }
                          }
//                    let obj = videoArry[indexPath.row]
//
//                    cell?.title.text = obj.lessonName
//                    cell?.lbl_duration.text = obj.video_duration
//                    cell?.lbl_teacherName.text = obj.teacher_name
//                    cell?.lbl_subj.text = obj.division_name
//                    cell?.lbl_Subject.text = obj.material_name
//
//                    let url = URL(string: obj.image_link!)
//
//                    cell?.img.sd_setImage(with: url)
//
                    
                    
                    return cell!
                }
                
                
                @objc func connected(sender: UIButton){
                    let buttonTag = sender.tag
                    
                    let id = UserDefaults.standard.integer(forKey: "userId")

                                                      if id == -1 {
                                                          showSimpleAlert()
                                                         
                                                         return
                                                      }
                    
                    let obj = videoCinemaArry[buttonTag]
                    
                    if obj.is_purchased2 == 1 {
                                              let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                                                        let vc = storyboard.instantiateViewController(withIdentifier: "PlayVideosVC") as! PlayVideosVC

                                                                     vc.isCinema = true
                                                                     vc.Id = obj.id

                                                                         navigationController?.pushViewController(vc, animated: true)
                                          }else{
                                              let controller = self.storyboard?.instantiateViewController(withIdentifier: "PayVC") as? PayVC
                                                              
                                              controller?.price = obj.price ?? ""
                                              controller?.Id = obj.id
                        controller?.type = "cinemaVideo"

                                              controller?.modalTransitionStyle   = .crossDissolve;
                                                                                controller?.modalPresentationStyle = .overCurrentContext
                                                                                controller?.modalPresentationStyle = .overCurrentContext
                                                                                present(controller!, animated: true, completion: nil)
                                          }
                                         

                }
                
                
                
                
                
                func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                    
                    let id = UserDefaults.standard.integer(forKey: "userId")
                                     
                                     
                                     if id == -1 {
                                         showSimpleAlert()
                                        
                                        return
                                     }
                    
                    if isCinema == true {
                        
                        
                        
                        
                        
                        let obj = videoCinemaArry[indexPath.row]
                        
                        if obj.is_purchased2 == 1 {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                                      let vc = storyboard.instantiateViewController(withIdentifier: "PlayVideosVC") as! PlayVideosVC

                                                   vc.isCinema = true
                                                   vc.Id = obj.id
                            vc.title = obj.lessonName

                                                       navigationController?.pushViewController(vc, animated: true)
                        }else{
                            let controller = self.storyboard?.instantiateViewController(withIdentifier: "PayVC") as? PayVC
                                            
                            controller?.price = obj.price ?? ""
                            controller?.Id = obj.id
                            controller?.modalTransitionStyle   = .crossDissolve;
                                                              controller?.modalPresentationStyle = .overCurrentContext
                                                              controller?.modalPresentationStyle = .overCurrentContext
                                                              present(controller!, animated: true, completion: nil)
                        }
                       

                    }else  {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                           let vc = storyboard.instantiateViewController(withIdentifier: "PlayVideosVC") as! PlayVideosVC

                        vc.Id = videoArry[indexPath.row].id
                        vc.title = videoArry[indexPath.row].lessonName

                                           navigationController?.pushViewController(vc, animated: true)

                    }
                    
                    
                    
                   
                    
                }
                
                
                
                
            }

