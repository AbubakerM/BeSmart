//
//  PlayVideosVC.swift
//  Besmart
//
//  Created by mac on 12/10/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import SDWebImage
//import youtube_ios_player_helper_swift
import YoutubePlayer_in_WKWebView

class PlayVideosVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playButt: UIButton!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var lbl_title: UILabel!
    
    @IBOutlet weak var lbl_subject: UILabel!
    @IBOutlet weak var lbl_country: UILabel!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_level: UILabel!
    @IBOutlet weak var lbl_content: UILabel!
    
    let avPlayerViewController = AVPlayerViewController()
    var playerViewss: AVPlayer?
    var playerView: PlayerView!
    
    var OneUrlVideo = String()
    var ViedoLink = ""
    var isFull = false

    var Id = 0
    var vidId = 0
    var isCinema = false
    var isOnline = false
    var isTeacherCorse = false
    var VideoData:CinemaOB!
    var VideoDataOnlin:vidoesOB!

    var RelatedVideo:[vidoesOB]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isOnline == true {
GetVideoDataOnline()
        }else{
            GetVideoData()

        }
        tableView.reloadData()
        
        
//        lbl_title.text = obj.lessonName
//        lbl_content.text = obj.lessonContent
//
//        let url = URL(string: obj.image_link!)
//        img.sd_setImage(with: url)
//        lbl_level.text = obj.section_name
//        lbl_name.text = obj.teacher_name
//        lbl_country.text = obj.country_name
//        lbl_subject.text = obj.material_name
        // Do any additional setup after loading the view.
    }
    
    
    
//    func GetVideoDataOne(){
//
//        DataClient.GetOneVideos(vidId: <#Int#>, corseId: <#Int#>, success: { (dict) in
//                print("cities Success")
//                print(dict)
//
//            self.VideoDataOnlin = dict
//                self.tableView.reloadData()
//
//
//            }, failure: { (err) in
//            })
//
//
//
//
//        }
      
        func GetVideoDataOnline(){
                
            DataClient.GetOnlineVideos( vidId: vidId, success: { (dict) in
                    print("cities Success")
                    print(dict)

            self.VideoDataOnlin = dict

                    self.lbl_title.text = dict.lessonName
                         
                         self.lbl_content.text = dict.lessonContent
                         
                         let url = URL(string: dict.image_link!)
                                  self.img.sd_setImage(with: url)
                         self.lbl_level.text = dict.section_name
                         self.lbl_name.text = dict.teacher_name
                         self.lbl_country.text = dict.country_name
                         self.lbl_subject.text = dict.material_name
                    
                }, failure: { (err) in
                })
                
                
                
                
            }
          
    func GetVideoData(){
          
        DataClient.GetOneCienma(id: Id, success: { (dict) in
              print("cities Success")
              print(dict)

            self.VideoData = dict
            
            
            self.RelatedVideo = dict.related_videos
            
            self.lbl_title.text = dict.videoData.lessonName
            
            self.lbl_content.text = dict.videoData.lessonContent
            
            let url = URL(string: dict.videoData.image_link!)
                     self.img.sd_setImage(with: url)
            self.lbl_level.text = dict.videoData.section_name
            self.lbl_name.text = dict.videoData.teacher_name
            self.lbl_country.text = dict.videoData.country_name
            self.lbl_subject.text = dict.videoData.material_name
              self.tableView.reloadData()
              
              
          }, failure: { (err) in
          })
          
          
          
          
      }
    
    @IBAction func playButt(_ sender: Any) {
        playButt.isHidden = true
        playViedo()

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    
    
    func playViedo(){
        
        
        if isTeacherCorse == true {
            
            
            
            ViedoLink = self.VideoData.videoData.video_link!
           
            
        }else if isOnline == true {
            
            ViedoLink = self.VideoDataOnlin.video ?? ""

        }else{
            ViedoLink = self.VideoData.videoData.video_link!

        }
        
        if ViedoLink.contains("youtube") == true {
            
            
            let myString = ViedoLink
            let replaced = myString.replacingOccurrences(of: "https://www.youtube.com/watch?v=", with: "") // "aaaaaaaa"
            playerView = UINib(nibName: "PlayerView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? PlayerView
            playerView.videoId = replaced
            
            
            
            self.playerView.frame = self.videoView.bounds
            
            self.videoView.addSubview(playerView)
            
            
            playerView.autoresizingMask = .flexibleWidth
            isFull = true
        }else{
            
        
            
        
        
        let myUrl = "\(ViedoLink)" as String
        
        if let encoded = myUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        {
            guard let urlencoded = URL(string: encoded)
                else { return }
            self.playerViewss = AVPlayer(url: urlencoded)
            self.avPlayerViewController.player = self.playerViewss
            self.avPlayerViewController.view.frame = self.videoView.bounds
            self.addChild(self.avPlayerViewController)
            self.videoView.addSubview(self.avPlayerViewController.view)
            //   self.avPlayerViewController.didMove(toParentViewController: self)
            self.avPlayerViewController.player?.play()
            self.avPlayerViewController.exitsFullScreenWhenPlaybackEnds = true
            //    self.avPlayerViewController.player?.replaceCurrentItem(with: AVPlayerItem?)
            //            NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(note:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.avPlayerViewController.player?.currentItem)
        }
        
        }
    }
    
    
}




extension PlayVideosVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RelatedVideo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        
        
        
        
        if isCinema == true {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "faveCell") as? CourseTableCell

            let obj = RelatedVideo[indexPath.row]
                   
                   let url = URL(string:obj.image_link ?? "" )
                   
                   cell?.img.sd_setImage(with: url)
                   cell?.lbl_title.text = obj.lessonName
                   cell?.lbl_jop.text = obj.section_name
                   cell?.lbl_course.text = obj.material_name
                   cell?.lbl_internt.text = obj.country_name
                   cell?.lbl_name.text = obj.teacher_name
                   cell?.lbl_price.text = "\(obj.price ?? "")$"
                   
                   
                   if obj.is_favoraite == true {
                       cell?.likeImg.image = #imageLiteral(resourceName: "heartGreen")
                   }else{
                       cell?.likeImg.image = #imageLiteral(resourceName: "heart")

                   }
            
            
            if obj.is_purchased == true {
                
                
                cell?.priceView.isHidden = true
            }else{
                cell?.priceView.isHidden = false

            }


                   return cell!
        }else{
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetCell") as? FaveCell

            let obj = RelatedVideo[indexPath.row]

                     let url = URL(string: obj.image_link ?? "")
                                                   cell?.img?.sd_setImage(with: url)
                                cell?.lbl_time.text = obj.video_duration
                                cell?.lbl_title.text = obj.lessonName
            //                    cell?.lbl_views.text = obj.
                                
                                return cell!
                                
            
            
            
        }
        
        
       
    }
    
    
    
    
    
    
    
    
}
