//
//  User_Login.swift
//  Naseem
//
//  Created by Dev Anas on 4/1/19.
//  Copyright © 2019 Dev Anas. All rights reserved.
//

import Foundation
struct  User_Login {
    
    
    let user_status : String

    
    init(dictionary : Dictionary<String , Any>) {
        
        user_status = dictionary["user_status"] as? String ?? ""
       
    }
}
