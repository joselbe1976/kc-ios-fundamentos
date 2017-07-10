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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
