//: [Previous](@previous)

import Foundation

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("init - \(name) is being initialized")
    }
    
    deinit {
        print("deinit - \(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference2 = nil
reference3 = nil
reference1 = nil


//: [Next](@next)
