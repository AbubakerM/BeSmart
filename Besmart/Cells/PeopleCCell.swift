//
//  PeopleCCell.swift
//  Besmart
//
//  Created by mac on 2/2/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit


class PeopleCCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl_reveiw: UILabel!
    @IBOutlet weak var lbl_country: UILabel!
    @IBOutlet weak var lbl_work: UILabel!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var backView: UIView!
    
    
    override func awakeFromNib() {
           super.awakeFromNib()
         
           
            img.layer.cornerRadius = CGFloat(8)
           img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
           
           backView.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.3, x: 0, y: 0, blur: 8, spread: 0)
                backView.layer.cornerRadius = 8
                
           
       }
       
       
       
}
