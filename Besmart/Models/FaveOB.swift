//
//  FaveOB.swift
//  Besmart
//
//  Created by mac on 2/13/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import Foundation

  struct   FaveOB {
 var favVideo:Array<vidoesOB>  = []
var favNote:Array<NotesOB>  = []
var favCorse:Array<CoursesOB>  = []
var faveOnline:Array<vidoesOB>  = []
var faveQa:Array<quetionsOB>  = []

  
  
  init(dictionary : Dictionary<String , Any>) {
      
      
      if let value = dictionary["videos"] as? Array<Dictionary<String, AnyObject>>{
                            
                       favVideo.removeAll()
                       
                            for itemDic in value {
                    let item = vidoesOB(dictionary:itemDic)
                               favVideo.append(item)
                                                }
                        }
    
    
    if let value = dictionary["notes"] as? Array<Dictionary<String, AnyObject>>{
                               
                          favNote.removeAll()
                          
                               for itemDic in value {
                       let item = NotesOB(dictionary:itemDic)
                                  favNote.append(item)
                                                   }
                           }
    
    
    
    if let value = dictionary["qas"] as? Array<Dictionary<String, AnyObject>>{
                               
                          faveQa.removeAll()
                          
                               for itemDic in value {
                       let item = quetionsOB(dictionary:itemDic)
                                  faveQa.append(item)
                                                   }
                           }
    
    
    if let value = dictionary["onlineVideos"] as? Array<Dictionary<String, AnyObject>>{
                               
                          faveOnline.removeAll()
                          
                               for itemDic in value {
                       let item = vidoesOB(dictionary:itemDic)
                                  faveOnline.append(item)
                                                   }
                           }
    
    if let value = dictionary["courses"] as? Array<Dictionary<String, AnyObject>>{
                               
                          favCorse.removeAll()
                          
                               for itemDic in value {
                       let item = CoursesOB(dictionary:itemDic)
                                  favCorse.append(item)
                                                   }
                           }
    
    
      
      
      
      
  }

}



  struct   SbscribeOB {

    
    var videos:Int?
        var courses:Int?
    var notes:Int?
    var qas:Int?
    var onlineVideos:Int?


  
  
  init(dictionary : Dictionary<String , Any>) {
      
      
        courses = dictionary["courses"] as? Int ?? -1
        videos = dictionary["videos"] as? Int ?? -1
        notes = dictionary["notes"] as? Int ?? -1
        qas = dictionary["qas"] as? Int ?? -1
    onlineVideos = dictionary["onlineVideos"] as? Int ?? -1


}
}



/////////Student////
  struct   StudProOB {

    
    var genarll:genarlOB!
    var wallet:stWalletOB!

  var followTeachArry:Array<followTeacherOB>  = []

  init(dictionary : Dictionary<String , Any>) {
      
    
    if let value = dictionary["general"] as? Dictionary<String, AnyObject>{
                                  
                             let item = genarlOB(dictionary:value)

        genarll = item
        
        
        
                              }
    
    
    if let value = dictionary["student_wallet"] as? Dictionary<String, AnyObject>{
                                  
                             let item = stWalletOB(dictionary:value)

        wallet = item
        
        
        
                              }
    
    
    if let value = dictionary["follow_teachers"] as? Array<Dictionary<String, AnyObject>>{
                                
                           followTeachArry.removeAll()
                           
                                for itemDic in value {
                        let item = followTeacherOB(dictionary:itemDic)
                                   followTeachArry.append(item)
                                                    }
                            }


      
      
      
  }

}




 struct   followTeacherOB {

    
    var id:Int?
        var lastName:String?
    var firstName:String?
    var country_name:String?
    var speciality_name:String?
    var is_favoraite:Bool?
    var image_link:String?
    var teacher_rating:Double?


  
  
  init(dictionary : Dictionary<String , Any>) {
      
      
        id = dictionary["id"] as? Int ?? -1
        lastName = dictionary["lastName"] as? String ?? ""
    firstName = dictionary["firstName"] as? String ?? ""
    speciality_name = dictionary["speciality_name"] as? String ?? ""
    is_favoraite = dictionary["is_favoraite"] as? Bool ?? false

        image_link = dictionary["image_link"] as? String ??  ""
    teacher_rating = dictionary["teacher_rating"] as? Double ?? 0.0


}
}

 struct   purchasedItemsOB {

    
    var id:Int?
        var lessonName:String?
    var courseName:String?
    var noteName:String?

    var price:String?
    var capon:String?
    var created_at:String?
    var is_purchased:Bool?
    var type:String?


  
  
  init(dictionary : Dictionary<String , Any>) {
      
      
        id = dictionary["id"] as? Int ?? -1
        price = dictionary["price"] as? String ?? ""
    capon = dictionary["capon"] as? String ?? ""
    created_at = dictionary["created_at"] as? String ?? ""
    is_purchased = dictionary["price"] as? Bool ?? false

        type = dictionary["type"] as? String ??  ""
     lessonName = dictionary["lessonName"] as? String ??  ""
    
    noteName = dictionary["noteName"] as? String ??  ""
    courseName = dictionary["courseName"] as? String ??  ""



}
}



 struct   genarlOB {

    
       var id:Int?
         var lastName:String?
     var firstName:String?
     var degree_name:String?
     var image_link:String?
     var agree_on_terms:String?


  
  
  init(dictionary : Dictionary<String , Any>) {
      
      
        id = dictionary["id"] as? Int ?? -1
        lastName = dictionary["lastName"] as? String ?? ""
    degree_name = dictionary["degree_name"] as? String ?? ""
    firstName = dictionary["firstName"] as? String ?? ""
    image_link = dictionary["image_link"] as? String ?? ""

        agree_on_terms = dictionary["agree_on_terms"] as? String ??  ""
     

}
}



 struct   stWalletOB {

    var points:String?
  
    
    var items:Array<purchasedItemsOB>  = []

  
  
  init(dictionary : Dictionary<String , Any>) {
      
      
    if let value = dictionary["purchased_items"] as? Array<Dictionary<String, AnyObject>>{
                               
                          items.removeAll()
                          
                               for itemDic in value {
                       let item = purchasedItemsOB(dictionary:itemDic)
                                  items.append(item)
                                                   }
                           }
    
    
    
    
        points = dictionary["points"] as? String ?? ""
  

}
}
