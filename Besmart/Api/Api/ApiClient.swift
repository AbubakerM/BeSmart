

 import UIKit


 import Alamofire
 class ApiClient: NSObject {
    
    class func sendRequest(path : String , parameters : Dictionary<String , Any> , success : @escaping ( _ respone : Any) -> Void, failure : @escaping ( _ error : LError) -> Void  , httpMethod: HTTPMethod ,  shouldShowProgress : Bool = false, progressMsg : String? , isRequireToken :  Bool = false){
        //url of the request
        let requestPath = SessionManager.sharedManger.apiPath + path
        //show dialog progress
        if(shouldShowProgress){
             ActivityIndicatorManager.start(progressMsg!);
        }
        
        
       //Content-Type "application/x-www-form-urlencoded"
       //Authorization "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjU2LCJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3VzZXJfbG9naW4iLCJpYXQiOjE1NTI5NDYzOTcsImV4cCI6MTU1NDE1NTk5NywibmJmIjoxNTUyOTQ2Mzk3LCJqdGkiOiJUYVRlNVFDbFFxeENMSHl3In0.bzUEsePf43djXl2M3JucN7U0bKc_xoRO88_Cl36fq1g"
        
        var headers : [String : String] = [:]

        
        let token = UserDefaults.standard.object(forKey: "userToken") as? String
        
        
        
        if isRequireToken {
            headers["Authorization"] = "Bearer \(ISConstant.userToken ?? "")"
        }
        
      
        //fire the request
        
        
        Alamofire.request(requestPath, method: httpMethod ,  parameters: parameters, encoding: URLEncoding.default, headers:headers).responseJSON { (response) in
            
            print("request fired")
            debugPrint("request: \(response.request!)")
            debugPrint("params: \(parameters)")
            debugPrint("headeer: \(headers)")
            debugPrint("Response Recieved : \(Date())")
             debugPrint("response: \(String(describing: response.result.value))")
            print("\(response.result.error)")
            if(shouldShowProgress){
                ActivityIndicatorManager.stop();
            }
            //handle the response
            
            handleRequestResponse(response: response, success: success, failure: failure )
        }
        
    }
    
        class func sendRequestWithImage(path : String  , success : @escaping ( _ respone : Any) -> Void, failure : @escaping ( _ error : LError) -> Void ,httpMethod: HTTPMethod , shouldShowProgress : Bool = false, progressMsg : String? , Image : UIImage? , imageKeyName : String , fileName : String, params  : Dictionary<String ,  Any> = [:] , isRequireHeader  : Bool = true){
            let requestPath = "https://besmartapp.com/api/student/update"
            if(shouldShowProgress){
                 ActivityIndicatorManager.start(progressMsg!);
            }
    
    
            var headers : [String : String] = [:]
    
            if(isRequireHeader){
             headers["Authorization"] = "Bearer \(ISConstant.userToken!)"
            }
            Alamofire.upload(multipartFormData: { (multipartFormData) in
    
                let imageData = Image!.jpegData(compressionQuality: 0.50)

                if let images = Image {
              
                    multipartFormData.append(imageData!, withName: "image", fileName: "swift_file.png", mimeType: "image/png")

                    
                }else{
                    multipartFormData.append("".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: "ss")
                }
                for (key , value) in params {
    
                    multipartFormData.append((value as! String).data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: key )
                }
            }, usingThreshold:UInt64.init(), to: "https://besmartapp.com/api/student/update", method: .post, headers: headers, encodingCompletion: { (result) in
                if(shouldShowProgress){
                    ActivityIndicatorManager.start()
    
                }
    
                switch result {
                case .success(let upload, _, _):
    
                    upload.uploadProgress(closure: { (progress) in
                        //Print progress
                        print(progress)
                        //                    ActivityIndicatorManager.showProgress(progress: 50)
                    })
    
                    upload.responseJSON { response in
                        print(response.result.value)

                        //print response.result
                        ActivityIndicatorManager.stop();
                        handleRequestResponse(response: response, success: success, failure: failure)
    
                    }
    
                case .failure(let encodingError):
                    //print encodingError.description
                    print("err is \(encodingError )")
                    break
                }
            })
        }
    
    class func handleRequestResponse(response : DataResponse<Any> ,success : @escaping ( _ respone : Any) -> Void, failure : @escaping ( _ error : LError) -> Void ){
        switch response.result {
            
        case .success :
            if let result = response.result.value  {
                let statusCode = (response.response?.statusCode)!
                if statusCode != 200 &&  statusCode != 201{
                    let dict =  result as! Dictionary<String, Any>
                    let errorVal = dict["message"] as? String ?? ""
                    let errorDescription = dict["message"] as? String ?? ""
                    let error = LError(error: errorVal, errorDescription: errorDescription)
                    failure(error)
                    return
                }
                
                success(result)
            }
            break;
            
        case .failure(let error) :
            if let err = error as? URLError, err.code == .notConnectedToInternet {
                // no internet connection
                let message = "no Internet connection"
                DataClient.shared.delegate.onInernetConnectInterrupt()
                let error = LError(error: "", errorDescription: message)
                failure(error)
                
            }
                
                
            else if let err = error as? URLError, (err.code.rawValue == 401) {
                // no internet connection
                SessionManager.sharedManger.token = nil
                SessionManager.saveSessionManger()
                let message = "not authnticated"
                let error = LError(error: "", errorDescription: message)
                DataClient.shared.delegate.onInvalidLogin()
                failure(error)
            }
                
                
                
            else if let result = response.result.value {
                let json = result as! [String: Any]
                let errorVal = json["message"] as? String ?? ""
                let errorDescription = json["message"] as? String ?? ""
                let error = LError(error: errorVal, errorDescription: errorDescription)
                failure(error)
            }
            //            }else {
            //                SessionManager.sharedManger.token = nil
            //                SessionManager.saveSessionManger()
            //                let message = "not authnticated"
            //                let error = LError(error: "", errorDescription: message)
            //                DataClient.shared.delegate.onInvalidLogin()
            //                failure(error)
            //            }
            //
            break;
        }
        
    }
    
    
    
 }
