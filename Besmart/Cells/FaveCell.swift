//
//  FaveCell.swift
//  Besmart
//
//  Created by mac on 12/8/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import Cosmos

class FaveCell: UITableViewCell {

    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var lbl_rate: UILabel!
    @IBOutlet weak var lbl_views: UILabel!
    @IBOutlet weak var lbl_time: UILabel!
    @IBOutlet weak var lbl_profile: UILabel!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var favImg: UIImageView!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        backView.layer.applySketchShadow(color: UIColor(hexString: "000000"), alpha: 0.3, x: 0, y: 3, blur: 5, spread: 0)
        backView.layer.cornerRadius = 8
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
