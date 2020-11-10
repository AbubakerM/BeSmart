//
//  AppDelegate.swift
//  Besmart
//
//  Created by mac on 12/7/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import IQKeyboardManagerSwift
import DropDown
import MFSDK


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        UIApplication.shared.statusBarStyle = .lightContent

        MFSettings.shared.configure(token: "qlQwS0DqhmQV-4O0qWPK6lWHAok3RCSCZGrzCVXUXKkRrrNTHrkpu7OXHWobSz9IMTr60D6IFT1FV2Jz0KuOq0TnzDjtz3b7RT_flzDmqWG8pj35ziPWPXLPHzyYT-G1Gkm-Fl1PzruHkQfmKS68Cddy0t2e7Ey2bSwVlcPU5j1Cg4RSZ9OFXJUIZQ3YNVR7LU0vCBj5aJmC6QbzxPAIIc0j0U3vauHEB8l3A4Mg2Rt507Bo_9O9MnqaQK84tE0tW2lesMzp5HiGDVJLfwm_C-Zgi-I9uyKihTzu3XHzYOFIYJjFZjcX2jdKwLcDtusdLpk9porOEFF13OkUMtBZPqeqZ5457JGct5J-gaO91EZUjEeJzauNjlZxgUrZiWgGWI-llLcM-u0r9Y9cyei4FxTAdzEHjl1H6oq5tGVaxgyCjrdUkOcEtepoqj6JtYkJqmcxqMro2VLu5HzrEKaQdQVj4bLF_UeQaoVV550CLtL_6El994JjGetb3qccbUaQXo5kDAvzFFgvFQSmaK8ifMIoLbeVFlZ1qHcFa9Qo820yzbgtnY7x_H-Tz67oh0JMoPSdgfNmbqadd4kDTZAMghqlnxJMhW5rHhCK4kV23I7gD7AdJIsmDiVlkJrhDV36o8gm-t9ueQO4MwfsKEAXOf-SuEovWjMfoDhfEAncQdEwEoU3znGZZ3kbkgTEk3etnE6qKA", baseURL: "https://api.myfatoorah.com")
        //https://api.myfatoorah.com ==> The live url && Live Token needed
        //"https://apitest.myfatoorah.com" ==> The test url
        // you can change color and title of nvgigation bar
        let them = MFTheme(navigationTintColor: .white, navigationBarTintColor: .lightGray, navigationTitle: "الدفع", cancelButtonTitle: "الغاء")
        MFSettings.shared.setTheme(theme: them)
        
        IQKeyboardManager.shared.enable = true
        DropDown.startListeningToKeyboard()
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        
        changeLanguage(lang: "ar")
        L102Localizer.DoTheMagic()
                Switcher.updateRootVC()

        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "NotoKufiArabic", size: 12)!], for: UIControl.State.normal)

             

        
//        let BarButtonItemAppearance = UIBarButtonItem.appearance()
//        BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("D'oh: \(error.localizedDescription)")
            } else {
                application.registerForRemoteNotifications()
            }
        }
        UIApplication.shared.registerForRemoteNotifications()
        FirebaseApp.configure()

        
        // Override point for customization after application launch.
        return true
    }

    
    func changeLanguage(lang:String){
        if lang.hasPrefix("en") {
            L102Language.setAppleLAnguageTo(lang: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            
            
        } else {
            
            L102Language.setAppleLAnguageTo(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            
        }
        
        
     
        
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print(token)
    }
    
    
    fileprivate func loginViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainNavigationController")
        return controller
    }
    
    
    func presentLoginViewController(animated:Bool) {
        
        let controller = loginViewController()
        
        if animated {
            let options: UIView.AnimationOptions = [.transitionCrossDissolve, .curveEaseOut]
            
            UIView.transition(with: self.window!, duration: 0.4, options: options, animations: {
                self.window?.rootViewController = controller
            }, completion: nil)
            
        } else {
            self.window?.rootViewController = controller
        }
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

