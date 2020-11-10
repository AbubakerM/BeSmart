//
//  TeacherOB.swift
//  Besmart
//
//  Created by mac on 12/11/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import Foundation
struct   TeacherOB {
    
    
    
    var  id : Int = 0
    
    
    var employmentNumber : String?
    var firstName : String?
    var lastName : String?
    var email : String?
    var mobile : String?
    var image_link : String?
    var country_name : String?
    var country_image : String?
    var join_date : String?

    var section_name : String?
    var speciality_name : String?
    var material_name : String?
    var approve : String?
    var teacher_rate_count : Int?
    var teacher_followers : Int?
   var teacher_rating : Double?

    
    var teacher_videos:Array<vidoesOB>  = []
    var teacher_QAs:Array<quetionsOB>  = []
    var teacher_notes:Array<NotesOB>  = []
    var teacher_online_videos:Array<vidoesOB>  = []
    var teacher_courses:Array<CoursesOB>  = []
    var teacher_rate:RateOB!

    
    var is_favoraite : Bool?
    
    
    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        firstName = dictionary["firstName"]  as? String ?? ""
        employmentNumber = dictionary["employmentNumber"]  as? String ?? ""

        approve = dictionary["approve"]  as? String ?? ""
        country_image = dictionary["country_image"]  as? String ?? ""

        lastName = dictionary["lastName"]  as? String ?? ""
        lastName = dictionary["lastName"]  as? String ?? ""
        join_date = dictionary["join_date"]  as? String ?? ""

        email = dictionary["email"]  as? String ?? ""
        mobile = dictionary["mobile"]  as? String ?? ""
        image_link = dictionary["image_link"]  as? String ?? ""
        country_name = dictionary["country_name"]  as? String ?? ""
        section_name = dictionary["section_name"]  as? String ?? ""
        speciality_name = dictionary["speciality_name"]  as? String ?? ""
        material_name = dictionary["material_name"]  as? String ?? ""
        is_favoraite = dictionary["is_favoraite"]  as? Bool ?? false
        
        teacher_rating = dictionary["teacher_rating"]  as? Double ?? 0.0

        
        
        if let value = dictionary["teacher_videos"] as? Array<Dictionary<String, AnyObject>>{
                                    
                               teacher_videos.removeAll()
                               
                                    for itemDic in value {
                            let item = vidoesOB(dictionary:itemDic)
                                       teacher_videos.append(item)
                                                        }
                                }
        
        if let value = dictionary["teacher_rate"] as? Dictionary<String, AnyObject>{
                                          
                                 
                let item = RateOB(dictionary:value)

            self.teacher_rate = item
                                      }
        
        if let value = dictionary["teacher_QAs"] as? Array<Dictionary<String, AnyObject>>{
                                          
                                     teacher_QAs.removeAll()
                                     
                                          for itemDic in value {
                                  let item = quetionsOB(dictionary:itemDic)
                                             teacher_QAs.append(item)
                                                              }
                                      }
        
        if let value = dictionary["teacher_notes"] as? Array<Dictionary<String, AnyObject>>{
                                              
                                         teacher_notes.removeAll()
                                         
                                              for itemDic in value {
                                      let item = NotesOB(dictionary:itemDic)
                                                 teacher_notes.append(item)
                                                                  }
                                          }
            
        
        
        if let value = dictionary["teacher_online_videos"] as? Array<Dictionary<String, AnyObject>>{
                                              
                                         teacher_online_videos.removeAll()
                                         
                                              for itemDic in value {
                                      let item = vidoesOB(dictionary:itemDic)
                                                 teacher_online_videos.append(item)
                                                                  }
                                          }
            
        
        if let value = dictionary["teacher_courses"] as? Array<Dictionary<String, AnyObject>>{
                                              
                                         teacher_courses.removeAll()
                                         
                                              for itemDic in value {
                                      let item = CoursesOB(dictionary:itemDic)
                                                 teacher_courses.append(item)
                                                                  }
                                          }
            
        
        
        
    }
}

