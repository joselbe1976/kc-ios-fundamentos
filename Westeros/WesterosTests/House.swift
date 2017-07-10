//
//  House.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 6/7/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import Foundation
import UIKit

typealias Words = String
typealias Members = Set<Personaje>



//MARK: - Clases Funcionales Modelo

// Casa
final class House {

    let name : String
    let sigil :  Sigil
    let words : Words
    private var _members : Members //miembros de la casa
    private var _minorHouses : HousesTableModel
    
    

    // Inicializador
    init(name : String , sigil : Sigil, words : Words) {
        (self.name,self.sigil,self.words) = (name, sigil, words)

        _members = Members()
        _minorHouses = HousesTableModel()
    }
}

//Extension Set personas
extension House{
    var count : Int{
        return _members.count
    }

    func  add(person: Personaje) {
        
        //control que si No son de la misma casa, no lo añadimos
        guard person.house.name == self.name else{
            return
        }
        _members.insert(person)
    }
}

//Extension minor house
extension House{
    var countMinorHouses : Int{
        return _minorHouses.count
    }
    
    func  addMinorHouse(house: House) {
        
        NSLog(house.proxy)
        NSLog(self.proxy)
        
        //control que si es la misma casa No se añade.
        guard house.proxy != self.proxy else{
            return
        }
        _minorHouses.add(house: house)
    }

}

extension House{
    var proxy : String{
        return "\(name) \(words) \(count)"
    }

    var proxyComparable : String{
        return "\(name) \(words) \(count)"
    }
}


extension House : Hashable{
    var hashValue : Int {
        get{
            return proxy.hashValue
        }
    }
}

extension House : Equatable{
    static func ==(lhs: House , rhs: House) -> Bool{
        return lhs.proxy == rhs.proxy
    }
}

extension House : Comparable{
    static func <(lhs: House, rhs: House) -> Bool{
        return lhs.proxyComparable < rhs.proxyComparable
    }
}


// Clase de Modelo

typealias Houses = Set<House>

final class HousesTableModel{
    
    private var _houses : Houses

    init(){
        _houses = Houses()
    }

    var count : Int{
        return _houses.count
    }
    
    func  add(house: House) {
        
        _houses.insert(house)
    }
    
}






// Emblema de la casa
final class Sigil {
    
    let description : String
    let image : UIImage

    // inicializador de la clase
    init(descrip : String, image : UIImage) {
        self.description = descrip
        self.image = image
    }
}
