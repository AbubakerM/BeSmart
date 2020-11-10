//
//  EngStudentCell.swift
//  Besmart
//
//  Created by mac on 12/8/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class EngStudentCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    
    
    override func awakeFromNib() {
        
        
        backView.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.1, x: 0, y: 0, blur: 8, spread: 0)
        backView.layer.cornerRadius = 8
        
        
        img.layer.cornerRadius = CGFloat(8)
        img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        
    }
    
}
