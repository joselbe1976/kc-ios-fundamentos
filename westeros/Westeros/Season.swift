//
//  Season.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 28/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

typealias Capitulos = Set<Episode>

final class Season{
    
    let name : String
    let dateSeason : Date
    let descrip : String //Descripcion de la temporada
    let image       : UIImage //foto de la temporada
    private var _episodes : Capitulos //capitulos de la temporada
    
    init(name : String, dateSeason : Date, descrip : String, image: UIImage){
        self.name = name
        self.dateSeason = dateSeason
        self.descrip = descrip
        self.image = image
        _episodes = Capitulos()
    }
    
}


//MARK: - extendemos para añdir funcionalidad de los campitulos de la temporada
extension Season{
    var count : Int{
        return _episodes.count
    }
    
    
    //Creamos unobjeto episodio a mano y le pasamos como Self para la temporada
    func add(episodeName: String, dateEpisode : Date,descrip : String, image: UIImage){
        let ep : Episode = Episode(name: episodeName, dateEpisode: dateEpisode, SeasonOfEpisode: self, descrip : descrip, image: image)
        self.add(episodio: ep)
    }
    
    
    //nos pasan un objeto episodio
    func add(episodio: Episode){
        
        
        episodio.SeasonOfEpisode = self // Le damos al Episodio la referencia a la temporada.
        
        _episodes.insert(episodio)
    }
    
    //nos pasan un array de episodios
    func add(episodios: Episode...){
        for episodio in episodios{
            add(episodio: episodio)
        }
    }
    
    func getSortedEpisodes() -> [Episode]{
        let memberArray : [Episode] = Array(_episodes)
        
        return memberArray.sorted()
    }
}




extension Season{
    var proxyForEquality : Date{
        get{
            return dateSeason
        }
    }
    
    var proxyForComparison : Date{
        get{
            return dateSeason
        }
    }
}



// MARK: - Equatable
extension Season : Equatable{
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
    
}

// MARK: - Hashable
extension Season : Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension Season : Comparable{
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    
    
}

// MARK : - Protocols
extension Season : CustomStringConvertible{
    var description: String {
        return "<\(type(of:self)): \(name)>"
    }
    
}




