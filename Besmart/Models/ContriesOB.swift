//
//  Chalet.swift
//  Naseem
//
//  Created by Dev Anas on 4/4/19.
//  Copyright © 2019 Dev Anas. All rights reserved.
//

import Foundation
struct   ContriesOB {
    
    var id : Int = 0
    let countryName : String
    let countryNumber : String
    let image : String


    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        countryName = dictionary["countryName"]  as? String ?? ""
        countryNumber = dictionary["countryNumber"]  as? String ?? ""
        image = dictionary["image_link"]  as? String ?? ""



        
    }
}


//
//
//struct   CatImageOB {
//    
//    var src : String
//    var attachment : String
//    var picture_id:Int
//    var position:Int
//    var Id:Int
//
//
//    
//    
//    
//    
//    init(dictionary : Dictionary<String , Any>) {
//        
//        
//        src = dictionary["src"] as? String ?? ""
//        attachment = dictionary["attachment"] as? String ?? ""
//        
//        Id = dictionary["attachment"] as? Int ?? 0
//        position = dictionary["attachment"] as? Int ?? 0
//        picture_id = dictionary["attachment"] as? Int ?? 0
//
//       
//        
//        
//    }
//}
////
////  Chalet.swift
////  Naseem
////
////  Created by Dev Anas on 4/4/19.
////  Copyright © 2019 Dev Anas. All rights reserved.
////
//
//import Foundation
//struct   ChaletOB {
//    
//    var id : Int = 0
//    var owner_id : Int = 0
//    let vendor_name : String
//    let vendor_description : String
//    let address : String
//    var old_price : Int = 0
//    let is_discount : String
//    var new_price : Int = 0
//    var area_id : Int = 0
//    var city_id : Int = 0
//    let morning_start : String
//    let morning_hour : String
//    let evening_start : String
//    let evening_hour : String
//    let full_day_start : String
//    let full_day_hour : String
//    let rate : String
//    let area_name : String
//    let city_name : String
//    let owner_name : String
//    let image : String
//    
//    
//    
//    init(dictionary : Dictionary<String , Any>) {
//        
//        id = dictionary["id"] as? Int ?? -1
//        owner_id = dictionary["owner_id"] as? Int ?? -1
//        vendor_name = dictionary["vendor_name"] as? String ?? ""
//        vendor_description = dictionary["vendor_description"] as? String ?? ""
//        address = dictionary["address"] as? String ?? ""
//        old_price = dictionary["old_price"] as? Int ?? -1
//        is_discount = dictionary["is_discount"] as? String ?? ""
//        new_price = dictionary["new_price"] as? Int ?? -1
//        area_id = dictionary["area_id"] as? Int ?? -1
//        city_id = dictionary["city_id"] as? Int ?? -1
//        morning_start = dictionary["morning_start"] as? String ?? ""
//        morning_hour = dictionary["morning_hour"] as? String ?? ""
//        evening_start = dictionary["evening_start"] as? String ?? ""
//        evening_hour = dictionary["evening_hour"] as? String ?? ""
//        full_day_start = dictionary["full_day_start"] as? String ?? ""
//        full_day_hour = dictionary["full_day_hour"] as? String ?? ""
//        rate = dictionary["rate"] as? String ?? ""
//        area_name = dictionary["area_name"] as? String ?? ""
//        city_name = dictionary["city_name"] as? String ?? ""
//        owner_name = dictionary["owner_name"] as? String ?? ""
//        image = dictionary["image"] as? String ?? ""
//        
//    }
//}
