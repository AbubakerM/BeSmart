//
//  vidoesOB.swift
//  Besmart
//
//  Created by mac on 12/15/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import Foundation
struct   vidoesOB {
    
    var id : Int = 0
    var course_id : String?
    var question : String?
    var answer : String?
    var question_link : String?
    var lessonName : String?
    var lesson_time : String?
    var lessonContent : String?
    var video : String?

    
    
    
    
    var video_duration : String?
    var video_rating : Double?

    
    
    var price : String?
    var approved : String?
    var answer_link : String?
    var country_name : String?
    
    var section_name : String?
    var material_name : String?
    var division_name : String?
    var speciality_name : String?
    var is_favoraite : Bool?
    var     is_purchased : Bool?

    var capon : String?
    var image_link : String?
    var video_link : String?


    var teacher_name : String?
    var type : String?

    var pivot : pivotOB!
    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        course_id = dictionary["course_id"]  as? String ?? ""
        lessonName = dictionary["lessonName"]  as? String ?? ""
        
        lesson_time = dictionary["lesson_time"]  as? String ?? ""

        image_link = dictionary["image_link"]  as? String ?? ""
        video_link = dictionary["video_link"]  as? String ?? ""

        video = dictionary["video"]  as? String ?? ""

        
        
        type = dictionary["type"]  as? String ?? ""

        capon = dictionary["capon"]  as? String ?? ""

        video_rating = dictionary["video_rating"]  as? Double ?? 0.0

        question = dictionary["question"]  as? String ?? ""
        answer = dictionary["answer"]  as? String ?? ""

        question_link = dictionary["question_link"]  as? String ?? ""
        division_name = dictionary["division_name"]  as? String ?? ""

        price = dictionary["price"]  as? String ?? ""
        approved = dictionary["approved"]  as? String ?? ""
        answer_link = dictionary["answer_link"]  as? String ?? ""
        
        country_name = dictionary["country_name"]  as? String ?? ""
        
        is_favoraite = dictionary["is_favoraite"]  as? Bool ?? false
        is_purchased = dictionary["is_purchased"]  as? Bool ?? false

        
        
        
        lessonContent = dictionary["lessonContent"]  as? String ?? ""


        video_duration = dictionary["video_duration"]  as? String ?? ""

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
