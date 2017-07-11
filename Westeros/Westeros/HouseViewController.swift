//
//  HouseViewController.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 10/7/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {
    
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var HouseWords: UILabel!
    @IBOutlet weak var Imagen : UIImageView!

    
    
    // Modelo 
    
    let model : House
    
    
    init(model: House){
            self.model = model
        
            super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //asignacion Modelo => View Items
    func asignarValues(){
        
        self.houseName.text = "House \(self.model.name)"
        self.HouseWords.text = self.model.words
        self.Imagen.image = self.model.sigil.image
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.asignarValues()
        
        //Titulo del Navigation controller
        self.title = self.model.name
        
        
    }
}
