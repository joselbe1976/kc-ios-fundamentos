//: [Previous](@previous)

//import UIKit

class AnonymousBook {
    
    let title : String
    
    //inicializador por defecto
    init(title : String) {
        self.title = title
    }
}


// en Swift una clase puede tener 0 ó 1 superclase
class Libro : AnonymousBook{
    
    let autores : [String]  //array de cadenas
    
    //inicializador designado. Solo en la clase se puede definir
    init(title : String, autores : [String]) {
    
        //primero inicializas tus propiedades
        self.autores = autores;
 
        //ultimo paso a super
        super.init(title: title)

    }

    
}

extension Libro{
    
    // Inicializadores de convenencia.
    
    convenience init (title: String, autor : String){
        self.init(title: title, autores: [autor])
    }
    
}

// Clase final, no permite extender. Poner siempre

final class BokCharacther{
    let name : String
    let book : Libro
    
    init(name: String , book : Libro) {
        self.name = name
        self.book = book
    }
}



// tambien implementan protocolos, lo mismo que en Struct

extension BokCharacther : CustomStringConvertible{
    var description: String {
        return "\(name) y libro \(self.book.title)"
        
    }
}


let uno = BokCharacther(name: "Jose Luis", book: Libro(title: "Señor anillos", autor: "Pedro Reyes"))

print(uno)





// SobreEscritura de metodos

/*
class MyClas : UIVIew{
    
    override func viewDidHide(){
        super.viewDidHide()
    }
    
}
 */
 






















//: [Next](@next)
