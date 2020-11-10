//
//  HomeCollectionCell.swift
//  Besmart
//
//  Created by mac on 12/7/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class HomeCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl_title: UILabel!
    
    @IBOutlet weak var vB: UIView!
    @IBOutlet weak var lbl_desc: UILabel!
    
    override func awakeFromNib() {
 
        
        
   
        img.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.1, x: 0, y: 0, blur: 8, spread: 0)
             img.layer.cornerRadius = 4

        
        
        //        lastView.layer.applySketchShadow(color: .black, alpha: 0.6, x: 0, y: 0, blur: 8, spread: 0)
        
        
        //        imageFull.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 3, blur: 8, spread: 0)
        //        imageFull.layer.cornerRadius = 6
    }
    
}
