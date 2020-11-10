//
//  QuestionsCell.swift
//  Besmart
//
//  Created by mac on 12/9/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit

class QuestionsCell: UITableViewCell {

    @IBOutlet weak var shwoMore: UIButton!
    @IBOutlet weak var lbl_subject: UILabel!
    @IBOutlet weak var lbl_country: UILabel!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var lbl_price: UILabel!
    @IBOutlet weak var lbl_teacherName: UILabel!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var showButt: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_desc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.3, x: 0, y: 0, blur: 8, spread: 0)
        backView.layer.cornerRadius = 8
        leftView.roundCorners([.layerMaxXMinYCorner, .layerMaxXMaxYCorner], radius: 8)
     
        
//
//        priceView.layer.cornerRadius = CGFloat(8)
//        priceView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        
    }
    
    
    @IBAction func showMore(_ sender: Any) {
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}