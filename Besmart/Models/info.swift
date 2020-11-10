//
//  info.swift
//  Besmart
//
//  Created by mac on 12/10/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import Foundation
struct   InfoUser {
    
    var data : ISData!
    
    init(dictionary : Dictionary<String , Any>) {
        
        if let value =  dictionary["data"] as? Dictionary<String, AnyObject> {
            data = ISData(dictionary: value)
        }
    }
}
