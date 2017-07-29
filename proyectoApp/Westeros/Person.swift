//
//  Character.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/6/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class Person{
    
    let name    : String
    let house   : House
    let image : UIImage
    
    private let _alias   : String?
    
    var alias : String{
        get{
            return _alias ?? ""
        }
    }
    
    init(name: String, alias: String? , house: House, image: UIImage) {
        
        self.name = name
        _alias = alias
        self.house = house
        self.image = image
    }
    
    convenience init(name: String, house: House){
        let imagen : UIImage = UIImage(named: "silueta.gif")!
        
        self.init(name: name, alias: nil, house: house, image: imagen)
    }
}


extension Person{
    
    var fullName : String{
        get{
            return "\(name) \(house.name)"
        }
    }
}

extension Person {
    var proxy : String{
        return "\(name) \(alias) \(house.name)"
    }
}
extension Person : Hashable{
    var hashValue : Int{
        get{
            return proxy.hashValue
        }
    }
}

extension Person : Equatable{
    static func ==(lhs: Person, rhs: Person) -> Bool{
        return lhs.proxy == rhs.proxy
    }
}


extension Person : Comparable{
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}


// MARK : -  Protocols
extension Person : CustomStringConvertible{
    var description: String {
        return "<\(type(of: self)): \(fullName)>"
    }
    
    
}




