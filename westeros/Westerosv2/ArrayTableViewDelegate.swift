//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit


final class ArrayTableViewDelegate<Element>: NSObject, UITableViewDelegate{
    
    
    typealias Elements = [Element]
    typealias DelegateMaker = (Element, IndexPath, UITableView) -> UIViewController  //la clausura que monta
    
    let model : Elements
    let _delegateMaker : DelegateMaker //aqui guardamos la clausuara
    
    //chapu
    var vcPadre : UIViewController?
    
    
    init(model: Elements, delegateMaker: @escaping DelegateMaker){
        self.model = model
        self._delegateMaker = delegateMaker
        self.vcPadre = nil
        
        super.init()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Ejecutamos la clausura
        
        let elem = model[indexPath.row]
        
        let vc = _delegateMaker(elem, indexPath, tableView)
  
        //Falta lanzar el viewController ...
        self.vcPadre?.navigationController?.pushViewController(vc, animated: true)
   
    }
    
    
}
