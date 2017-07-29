//
//  Episode.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 28/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class Episode{
    
    let name : String
    let dateEpisode : Date
    let descrip : String //Descripcion del capitulo
    let image       : UIImage //foto de episodio
    weak var SeasonOfEpisode : Season?  //ARC lo marco como debil y por eso a demas como Opcional
    
    init(name : String, dateEpisode : Date, SeasonOfEpisode : Season, descrip : String, image: UIImage){
        self.name = name
        self.dateEpisode = dateEpisode
        self.SeasonOfEpisode = SeasonOfEpisode
        self.descrip = descrip
        self.image = image
    }
    init (name : String, dateEpisode : Date, descrip : String, image: UIImage){
        self.name = name
        self.dateEpisode = dateEpisode
        self.descrip = descrip
        self.image = image
    }
    
    
}



extension Episode{
    var proxyForEquality : Date{
        get{
            return dateEpisode
        }
    }
    
    var proxyForComparison : Date{
        get{
            return dateEpisode
        }
    }
}


// MARK: - Equatable
extension Episode : Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
    
}

// MARK: - Hashable
extension Episode : Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension Episode : Comparable{
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    
    
}

// MARK : - Protocols
extension Episode : CustomStringConvertible{
    var description: String {
        return "<\(type(of:self)): \(name) of session \(SeasonOfEpisode!.name)>"
    }
    
}
