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
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        starkHouse = House(name: "Stark", sigil: Sigil(descrip: "Rampam Lion", image: #imageLiteral(resourceName: "lannister.jpg")), words: "Winter is comming!")
        
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
    
        
}
