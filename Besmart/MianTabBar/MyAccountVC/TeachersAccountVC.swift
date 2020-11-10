//
//  MyAccountVC.swift
//  Besmart
//
//  Created by mac on 12/9/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class TeachersAccountVC: UIViewController {
    
    

    @IBOutlet weak var videosCO: UIView!
    @IBOutlet weak var onlineCO: UIView!
    @IBOutlet weak var questionsCO: UIView!
    @IBOutlet weak var notesCO: UIView!
    
    @IBOutlet weak var VideoLine: UIView!
    
    @IBOutlet weak var Qline: UIView!
    
    @IBOutlet weak var Notesline: UIView!
    
    @IBOutlet weak var OnlineLine: UIView!
    
    @IBOutlet weak var PlayImg: UIImageView!
    
    @IBOutlet weak var lbl_video: UILabel!
    
    @IBOutlet weak var lbl_Q: UILabel!
    
    @IBOutlet weak var Qimg: UIImageView!
    
    @IBOutlet weak var book_img: UIImageView!
    
    @IBOutlet weak var lbl_notes: UILabel!
    
    @IBOutlet weak var PcImg: UIImageView!
    
    @IBOutlet weak var lbl_course: UILabel!
    
    @IBOutlet weak var lbl_country: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
     var obj: TeacherOB!

    @IBOutlet weak var lbl_username: UILabel!
    @IBOutlet weak var lbl_name: UILabel!
    var infos: VideosVC!
    var NotesInfo: NotesVC!
    var QuestionInfo: QuestionsVC!
    var CorseInfo: OnlineCourseVC!




    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        onlineCO.alpha = 1
        videosCO.alpha = 0
        questionsCO.alpha = 0
        notesCO.alpha = 0
        
        
        
        
        
        OnlineLine.backgroundColor = UIColor(hexString: "A6D141")
        
        PcImg.image = PcImg.image?.withRenderingMode(.alwaysTemplate)
        PcImg.tintColor = UIColor(hexString: "A6D141")
        lbl_course.textColor = UIColor(hexString: "A6D141")

        let url = URL(string:obj.image_link!)
        profileImg.sd_setImage(with: url)
        
        lbl_username.text = "\(obj.firstName!) \(obj.lastName!)"
        lbl_name.text = obj.speciality_name
        lbl_country.text = obj.country_name
    
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? VideosVC,
            segue.identifier == "videosSeg" {
            self.infos = vc
            // if you already have your data object
            self.infos.Id = obj.id
            self.infos.type = "teacher"

        } else if let vc = segue.destination as? NotesVC,
            segue.identifier == "notesSeg" {
            self.NotesInfo = vc
            // if you already have your data object
            self.NotesInfo.Id = obj.id ?? 0
            self.NotesInfo.type = "teacher"

        }else if let vc = segue.destination as? QuestionsVC,
            segue.identifier == "qSeg" {
            self.QuestionInfo = vc
            // if you already have your data object
            self.QuestionInfo.Id = obj.id
            self.QuestionInfo.type = "teacher"

        }else if let vc = segue.destination as? OnlineCourseVC,
            segue.identifier == "onlineSeg" {
            self.CorseInfo = vc
            // if you already have your data object
            self.CorseInfo.Id = obj.id
            self.CorseInfo.type = "teacher"

        }
        
       
        
        

    }
    
    @IBAction func tabButtons(_ sender: Any) {
        
        
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 1:
            
            
            onlineCO.alpha = 1
            videosCO.alpha = 0
            questionsCO.alpha = 0
            notesCO.alpha = 0
            
            
            
            OnlineLine.backgroundColor = UIColor(hexString: "A6D141")
            VideoLine.backgroundColor = UIColor.white
            Qline.backgroundColor = UIColor.white
            Notesline.backgroundColor = UIColor.white

            
            PcImg.image = PcImg.image?.withRenderingMode(.alwaysTemplate)
            PcImg.tintColor = UIColor(hexString: "A6D141")
            
            
            
            Qimg.image = Qimg.image?.withRenderingMode(.alwaysTemplate)
            Qimg.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            book_img.image = book_img.image?.withRenderingMode(.alwaysTemplate)
            book_img.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            PlayImg.image = PlayImg.image?.withRenderingMode(.alwaysTemplate)
            PlayImg.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            lbl_course.textColor = UIColor(hexString: "A6D141")
            lbl_Q.textColor = UIColor(hexString: "B0C1D1")
            lbl_notes.textColor = UIColor(hexString: "B0C1D1")
            lbl_video.textColor = UIColor(hexString: "B0C1D1")

          
            
            // Do any additiona
            
        case 2:
            onlineCO.alpha = 0
            videosCO.alpha = 0
            questionsCO.alpha = 1
            notesCO.alpha = 0
            
            
            
            OnlineLine.backgroundColor = UIColor.white
            VideoLine.backgroundColor = UIColor.white
            Qline.backgroundColor = UIColor(hexString: "A6D141")
            Notesline.backgroundColor = UIColor.white
            
            
            PcImg.image = PcImg.image?.withRenderingMode(.alwaysTemplate)
            PcImg.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            Qimg.image = Qimg.image?.withRenderingMode(.alwaysTemplate)
            Qimg.tintColor = UIColor(hexString: "A6D141")
            
            
            
            book_img.image = book_img.image?.withRenderingMode(.alwaysTemplate)
            book_img.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            PlayImg.image = PlayImg.image?.withRenderingMode(.alwaysTemplate)
            PlayImg.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            lbl_course.textColor = UIColor(hexString: "B0C1D1")
            lbl_Q.textColor = UIColor(hexString: "A6D141")
            lbl_notes.textColor = UIColor(hexString: "B0C1D1")
            lbl_video.textColor = UIColor(hexString: "B0C1D1")
            
            
        // Change to Spanish
        case 3:
            
            onlineCO.alpha = 0
            videosCO.alpha = 0
            questionsCO.alpha = 0
            notesCO.alpha = 1
            
            
            
            OnlineLine.backgroundColor = UIColor.white
            VideoLine.backgroundColor = UIColor.white
            Qline.backgroundColor =  UIColor.white
            Notesline.backgroundColor = UIColor(hexString: "A6D141")
            
            
            PcImg.image = PcImg.image?.withRenderingMode(.alwaysTemplate)
            PcImg.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            Qimg.image = Qimg.image?.withRenderingMode(.alwaysTemplate)
            Qimg.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            book_img.image = book_img.image?.withRenderingMode(.alwaysTemplate)
            book_img.tintColor = UIColor(hexString: "A6D141")
            
            
            
            PlayImg.image = PlayImg.image?.withRenderingMode(.alwaysTemplate)
            PlayImg.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            lbl_course.textColor = UIColor(hexString: "B0C1D1")
            lbl_Q.textColor = UIColor(hexString: "B0C1D1")
            lbl_notes.textColor = UIColor(hexString: "A6D141")
            lbl_video.textColor = UIColor(hexString: "B0C1D1")
            
            
        case 4:
            
            
            onlineCO.alpha = 0
            videosCO.alpha = 1
            questionsCO.alpha = 0
            notesCO.alpha = 0
            
            
            
            OnlineLine.backgroundColor = UIColor.white
            VideoLine.backgroundColor = UIColor(hexString: "A6D141")
            Qline.backgroundColor =  UIColor.white
            Notesline.backgroundColor = UIColor.white
            
            
            PcImg.image = PcImg.image?.withRenderingMode(.alwaysTemplate)
            PcImg.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            Qimg.image = Qimg.image?.withRenderingMode(.alwaysTemplate)
            Qimg.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            book_img.image = book_img.image?.withRenderingMode(.alwaysTemplate)
            book_img.tintColor = UIColor(hexString: "B0C1D1")
            
            
            
            PlayImg.image = PlayImg.image?.withRenderingMode(.alwaysTemplate)
            PlayImg.tintColor = UIColor(hexString: "A6D141")
            
            
            
            lbl_course.textColor = UIColor(hexString: "B0C1D1")
            lbl_Q.textColor = UIColor(hexString: "B0C1D1")
            lbl_notes.textColor = UIColor(hexString: "B0C1D1")
            lbl_video.textColor = UIColor(hexString: "A6D141")
            
            
        // Change to French, etc
        default:
            print("Unknown language")
            return
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
  
}
