//
//  RepositorioTest.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 11/7/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import XCTest

@testable import Westeros

class RepositorioTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func  testLocalRespositoryCreation(){
        
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation(){
        let Houses = Repository.local.houses
        
        XCTAssertNotNil(Houses)
        
        XCTAssertEqual(Houses.count, 2)
    }
    
}
