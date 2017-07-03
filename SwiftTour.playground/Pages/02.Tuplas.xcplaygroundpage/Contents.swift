
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




//: [Next](@next)

