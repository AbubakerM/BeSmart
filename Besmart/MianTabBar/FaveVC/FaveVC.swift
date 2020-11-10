//
//  FaveVC.swift
//  Besmart
//
//  Created by mac on 12/8/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class FaveVC: UIViewController {
    
    @IBOutlet weak var favCO: UIView!
    
    @IBOutlet weak var noteLine: UIView!
    @IBOutlet weak var notesBtt: UIButton!
    @IBOutlet weak var favBtt: UIButton!
    @IBOutlet weak var qestionBtt: UIButton!
    
    @IBOutlet weak var onlineLine: UIView!
    @IBOutlet weak var onlineBTT: UIButton!
    @IBOutlet weak var onlineCO: UIView!
    @IBOutlet weak var notesCO: UIView!
    @IBOutlet weak var questionLine: UIView!
    @IBOutlet weak var favLine: UIView!
    
    @IBOutlet weak var qestionCO: UIView!
    @IBOutlet weak var corseCO: UIView!
    @IBOutlet weak var corseBtt: UIButton!
    
    @IBOutlet weak var corseLine: UIView!
    
    
    
    var ViedoCo:FavViideoVC!
     var QaCo: QuestionsVC!
       var CorseCo: FaveViedoVC!
    var NoteCo: NotesVC!
    var OnlinCo: OnlineCourseVC!

var isfave = false


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let id = UserDefaults.standard.integer(forKey: "userId")
        
        
        if id != -1 {
                    favCO.alpha = 1
                           onlineCO.alpha = 0
                           qestionCO.alpha = 0
                           notesCO.alpha = 0
                           corseCO.alpha = 0
                           
                           
                           favLine.backgroundColor = UIColor(hexString: "BCED4A")
                           corseLine.backgroundColor = UIColor(hexString: "B0C1D1")
                           onlineLine.backgroundColor = UIColor(hexString: "B0C1D1")
                           questionLine.backgroundColor = UIColor(hexString: "B0C1D1")
                           noteLine.backgroundColor = UIColor(hexString: "B0C1D1")
                           
                           
                           favBtt.setTitleColor(UIColor(hexString: "BCED4A"), for: .normal)
                           
                           
                           corseBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
                           onlineBTT.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
                           
                           qestionBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
                           notesBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
                                   }
       
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let id = UserDefaults.standard.integer(forKey: "userId")
            
            
        if id == -1 {
            
            self.showSimpleAlert()

            
            
        }
        
    }
    
    
    @IBAction func multView(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 5:
            favCO.alpha = 1
            onlineCO.alpha = 0
            qestionCO.alpha = 0
            notesCO.alpha = 0
            corseCO.alpha = 0
            
            
            favLine.backgroundColor = UIColor(hexString: "BCED4A")
            corseLine.backgroundColor = UIColor(hexString: "B0C1D1")
            onlineLine.backgroundColor = UIColor(hexString: "B0C1D1")
            questionLine.backgroundColor = UIColor(hexString: "B0C1D1")
            noteLine.backgroundColor = UIColor(hexString: "B0C1D1")
            
            
            
               favBtt.setTitleColor(UIColor(hexString: "BCED4A"), for: .normal)
                   
                   
                   corseBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
                   onlineBTT.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
                   
                   qestionBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
                   notesBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
                   
                   
            
        case 1:
            
            
            favCO.alpha = 0
            onlineCO.alpha = 0
            qestionCO.alpha = 0
            notesCO.alpha = 0
            corseCO.alpha = 1
            
            
            favLine.backgroundColor = UIColor(hexString: "B0C1D1")
            corseLine.backgroundColor = UIColor(hexString: "BCED4A")
            onlineLine.backgroundColor = UIColor(hexString: "B0C1D1")
            questionLine.backgroundColor = UIColor(hexString: "B0C1D1")
            noteLine.backgroundColor = UIColor(hexString: "B0C1D1")
            
            
            favBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            
            
            corseBtt.setTitleColor(UIColor(hexString: "BCED4A"), for: .normal)
            onlineBTT.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            
            qestionBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            notesBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            
            
            
            
        // Change to Spanish
        case 2:
            
            
            
            favCO.alpha = 0
            onlineCO.alpha = 0
            qestionCO.alpha = 1
            notesCO.alpha = 0
            corseCO.alpha = 0
            
            
            favLine.backgroundColor = UIColor(hexString: "B0C1D1")
            corseLine.backgroundColor = UIColor(hexString: "B0C1D1")
            onlineLine.backgroundColor = UIColor(hexString: "B0C1D1")
            questionLine.backgroundColor = UIColor(hexString: "BCED4A")
            noteLine.backgroundColor = UIColor(hexString: "B0C1D1")
            
            
            favBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            
            
            corseBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            onlineBTT.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            
            qestionBtt.setTitleColor(UIColor(hexString: "BCED4A"), for: .normal)
            notesBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            
        case 3:
            
            onlineCO.alpha = 0
            qestionCO.alpha = 0
            favCO.alpha = 0
            corseCO.alpha = 0
            notesCO.alpha = 1
            
            
            favLine.backgroundColor = UIColor(hexString: "B0C1D1")
            corseLine.backgroundColor = UIColor(hexString: "B0C1D1")
            onlineLine.backgroundColor = UIColor(hexString: "B0C1D1")
            questionLine.backgroundColor = UIColor(hexString: "B0C1D1")
            noteLine.backgroundColor = UIColor(hexString: "BCED4A")
            
            
            favBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            
            
            corseBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            onlineBTT.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            
            qestionBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            notesBtt.setTitleColor(UIColor(hexString: "BCED4A"), for: .normal)
            
            NoteCo.isfave = true
            
            
        case 4:
            
          
            onlineCO.alpha = 1
            qestionCO.alpha = 0
            favCO.alpha = 0
            corseCO.alpha = 0
            notesCO.alpha = 0
            
            
            favLine.backgroundColor = UIColor(hexString: "B0C1D1")
            corseLine.backgroundColor = UIColor(hexString: "B0C1D1")
            onlineLine.backgroundColor = UIColor(hexString: "BCED4A")
            questionLine.backgroundColor = UIColor(hexString: "B0C1D1")
            noteLine.backgroundColor = UIColor(hexString: "B0C1D1")
            
            
            favBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            
            
            corseBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            onlineBTT.setTitleColor(UIColor(hexString: "BCED4A"), for: .normal)
            
            qestionBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            notesBtt.setTitleColor(UIColor(hexString: "B0C1D1"), for: .normal)
            
    
        // Change to French, etc
        default:
            print("Unknown language")
            return
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "videoSeg" {
              let secondVC: FavViideoVC = segue.destination as! FavViideoVC
              
              ViedoCo = secondVC
            ViedoCo.isFave = true

              
          }else if segue.identifier == "corseSeg" {
              let secondVC: FaveViedoVC = segue.destination as! FaveViedoVC
              
              CorseCo = secondVC
            CorseCo.isFave = true

              
      }else if segue.identifier == "qaSeg" {
              let secondVC: QuestionsVC = segue.destination as! QuestionsVC
              
              QaCo = secondVC
              QaCo.isFave = true

      }else if segue.identifier == "noteSeg" {
              let secondVC: NotesVC = segue.destination as! NotesVC
              NoteCo = secondVC
            
            NoteCo.isfave = true

              
      }else if segue.identifier == "onlineSeg" {
              let secondVC: OnlineCourseVC = segue.destination as! OnlineCourseVC
              
              OnlinCo = secondVC
              OnlinCo.isFave = true

      }
      }
    
    
}





