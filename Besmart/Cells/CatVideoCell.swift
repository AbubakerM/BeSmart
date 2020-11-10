//
//  CatVideoCell.swift
//  Besmart
//
//  Created by mac on 1/30/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class CatVideoCell: UICollectionViewCell {

    
    @IBOutlet weak var lbl_title: UILabel!
    
    
    
    @IBOutlet weak var lbl_noTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var botomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        botomView.layer.cornerRadius = CGFloat(8)
        botomView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
               
        
        
        
        
        
        // Initialization code
    }

  

}
