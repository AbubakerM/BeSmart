////
////  PopUpViewController.swift
////  PopUp
////
////  Created by Andrew Seeley on 6/06/2016.
////  Copyright © 2016 Seemu. All rights reserved.
////
//
//import UIKit
//
//import ActionSheetPicker_3_0
//import Alamofire
//
//
//
//class PobViewREsult:UIViewController{
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    
//    
//    
//}
//class PobViewREsult2:UIViewController,UITextViewDelegate{
//    
//    
//    
//    override func viewDidLoad() {
//        
//        
//        
//        
//        
//    }
//    
//    @IBAction func yseButt(_ sender: Any) {
//        
//        
//        let storyboard = UIStoryboard(name: "AccountStoryboard", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "LogIn_SignUpViewController")
//        self.present(vc, animated: true, completion: nil)
//        
//        
//    }
//    
//    
//    @IBAction func noButt(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//
//    }
//    
//    
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        
//    }
//
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    
//    
//    
//    
//    
//    
//}
//
//
//
//
//
//
//
//
//class PobViewREsult3:UIViewController,UITextViewDelegate{
//
//    var obj2 = CalendarReservationViewController.self
//    
//    static var msg = ""
//
//    @IBOutlet weak var lbl_msg: UILabel!
//    
//    @IBOutlet weak var okButt: UIButton!
//    override func viewDidLoad() {
//        
//        
//        
//        if PobViewREsult3.msg != "done" {
//            lbl_msg.text = PobViewREsult3.msg
//
//        }
//
//       
//
//      
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//     
//    }
//  
//        
//        
//    
//  
//    
//
//    @IBAction func okButton(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
//  
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    
//
//    
//    
//    
//    
//}
//
//
//
//
//
//
//
//
//class MassegeBoxAddResult
//{
//    static func MassegeShowResult(MyVC : UIViewController)
//    {
//        let story = UIStoryboard.init(name: "Massege", bundle: nil)
//        let VC = story.instantiateViewController(withIdentifier: "CustomAlertID10") as! PobViewREsult3
//        VC.modalPresentationStyle = .overFullScreen
//        VC.modalTransitionStyle = .crossDissolve
//        
//        
//        
//        
//        //  VC.MassegeTitle  = massageTitle
//        // VC.MassegeDes = massegeDes
//        
//        MyVC.present(VC, animated: true, completion: nil)
//    }
//    
//    static func MassegeShowResult2(MyVC : UIViewController)
//    {
//        let story = UIStoryboard.init(name: "Massege", bundle: nil)
//        let VC = story.instantiateViewController(withIdentifier: "CustomAlertID11") as! PobViewREsult2
//        VC.modalPresentationStyle = .overFullScreen
//        VC.modalTransitionStyle = .crossDissolve
//        
//        
//        
//        
//        //  VC.MassegeTitle  = massageTitle
//        // VC.MassegeDes = massegeDes
//        
//        MyVC.present(VC, animated: true, completion: nil)
//    }
//}
//
//
//
//
//
//protocol PobViewREsultProtocol {
//    func ShowAlert(title : String)
//    
//}
