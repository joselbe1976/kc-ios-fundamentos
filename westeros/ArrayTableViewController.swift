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
    let delegate : ArrayTableViewDelegate<Element>

    
    init(datasource : ArrayDataSource<Element>, delegate: ArrayTableViewDelegate<Element>, style: UITableViewStyle, title: String){
        self.dataSource = datasource
        self.delegate = delegate
        
        
        super.init(style: style)

        //chapu
        
        delegate.vcPadre = self
        
        //datasource de la vista
        tableView.dataSource = self.dataSource
        tableView.delegate = self.delegate
        
        self.title = title
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
