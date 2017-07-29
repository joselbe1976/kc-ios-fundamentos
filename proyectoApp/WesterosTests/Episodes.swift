//
//  Episodes.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 28/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest

@testable import Westeros
class Episodes: XCTestCase {
    
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
    
    func testExistEpisodes() {
    
        //todas tenporadas tienen episodios
        
        for temp in temporadas {
            print(temp.name)
            XCTAssertNotEqual(temp.count, 0)
            
        }

    }

    func testEquality(){
        
        let tm1 = temporadas[0]
        let episodiosTm1 = tm1.getSortedEpisodes()
        
        XCTAssertNotEqual(episodiosTm1[0], episodiosTm1[1])
        XCTAssertEqual(episodiosTm1[0], episodiosTm1[0])
    }
    
    func testHashable() {
        
        let tm1 = temporadas[0]
        let episodiosTm1 = tm1.getSortedEpisodes()
        
        XCTAssertNotNil(episodiosTm1[0].hashValue)
        
    }

   
    
}
