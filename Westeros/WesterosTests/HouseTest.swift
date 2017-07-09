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
    
    var starkImage : UIImage!
    var lanisterImage : UIImage!
    var starSigil : Sigil!
    var Lannistersigil : Sigil!
    var starkHouse : House!
    var LannisterHouse:House!
    var robb : Personaje!
    var atya : Personaje!
    var tyrion : Personaje!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lanisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starSigil = Sigil(descrip: "DireWolf", image: starkImage)
        Lannistersigil = Sigil(descrip: "Rampam Lion", image: lanisterImage)
        
        starkHouse = House(name: "Stark", sigil: starSigil, words: "Hear my Hert")
        LannisterHouse = House(name: "Lannister", sigil: Lannistersigil, words: " I love Lannister House!")
        
        robb = Personaje(name: "Robb", alias: "The Young wolf", house: starkHouse)
        atya = Personaje(name: "Atya", house: starkHouse)
        tyrion = Personaje(name: "tyrion", alias: "The Imp", house: LannisterHouse)
        
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
    
    //Test de añadir personas
    func testAddPersons(){
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person: atya)
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
    }
    
    
    //Test Comparable de Houses
    func  testEquatable(){
            XCTAssertEqual(starkHouse, starkHouse)  //Son iguales
            XCTAssertNotEqual(starkHouse, LannisterHouse) //No seon Iguales
    }
    
    //testamos el Table Model de House
    func testHouseTableModel(){
        let houses : HousesTableModel = HousesTableModel()
        
        XCTAssertEqual(houses.count, 0)
        houses.add(house: starkHouse)
        XCTAssertEqual(houses.count, 1)
        houses.add(house: LannisterHouse)
        XCTAssertEqual(houses.count, 2)
        houses.add(house: LannisterHouse)
        XCTAssertEqual(houses.count, 2)

     
    }
    
    // Test casas Henores
    func  testHouseMinor(){
        XCTAssertEqual(starkHouse.countMinorHouses, 0)
        starkHouse.addMinorHouse(house: LannisterHouse)
        XCTAssertEqual(starkHouse.countMinorHouses, 1)
        
    }
    
    
    
    
}
