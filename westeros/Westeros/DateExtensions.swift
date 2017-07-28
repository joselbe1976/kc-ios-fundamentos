//
//  DateExtensions.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 28/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation


extension Date{

    public static func getDateFromString(_ fecha : String) -> Date{
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        return  (dateFormatter.date(from: fecha))!
    
    }
    
    public  func getStringFromDate() -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        return  dateFormatter.string(from: self)
    }
}
    
    

