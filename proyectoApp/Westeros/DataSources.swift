//
//  DataSources.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class DataSources{
    
    
    static func houseDataSource(model: [House]) -> ArrayDataSource<House>{
        
        
        return ArrayDataSource(model: model, cellMake: { (house: House, tableView : UITableView) -> HousesTableViewCell in
            
        
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "House") as! HousesTableViewCell
            
            cell.imageView?.image = resizeImage(image: house.sigil.image, targetSize: CGSize(width: 90, height: 100))
            cell.titulo.text = house.name
            cell.descrip.text = house.words
            
            
            return cell
        })

     
    }
    
    
    
    static func personDataSource(model: [Person]) -> ArrayDataSource<Person>{
        
        
        return ArrayDataSource(model: model, cellMake: { (person: Person, tableView : UITableView) -> UITableViewCell in
    
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Season") as! HousesTableViewCell
            
            
            cell.imageView?.image = resizeImage(image: person.image, targetSize: CGSize(width: 100, height: 100))
            cell.titulo.text = person.name
            cell.descrip.text = person.alias
            
            return cell

            
        })
        
        
    }
    
    static func SeasonDataSource(model: [Season]) -> ArrayDataSource<Season>{
        
        
        return ArrayDataSource(model: model, cellMake: { (season: Season, tableView : UITableView) -> HousesTableViewCell in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Season") as! HousesTableViewCell
            
            
            cell.imageView?.image = resizeImage(image: season.image, targetSize: CGSize(width: 90, height: 100))
            cell.titulo.text = season.name
            cell.descrip.text = season.descrip
            
            return cell
        })
        
        
    }
    
    

}
