//
//  AppDelegate.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/5/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Crear Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.cyan
        
        // Creamos unos modelos
        let houses = Repository.local.houses
        let seasons = Repository.localSesion.Seasons
        
       /* Creamos el TabBar
           let tabVC = UITabBarController()
           tabVC.viewControllers = houses.map {HouseViewController(model: $0).wrappedInNavigation()}
        
         */
        
        
      
        
        
        
        
        
      
        
        
        
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
                //IPAD
            
            let vcStart = StartViewController(nibName: "StartViewControllerIPAD", bundle: nil)
            
            let globalNav = IpadNavViewController(rootViewController: vcStart)
            
            
            //Houses
            
            let dataSources = DataSources.houseDataSource(model: houses)
            let houseDelegate = Delegates.housesDelegate(model: houses)
            let housesVC = ArrayTableViewController(datasource: dataSources, delegate: houseDelegate, style: .plain, title: "Houses", navControllerIpad: globalNav).wrappedInNavigation()
            
            // Temporadas
            
            let dataSourceSeason = DataSources.SeasonDataSource(model:seasons )
            let SeasoNDelegate = Delegates.SeasonsDelegate(model: seasons)
            let seasonsVC = ArrayTableViewController(datasource: dataSourceSeason, delegate: SeasoNDelegate,  style: .plain, title: "Seasons", navControllerIpad: globalNav).wrappedInNavigation()
            
            
            
            let img1 = resizeImage(image: #imageLiteral(resourceName: "house.png"), targetSize: CGSize(width: 25, height: 25))
            housesVC.tabBarItem = UITabBarItem(title: "Houses", image: img1, selectedImage: nil)
            
            let img2 = resizeImage(image: #imageLiteral(resourceName: "capitulos.png"), targetSize: CGSize(width: 25, height: 25))
            seasonsVC.tabBarItem = UITabBarItem(title: "Seasons", image: img2, selectedImage: nil)
            
            let TabVC = UITabBarController()
            TabVC.viewControllers = [housesVC, seasonsVC]

            
            //creamos el SplitViewController
            let splitVC = UISplitViewController()
            splitVC.viewControllers = [TabVC, globalNav]
            
            //faltan delegados del splitView
            
            
            window?.rootViewController = splitVC

            
        }
        else{
                //IPHONE
            
            
            //Houses
            
            let dataSources = DataSources.houseDataSource(model: houses)
            let houseDelegate = Delegates.housesDelegate(model: houses)
            let housesVC = ArrayTableViewController(datasource: dataSources, delegate: houseDelegate,  style: .plain, title: "Houses").wrappedInNavigation()
            
            
            // Temporadas
            
            let dataSourceSeason = DataSources.SeasonDataSource(model:seasons )
            let SeasoNDelegate = Delegates.SeasonsDelegate(model: seasons)
            let seasonsVC = ArrayTableViewController(datasource: dataSourceSeason, delegate: SeasoNDelegate,  style: .plain, title: "Seasons").wrappedInNavigation()
            
            
            let vcStart = StartViewController(nibName: "StartViewController", bundle: nil).wrappedInNavigation()
       
            
            vcStart.tabBarItem = UITabBarItem(title: "Credits", image: resizeImage(image: #imageLiteral(resourceName: "yo.png"), targetSize: CGSize(width: 25, height: 25)), selectedImage: nil)
            
            
            let img1 = resizeImage(image: #imageLiteral(resourceName: "house.png"), targetSize: CGSize(width: 25, height: 25))
            housesVC.tabBarItem = UITabBarItem(title: "Houses", image: img1, selectedImage: nil)
            
            let img2 = resizeImage(image: #imageLiteral(resourceName: "capitulos.png"), targetSize: CGSize(width: 25, height: 25))
            seasonsVC.tabBarItem = UITabBarItem(title: "Seasons", image: img2, selectedImage: nil)
            
            let TabVC = UITabBarController()
            TabVC.viewControllers = [vcStart, housesVC, seasonsVC]
            
            // Asignamos el RootVC
            window?.rootViewController = TabVC
        }
        
        // Creamos tabBar
    
        
       
        
        
        //apariencia de la App
        proxyApparence()
        
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
    
    

    
    // proxy de apariencia. Cambiamos todo los colores de los componentes de la App
    
    func proxyApparence(){
        
        let AppBackGroundColor = UIColor.black
        let AppForetextColor = UIColor.white
        
        UINavigationBar.appearance().barTintColor = AppBackGroundColor
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().tintColor = AppForetextColor
        
        UITableView.appearance().backgroundColor = AppBackGroundColor
        UITableViewCell.appearance().backgroundColor = AppBackGroundColor
        UITableViewCell.appearance().tintColor = AppForetextColor
        
        UILabel.appearance().tintColor = AppForetextColor
        
        //UIView.appearance().backgroundColor = AppBackGroundColor
        
        UITabBar.appearance().barTintColor = AppBackGroundColor
        UITabBar.appearance().tintColor = AppForetextColor
        UITabBar.appearance().selectedImageTintColor = AppForetextColor
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: CGFloat(10.0))!, NSForegroundColorAttributeName: UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: CGFloat(10.0))!, NSForegroundColorAttributeName: UIColor.white], for: .normal)
    }


}

