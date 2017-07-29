//
//  Seasons.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 28/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest

@testable import Westeros
class Seasons: XCTestCase {
    
    var  temporadas :  [Season]!
    
    override func setUp() {
        super.setUp()
        
        
        //las Temporadas
          temporadas = Repository.localSesion.Seasons
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testnoNil() {

         let temp1 = Season(name: "temp1", dateSeason:  Date.getDateFromString("01/01/2010"), descrip: "", image: UIImage(named: "default.png")!)
        XCTAssertNotNil(temp1)

    }
    
    func testtemporadasNoCero() {
      
        XCTAssertNotEqual(temporadas.count, 0)
        
    }
    
    func testHouseEquality(){
        
        
        // Identidad
        XCTAssertEqual(temporadas[0], temporadas[0])
      
        // Desigualdad
        XCTAssertNotEqual(temporadas[0], temporadas[1])
    }

    func testHashable() {
        
        XCTAssertNotNil(temporadas[0].hashValue)
        
    }
    func testEpisodios(){
        //deben tener episodios
        XCTAssertNotEqual(temporadas[0].count,0)
        XCTAssertNotEqual(temporadas[1].count,0)
    }
    
    func testHouseComparison(){
        
        XCTAssertLessThan(temporadas[0], temporadas[1])
    }
    
}
