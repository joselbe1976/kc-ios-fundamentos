//
//  clasesEjemplo.swift
//  delegates
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 23/7/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import Foundation


@objc class clasesEjemplo : NSObject{
    
      //Creo delegado
      var delegate : clasesEjemploDelegate?
    
    
      //metodo
    
    func LoadData(){
        
        //Aqui llamada Web sercice, Core Data, Realm etc..
        let model = modelo(name: "Jose Luis", apells: "Bustos Esteban")
        
        //llamamos deledado
        self.delegate?.llamadaSoap(self, didFinishSoapLoadData: model)
        
        
    }
    
    
    
}

//protocolo delegado
protocol clasesEjemploDelegate {
    
    func llamadaSoap(_ vc : clasesEjemplo, didFinishSoapLoadData model: modelo)
}




// Clase modelo
final class modelo{
    var nombre : String
    var apellidos : String
    
    init(name: String, apells: String) {
        
        self.nombre = name
        self.apellidos = apells
        
    }
}
