//
//  PlayerView.swift
//  Example
//
//  Created by Moayad Al kouz on 8/13/18.
//  Copyright © 2018 Moayad Al kouz. All rights reserved.
//

import UIKit
//import youtube_ios_player_helper_swift
import YoutubePlayer_in_WKWebView


class PlayerView: UIView {
    var videoId: String = ""{
        didSet{
            if !videoId.isEmpty{
                loadVideo()
            }
            
        }
    }
    
    
    @IBOutlet weak var ytPlayerView: WKYTPlayerView!
    @IBOutlet weak var btnPlayPause: UIButton!
    @IBOutlet weak var btnFullScreen: UIButton!
    
    @IBOutlet weak var timeSlider: UISlider!{
        didSet{
            self.timeSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
            self.timeSlider.addTarget(self, action: #selector(startEditingSlider), for: .touchDown)
            self.timeSlider.addTarget(self, action: #selector(stopEditingSlider), for: [.touchUpInside, .touchUpOutside])
            self.timeSlider.value = 0.0
        }
    }
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var controlsView: UIView!
    
    private var isFullScreen = false
    
    private func loadVideo(){
        let playerVars:[String: Any] = [
            "controls" : "0",
            "showinfo" : "0",
            "autoplay": "0",
            "rel": "0",
            "modestbranding": "0",
            "iv_load_policy" : "3",
            "fs": "0",
            "playsinline" : "1"
        ]
        ytPlayerView.delegate = self
        //_ = ytPlayerView.load(videoId: videoId, playerVars: playerVars)
        ytPlayerView.load(withVideoId: videoId, playerVars: playerVars)
        ytPlayerView.isUserInteractionEnabled = false
        updateTime()
    }
    
    
    
    @IBAction func toogleFullScreen(sender: UIButton){
        guard let rootVC = UIApplication.shared.delegate?.window??.rootViewController else {
            return
        }
        isFullScreen = !isFullScreen
        if isFullScreen{
            let landscape = LandscapeViewController()
            landscape.view = self
            
            rootVC.present(landscape, animated: false, completion: nil)
        }else{
            rootVC.presentedViewController?.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func playStop(sender: UIButton){
        ytPlayerView.getPlayerState({ (state, error) in
            if error == nil {
                if state == .playing {
                    self.ytPlayerView.stopVideo()
                    sender.setImage(#imageLiteral(resourceName: "play"), for: .normal)
                } else {
                    self.ytPlayerView.playVideo()
                    sender.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
                }
            }
        })
    }
    
    func secondsToHoursMinutesSeconds (_ seconds : Int) -> (hours : Int, minutes : Int, seconds : Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func paddedNumber(_ number : Int) -> String{
        if(number < 0){
            return "00"
        }else if(number < 10){
            return "0\(number)"
        }else{
            return String(number)
        }
    }
    
    func ytk_secondsToCounter(_ seconds : Int) -> String {
        
        let time = self.secondsToHoursMinutesSeconds(seconds)
        
        let minutesSeconds = "\(self.paddedNumber(time.minutes)):\(self.paddedNumber(time.seconds))"
        
        if(time.hours == 0){
            return minutesSeconds
        }else{
            return "\(self.paddedNumber(time.hours)):\(minutesSeconds)"
        }
        
    }
    
    @objc func sliderValueChanged(){
        
        //let duration = ytPlayerView.getDuration(<#T##completionHandler: ((TimeInterval, Error?) -> Void)?##((TimeInterval, Error?) -> Void)?##(TimeInterval, Error?) -> Void#>)
        ytPlayerView.getDuration { (duration, error) in
            guard error == nil else { return }
            
            let currentTime = Int(Double(self.timeSlider.value) * duration)
            self.currentTimeLabel.text = self.ytk_secondsToCounter(currentTime)
            
            let timeLeft = Int(duration) - currentTime
            self.remainingTimeLabel.text = "-\(self.ytk_secondsToCounter(timeLeft))"
        }
        
        
    }
    
    @objc func stopEditingSlider(){
        ytPlayerView.getDuration { (duration, error) in
            guard error == nil else { return }
            
            let seconds = self.timeSlider.value * Float(duration)
            
            self.ytPlayerView.playVideo()
            //        self.playerView.seekTo(seconds: seconds, seekAhead: true)
            self.ytPlayerView.seek(toSeconds: seconds, allowSeekAhead: true)
        }
        //let duration = Float(ytPlayerView.duration)
        
        
    }
    
    @objc func startEditingSlider(){
        self.ytPlayerView.pauseVideo()
    }
    
    @objc func updateTime(){
         //let currentTime = ytPlayerView.currentTime
        ytPlayerView.getCurrentTime { (currentTime, error) in
            guard error == nil else { return }
            self.ytPlayerView.getDuration { (duration, error) in
                guard error == nil else { return }

                let progress = currentTime / Float(duration)
                self.timeSlider.value = progress
                self.timeSlider.sendActions(for: .valueChanged)
                
                
                self.perform(#selector(self.updateTime), with: nil, afterDelay: 1.0)
            }
            
        }
        //let duration = Float( ytPlayerView.duration )
        
        
    }
    
}

class LandscapeViewController: UIViewController {
    
    override var shouldAutorotate: Bool{
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscape
    }
}


extension PlayerView: WKYTPlayerViewDelegate {
//    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
//        playerView.playVideo()
//        btnPlayPause.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
//    }
    
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        playerView.playVideo()
        btnPlayPause.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
    }
    
//    func playerView(_ playerView: YTPlayerView, didChangeTo quality: YTPlaybackQuality) {
//        print("Quality :: ", quality)
//    }
    
    func playerView(_ playerView: WKYTPlayerView, didChangeTo quality: WKYTPlaybackQuality) {
        print("Quality :: ", quality)
    }
    
    //    func playerViewPreferredInitialLoadingView(_ playerView: YTPlayerView) -> UIView? {
    //        let loader = UIView(frame: CGRect(x: 10, y: 10, width: 200, height: 200))
    //        loader.backgroundColor = UIColor.brown
    //        return loader
    //    }
}
