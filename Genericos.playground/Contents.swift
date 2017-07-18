//: Genericos

/*
    Son plantillas de código que se completan en la compilacion
 
    * Funciones Genericas
    * clases genericas
    * Estructuras y Enums genericas
    * Protocolos genericos
 
 
 */


// Funciones genericas

func swapInt( a: inout Int, b: inout Int){
        let aux = a
        a = b
        b = aux
}

var a = 3
var b = 2
swapInt(a: &a, b: &b) //se pasan por referencia puntero al valor real en ram
a
b



// Lo hacemos que funcione con cualquier cosa

func swapGeneric <A>( a: inout A, b: inout A){
    let aux = a
    a = b
    b = aux
}


var c1 = "Hola"
var c2 = "Adios"
swapGeneric(a: &c1, b: &c2)
c1
c2



// Para genericos se puede usar no solo una letra sino palabras
func zzzz <HOLA>( a: HOLA){
    
}




// ------------------- structs --------------------


struct Pair<First, Second>{
    let first : First
    let second : Second
}

let p = Pair(first: 4, second: "Hola mundo")
let p2 = Pair(first: "hola" , second: [12 , 13, 15])


// restricicones a tipos. Indico que Key debe tener implemente Hashable

struct hasPair<Value, Key : Hashable>{
    let value : Value
    let key : Key
}

// oara mas de una restriccion usar sintaxis del where. Vwr libro

//mezcla espefifico con generico

func MixePair <T> (a: Int, B: T){
    
}





// ------ protocolo ---------


protocol Bar{
    associatedtype Element
    
}



