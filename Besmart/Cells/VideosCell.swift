//
//  VideosCell.swift
//  Besmart
//
//  Created by mac on 12/11/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import AnimatedGradientView

class VideosCell: UITableViewCell {
    
    @IBOutlet weak var lbl_teacher: UILabel!
    
    @IBOutlet weak var lbl_material: UILabel!
    @IBOutlet weak var lbl_section: UILabel!
    
    @IBOutlet weak var lbl_time: UILabel!
    @IBOutlet weak var lblView: UIView!
    @IBOutlet weak var lbl_university: UILabel!
    @IBOutlet weak var lbl_country: UILabel!
    @IBOutlet weak var lbl_profile: UILabel!
    @IBOutlet weak var lbl_level: UILabel!
    @IBOutlet weak var lbl_num: UILabel!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var buyBtt: AnimatedGradientView!
    
    @IBOutlet weak var lbl_date: UILabel!
    @IBOutlet weak var back_img: UIImageView!
    
    @IBOutlet weak var followButt: UIButton!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.3, x: 0, y: 0, blur: 8, spread: 0)
        backView.layer.cornerRadius = 8
        
        
               buyBtt.colorStrings = [["#BCED4A", "#A6D141"]]
               
               buyBtt.direction = .right
               buyBtt.layer.cornerRadius = CGFloat(8)
                      buyBtt.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        back_img.layer.cornerRadius = CGFloat(8)
        back_img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
         lblView.layer.cornerRadius = CGFloat(8)
                lblView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
    }
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
