//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class ArrayDataSource<Element> : NSObject,  UITableViewDataSource{

    typealias Elements = [Element]
    typealias CellMaker = (Element, UITableView) -> UITableViewCell  //la clausura que monta
    
    
    private let _model : Elements //aqui tenemos el arrat de modelo que nos pasan House o personas
    private let _cellMaker : CellMaker //aqui guardamos la clausuara
    
    
    //inicializalizadores
    init(model: Elements, cellMake: @escaping CellMaker){
        _model = model
        _cellMaker = cellMake
        super.init()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elem = _model[indexPath.row]
        return _cellMaker(elem, tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    
    
}
