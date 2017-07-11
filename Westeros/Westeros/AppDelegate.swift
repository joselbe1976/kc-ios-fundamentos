//
//  AppDelegate.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 5/7/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.blue
        
        // Creamos el Modelos
        
        let starkImage : UIImage  = #imageLiteral(resourceName: "codeIsComing.png")
        let  lanisterImage : UIImage = #imageLiteral(resourceName: "lannister.jpg")
        var starSigil : Sigil!
        var starkHouse : House!
        var Lannistersigil : Sigil!
        var LannisterHouse:House!

        
        starSigil = Sigil(descrip: "DireWolf", image: starkImage)
        Lannistersigil = Sigil(descrip: "Rampam Lion", image: lanisterImage)
        
        starkHouse = House(name: "Stark", sigil: starSigil, words: "Hear my Hert")
        LannisterHouse = House(name: "Lannister", sigil: Lannistersigil, words: " I love Lannister House!")
        
        
        
        //Creo los View Controllers
        
        let vc1 = HouseViewController(model: starkHouse)
        let vc2 = HouseViewController(model: LannisterHouse)
        
        //botones del tab del controlador
        vc1.tabBarItem =  UITabBarItem(title: "starkHouse", image: #imageLiteral(resourceName: "info-32.png"), tag: 0)
        vc2.tabBarItem =  UITabBarItem(title: "LannisterHouse", image: #imageLiteral(resourceName: "info-32.png"), tag: 1)
        
        //Creamos el tabController
        let TabVC = UITabBarController()
        TabVC.viewControllers = [ vc1.getInNavigation(), vc2.getInNavigation()]
        
        //Asigamos el Root
        window?.rootViewController = TabVC
        
        
        //proxy apariencia de la App Completa
        self.proxyAparenceGlobal()
        
        
        // Override point for customization after application launch.
        return true
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

    
    
    //Proxy de Apariencia
    func proxyAparenceGlobal(){
                UITabBar.appearance().backgroundColor = UIColor.orange
        
        
    }
    
    
    

}

