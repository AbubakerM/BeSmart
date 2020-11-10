//
//  TeacherVideos.swift
//  Besmart
//
//  Created by mac on 12/11/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import Foundation
struct   TeacherVideosOB {
    
    
    
    var  id : Int = 0

    var course_id : String?
    var lessonName : String?
    var lessonDate : String?
    var lesson_time : String?

    var price : String?
    var lessonContent : String?
    var approved : String?
    var image_link : String?
    var country_name : String?
    var section_name : String?
    var speciality_name : String?
    var material_name : String?
    var division_name : String?
    var teacher_name : String?
    var video_rating : Double?
    var video_duration : String?


    var video_link : String?

    var is_favoraite : Bool?
    
    
    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        course_id = dictionary["course_id"]  as? String ?? ""
        price = dictionary["price"]  as? String ?? ""
        lessonDate = dictionary["lesson_date"]  as? String ?? ""
        
        lesson_time = dictionary["lesson_time"]  as? String ?? ""
        video_duration = dictionary["video_duration"]  as? String ?? ""


        lessonContent = dictionary["email"]  as? String ?? ""
        approved = dictionary["mobile"]  as? String ?? ""
        image_link = dictionary["image_link"]  as? String ?? ""
        country_name = dictionary["country_name"]  as? String ?? ""
        section_name = dictionary["section_name"]  as? String ?? ""
        speciality_name = dictionary["speciality_name"]  as? String ?? ""
        material_name = dictionary["material_name"]  as? String ?? ""
        video_rating = dictionary["video_rating"]  as? Double ?? 0.0
        video_link = dictionary["video_link"]  as? String ?? ""
        teacher_name = dictionary["teacher_name"]  as? String ?? ""
        division_name = dictionary["division_name"]  as? String ?? ""
        lessonName = dictionary["lessonName"]  as? String ?? ""


        is_favoraite = dictionary["is_favoraite"]  as? Bool ?? false
        
        
        
        
}
}
