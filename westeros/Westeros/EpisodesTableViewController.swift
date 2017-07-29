//
//  EpisodesTableViewController.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 28/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class EpisodesTableViewController: UITableViewController {

    
    private var _model : [Episode]
    
  
    init(modelo : [Episode]){
        self._model = modelo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //registramos la celda
        tableView.register(UINib(nibName: "HousesTableViewCell", bundle: nil), forCellReuseIdentifier: "Episode")

        // Titulo
        self.title = "Episodes"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return _model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Episode", for: indexPath) as! HousesTableViewCell

        let modelo = _model[indexPath.row]
        
        //IMAGTEN REDIMENSIONADA
        cell.imageView?.image =  resizeImage(image: modelo.image, targetSize: CGSize(width: 90, height: 100))
        cell.titulo.text = modelo.name
        cell.descrip.text  = modelo.descrip

        return cell
    }
 
    // Cambio el Ancho
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    // al seleccionar ponemos un view controller de detalle
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelo = _model[indexPath.row]
        
        let vc = EpisodeViewController(modelo: modelo)
        navigationController?.pushViewController(vc, animated: true)
        
        
    }

}
