//
//  ISConstant.swift
//  Naseem
//
//  Created by Dev Anas on 4/4/19.
//  Copyright © 2019 Dev Anas. All rights reserved.
//

import Foundation
struct   ISConstant {
    
    let status : String
    let message : String
   static var apiPath = "http://besmart.avocodes.com/api/"

    static var isLogin = UserDefaults.standard.object(forKey: "status") as? Bool
    
      static var userToken = UserDefaults.standard.object(forKey: "token")
    
    
    static var expireDate = ""
    
    
    
    static let Firstname =  UserDefaults.standard.object(forKey: "Firstname") as! String
    static let Lastname =  UserDefaults.standard.object(forKey: "Lastname") as! String
    static let Email =  UserDefaults.standard.object(forKey: "Email") as! String
   
    static var userId =  UserDefaults.standard.object(forKey: "userId") as? Int ?? 0
    static let countryID =  UserDefaults.standard.object(forKey: "countryID") as? Int ?? 0
    static var lang =  UserDefaults.standard.object(forKey: "lang") as? String ?? ""
    
    static var imageProfile =  UserDefaults.standard.object(forKey: "imagePro") as? String ?? ""
    
    static var countryName =  UserDefaults.standard.object(forKey: "countryName") as? String ?? ""

    static var mobile =  UserDefaults.standard.object(forKey: "mobile") as? String ?? ""
    static var countryImage =  UserDefaults.standard.object(forKey: "countryImage") as? String ?? ""

    
    
    

    
    
    

init(dictionary : Dictionary<String , Any>) {
    
    status = dictionary["status"] as? String ?? ""
    message = dictionary["message"] as? String ?? ""
    }
}
