//
//  DataClient.swift
//  Naseem
//
//  Created by Dev Anas on 4/4/19.
//  Copyright © 2019 Dev Anas. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataClient: NSObject {
    
    var delegate : NoIntenetConnection!
    class var shared  :  DataClient {
        struct Static{
            static let instance = DataClient();
        }
        return Static.instance
    }
    
    
    
    //Login functions

    class func Userlogin(email : String ,password:Int, success :   @escaping (_ response : ISData)  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        let params = [
            "email" : email,
            "password": password,
            "device_token":12536982455,
            "device":0
            ] as [String : Any]
        ApiClient.sendRequest(path: "login", parameters: params, success: { (response) in
            let dict = response as? NSDictionary ?? [:]

            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""


            if(status){
                
                success(InfoUser(dictionary: dict as! Dictionary<String, Any>).data)
//                                success(dict)
                

                
                
            }else{
                failure(msg)
            }


        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "login..." )
    }
    
    class func  submitPayment(parameters: [String : Any],success :   @escaping (_ response : String)  -> Void , failure :  @escaping (_ err : String) -> Void){
                     
       ApiClient.sendRequest(path: "charge" , parameters: parameters, success: { (response) in
              let dict = response as? NSDictionary ?? [:]
              let status = dict.value(forKey: "status") as? Bool ?? false
              let msg = dict.value(forKey: "message") as? String ?? ""
              
              if (status) {
                  print(status)
               
                    success(msg)
                   
              }else{
                  failure(msg)
                  
              }
          }, failure: { (err) in
              failure(err.errorDescription)
          }, httpMethod: .post, shouldShowProgress: true, progressMsg: "...",isRequireToken: true)
      }

    class func UserRegister(firstName : String , lastName : String , email : String , password : Int  , country : Int ,degree : Int,token: Int, success :   @escaping (_ response : ISData)  -> Void , failure :  @escaping (_ err : String) -> Void){

        let params = [
            "firstName" : firstName ,
            "lastName" : lastName ,
            "email" : email ,
            "gender" : 1 ,
            "device_token" : 125369824 ,
            "password" : password ,
            "country" : country,
            "degree" : degree,
            "agree_on_terms" : 1,
            "device" : "ios"
            

            ] as [String : Any]

        
        
        print("parameter",params)
        ApiClient.sendRequest(path: "register", parameters: params, success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""

            if(status){

                success(InfoUser(dictionary: dict as! Dictionary<String, Any>).data)
                //                                success(dict)
                

            }else{
                failure(msg)
            }

        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "register...")
    }
    
    
    
    class func EditPass(oldPass:String,newPass:String,rePass:String, success :   @escaping (_ response : String)  -> Void , failure :  @escaping (_ err : String) -> Void){
           
           let params = [
               "current_password":oldPass,
               "password":newPass,
               "confirm_password" : rePass
            
               ] as [String : Any]
           
           
           
           
           
           ApiClient.sendRequest(path: "student/update_password", parameters: params, success: { (response) in
               let dict = response as? NSDictionary ?? [:]
               
               let status = dict.value(forKey: "status") as? Bool ?? false
               let msg = dict.value(forKey: "message") as? String ?? ""
               
               
               if(status){
                   
              success(msg)
                   
               }else{
                   failure(msg)
               }
               
               
           }, failure: { (err) in
               failure(err.errorDescription)
           }, httpMethod: .post, shouldShowProgress: true, progressMsg: "Edting...",isRequireToken: true )
       }
       
    //EditProfile
    
    class func EditProgfile(firstName:String,lastName:String,email : String ,country:Int,image:UIImage, success :   @escaping (_ response : ISData)  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        
        let imageName = "img-\(CACurrentMediaTime()).png"

        let params = [
            "firstName":firstName,
            "lastName":lastName,
            "email" : email,
            "country": "\(country)",
            "degree":"1",
            "image":""
            ] as [String : Any]
        
        
        
        
        
        ApiClient.sendRequestWithImage(path: "student/update", success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            
            if(status){
                
                success(InfoUser(dictionary: dict as! Dictionary<String, Any>).data)
                //                                success(dict)
                
                
                
                
            }else{
                failure(msg)
            }
            
            
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "Edting...", Image: image, imageKeyName: "image", fileName: imageName, params: params,isRequireHeader: true )
    }
    
    
    //ShowProfile
    
    class func ShowProgfile( success :   @escaping (_ response : ISData)  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        
        
        
        
        
        
        ApiClient.sendRequest(path: "student", parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            
            if(status){
                
                
                if let value = dict["data"] as? Dictionary<String, AnyObject> {
                          
                    
                    if let value2 = value["general"] as? Dictionary<String, AnyObject> {
                                                
                         success(ISData(dictionary: value2))
                        
                                                   
                                                }
                                
                             }
                
               
                //                                success(dict)
                
                
                
                
            }else{
                failure(msg)
            }
            
            
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Edting...",isRequireToken: true )
    }
    
    
    class func ShowTeacherPro(id:Int,success :   @escaping (_ response : TeacherOB)  -> Void , failure :  @escaping (_ err : String) -> Void){
           
        
        
             let params = [
                        "teacher_id":id
                        ] as [String : Any]
           ApiClient.sendRequest(path: "teacher", parameters: params, success: { (response) in
               let dict = response as? NSDictionary ?? [:]
               
               let status = dict.value(forKey: "status") as? Bool ?? false
               let msg = dict.value(forKey: "message") as? String ?? ""
               
               
               if(status){
                   
                   
                   if let value = dict["data"] as? Dictionary<String, AnyObject> {
                             
                       success(TeacherOB(dictionary: value))

                                   
                                }
                   
                  
                   //                                success(dict)
                   
                   
                   
                   
               }else{
                   failure(msg)
               }
               
               
           }, failure: { (err) in
               failure(err.errorDescription)
           }, httpMethod: .post, shouldShowProgress: true, progressMsg: "Edting...",isRequireToken: false )
       }
    
    
    
    
    
    class func GetCountries(success :   @escaping (_ response : [ContriesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        ApiClient.sendRequest(path: "countries" , parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [ContriesOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for itemDic in value {
                        let item = ContriesOB(dictionary:itemDic)
                        data.append(item)
                    }
                }
                success(data)
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...")
    }
    
    
    class func GetSectionByCountries(Id:Int,success :   @escaping (_ response : [sectionsOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
           
           ApiClient.sendRequest(path: "countries/\(Id)" , parameters: [:], success: { (response) in
               let dict = response as? NSDictionary ?? [:]
               let status = dict.value(forKey: "status") as? Bool ?? false
               let msg = dict.value(forKey: "message") as? String ?? ""
               
               if (status) {
                   print(status)
                   var data: [sectionsOB] = []
                   if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                       
                       for itemDic in value {
                           let item = sectionsOB(dictionary:itemDic)
                           data.append(item)
                       }
                   }
                   success(data)
               }else{
                   failure(msg)
                   
               }
           }, failure: { (err) in
               failure(err.errorDescription)
           }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...")
       }
       
    
    class func GetLevel(success :   @escaping (_ response : [LevelOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        ApiClient.sendRequest(path: "levels" , parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [LevelOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for itemDic in value {
                        let item = LevelOB(dictionary:itemDic)
                        data.append(item)
                    }
                }
                success(data)
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...")
    }
    
    
    
    //GetSlider
    
        class func GetSlider(success :   @escaping (_ response : HomeOB)  -> Void , failure :  @escaping (_ err : String) -> Void){
    
            ApiClient.sendRequest(path: "home", parameters: [:], success: { (response) in
                let dict = response as? NSDictionary ?? [:]
                let status = dict.value(forKey: "status") as? Bool ?? false
                let msg = dict.value(forKey: "message") as? String ?? ""
    
             
                
                    if(status){
                        
                        if let value = dict["data"] as?  Dictionary<String, AnyObject> {
                                           
       
            let item = HomeOB(dictionary:value)
                    success(item)
                                       }
                       
                
                            }else{
                                failure(msg)
                            }
                
                
                
                
            }, failure: { (err) in
                failure(err.errorDescription)
            }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...")
        }
    
    
    
    class func GetSpecialities(id:Int,success :   @escaping (_ response : [specialitiesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        
        
        
        let params = [
                   "section_id":id
                   ] as [String : Any]
       
               ApiClient.sendRequest(path: "section/specialities", parameters: params, success: { (response) in
                   let dict = response as? NSDictionary ?? [:]
                   let status = dict.value(forKey: "status") as? Bool ?? false
                   let msg = dict.value(forKey: "message") as? String ?? ""
       
                
                   
                       if(status){
                           
                var data: [specialitiesOB] = []
                           if let value = dict["data"] as? Dictionary<String, AnyObject>{
                            
                            if let v2 = value["specialities"] as? Array<Dictionary<String, AnyObject>>{
                                for itemDic in v2 {
                                                                 let item = specialitiesOB(dictionary:itemDic)
                                                                 data.append(item)
                                                             }
                                                         }
                                                         success(data)
                            }
                               
                             
                   }else{
                       failure(msg)
                       
                   }
                   
                   
                   
               }, failure: { (err) in
                   failure(err.errorDescription)
               }, httpMethod: .post, shouldShowProgress: true, progressMsg: "Cities...")
           }
    
    
    class func PayNow(id:Int,type:String,success :   @escaping (_ response : String)  -> Void , failure :  @escaping (_ err : String) -> Void){
           
           
           
//           
//           let params = [
//                      "section_id":id
//                      ] as [String : Any]
//          
        ApiClient.sendRequest(path: "buy/\(type)/\(id)", parameters: [:], success: { (response) in
                      let dict = response as? NSDictionary ?? [:]
                      let status = dict.value(forKey: "status") as? Bool ?? false
                      let msg = dict.value(forKey: "message") as? String ?? ""
          
                   
                      
                          if(status){
                              
                
                                  success(msg)

                                
                      }else{
                          failure(msg)
                          
                      }
                      
                      
                      
                  }, failure: { (err) in
                      failure(err.errorDescription)
                  }, httpMethod: .post, shouldShowProgress: true, progressMsg: "Cities...",isRequireToken: true)
              }
       
    

    class func DwonloadFile(id:Int,typeDown:String,type:String,success :   @escaping (_ response : String)  -> Void , failure :  @escaping (_ err : String) -> Void){
               
               
               
    
//               let params = [
//                          "qa_id":id
//                          ] as [String : Any]
//        
//        
//        if type
    
            ApiClient.sendRequest(path: "\(type)/\(typeDown)", parameters: [:], success: { (response) in
                          let dict = response as? NSDictionary ?? [:]
                          let status = dict.value(forKey: "status") as? Bool ?? false
                          let msg = dict.value(forKey: "message") as? String ?? ""
              
                       
                          
                          if(status){
                                  
                                success(msg)
                                    
                          }else{
                              failure(msg)
                              
                          }
                          
                          
                          
                      }, failure: { (err) in
                          failure(err.errorDescription)
                      }, httpMethod: .post, shouldShowProgress: true, progressMsg: "Cities...",isRequireToken: true)
                  }
           
    class func GetSpecialitiesDive(id:Int,success :   @escaping (_ response : specialitiesOB)  -> Void , failure :  @escaping (_ err : String) -> Void){
           
           
           
           
           let params = [
                      "speciality_id":id
                      ] as [String : Any]
          
                  ApiClient.sendRequest(path: "specialities/divisions", parameters: params, success: { (response) in
                      let dict = response as? NSDictionary ?? [:]
                      let status = dict.value(forKey: "status") as? Bool ?? false
                      let msg = dict.value(forKey: "message") as? String ?? ""
          
                   
                      
                          if(status){
                              
                 if let value = dict["data"] as?  Dictionary<String, AnyObject> {
                                                          
                      
                           let item = specialitiesOB(dictionary:value)
                                   success(item)
                                                      }
                                      
                               
                                           }else{
                                               failure(msg)
                                           }
                               
                      
                      
                  }, failure: { (err) in
                      failure(err.errorDescription)
                  }, httpMethod: .post, shouldShowProgress: true, progressMsg: "Cities...")
              }
          
             class func GetMaterials(id:Int,success :   @escaping (_ response : [materialsOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
                 
                 
                 
                 
                 let params = [
                            "division_id":id
                            ] as [String : Any]
                
                        ApiClient.sendRequest(path: "divisions/materials", parameters: params, success: { (response) in
                            let dict = response as? NSDictionary ?? [:]
                            let status = dict.value(forKey: "status") as? Bool ?? false
                            let msg = dict.value(forKey: "message") as? String ?? ""
                
                         
                            
                                if(status){
                                    
                         var data: [materialsOB] = []
                                    if let value = dict["data"] as? Dictionary<String, AnyObject>{
                                     
                                     if let v2 = value["materials"] as? Array<Dictionary<String, AnyObject>>{
                                         for itemDic in v2 {
                                                                          let item = materialsOB(dictionary:itemDic)
                                                                          data.append(item)
                                                                      }
                                                                  }
                                                                  success(data)
                                     }
                                        
                                      
                            }else{
                                failure(msg)
                                
                            }
                            
                            
                            
                        }, failure: { (err) in
                            failure(err.errorDescription)
                        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "Cities...")
                    }
                
       
       
    //GetCienma
    
    class func GetCienma(success :   @escaping (_ response : [CinemaOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        ApiClient.sendRequest(path: "cinemaVideos", parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [CinemaOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for itemDic in value {
                        let item = CinemaOB(dictionary:itemDic)
                        data.append(item)
                    }
                }
                success(data)
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...")
    }
    
    
    class func GetOneCienma(id:Int,success :   @escaping (_ response : CinemaOB)  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        let params = [
                    "cinema_id":id
                                    ] as [String : Any]
                        
        
        ApiClient.sendRequest(path:"cinemaVideo", parameters: params, success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                if let value = dict["data"] as? Dictionary<String, AnyObject> {
               
                    let item = CinemaOB(dictionary:value)
                                    success(item)

                }
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "Cities...",isRequireToken: true)
    }
    
    
    
    //GetCorses
    
    class func GetCorse(materialId:Int,success :   @escaping (_ response : [CoursesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
     
     
                  let params = [
                             "material_id":16
                             ] as [String : Any]
                 
        ApiClient.sendRequest(path: "material/courses" , parameters: params, success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [CoursesOB] = []
                if let value = dict["data"] as? Dictionary<String, AnyObject> {
                    
                 
                 if let v2 = value["courses"] as? Array<Dictionary<String, AnyObject>>{

                         for itemDic in v2 {
                             let item = CoursesOB(dictionary:itemDic)
                             data.append(item)
                         }
                     }
                     success(data)
                 }
                 
                 
                 
                 
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...")
    }

    class func  GetOnlinVid(materialId:Int,success :   @escaping (_ response : [vidoesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
     
     
                  let params = [
                             "material_id":materialId
                             ] as [String : Any]
                 
        ApiClient.sendRequest(path: "material/onlineVideos" , parameters: params, success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [vidoesOB] = []
                if let value = dict["data"] as? Dictionary<String, AnyObject> {
                    
                 
                 if let v2 = value["online_videos"] as? Array<Dictionary<String, AnyObject>>{

                         for itemDic in v2 {
                             let item = vidoesOB(dictionary:itemDic)
                             data.append(item)
                         }
                     }
                     success(data)
                 }
                 
                 
                 
                 
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...")
    }
    
    
    class func  Getsub(success :   @escaping (_ response : SbscribeOB)  -> Void , failure :  @escaping (_ err : String) -> Void){
            
         
         ApiClient.sendRequest(path: "subscriptions" , parameters: [:], success: { (response) in
                let dict = response as? NSDictionary ?? [:]
                let status = dict.value(forKey: "status") as? Bool ?? false
                let msg = dict.value(forKey: "message") as? String ?? ""
                
                if (status) {
                    print(status)
                    if let value = dict["data"] as? Dictionary<String, AnyObject> {
                        
                     
                     let item = SbscribeOB(dictionary:value)
                                     success(item)
                     
                    
                     }
                     
                    
                     
                }else{
                    failure(msg)
                    
                }
            }, failure: { (err) in
                failure(err.errorDescription)
            }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
        }
    
    
    class func  GetStudProfile(success :   @escaping (_ response : StudProOB)  -> Void , failure :  @escaping (_ err : String) -> Void){
             
          
          ApiClient.sendRequest(path: "student" , parameters: [:], success: { (response) in
                 let dict = response as? NSDictionary ?? [:]
                 let status = dict.value(forKey: "status") as? Bool ?? false
                 let msg = dict.value(forKey: "message") as? String ?? ""
                 
                 if (status) {
                     print(status)
                     if let value = dict["data"] as? Dictionary<String, AnyObject> {
                         
                      
                      let item = StudProOB(dictionary:value)
                                      success(item)
                      
                     
                      }
                      
                     
                      
                 }else{
                     failure(msg)
                     
                 }
             }, failure: { (err) in
                 failure(err.errorDescription)
             }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
         }
    
    
    class func  GetTeachers(country_id:Int,speciality_id:Int,material_id:Int,section_id:Int,rateId:Int,success :   @escaping (_ response : [TeacherOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
                
             
        
               let params = [ "country_id":country_id,
                              "material_id":material_id,
                              "speciality_id":speciality_id,
                              "section_id":section_id,
                              "rate":rateId,
                              
                                            ] as [String : Any]
                                
             ApiClient.sendRequest(path: "teachers" , parameters: params, success: { (response) in
                    let dict = response as? NSDictionary ?? [:]
                    let status = dict.value(forKey: "status") as? Bool ?? false
                    let msg = dict.value(forKey: "message") as? String ?? ""
                    
                    if (status) {
                        print(status)
                     
                        
                        var data: [TeacherOB] = []
                                     if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                                         
                                         for itemDic in value {
                                             let item = TeacherOB(dictionary:itemDic)
                                             data.append(item)
                                         }
                                     }
                                     success(data)
                        
                         
                    }else{
                        failure(msg)
                        
                    }
                }, failure: { (err) in
                    failure(err.errorDescription)
                }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
            }
      
    
    class func  GetOneTeacher(Id:Int,success :   @escaping (_ response : TeacherOB)  -> Void , failure :  @escaping (_ err : String) -> Void){
              
           
        
        let params = [ "teacher_id":Id
                                     ] as [String : Any]
                         
           ApiClient.sendRequest(path: "teacher" , parameters: params, success: { (response) in
                  let dict = response as? NSDictionary ?? [:]
                  let status = dict.value(forKey: "status") as? Bool ?? false
                  let msg = dict.value(forKey: "message") as? String ?? ""
                  
                  if (status) {
                      print(status)
                   
                    
                    if let value = dict["data"] as? Dictionary<String, AnyObject> {
                                        
                                     
                                     let item = TeacherOB(dictionary:value)
                                                     success(item)
                                     
                                    
                                     }
                       
                  }else{
                      failure(msg)
                      
                  }
              }, failure: { (err) in
                  failure(err.errorDescription)
              }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
          }
    
    
    class func  FollowTeach(Id:Int,success :   @escaping (_ response : String)  -> Void , failure :  @escaping (_ err : String) -> Void){
          
       
    
    let params = [ "teacher_id":Id
                                 ] as [String : Any]
                     
       ApiClient.sendRequest(path: "teacher/like" , parameters: params, success: { (response) in
              let dict = response as? NSDictionary ?? [:]
              let status = dict.value(forKey: "status") as? Bool ?? false
              let msg = dict.value(forKey: "message") as? String ?? ""
              
              if (status) {
                  print(status)
               
           success(msg)
                   
              }else{
                  failure(msg)
                  
              }
          }, failure: { (err) in
              failure(err.errorDescription)
          }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
      }
    
    class func  GetFave(success :   @escaping (_ response : FaveOB)  -> Void , failure :  @escaping (_ err : String) -> Void){
           
        
        ApiClient.sendRequest(path: "favoraite" , parameters: [:], success: { (response) in
               let dict = response as? NSDictionary ?? [:]
               let status = dict.value(forKey: "status") as? Bool ?? false
               let msg = dict.value(forKey: "message") as? String ?? ""
               
               if (status) {
                   print(status)
                   if let value = dict["data"] as? Dictionary<String, AnyObject> {
                       
                    
                    let item = FaveOB(dictionary:value)
                                    success(item)
                    
                   
                    }
                    
                   
                    
               }else{
                   failure(msg)
                   
               }
           }, failure: { (err) in
               failure(err.errorDescription)
           }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
       }
    
  class func  GetNotes(materialId:Int,success :   @escaping (_ response : [NotesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
         
      
      
                   let params = [
                              "material_id":materialId
                              ] as [String : Any]
                  
         ApiClient.sendRequest(path: "material/notes" , parameters: params, success: { (response) in
             let dict = response as? NSDictionary ?? [:]
             let status = dict.value(forKey: "status") as? Bool ?? false
             let msg = dict.value(forKey: "message") as? String ?? ""
             
             if (status) {
                 print(status)
                 var data: [NotesOB] = []
                 if let value = dict["data"] as? Dictionary<String, AnyObject> {
                     
                  
                  if let v2 = value["notes"] as? Array<Dictionary<String, AnyObject>>{

                          for itemDic in v2 {
                              let item = NotesOB(dictionary:itemDic)
                              data.append(item)
                          }
                      }
                      success(data)
                  }
                  
                  
                  
                  
             }else{
                 failure(msg)
                 
             }
         }, failure: { (err) in
             failure(err.errorDescription)
         }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...")
     }
     
      

 class func  GetQA(materialId:Int,success :   @escaping (_ response : [quetionsOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
     
     
                  let params = [
                             "material_id":materialId
                             ] as [String : Any]
                 
        ApiClient.sendRequest(path: "material/qas" , parameters: params, success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [quetionsOB] = []
                if let value = dict["data"] as? Dictionary<String, AnyObject> {
                    
                 
                 if let v2 = value["qas"] as? Array<Dictionary<String, AnyObject>>{

                         for itemDic in v2 {
                             let item = quetionsOB(dictionary:itemDic)
                             data.append(item)
                         }
                     }
                     success(data)
                 }
                 
                 
                 
                 
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...")
    }
    
      
    class func GetCoreses(materialId:Int,success :   @escaping (_ response : [CoursesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        
        let params = ["material_id":materialId
                                       ] as [String : Any]
                           
        ApiClient.sendRequest(path: "/material/courses", parameters: params, success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [CoursesOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for itemDic in value {
                        let item = CoursesOB(dictionary:itemDic)
                        data.append(item)
                    }
                }
                success(data)
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "Cities...")
    }
    
    
    //GetTeacher
    class func GetTeacher(success :   @escaping (_ response : [TeacherOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        ApiClient.sendRequest(path: "teachers", parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [TeacherOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for itemDic in value {
                        let item = TeacherOB(dictionary:itemDic)
                        data.append(item)
                    }
                }
                success(data)
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...")
    }
    
    
    class func GetSubQa(success :   @escaping (_ response : [quetionsOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
     
     ApiClient.sendRequest(path: "qasSubscription" , parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [quetionsOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                 
                 
                    for itemDic in value {
                    let item = quetionsOB(dictionary:itemDic)
                    data.append(item)
                 
               
                     }
                     success(data)
                 }
                 
                 
                 
                 
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
    }
    
    
    class func GetSubNote(success :   @escaping (_ response : [NotesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
     
     ApiClient.sendRequest(path: "notesSubscription" , parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [NotesOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                 
                 
                    for itemDic in value {
                    let item = NotesOB(dictionary:itemDic)
                    data.append(item)
                 
               
                     }
                     success(data)
                 }
                 
                 
                 
                 
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
    }
    
    
    class func GetSubOnline(success :   @escaping (_ response : [vidoesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
     
     ApiClient.sendRequest(path: "onlineVideosSubscription" , parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [vidoesOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                 
                 
                    for itemDic in value {
                    let item = vidoesOB(dictionary:itemDic)
                    data.append(item)
                 
               
                     }
                     success(data)
                 }
                 
                 
                 
                 
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
    }
    
    
    
    
    
    
    
    class func GetSubCorse(success :   @escaping (_ response : [CoursesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
     
     ApiClient.sendRequest(path: "coursesSubscription" , parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [CoursesOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                 
                 
                    for itemDic in value {
                    let item = CoursesOB(dictionary:itemDic)
                    data.append(item)
                 
               
                     }
                     success(data)
                 }
                 
                 
                 
                 
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
    }
    
    
    class func GetCorseVideo(id:Int,success :   @escaping (_ response : [vidoesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        
        let params = [   "course_id":id
                                    ] as [String : Any]
                        
           
        
        ApiClient.sendRequest(path: "course/videos" , parameters: params, success: { (response) in
               let dict = response as? NSDictionary ?? [:]
               let status = dict.value(forKey: "status") as? Bool ?? false
               let msg = dict.value(forKey: "message") as? String ?? ""
               
               if (status) {
                   print(status)
                   var data: [vidoesOB] = []
                   if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    
                       for itemDic in value {
                       let item = vidoesOB(dictionary:itemDic)
                       data.append(item)
                    
                  
                        }
                        success(data)
                    }
                    
                    
                    
                    
               }else{
                   failure(msg)
                   
               }
           }, failure: { (err) in
               failure(err.errorDescription)
           }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
       }
    
    
    class func GetCorseQA(id:Int,success :   @escaping (_ response : [quetionsOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
              
        
        let params = [   "course_id":id
        ] as [String : Any]
           
           ApiClient.sendRequest(path: "course/qas" , parameters: params, success: { (response) in
                  let dict = response as? NSDictionary ?? [:]
                  let status = dict.value(forKey: "status") as? Bool ?? false
                  let msg = dict.value(forKey: "message") as? String ?? ""
                  
                  if (status) {
                      print(status)
                      var data: [quetionsOB] = []
                      if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                       
                       
                          for itemDic in value {
                          let item = quetionsOB(dictionary:itemDic)
                          data.append(item)
                       
                     
                           }
                           success(data)
                       }
                       
                       
                       
                       
                  }else{
                      failure(msg)
                      
                  }
              }, failure: { (err) in
                  failure(err.errorDescription)
              }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
          }
       
    class func GetCorseNote(id:Int,success :   @escaping (_ response : [NotesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        let params = ["course_id":id
        ] as [String : Any]
     
     ApiClient.sendRequest(path: "course/notes" , parameters: params, success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [NotesOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                 
                 
                    for itemDic in value {
                    let item = NotesOB(dictionary:itemDic)
                    data.append(item)
                 
               
                     }
                     success(data)
                 }
                 
                 
                 
                 
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
    }
    
    
    
    class func GetCorseOnline(id:Int,success :   @escaping (_ response : [CoursesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        
        let params = ["course_id":id
        ] as [String : Any]
     
     ApiClient.sendRequest(path: "course/onlineVideos" , parameters: params, success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [CoursesOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                 
                 
                    for itemDic in value {
                    let item = CoursesOB(dictionary:itemDic)
                    data.append(item)
                 
               
                     }
                     success(data)
                 }
                 
                 
                 
                 
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
    }
    
    
    
    
    class func GetSubVideos(success :   @escaping (_ response : [vidoesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
           
        
        ApiClient.sendRequest(path: "videosSubscription" , parameters: [:], success: { (response) in
               let dict = response as? NSDictionary ?? [:]
               let status = dict.value(forKey: "status") as? Bool ?? false
               let msg = dict.value(forKey: "message") as? String ?? ""
               
               if (status) {
                   print(status)
                   var data: [vidoesOB] = []
                   if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    
                       for itemDic in value {
                       let item = vidoesOB(dictionary:itemDic)
                       data.append(item)
                    
                  
                        }
                        success(data)
                    }
                    
                    
                    
                    
               }else{
                   failure(msg)
                   
               }
           }, failure: { (err) in
               failure(err.errorDescription)
           }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
       }
    
    
    class func GetCinemaVideos(country_id:Int,material_id:Int,speciality_id:Int,section_id:Int,teacher_id:Int,success :   @escaping (_ response : [CinemaOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
             
        let params = [ "country_id":country_id,
                                    "material_id":material_id,
                                    "speciality_id":speciality_id,
                                    "section_id":section_id,
                                    "teacher_id":teacher_id,
                                    
                                                  ] as [String : Any]
                                      
          
          
        ApiClient.sendRequest(path: "cinemaVideos" , parameters: params, success: { (response) in
                 let dict = response as? NSDictionary ?? [:]
                 let status = dict.value(forKey: "status") as? Bool ?? false
                 let msg = dict.value(forKey: "message") as? String ?? ""
                 
                 if (status) {
                     print(status)
                     var data: [CinemaOB] = []
                     if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                         
                      for itemDic in value {
                          let item = CinemaOB(dictionary:itemDic)
                          data.append(item)
                      }

                    
                          
                          success(data)
                      }
                      
                      
                      
                      
                 }else{
                     failure(msg)
                     
                 }
             }, failure: { (err) in
                 failure(err.errorDescription)
             }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
         }
    class func GetVideos(materialId:Int,success :   @escaping (_ response : [vidoesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
           
        
        
                     let params = [
                                "material_id":materialId
                                ] as [String : Any]
                    
           ApiClient.sendRequest(path: "material/videos" , parameters: params, success: { (response) in
               let dict = response as? NSDictionary ?? [:]
               let status = dict.value(forKey: "status") as? Bool ?? false
               let msg = dict.value(forKey: "message") as? String ?? ""
               
               if (status) {
                   print(status)
                   var data: [vidoesOB] = []
                   if let value = dict["data"] as? Dictionary<String, AnyObject> {
                       
                    
                    if let v2 = value["videos"] as? Array<Dictionary<String, AnyObject>>{

                            for itemDic in v2 {
                                let item = vidoesOB(dictionary:itemDic)
                                data.append(item)
                            }
                        }
                        success(data)
                    }
                    
                    
                    
                    
               }else{
                   failure(msg)
                   
               }
           }, failure: { (err) in
               failure(err.errorDescription)
           }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...")
       }
       
    
    class func GetOneVideos(vidId:Int,corseId:Int,success :   @escaping (_ response : [vidoesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
              
           
           
                        let params = [
                                   "video_id":vidId
                                   ] as [String : Any]
                       
              ApiClient.sendRequest(path: "video" , parameters: params, success: { (response) in
                  let dict = response as? NSDictionary ?? [:]
                  let status = dict.value(forKey: "status") as? Bool ?? false
                  let msg = dict.value(forKey: "message") as? String ?? ""
                  
                  if (status) {
                      print(status)
                      var data: [vidoesOB] = []
                      if let value = dict["data"] as? Dictionary<String, AnyObject> {
                          
                       
                       if let v2 = value["videos"] as? Array<Dictionary<String, AnyObject>>{

                               for itemDic in v2 {
                                   let item = vidoesOB(dictionary:itemDic)
                                   data.append(item)
                               }
                           }
                           success(data)
                       }
                       
                       
                       
                       
                  }else{
                      failure(msg)
                      
                  }
              }, failure: { (err) in
                  failure(err.errorDescription)
              }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
          }
    class func GetOnlineVideos(vidId:Int,success :   @escaping (_ response : vidoesOB)  -> Void , failure :  @escaping (_ err : String) -> Void){
        
     
     
                  let params = [
                             "onlineVideo_id":vidId
                             ] as [String : Any]
                 
        ApiClient.sendRequest(path: "onlineVideo" , parameters: params, success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                if let value = dict["data"] as? Dictionary<String, AnyObject> {
                       let item = vidoesOB(dictionary:value)
                 success(item)

                
                 }
                 
                 
                 
                 
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "settings...",isRequireToken: true)
    }
          
    
    class func GetTeacherVideo(Id:Int,type:String,success :   @escaping (_ response : [TeacherVideosOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        ApiClient.sendRequest(path: "\(type)/\(Id)/videos", parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [TeacherVideosOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for itemDic in value {
                        let item = TeacherVideosOB(dictionary:itemDic)
                        data.append(item)
                    }
                }
                success(data)
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...")
    }
    
    class func GetTeacherNotes(Id:Int,type:String,success :   @escaping (_ response : [NotesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        ApiClient.sendRequest(path: "\(type)/\(Id)/notes", parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [NotesOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for itemDic in value {
                        let item = NotesOB(dictionary:itemDic)
                        data.append(item)
                    }
                }
                success(data)
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...")
    }
    
    
    
    class func GetTeacherQu(Id:Int,type:String ,success :   @escaping (_ response : [quetionsOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        ApiClient.sendRequest(path: "\(type)/\(Id)/qas", parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [quetionsOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for itemDic in value {
                        let item = quetionsOB(dictionary:itemDic)
                        data.append(item)
                    }
                }
                success(data)
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...")
    }
    
    
    class func GetCorseQs(Id:Int,success :   @escaping (_ response : [quetionsOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        ApiClient.sendRequest(path: "teacher/\(Id)/qas", parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [quetionsOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for itemDic in value {
                        let item = quetionsOB(dictionary:itemDic)
                        data.append(item)
                    }
                }
                success(data)
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...")
    }
    
    
    
    class func GetTeacherCourse(Id:Int,type:String,success :   @escaping (_ response : [CoursesOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
        
        ApiClient.sendRequest(path: "\(type)/\(Id)/onlineVideos", parameters: [:], success: { (response) in
            let dict = response as? NSDictionary ?? [:]
            let status = dict.value(forKey: "status") as? Bool ?? false
            let msg = dict.value(forKey: "message") as? String ?? ""
            
            if (status) {
                print(status)
                var data: [CoursesOB] = []
                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for itemDic in value {
                        let item = CoursesOB(dictionary:itemDic)
                        data.append(item)
                    }
                }
                success(data)
            }else{
                failure(msg)
                
            }
        }, failure: { (err) in
            failure(err.errorDescription)
        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...")
    }
    
    
//    class func ِAddChalet(vendor_name : String , owner_name : String , phone : Int , location : String  , image : String , success :   @escaping (_ response : Any)  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        let params = [
//            "vendor_name" : vendor_name ,
//            "owner_name" : owner_name ,
//            "phone" : phone ,
//            "location" : location ,
//            "image" : image
//
//            ] as [String : Any]
//
//        ApiClient.sendRequest(path: "add_request_chalet", parameters: params, success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if(status){
//
//                success(User_Register(dictionary: dict as! Dictionary<String, Any>))
//
//                success(dict)
//
//            }else{
//                failure(msg)
//            }
//
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "register...")
//    }
    
    
    
//    class func Activate(activation_code : String , ios_token : String , success :   @escaping (_ response : Any)  -> Void , failure :  @escaping (_ err : String) -> Void){
//        let params = [
//            "activation_code" : activation_code ,
//            "ios_token" : ios_token
//        ]
//
//        ApiClient.sendRequest(path: "user_activate", parameters: params , success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//            let token = dict.value(forKey: "access_token") as? String ?? ""
//
//            UserDefaults.standard.set(token, forKey: "userToken")
//
//
//
//
//
//            if (status) {
//                success(User_Activate(dictionary: dict as! Dictionary<String, Any>))
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "Adding...")
//    }
//
//    class func uploadImg(selectedImg : UIImage , success :   @escaping (_ response : Any)  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        let imageName = "img-\(CACurrentMediaTime()).png"
//
//        let paramss = [
//            "file" : imageName
//
//            ] as [String : Any]
//
//        ApiClient.sendRequestWithImage(path: "avatar/upload", success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "filename") as? String ?? ""
//
//
//            if (status) {
//                success(dict)
//
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//
//        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "T##String?", Image: selectedImg, imageKeyName: "img", fileName: imageName, params: paramss, isRequireHeader: false)
//    }
//    class func CitiesWithChalet(success :   @escaping (_ response : [Data_Cities_With_Chalet])  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "cities_with_chalet", parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                var data: [Data_Cities_With_Chalet] = []
//                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
//
//                    for itemDic in value {
//                        let item = Data_Cities_With_Chalet(dictionary:itemDic)
//                        data.append(item)
//                    }
//                }
//                success(data)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "")
//    }
//
//
//
//    class func GetMyRev(state:Int,success :   @escaping (_ response : [MyReservationOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//
//        ApiClient.sendRequest(path: "get_order", parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                var data: [MyReservationOB] = []
//                if let value = dict["data"] as? [Array<Dictionary<String, AnyObject>>] {
//
////                    let value2 = value as? Array<Dictionary<String, AnyObject>>
//
//                   print(value)
//                    data.removeAll()
//                    for itemDic in value[state] {
//                        let item = MyReservationOB(dictionary:itemDic)
//                        data.append(item)
//                    }
//                }
//                success(data)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "",isRequireToken: true)
//    }
//
//
//    class func MapChalet(success :   @escaping (_ response : [Data_AllChaletOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "map_chalet", parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                var data: [Data_AllChaletOB] = []
//                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
//
//                    for itemDic in value {
//                        let item = Data_AllChaletOB(dictionary:itemDic)
//                        data.append(item)
//                    }
//                }
//                success(data)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...")
//    }
//
//    class func Chalet(id: Int,success :   @escaping (_ response : Data_Chalet)  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "chalet/\(id)" , parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                success(InfoChalet(dictionary: dict as! Dictionary<String, Any>).data)
//                //success(dict)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Chalets...")
//    }
//
//    class func userData(success :   @escaping (_ response : DataProfile)  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//
//        ApiClient.sendRequest(path: "user_profile", parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                success(InfoUser(dictionary: dict as! Dictionary<String, Any>).data)
//                //success(dict)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "", isRequireToken: true)
//
//
//    }
//    class func UpdateuserData(first_name:String,lastName:String,success :   @escaping (_ response : DataProfile)  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//
//        let params = [
//            "first_name" : first_name ,
//            "last_name" : lastName
//        ]
//
//        ApiClient.sendRequest(path: "user_update_profile", parameters: params, success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                success(InfoUser(dictionary: dict as! Dictionary<String, Any>).data)
//                //success(dict)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "", isRequireToken: true)
//
//
//    }
//
//    class func revChalet(vendor_id:Int,date:String,time:Int,type:Int,number_of_people:Int,price:Int,success :   @escaping (_ response : chaletRevDatesOB)  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//
//        let params = [
//            "vendor_id" : vendor_id ,
//            "date" : date,
//            "time" : time,
//            "type" : type,
//            "number_of_people" : number_of_people,
//            "price" : price
//
//            ] as [String : Any]
//
//        ApiClient.sendRequest(path: "order", parameters: params, success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            PobViewREsult3.msg = msg
//            if (status) {
//                print(status)
//
//                print(status)
//                success(RevOB(dictionary: dict as! Dictionary<String, Any>).data)            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "", isRequireToken: true)
//
//
//    }
//
//
//    class func ChaletArea(success :   @escaping (_ response : [Data_Chaelt_Area])  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "areas_by_city" , parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                var data: [Data_Chaelt_Area] = []
//                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
//
//                    for itemDic in value {
//                        let item = Data_Chaelt_Area(dictionary:itemDic)
//                        data.append(item)
//                    }
//                }
//                success(data)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "")
//    }
//
//
//
//    class func Fetuers(success :   @escaping (_ response : characteristicsOB)  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "characteristics" , parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                success(InfoCharacter(dictionary: dict as! Dictionary<String, Any>).data)
//                //success(dict)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "")
//    }
//
//
//
//
//
//
//
//
//
//
//    class func Cities(id: Int,success :   @escaping (_ response : Data_Cities_With_Chalet)  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "cities/\(id)" , parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                success(InfoChaletCites(dictionary: dict as! Dictionary<String, Any>).data)
//                //success(dict)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Chalets...")
//    }
//
 
//
//    class func NotifcationApi(success :   @escaping (_ response : [NotifcationOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "notifications", parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                var data: [NotifcationOB] = []
//                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
//
//                    for itemDic in value {
//                        let item = NotifcationOB(dictionary:itemDic)
//                        data.append(item)
//                    }
//                }
//                success(data)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...",isRequireToken: true)
//    }
//
//
//
//    class func getDayPrice(id:Int,dateStr: String,success :   @escaping (_ response : [Day_PriceOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "days_price/\(id)/\(dateStr)", parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                var data: [Day_PriceOB] = []
//                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
//
//                    for itemDic in value {
//                        let item = Day_PriceOB(dictionary:itemDic)
//                        data.append(item)
//                    }
//                }
//                success(data)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...",isRequireToken: true)
//    }
//
//
//
//
//    class func FilterData(dateStr:String,areaId:Int,priceOf:Int,priceTo:Int,rate:Int,fetuers: [Int],success :   @escaping (_ response : [ChaletOB])  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//
//        var jsonString = "";
//
//        do {
//
//            let jsonData = try JSONSerialization.data(withJSONObject: fetuers, options: .prettyPrinted)
//            jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
//
//        } catch {
//            print(error.localizedDescription)
//        }
//
//        let params = [
//            "date" : dateStr ,
//            "area_id" : areaId ,
//            "price_of" : priceOf ,
//            "price_to" : priceTo ,
//            "rate" : rate,
//            "characteristics" : jsonString
//
//
//            ] as [String : Any]
//
//        print("para",params)
//        ApiClient.sendRequest(path: "filter_chalet" , parameters: params, success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                var data: [ChaletOB] = []
//                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
//
//                    for itemDic in value {
//                        let item = ChaletOB(dictionary:itemDic)
//                        data.append(item)
//                    }
//                }
//                success(data)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .post, shouldShowProgress: true, progressMsg: "filter...")
//    }
//
//    func toJSonString(data : Any) -> String {
//
//        var jsonString = "";
//
//        do {
//
//            let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
//            jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
//
//        } catch {
//            print(error.localizedDescription)
//        }
//
//        return jsonString;
//    }
//
//
//
//
//
//       class func getDates(id: Int,success :   @escaping (_ response : RevDates)  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "order_chalet/\(id)", parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//
////                let value = dict["data"] as! Dictionary<String, Any>
//                var data : RevDates!
//
//                if ((dict as? Dictionary<String, AnyObject>) != nil) {
//
//                    if let value =  dict["data"] as? Dictionary<String, AnyObject> {
//                        data = RevDates(dictionary: value)
//                    }
//                    if data != nil {
//                        success(data)
//
//                    }
////                    success(InfoRevDataa(dictionary: dict as! Dictionary<String, AnyObject>).data)
//
//                }
//                //success(dict)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...",isRequireToken: false)
//    }
//
//    class func aboutApp(success :   @escaping (_ response : [PageData])  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "pages", parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                var data: [PageData] = []
//                if let value = dict["data"] as? Array<Dictionary<String, AnyObject>> {
//
//                    for itemDic in value {
//                        let item = PageData(dictionary:itemDic)
//                        data.append(item)
//                    }
//                }
//                success(data)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "Cities...",isRequireToken: false)
//    }
//
//    class func Page(success :   @escaping (_ response : Any)  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "pages" , parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                success(Pages(dictionary: dict as! Dictionary<String, Any>).data)
//                //success(dict)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "pages...")
//    }
//
//    class func Settings(success :   @escaping (_ response : Any)  -> Void , failure :  @escaping (_ err : String) -> Void){
//
//        ApiClient.sendRequest(path: "settings" , parameters: [:], success: { (response) in
//            let dict = response as? NSDictionary ?? [:]
//            let status = dict.value(forKey: "status") as? Bool ?? false
//            let msg = dict.value(forKey: "message") as? String ?? ""
//
//            if (status) {
//                print(status)
//                success(Setting(dictionary: dict as! Dictionary<String, Any>).data)
//                //success(dict)
//            }else{
//                failure(msg)
//
//            }
//        }, failure: { (err) in
//            failure(err.errorDescription)
//        }, httpMethod: .get, shouldShowProgress: true, progressMsg: "settings...")
//    }

}

protocol NoIntenetConnection {
    func onInernetConnectInterrupt()
    func onInvalidLogin()
}
