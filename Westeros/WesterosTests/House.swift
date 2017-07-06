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
    
    

    // Inicializador
    init(name : String , sigil : Sigil, words : Words) {
        (self.name,self.sigil,self.words) = (name, sigil, words)

        _members = Members()
    }
}


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
