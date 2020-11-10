//
//  NotesVC.swift
//  Besmart
//
//  Created by mac on 12/11/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import Foundation
struct   NotesOB {
    
    var id : Int = 0
    let course_id : String
    let noteName : String
    let price : String
    let approved : String
    let file_link : String
    let country_name : String

    let section_name : String
    let material_name : String
    let speciality_name : String

    let teacher_name : String
    let is_purchased
 : Bool

    var pivot : pivotOB!

    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        course_id = dictionary["countryName"]  as? String ?? ""
        is_purchased = dictionary["is_purchased"]  as? Bool ?? false

        noteName = dictionary["noteName"]  as? String ?? ""
        price = dictionary["price"]  as? String ?? ""
        approved = dictionary["approved"]  as? String ?? ""
        file_link = dictionary["file_link"]  as? String ?? ""

        country_name = dictionary["country_name"]  as? String ?? ""
        section_name = dictionary["section_name"]  as? String ?? ""
        material_name = dictionary["material_name"]  as? String ?? ""
        speciality_name = dictionary["speciality_name"]  as? String ?? ""
        
        teacher_name = dictionary["teacher_name"]  as? String ?? ""

        if let value = dictionary["pivot"] as? Dictionary<String, AnyObject> {
            
              let item = pivotOB(dictionary:value)
              pivot = item
        }
        
        
    }
}


struct  pivotOB {
    

    let teacher_id : String
    let note_id : String
    
    
    
    init(dictionary : Dictionary<String , Any>) {
        
        teacher_id = dictionary["teacher_id"]  as? String ?? ""
        note_id = dictionary["note_id"]  as? String ?? ""
        
        
        
        
}
}
