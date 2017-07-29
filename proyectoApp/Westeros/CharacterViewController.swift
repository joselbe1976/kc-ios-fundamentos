//
//  CharacterViewController.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 29/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {


    @IBOutlet weak var name: UITextView!
    @IBOutlet weak var imagen: UIImageView!
   
    
    
    private var _model : Person
    
    init(model: Person){
        _model = model
        super.init(nibName: nil, bundle: nil)
        
    }
    
    // Chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = _model.name
       // name.text = _model.alias
        imagen?.image = _model.image
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
