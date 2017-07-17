//
//  Repository.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 11/7/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import Foundation
import UIKit

final class Repository {
    
    
    static var local = LocalFactory()
}


protocol HouseFactory{
    var houses : [House] {get}

}

final class LocalFactory : HouseFactory{
    
    var houses : [House]{
        get{
            //Aqui cremoa las casas
            
            let starkImage : UIImage  = #imageLiteral(resourceName: "codeIsComing.png")
            let lanisterImage : UIImage = #imageLiteral(resourceName: "lannister.jpg")
            var starSigil : Sigil!
            var Lannistersigil : Sigil!
            
            
            starSigil = Sigil(descrip: "DireWolf", image: starkImage)
            Lannistersigil = Sigil(descrip: "Rampam Lion", image: lanisterImage)
            
            let starkHouse = House(name: "Stark", sigil: starSigil, words: "Hear my Hert")
            let LannisterHouse = House(name: "Lannister", sigil: Lannistersigil, words: " I love Lannister House!")
   
            //personajes
            let robb = Personaje(name: "Robb", alias: "The Young wolf", house: starkHouse)
            let atya = Personaje(name: "Atya", house: LannisterHouse)
            let tyrion = Personaje(name: "tyrion", alias: "The Imp", house: starkHouse)
            
            
            //personajes a las casas
            starkHouse.add(person: robb)
            starkHouse.add(person: tyrion)
            LannisterHouse.add(person: atya)
            
            
            return [starkHouse, LannisterHouse].sorted() //lo devuelvo ordenado

            
        }
    }
}
