//
//  HouseTests.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/6/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
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
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        let starkUrl = URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!
        let LanisterUrl = URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!
        
        
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkUrl)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url:LanisterUrl)
        
        robb = Person(name: "Edduard", alias: "The hand of the King", house: starkHouse, image: UIImage(named: "edduard_stark.png")!)
        arya = Person(name: "Arya", alias: "Braavos", house: starkHouse, image: UIImage(named: "arya_stark.png")!)
        tyrion = Person(name: "Jon Snow", alias: "Commander of the Night's Watch", house: starkHouse, image: UIImage(named: "Jon-Snow_stark.png")!)
        
    
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    func testHouseExistence(){
        let starkUrl = URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkUrl)
        
        
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence(){
        
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons(){
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person: robb)
        
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person: arya)
        
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 3)
        
        
    }
    
    func testHouseEquality(){
        
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad
        let starkUrl = URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkUrl)
        XCTAssertEqual(jinxed, starkHouse)
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
        
        
    }
    
    func testHashable() {
        
        
        XCTAssertNotNil(starkHouse.hashValue)
        
    }
    
    func testHouseComparison(){
        
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
}













