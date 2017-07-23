//
//  ViewController.swift
//  delegates
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 23/7/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nombreTxt: UITextField!
    
    
    var model : modelo?  //Modelo de la vista

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //llamamos a la clase, el metodo
        let obj = clasesEjemplo()
        obj.delegate = self
        obj.LoadData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//extendemos

extension ViewController : clasesEjemploDelegate {
    
    //funcion delegada
    func llamadaSoap(_ vc : clasesEjemplo, didFinishSoapLoadData model: modelo){
    
        self.model = model //recibimos el modelo y asignamos
        
        //Aqui acciones de la UI etc..
        
        nombreTxt.text = model.nombre
    }
}
