//
//  HouseViewController.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/10/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    
    @IBOutlet weak var wordsTextView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    
    let model : House
    
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
        
    }
    
    // Chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func syncViewWithModel(){
        // model -> view
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsTextView.text = model.words
        
        
    }
    

    func setupUI(){
        //añadimos boton al navigation controller
        
        let boton = UIBarButtonItem(title: "Wiki", style: .plain, target: self , action: #selector(openWiki))
        let boton2 = UIBarButtonItem(title: "Characters", style: .plain, target: self , action: #selector(openListPersonajes))
        
        self.navigationItem.rightBarButtonItems = [boton, boton2]
    }
    
    @objc func openWiki(){
        let vcWiki = WikiViewController(modelo: self.model)
        self.navigationController?.pushViewController(vcWiki, animated: true)
        
    }
    @objc func openListPersonajes(){
       
        
        //Usamos Genericos
        let dataSourcesPerson = DataSources.personDataSource(model: self.model.getSortedmembers())
        let personDelegate = Delegates.PersonsDelegate(model: self.model.getSortedmembers())
        let VC = ArrayTableViewController(datasource: dataSourcesPerson, delegate: personDelegate,  style: .plain, title: "Charachers")
        self.navigationController?.pushViewController(VC, animated: true)

        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWithModel()
    }
}
















