//
//  LevelOB.swift
//  Besmart
//
//  Created by mac on 12/9/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import Foundation
struct   LevelOB {
    
    var id : Int = 0
    let levelName : String
    
    
    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        levelName = dictionary["levelName"]  as? String ?? ""
        
    }
}
