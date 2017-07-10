//
//  CharecterTest.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 6/7/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import XCTest

@testable import Westeros

class PersonajeTest: XCTestCase {
    
    var starkHouse : House!  
    var  ned : Personaje!
    
    var robb : Personaje!
    var atya : Personaje!
    var tyrion : Personaje!
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        starkHouse = House(name: "Stark", sigil: Sigil(descrip: "Rampam Lion", image: #imageLiteral(resourceName: "lannister.jpg")), words: "Winter is comming!")
        ned = Personaje(name: "Edduar",alias: "Ned", house: starkHouse )
        
        
        robb = Personaje(name: "Robb", alias: "The Young wolf", house: starkHouse)
        atya = Personaje(name: "Atya", house: starkHouse)
        tyrion = Personaje(name: "tyrion", alias: "The Imp", house: starkHouse)
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // --------Creamos Nuestros Test
    
    //tiene que existir la clase Character
    func testPersonajeExistence(){
        let ned = Personaje(name: "Edduar",alias: "Ned", house: starkHouse )
        
        XCTAssertNotNil(ned)
    }
    
    //Testeamos la variable computada FullName
    func testFullName(){
        
        XCTAssertEqual(ned.fullName,"Edduar of Stark")
    }
    
    
    func testPersonEquility(){
    
        // IUdentidad
        
        XCTAssertEqual(tyrion , tyrion)
        
        // Igualdad
        
        let tyrion2 : Personaje = Personaje(name: "tyrion", alias: "The Imp", house: starkHouse)
        
        
        XCTAssertEqual(tyrion , tyrion2)
        
        //Desigualdad
        XCTAssertNotEqual(tyrion , atya)
        
    
        
    }
    
    
}
