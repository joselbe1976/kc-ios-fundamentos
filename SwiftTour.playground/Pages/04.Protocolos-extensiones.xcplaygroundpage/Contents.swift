//: [Previous](@previous)


/*
    Extensiones:  
        a) Capacidad de extender clases o structures
        b) Moduladizar clases o Structs
 
    No puedes añadir nada que pueda cambiar el layaout en memoria de lo que estas cambiando. Por ejemplo no se puede añadir Variables de instancia, porque cambias el tamaño en memoria.
 
    No se pueden añadir ciertos tipos de inicializadores.


*/


//añadimos compartamiento de una struct existente

//MARK : - Extension entero
extension Int{
    func invert() -> Int{
        return -self
    }
}

42.invert()

// ---- > No se puede hacer
/*
extension Int{
    var a : Double
    
}
 */



struct Complet{
    var x : Double
    var y : Double
}

extension Complet{
    
    //variable computada
    var magnitude : Double{
        get{
            return x/y
        }
        /*
        set{
            self.x =  newValue
        }
        */
    }
}



// MARK: Protocolos (interface de Java)
/*
    Swift esta hecho por protocolos y debemos mirar los siguientes:
    - CustomStringPresentable. Hace representable un objeto
    - Equatable              . Quien adopta este, se comprube si dos oinstancias son iguales o equivalentes
    - Hashable               . Quien implemente tiene un valor Hash.
    - Comparable.            . Determina si uno es MAS que otro, vital para ordenaciones etc.
 */


extension Complet : CustomStringConvertible{
    var description: String {
        return "Ahi va...(\(x), \(y))"
    }
}

let a = Complet(x: 12, y: -3)

let b = Complet(x: 12, y: -3)




extension Complet : Equatable{
    static func ==(lhs: Complet, rhs: Complet) -> Bool{
            return  (lhs.x == rhs.x && lhs.y == rhs.y)
    }
}

a == b



// MARK :  PROTOCOLOS

//Creamos mi propio protocolo
protocol Aswerable{
    var answer : Int{get}
    
}

//implementamos por defecto se hace por defecto en una extension
extension Aswerable{
    var answer : Int{
        return 42
    }
}



// A partir de ahora cualquie tipo que dopte nuestro proticlo debe implementar la opcion


extension String : Aswerable{}

"LA RESPUESta a la vida".answer

extension Complet : Aswerable{
    var answer : Int{
        return 0
    }
}



//: [Next](@next)
