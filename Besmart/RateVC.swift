//
//  RateVC.swift
//  Besmart
//
//  Created by mac on 2/20/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit
import Cosmos

class RateVC: UIViewController {

    @IBOutlet weak var P5Perc: UILabel!
    @IBOutlet weak var P5: UIProgressView!
    @IBOutlet weak var P4: UIProgressView!
    @IBOutlet weak var p4Percentage: UILabel!
    @IBOutlet weak var p3Percent: UILabel!
    @IBOutlet weak var p3: UIProgressView!
    @IBOutlet weak var p2Percent: UILabel!
    @IBOutlet weak var p2: UIProgressView!
    @IBOutlet weak var p1Percent: UILabel!
    @IBOutlet weak var p1: UIProgressView!
    @IBOutlet weak var rateNo: UILabel!
    @IBOutlet weak var rateCont: UILabel!
    @IBOutlet weak var rateV: CosmosView!
    
    
    var rateData:RateOB!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.rateNo.text = "\(rateData.rate?.rounded(toPlaces: 1) ?? 0.0)"
        
        self.rateV.rating = rateData.rate?.rounded(toPlaces: 1) ?? 0.0
        
        self.P5.progress =  Float((rateData.five_star_rate)/100)
        self.P4.progress = Float((rateData.four_star_rate)/100)
        self.p3.progress = Float((rateData.three_star_rate)/100)
        self.p2.progress = Float((rateData.two_star_rate)/100)
        self.p1.progress = Float((rateData.one_star_rate)/100)
        
        
//        self.P5Perc.text = "\()"

        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
