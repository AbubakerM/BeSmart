//
//  CinemaOB.swift
//  Besmart
//
//  Created by mac on 12/10/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import Foundation
struct   CinemaOB {
    
    
    
    var  id : Int = 0
    
    var lessonName : String?
    var lessonContent : String?
    var lessonDate : String?
    var lesson_time : String?
    
    var video_duration : String?
    var price : String?
    var capon : String?
    var approved : String?
    var video_link : String?
    var video: String?
    
    var image_link : String?
    
    
    
    var country_name : String?
    var section_name : String?
    var speciality_name : String?
    var material_name : String?
    var teacher_name : String?
    var is_favoraite : Bool?
    
    var is_purchased : Bool?
    var is_purchased2 : Int?

    
    var related_videos:Array<vidoesOB>  = []
    var videoData:vidoesOB!

    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        lessonName = dictionary["lessonName"]  as? String ?? ""
        lessonContent = dictionary["lessonContent"]  as? String ?? ""
        
        lesson_time = dictionary["lesson_time"]  as? String ?? ""
        lessonDate = dictionary["lessonDate"]  as? String ?? ""
        
        
        video_duration = dictionary["video_duration"]  as? String ?? ""
        video = dictionary["video"]  as? String ?? ""
        
        
        
        
        price = dictionary["price"]  as? String ?? ""
        capon = dictionary["capon"]  as? String ?? ""
        approved = dictionary["approved"]  as? String ?? ""
        video_link = dictionary["video_link"]  as? String ?? ""
        image_link = dictionary["image_link"]  as? String ?? ""
        country_name = dictionary["country_name"]  as? String ?? ""
        section_name = dictionary["section_name"]  as? String ?? ""
        speciality_name = dictionary["speciality_name"]  as? String ?? ""
        material_name = dictionary["material_name"]  as? String ?? ""
        teacher_name = dictionary["teacher_name"]  as? String ?? ""
        is_favoraite = dictionary["is_favoraite"]  as? Bool ?? false
        
        is_purchased = dictionary["is_purchased"]  as? Bool ?? false

        is_purchased2 = dictionary["is_purchased"]  as? Int ?? 0

        if let value = dictionary["related_videos"] as? Array<Dictionary<String, AnyObject>>{
                                           
                                      related_videos.removeAll()
                                      
                                           for itemDic in value {
                                   let item = vidoesOB(dictionary:itemDic)
                                              related_videos.append(item)
                                                               }
                                       }
        
        if let value = dictionary["video"] as? Dictionary<String, AnyObject>{
                                           
                                      
                                    
                                   let item = vidoesOB(dictionary:value)
                                              videoData = item
                                                               
                                       }

               
        
        
    }
}
