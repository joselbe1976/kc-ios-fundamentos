//
//  ArrayDataSourceTest.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class ArrayDataSourceTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testArrayDataSourceCreation(){
  
        let ds = ArrayDataSource(model: [1,2,3]) { (number: Int, tableView : UITableView) -> UITableViewCell in
                var cell = tableView.dequeueReusableCell(withIdentifier: "Hola")
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: "Hola")
            }
            
            cell?.textLabel?.text = "el numero \(number)"
            
            return cell!
        }
        
        XCTAssertNotNil(ds)
    }



}
