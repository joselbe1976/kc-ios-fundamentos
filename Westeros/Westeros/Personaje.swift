//
//  Character.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 6/7/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import Foundation

//Clase Actor
final class Personaje{
    
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
    init(name: String, alias : String, house : House) {
        (self.name, self._alias, self.house)=(name, alias, house)
    }
    
   init(name: String, house : House) {
        (self.name,  self.house)=(name, house)
        _alias = nil
    }
 
}
