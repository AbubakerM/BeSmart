//
//  ISData.swift
//  Naseem
//
//  Created by Dev Anas on 4/1/19.
//  Copyright © 2019 Dev Anas. All rights reserved.
//

import Foundation
struct ISData {
    
    var firstName : String?
    var image_link : String?
    var lastName : String?
    var email : String?
    var country_name : String?
    var country_image_link : String?

    var degree : String?
    var token : String?
    var mobile : String?

    var id : Int = 0
    
    init(dictionary : Dictionary<String , Any>) {
        
        firstName = dictionary["firstName"] as? String ?? ""
        lastName = dictionary["lastName"] as? String ?? ""
        image_link = dictionary["image_link"] as? String ?? ""
        mobile = dictionary["mobile"] as? String ?? ""
        country_image_link = dictionary["country_image_link"] as? String ?? ""


        email = dictionary["email"] as? String ?? ""
        token = dictionary["token"] as? String ?? ""
        degree = dictionary["degree"] as? String ?? ""
        country_name = dictionary["country_name"] as? String ?? ""
        id = dictionary["id"] as? Int ?? -1
    }
}
