//
//  MyvideosTBcell.swift
//  Besmart
//
//  Created by mac on 12/8/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class MyvideosTBcell: UITableViewCell {

    @IBOutlet weak var lbl_university: UILabel!
    @IBOutlet weak var lbl_country: UILabel!
    @IBOutlet weak var lbl_profile: UILabel!
    @IBOutlet weak var lbl_level: UILabel!
    @IBOutlet weak var lbl_num: UILabel!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var back_img: UIImageView!
    
    @IBOutlet weak var followButt: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.3, x: 0, y: 0, blur: 8, spread: 0)
        backView.layer.cornerRadius = 8
        
        
         back_img.layer.cornerRadius = CGFloat(8)
        back_img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        
    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
