//
//  quetionsOB.swift
//  Besmart
//
//  Created by mac on 12/11/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import Foundation
struct   quetionsOB {
    
    var id : Int = 0
    var course_id : String?
    var question : String?
    var answer : String?
    var question_link : String?
    var lessonName : String?



    var price : String?
    var approved : String?
    var answer_link : String?
    var country_name : String?
    
    var section_name : String?
    var material_name : String?
    var speciality_name : String?
    var is_purchased : Bool?

    
    var teacher_name : String?
    
    var pivot : pivotOB!
    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        course_id = dictionary["countryName"]  as? String ?? ""
        lessonName = dictionary["lessonName"]  as? String ?? ""

        is_purchased = dictionary["is_purchased"]  as? Bool ?? false

        question = dictionary["question"]  as? String ?? ""
        question_link = dictionary["question_link"]  as? String ?? ""

        price = dictionary["price"]  as? String ?? ""
        approved = dictionary["approved"]  as? String ?? ""
        answer_link = dictionary["answer_link"]  as? String ?? ""
        
        
        answer = dictionary["answer"]  as? String ?? ""

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
