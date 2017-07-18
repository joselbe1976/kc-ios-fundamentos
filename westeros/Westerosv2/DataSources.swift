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
        
        
        return ArrayDataSource(model: model, cellMake: { (house: House, tableView : UITableView) -> UITableViewCell in
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "House")
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: "House")
            }
            
            cell?.textLabel?.text = house.name
            cell?.imageView?.image = house.sigil.image
            cell?.detailTextLabel?.text = "\(house.count) Miembros"
            
            return cell!
        })

     
    }
    
    
    
    static func personDataSource(model: [Person]) -> ArrayDataSource<Person>{
        
        
        return ArrayDataSource(model: model, cellMake: { (person: Person, tableView : UITableView) -> UITableViewCell in
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "Person")
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: "Person")
            }
            
            cell?.textLabel?.text = person.fullName

            
            return cell!
        })
        
        
    }

}
