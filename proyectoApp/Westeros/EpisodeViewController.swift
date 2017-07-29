//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 28/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {



    
    @IBOutlet weak var descrip: UITextView!
    @IBOutlet weak var imagen: UIImageView!
    private var _model : Episode
    
    
    init(modelo: Episode){
        _model = modelo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Titulo
        self.title = _model.name
        
        // asignamos

        descrip.text = _model.descrip
        imagen.image = _model.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
