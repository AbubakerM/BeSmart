//
//  File.swift
//  Besmart
//
//  Created by mac on 12/10/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import Foundation

struct   HomeOB {
    
    var id : Int = 0
    let text : String
    let image_link : String
    var slider: Array<SliderOB>  = []
    var sectionName:Array<sectionsOB>  = []
    var corsesArry:Array<CoursesOB>  = []
    
    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        text = dictionary["text"]  as? String ?? ""
        image_link = dictionary["image_link"]  as? String ?? ""
        
        if let value = dictionary["slider"] as? Array<Dictionary<String, AnyObject>>{
                 
            slider.removeAll()
            
                 for itemDic in value {
         let item = SliderOB(dictionary:itemDic)
                    slider.append(item)
                                     }
             }
        
        if let value = dictionary["sections"] as? Array<Dictionary<String, AnyObject>>{
                       
                  sectionName.removeAll()
                  
                       for itemDic in value {
               let item = sectionsOB(dictionary:itemDic)
                          sectionName.append(item)
                                           }
                   }
        
        
        if let value = dictionary["courses"] as? Array<Dictionary<String, AnyObject>>{
                
           corsesArry.removeAll()
           
                for itemDic in value {
        let item = CoursesOB(dictionary:itemDic)
                   corsesArry.append(item)
                                    }
            }
        
        
    }
}


struct   SliderOB {
    
    var id : Int = 0
    let title : String
    let description : String
    let image_link : String

    
    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        title = dictionary["title"]  as? String ?? ""
        description = dictionary["description"]  as? String ?? ""
        image_link = dictionary["image_link"]  as? String ?? ""

    }
}



struct   sectionsOB {
    
    var id : Int = 0
    let sectionName : String
    let image_link : String

    
    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        sectionName = dictionary["sectionName"]  as? String ?? ""
        image_link = dictionary["image_link"]  as? String ?? ""

    }
}







struct   specialitiesOB {
    
    var id : Int = 0
    let specialityName : String
    let image_link : String

    
    var diviton:Array<divisionsOB>  = []

    
    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        specialityName = dictionary["specialityName"]  as? String ?? ""
        image_link = dictionary["image_link"]  as? String ?? ""

        if let value = dictionary["divisions"] as? Array<Dictionary<String, AnyObject>>{
                              
                         diviton.removeAll()
                         
                              for itemDic in value {
                      let item = divisionsOB(dictionary:itemDic)
                                 diviton.append(item)
                                                  }
                          }
        
        
        
        
        
    }
}

struct   divisionsOB {
    
    var id : Int = 0
    let divisionName : String
    let image_link : String

    
    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        divisionName = dictionary["divisionName"]  as? String ?? ""
        image_link = dictionary["image_link"]  as? String ?? ""

    }
}





struct   materialsOB {
    
    var id : Int = 0
    let materialName : String
    let image_link : String

    
    
    init(dictionary : Dictionary<String , Any>) {
        
        id = dictionary["id"] as? Int ?? -1
        materialName = dictionary["materialName"]  as? String ?? ""
        image_link = dictionary["image_link"]  as? String ?? ""

    }
}

