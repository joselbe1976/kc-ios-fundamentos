//: [Previous](@previous)

/* 
 Estructuras tienen 2 ventajas sobre las tuplas:
    - Componentes con nombre
    - Pueden tener métodos
 
 Por defecto todo en una structura es inmutable
 
 */

struct Complex {
    let x : Double
    let y : Double
    
    //inicializador por defecto
    init(real: Double, imagin : Double) {
        /*
         x = real
         y = imagin
        */
        
        (x, y) = (real, imagin)
    }
    
    // inicializador de convenencia
    init(real: Double) {
        self.init(real: real, imagin: 0) //nos aprocechamos del inicializador por defecto
    }
    
    
    // Metodos sobre operaciones complejas
    func magnitude() -> Double{
        return ((x * x) + (y * y)).squareRoot()
    }
    
}

// El compilador nos genera un inicializador por defecto
let a = Complex(real: 4, imagin: -3.2)



// Structuras son Inmutables

struct Point{
    var x : Double
    var y : Double

    mutating func moveTo(x : Double, y : Double){
        self.x = x
        self.y = y
    }
}


// Structs NUNCA se comparten entre dos variables etc, se envia un copia, no referencia como en las clases

var x1 : Int = 32
var x2 = x1 // X2 ahora es una copia independiente de X1
x1 = 0
x2

//Structs NO tienen Herencia



//: [Next](@next)
