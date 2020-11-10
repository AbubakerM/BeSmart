//
//  BranchCell.swift
//  Besmart
//
//  Created by mac on 2/6/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class BranchCell: UICollectionViewCell {
    @IBOutlet weak var backView: UIView!
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
           //        priceView.isHidden = true
           
           
        backgroundColor = UIColor.clear
        backView.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha:0.1, x: 0, y: 0, blur: 8, spread: 0)
           backView.layer.cornerRadius = 15
      
           
           img.layer.cornerRadius = CGFloat(8)
           img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
           
           
           //        lastView.layer.applySketchShadow(color: .black, alpha: 0.6, x: 0, y: 0, blur: 8, spread: 0)
           
           
           //        imageFull.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 3, blur: 8, spread: 0)
           //        imageFull.layer.cornerRadius = 6
       }
    
}
