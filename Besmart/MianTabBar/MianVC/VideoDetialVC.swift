//
//  VideoDetialVC.swift
//  Besmart
//
//  Created by mac on 12/10/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import AnimatedGradientView

class VideoDetialVC: UIViewController {
    
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var topImg: UIImageView!
    @IBOutlet weak var playButt: UIButton!
    let avPlayerViewController = AVPlayerViewController()
    var playerViewss: AVPlayer?
    var OneUrlVideo = String()
    
    var obj:CoursesOB!

    @IBOutlet weak var pricee: UILabel!
    
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var lbl_content: UILabel!
    @IBOutlet weak var lbl_contry: UILabel!
    @IBOutlet weak var lbl_book: UILabel!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_level: UILabel!
    @IBOutlet weak var v1: AnimatedGradientView!
    
    @IBOutlet weak var v2: AnimatedGradientView!
    
    @IBOutlet weak var v3: AnimatedGradientView!
    
    @IBOutlet weak var v4: AnimatedGradientView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        lbl_book.text = obj.material_name
        lbl_name.text = obj.teacher_name
        lbl_contry.text =  obj.country_name
        lbl_level.text = obj.section_name
        lbl_content.text = obj.courseContent
        
        if obj.is_purchased == true {
            topV.isHidden = true
        }
        
        let url = URL(string: obj.image_link!)
        topImg.sd_setImage(with: url)
        
        
        pricee.text = "\(obj.price ?? "")$"
        v1.colorStrings = [["#1D6FA3", "#5EEEE8"]]
        
        v1.direction = .right
        
        v1.layer.cornerRadius = CGFloat(8)
        v1.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        
        v2.colorStrings = [["#1D6FA3", "#5EEEE8"]]
        
        v2.direction = .right
        
        v2.layer.cornerRadius = CGFloat(8)
        v2.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        
        v3.colorStrings = [["#1D6FA3", "#5EEEE8"]]
        
        v3.direction = .right
        
        v3.layer.cornerRadius = CGFloat(8)
        v3.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        
        v4.colorStrings = [["#1D6FA3", "#5EEEE8"]]
        
        v4.direction = .right
        
        v4.layer.cornerRadius = CGFloat(8)
        v4.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        let id = UserDefaults.standard.integer(forKey: "userId")
        
        
        if id == -1 {
            showSimpleAlert()
        }
    }
    
    
    
    @IBAction func playButt(_ sender: Any) {
        
        playButt.isHidden = true
        playViedo()

    }
    
    @IBAction func buyBtn(_ sender: Any) {
        
        
        
        let id = UserDefaults.standard.integer(forKey: "userId")

              if id == -1 {
                              showSimpleAlert()
                                                                    
                                                                    return
                                      }
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "PayVC") as? PayVC
        
        
        controller?.price = obj.price ?? ""
        controller?.type = "course"
        controller?.Id = obj.id


                                       controller?.modalTransitionStyle   = .crossDissolve;
                                       controller?.modalPresentationStyle = .overCurrentContext
                                       controller?.modalPresentationStyle = .overCurrentContext
                                       present(controller!, animated: true, completion: nil)
                
    }
    @IBAction func MultiButtons(_ sender: Any) {
        
        
        
        if obj.is_purchased == true {
        
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 0:
                 let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "MultiTablesVC") as? MultiTablesVC
                 
                 
                 vc?.obj  = obj
                 vc?.types  = "Video"
                 

                         navigationController?.pushViewController(vc!, animated: true)
        case 1:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MultiTablesVC") as? MultiTablesVC
                         
                         
                         vc?.obj  = obj
                vc?.types  = "Online"

                                 navigationController?.pushViewController(vc!, animated: true)
        case 2:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MultiTablesVC") as? MultiTablesVC
                         
                         
                         vc?.obj  = obj
                                vc?.types  = "QA"

                
                
                
                navigationController?.pushViewController(vc!, animated: true)
            
        case 3:
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MultiTablesVC") as? MultiTablesVC
                         
                         
                         vc?.obj  = obj
               vc?.types  = "Note"

                                 navigationController?.pushViewController(vc!, animated: true)
        default:
            print("Unknown language")
            return
        }
            
        }

    }
    
    
    func playViedo(){
        
//        let myUrl = "\(obj.video_link!)" as String
//        
//        if let encoded = myUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
//        {
//            guard let urlencoded = URL(string: encoded)
//                else { return }
//            self.playerViewss = AVPlayer(url: urlencoded)
//            self.avPlayerViewController.player = self.playerViewss
//            self.avPlayerViewController.view.frame = self.videoView.bounds
//            self.addChild(self.avPlayerViewController)
//            self.videoView.addSubview(self.avPlayerViewController.view)
//            //   self.avPlayerViewController.didMove(toParentViewController: self)
//            self.avPlayerViewController.player?.play()
//            self.avPlayerViewController.exitsFullScreenWhenPlaybackEnds = true
//            //    self.avPlayerViewController.player?.replaceCurrentItem(with: AVPlayerItem?)
////            NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(note:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.avPlayerViewController.player?.currentItem)
//        }
        
    }

}
