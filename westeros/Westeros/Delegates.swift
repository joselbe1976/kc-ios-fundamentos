//
//  Delegates.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class Delegates {
    static func  housesDelegate ( model: [House]) -> ArrayTableViewDelegate<House>{
        
       // Creamos el objeto y la cluasura a ejecutar
       
        let del = ArrayTableViewDelegate(model: model, delegateMaker: {(house, IndexPath, UITableView) -> UIViewController in
          
               let vc = HouseViewController(model: house)
               return vc
        })
        
        return del
    }
    
    static func  SeasonsDelegate ( model: [Season]) -> ArrayTableViewDelegate<Season>{
        
        // Creamos el objeto y la cluasura a ejecutar
        
        let del = ArrayTableViewDelegate(model: model, delegateMaker: {(season, IndexPath, UITableView) -> UIViewController in
            
            
            
            let vc = EpisodesTableViewController.init(modelo: season.getSortedEpisodes())
            return vc

         
        })
        
        return del
        
    }
    
    
    
}
