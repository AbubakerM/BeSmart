//
//  CategoryDetialsCell.swift
//  Besmart
//
//  Created by mac on 12/8/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import AnimatedGradientView

class CategoryDetialsCell: UICollectionViewCell {
    
    @IBOutlet weak var favImg: UIImageView!
    
    @IBOutlet weak var lbl_price: UILabel!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var lbl_work: UILabel!
    
    @IBOutlet weak var lbl_subject: UILabel!
    
    @IBOutlet weak var lbl_subj: UILabel!
    @IBOutlet weak var lbl_time: UILabel!
    @IBOutlet weak var lbl_profile: UILabel!
    
    @IBOutlet weak var wtView: AnimatedGradientView!
    
    @IBOutlet weak var lbl_teacherName: UILabel!
    
    @IBOutlet weak var lbl_subSubject: UILabel!
    @IBOutlet weak var lbl_duration: UILabel!
    @IBOutlet weak var watchBtn: UIButton!
    
    @IBOutlet weak var lbl_Subject: UILabel!
    
    @IBOutlet weak var lbl_W: UILabel!
    @IBOutlet weak var priceV: UIView!
    @IBOutlet weak var WatchButt: UIButton!
    override func awakeFromNib() {
        //        priceView.isHidden = true
        
        
        
        backView.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.1, x: 0, y: 3, blur: 10, spread: 0)
        backView.layer.cornerRadius = 15
        
        
        wtView.colorStrings = [["#BCED4A", "#A6D141"]]
        
        wtView.direction = .right
        
        wtView.layer.cornerRadius = CGFloat(8)
        wtView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        img.layer.cornerRadius = CGFloat(8)
        img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        priceV.layer.cornerRadius = CGFloat(8)
        priceV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        //        lastView.layer.applySketchShadow(color: .black, alpha: 0.6, x: 0, y: 0, blur: 8, spread: 0)
        
        
        //        imageFull.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 3, blur: 8, spread: 0)
        //        imageFull.layer.cornerRadius = 6
    }
}





class onlineCell:UITableViewCell{
    
    
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var favImg: UIButton!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var lbl_time: UILabel!
    
    @IBOutlet weak var lbl_subject: UILabel!

    
    @IBOutlet weak var wtView: AnimatedGradientView!
    
    @IBOutlet weak var lbl_teacherName: UILabel!
    
    @IBOutlet weak var lbl_w: UILabel!
    @IBOutlet weak var lbl_divison: UILabel!
    @IBOutlet weak var lbl_subSubject: UILabel!
    @IBOutlet weak var lbl_duration: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var lbl_price: UILabel!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var buyBtn: UIButton!
    
    @IBOutlet weak var WatchButt: UIButton!
    override func awakeFromNib() {
        //        priceView.isHidden = true
        
        
        
        backView.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.1, x: 0, y: 3, blur: 10, spread: 0)
        backView.layer.cornerRadius = 15
        
        
        wtView.colorStrings = [["#BCED4A", "#A6D141"]]
        
        wtView.direction = .right
        
        wtView.layer.cornerRadius = CGFloat(8)
        wtView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        img.layer.cornerRadius = CGFloat(8)
        img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        

   priceView.layer.cornerRadius = CGFloat(3)
   priceView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
   

        
        
        
    }
    
    
}






class onlineV:UITableViewCell{
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var img: UIImageView!
    
    
    
    @IBOutlet weak var lbl_title: UILabel!
    
    
    @IBOutlet weak var lbl_time: UILabel!
    
    override func awakeFromNib() {
         //        priceView.isHidden = true
         
         
         
         backView.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.1, x: 0, y: 3, blur: 5, spread: 0)
         backView.layer.cornerRadius = 15
         
       
         img.layer.cornerRadius = CGFloat(8)
         img.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]

    

         
         
         
     }
    
}



