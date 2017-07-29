//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {

    let dataSource : ArrayDataSource<Element>
    var delegate : ArrayTableViewDelegate<Element>?  //referencia al navegador, lo pongo weak

    
    init(datasource : ArrayDataSource<Element>, delegate: ArrayTableViewDelegate<Element>?, style: UITableViewStyle, title: String){
      
        
        self.dataSource = datasource
        
        super.init(style: style)
        
        if (delegate != nil){
            self.delegate = delegate
            delegate?.vcPadre = self
        }
        
              
        //datasource de la vista
        tableView.dataSource = self.dataSource
        tableView.delegate = self.delegate
        
        self.title = title
        
    }
    
    init(datasource : ArrayDataSource<Element>, delegate: ArrayTableViewDelegate<Element>?, style: UITableViewStyle, title: String, navControllerIpad : UINavigationController){
        
        
        self.dataSource = datasource
        
        super.init(style: style)
        
        if (delegate != nil){
            self.delegate = delegate
            delegate?.vcPadre = navControllerIpad //Igual que el otro pero añadiendo como navegaor otro
        }
        
        
        //datasource de la vista
        tableView.dataSource = self.dataSource
        tableView.delegate = self.delegate
        
        self.title = title
        
    }

    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //registro las posibles celdas personalizadas e identificadores de reuso
        tableView.register(UINib(nibName: "HousesTableViewCell", bundle: nil), forCellReuseIdentifier: "House")
        tableView.register(UINib(nibName: "HousesTableViewCell", bundle: nil), forCellReuseIdentifier: "Season")
        
        

    }
    
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
