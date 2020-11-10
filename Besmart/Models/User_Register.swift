//
//  UserRegister.swift
//  Naseem
//
//  Created by Dev Anas on 4/1/19.
//  Copyright © 2019 Dev Anas. All rights reserved.
//

import Foundation
struct  User_Register {
    
    var data : ISData!
    
    init(dictionary : Dictionary<String , Any>) {
        
        
        if let value =  dictionary["data"] as? Dictionary<String, AnyObject> {
            data = ISData(dictionary: value)
        }
    }
}
