//: [Previous](@previous)

import Foundation

//func name(label parameterName:AnotherType) -> SomeType {
//    return SomeType()
//}

//closure - anonymous function
//Error - closure expression is unused
//let anonymousFunction = { (parameterName:AnotherType) -> SomeType in
//    return SomeType()
//}

func name(label parameterName:String) -> String {
    return ""
}

//closure - anonymous function
//Error - closure expression is unused
let anonymousFunction = { (parameterName:String) -> String in
    return parameterName
}

let printSomething = {
    print("Printed from a closure")
}

let printPet = { (label: String) in
    print(label)
}

anonymousFunction("hola")
anonymousFunction("Dog")

//func name() {
//    {
//        print("Printed from a name() closure")
//    }()
//}
//
//name()

func name(name:String = "default",
          completion: @escaping ((String) -> ()) = { _ in  }){
    print(name)
    completion(name)
}

func name(completion: ()->(),
          name: String = "default1") {
    print(name)
    completion()
}

//name(completion: printSomething)

//name(name: "hola") {
//    printSomething()
//}

name()
//name(name: "bird")
name(completion: {
   printSomething()
}, name: "algo")

let something = {
    printSomething()
 }

//something == printSomething

//name(name: "cat", completion: printPet)

let perro = { (label:String) in
    printPet(label)
    print("hola perro")
}

name(name: "printSomething") { name in
    perro(name)
    printSomething()
}

name(name: "perro", completion: perro)

name(name: "printSomething") { printSomething()
    perro("")
}

name(name: "perro", completion: printSomething )
//: [Next](@next)
