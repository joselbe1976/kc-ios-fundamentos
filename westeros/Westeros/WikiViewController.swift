//
//  WikiViewController.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 17/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class WikiViewController: UIViewController {

    //outlets
    
    @IBOutlet weak var browser: UIWebView!
    @IBOutlet weak var progress: UIActivityIndicatorView!
    
    //Modelo
    let model : House

    //inicializador
    init(modelo : House){
        self.model = modelo
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.browser.delegate = self //Delegado somos nosotros
        
        progress.isHidden = false
        progress.startAnimating()
        
        
        //soncrinizamos al cargar
        syncModelView()
      
    }
    
 
    // Sincronizacion de la vista
    func syncModelView(){
        title = "Wiki"
        self.browser.loadRequest(URLRequest(url: self.model.wiki))
    }
}


// Delegado del  WebView

extension WikiViewController : UIWebViewDelegate{
    
    // fin carga web
    func webViewDidFinishLoad(_ webView: UIWebView){
        progress.stopAnimating()
        progress.isHidden = true
    }
    
    // evitamos navegacion
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool{
        
        
        if ( navigationType == .linkClicked || navigationType == .formSubmitted){
            return false
        }
        
        return true
    }

}
