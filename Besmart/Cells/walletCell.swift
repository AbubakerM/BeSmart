//
//  walletCell.swift
//  Besmart
//
//  Created by mac on 2/17/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit

class walletCell: UITableViewCell {

    @IBOutlet weak var lbl_date: UILabel!
    @IBOutlet weak var lbl_price: UILabel!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_type: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
