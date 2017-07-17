//
//  Character.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 6/7/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import Foundation

//Clase Personaje
final class Personaje {
    
    let name : String
    let house : House
    
    private let _alias : String?
    var alias : String{
        get{
            
            //desempaquetado con operador ??. Me devuelves _alias y si esta vacio lo otro.
            
            return _alias ?? ""
            
            //desempaquetamos en _alias que es local en el desempaquetado nada mas
            /*
            if let _alias = _alias {
                return _alias
            } else {
                return ""
            }
            */
        }
        //no permitimos modificar el alias, solo por constructor.
    }
    
    
    // inicializadores
    init(name: String, alias : String? = nil, house : House) {
        (self.name, self._alias, self.house)=(name, alias, house)
    }
    

}


extension Personaje{
    
    var fullName: String{
        
        get{
            return "\(self.name) of \(self.house.name)"
        }
    }
}

extension Personaje{
    var proxy : String{
        return "\(name) \(alias) \(house.name)"
    }
}

extension Personaje : Hashable{
    var hashValue : Int {
        get{
            return proxy.hashValue
        }
    }
}

extension Personaje : Equatable{
    static func ==(lhs: Personaje , rhs: Personaje) -> Bool{
        return lhs.proxy == rhs.proxy
    }
}

extension Personaje : Comparable{
    static func <(lhs: Personaje, rhs: Personaje) -> Bool{
            return lhs.name > rhs.name
    }
}
