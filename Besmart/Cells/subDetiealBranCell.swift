//
//  subDetiealBranCell.swift
//  Besmart
//
//  Created by mac on 2/6/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit
import AnimatedGradientView

class subDetiealBranCell: UITableViewCell {

    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var subImg: UIImageView!
    @IBOutlet weak var icTitle: UILabel!
    @IBOutlet weak var icImg: UIImageView!
    @IBOutlet weak var rightImg: UIImageView!
    @IBOutlet weak var leftImg: UIImageView!
    @IBOutlet weak var aniView: AnimatedGradientView!
    @IBOutlet weak var aniV: AnimatedGradientView!
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
        
        aniV.colorStrings = [["#1D6FA3", "#5EEEE8"]]
        
        aniV.direction = .right
        
        aniV.layer.cornerRadius = CGFloat(8)
        aniV.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}





class subCell: UITableViewCell {

    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var subImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



