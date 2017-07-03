
//: [Previous] (@previous)


//: Funcion con mas de un valor de retorno

func intDiv( _ a: Int, _ b: Int) -> (cociente : Int, resto : Int){
    return ((a/b), (a%b))
}

intDiv(3,2).cociente



//: Servidor web recibe un request y devuelve un response

typealias HTTPStatus = (code: Int, text: String)
typealias HTTPRequest = String
typealias HTTPResponse = (body: String, status: HTTPStatus)

func httpServer(request : HTTPRequest) -> HTTPResponse{
    //habra que poner el codigo de verdad...
    return ("It Worked!", (200, "OK"))
}

let response = httpServer(request: "index.html")
dump(response)


// usamos "patter Matching" para "desensamblar" la tupla en varias variables

let (cociente, resto) = intDiv(5, 2)
cociente
resto

// si o quiero el cociente...
let (_, resto2) = intDiv(5, 2)



// Tuplas de N Elementos

(3,4,"kjshda") //3 tupla
(1,2,3,"pee") // 4 tupla
(1) // 1 tupla. NO existe
()  // 0 tupla Pues si existe. Significa nada, es como void en otros lenguajes

func test() -> (){
    
}

func test1(){
    
}

func test2() -> Void{
    
}

let uno = test()
let dos = test1()
let tres = test2()





//: [Next](@next)

