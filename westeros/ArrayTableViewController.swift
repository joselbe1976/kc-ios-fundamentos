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
    weak var delegate : ArrayTableViewDelegate<Element>?  //referencia al navegador, lo pongo weak

    
    init(datasource : ArrayDataSource<Element>, delegate: ArrayTableViewDelegate<Element>, style: UITableViewStyle, title: String){
        self.dataSource = datasource
        self.delegate = delegate
        
        
        super.init(style: style)

        //chapu
        
        delegate.vcPadre = self
        
        //datasource de la vista
        tableView.dataSource = self.dataSource
        //tableView.delegate = self.delegate
        
        self.title = title
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //registro las posibles celdas personalizadas e identificadores de reuso
        tableView.register(UINib(nibName: "HousesTableViewCell", bundle: nil), forCellReuseIdentifier: "House")
        tableView.register(UINib(nibName: "HousesTableViewCell", bundle: nil), forCellReuseIdentifier: "Season")
        
        //color de fondo
        tableView.backgroundColor = UIColor.black

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Ejecutamos la clausura
        print("selecciona celda")
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
