// Fundamentos IOS
// ---------------------------------------------


// Valores , "bindings" & REPL

let answer = 40 + 4

//Siempre mejor let (inmutable) que var (Variable)
var doonaMobile = "Soy una variable"
doonaMobile = "Hola soy Jose"



// Definir el tipo de forma explicita el tipo de una variable
let name : String = "Hola mundo 2"


// Inferencia de tipos, comun en lenguajes como Haskell, oCaml, f#, Kotlin etc., son lenguaje  funcionale con tipado estatico
let name2 = "Luke"


//Usamos typeAlias, es dar un "mote"

typealias Integer  = Int  //a los Int los quiero llamar Integer

let num2 : Integer = 12

dump(num2)
type(of: num2)

typealias Author = String

//ahora podemos usarlo, en el programa, y si mañana debe ser algo mas complejo solo se cambia la definicion. Se puede usar como tipo en funciones o cualquier cosa en el programa


//El simbolo Anónimo

let _ = "Hola mundillo"




// ---------------- Funciones ---------------

func add (x: Int, y: Int) -> Int{
    return x + y
}

add(x: 12, y: 8)


// nombres internos y externos
func  fraction (numerador a: Double, denominador b : Double) -> Double{
    return a / b
}

fraction(numerador: 12, denominador: 4)


//sin nombres externos
func suma42(_ a: Int)->Int{
    return a + 42;
}

suma42(5)



// --------Crear nuevos Tipos---- ----------

/*:
 * Tuplas
 * Structs
 * Classes
 * Enums
 */


// Tuplas. Listas de distintos tipos, uno detras del otro

var httpResponse = ("OK",200)

httpResponse.1
httpResponse.0
type(of: httpResponse.0)







