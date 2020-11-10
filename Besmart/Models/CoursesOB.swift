//
//  CoursesOB.swift
//  Besmart
//
//  Created by mac on 12/11/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import Foundation
struct   CoursesOB {
    
    var  id : Int = 0
    
    var courseName : String?
    var courseContent : String?
    var video_duration : String?
    var price : String?
    var capon : String?
    var image_link : String?
    var country_name : String?
    var section_name : String?
    var speciality_name : String?
    var material_name : String?
    var teacher_name : String?
    var division_name : String?
    var lesson_time : String?
    var lessonName : String?


    var is_favoraite : Bool?
    var is_purchased : Bool?

    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        courseName = dictionary["courseName"]  as? String ?? ""
        
        lesson_time = dictionary["lesson_time"]  as? String ?? ""
        lessonName = dictionary["lessonName"]  as? String ?? ""


        courseContent = dictionary["courseContent"]  as? String ?? ""

        video_duration = dictionary["video_duration"]  as? String ?? ""
        price = dictionary["price"]  as? String ?? ""
        capon = dictionary["capon"]  as? String ?? ""
        image_link = dictionary["image_link"]  as? String ?? ""
        country_name = dictionary["country_name"]  as? String ?? ""
        section_name = dictionary["section_name"]  as? String ?? ""
        division_name = dictionary["division_name"]  as? String ?? ""

        speciality_name = dictionary["speciality_name"]  as? String ?? ""
        material_name = dictionary["material_name"]  as? String ?? ""
        teacher_name = dictionary["teacher_name"]  as? String ?? ""
        
        is_favoraite = dictionary["is_favoraite"]  as? Bool ?? false

        
        is_purchased = dictionary["is_purchased"]  as? Bool ?? false

        
        
        
    }
}


struct   RateOB {
    
    var  five_star_rate : Int = 0
    var  four_star_rate : Int = 0
    var  three_star_rate : Int = 0
    var  two_star_rate : Int = 0
    var  one_star_rate : Int = 0

    var rate : Double?
   


    
    init(dictionary : Dictionary<String , Any>) {
        
        five_star_rate = dictionary["five_star_rate"] as? Int ?? -1
        four_star_rate = dictionary["four_star_rate"] as? Int ?? -1
        two_star_rate = dictionary["two_star_rate"] as? Int ?? -1
        two_star_rate = dictionary["two_star_rate"] as? Int ?? -1
        one_star_rate = dictionary["one_star_rate"] as? Int ?? -1
        rate = dictionary["rate"] as? Double ?? 0.0

     
        
        
    }
}
