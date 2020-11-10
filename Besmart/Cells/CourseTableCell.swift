//
//  CourseTableCell.swift
//  Besmart
//
//  Created by mac on 1/30/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class CourseTableCell: UITableViewCell {

    @IBOutlet weak var pView: UIView!
    @IBOutlet weak var pp: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var favImg: UIButton!
    @IBOutlet weak var pricee: UILabel!
    @IBOutlet weak var likeImg: UIImageView!
    @IBOutlet weak var lbl_Rate: UILabel!
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var lbl_price: UILabel!
    @IBOutlet weak var x1: UIView!
    @IBOutlet weak var lbl_course: UILabel!
    @IBOutlet weak var lbl_internt: UILabel!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_jop: UILabel!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        
        priceView.clipsToBounds = true
        priceView.layer.cornerRadius = 3
        priceView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
//        priceView.layer.cornerRadius = 3
//        priceView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
//        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
