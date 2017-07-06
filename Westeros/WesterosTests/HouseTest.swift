//
//  HouseTest.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 6/7/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import XCTest

@testable import Westeros


class HouseTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // --------Creamos Nuestros Test
    
    //tiene que existir la clase House
    func testHouseExistence(){
        let stark = House(name: "Stark", sigil: Sigil(descrip: "Rampam Lion", image: #imageLiteral(resourceName: "lannister.jpg")), words: "Winter is comming!")
        
        XCTAssertNotNil(stark)
    }
    
    // Tiene que existir la clase Sigil, revisamos 2 imagenes que deben existir
    func testSigilExistence(){
        let sigil = Sigil(descrip: "DireWorl", image: #imageLiteral(resourceName: "codeIsComing.png"))
        XCTAssertNotNil(sigil)
        
        let sigil2 = Sigil(descrip: "Rampam Lion", image: #imageLiteral(resourceName: "lannister.jpg"))
        XCTAssertNotNil(sigil2)
    }
    
    
}
