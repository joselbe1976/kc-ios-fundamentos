//
//  CharacterTest.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/6/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    var starkImage : UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb : Person!
    var arya : Person!
    var tyrion : Person!

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
         let starkUrl = URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkUrl)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: starkUrl)
        
        robb = Person(name: "Edduard", alias: "The hand of the King", house: starkHouse, image: UIImage(named: "edduard_stark.png")!)
        arya = Person(name: "Arya", alias: "Braavos", house: starkHouse, image: UIImage(named: "arya_stark.png")!)
        tyrion = Person(name: "Jon Snow", alias: "Commander of the Night's Watch", house: starkHouse, image: UIImage(named: "Jon-Snow_stark.png")!)
        
        

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence(){
   
        
        
        XCTAssertNotNil(tyrion)
    }
    
    func testFullName(){
        XCTAssertEqual(tyrion.fullName, "Jon Snow Stark")
    }
    
    
    func testPersonEquality(){
        
        // Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        // Igualdad
        let imp = Person(name: "Jon Snow", alias: "Commander of the Night's Watch", house: starkHouse, image: UIImage(named: "Jon-Snow_stark.png")!)
        
        XCTAssertEqual(imp, tyrion)
        
        // Desigualdad
        XCTAssertNotEqual(tyrion, arya)
        
    }
    
}















