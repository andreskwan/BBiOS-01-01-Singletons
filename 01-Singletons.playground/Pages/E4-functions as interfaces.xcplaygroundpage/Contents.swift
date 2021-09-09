//: [Previous](@previous)

import Foundation
import XCTest

XCTAssert(true)

struct LoggedInUser {
    let name: String
    let age: Int
}

typealias printUserName = (LoggedInUser) -> String
typealias printUserAge = (LoggedInUser) -> Int

let printName: printUserName = { (user: LoggedInUser) -> String in
    print("(user): \(user.name)")
    return user.name
}

let printAge: printUserAge = { (user: LoggedInUser) -> Int in
    print("(user): \(user.age)")
    return user.age
}

protocol Login {
    func login(name: String,
               age: Int,
               functionName: printUserName,
               functionAge: @escaping printUserAge) -> String
}

class ApiClient {
    var printAge: printUserAge!
//    var printName: printUserName!
    
    init() { }
}

extension ApiClient: Login {
    func login(name: String,
               age: Int,
               functionName: printUserName,
               functionAge: @escaping printUserAge) -> String {
        
        let mandy = LoggedInUser(name: name, age: 2)
        
        self.printAge = functionAge
//        self.printName = functionName
        functionAge(mandy)
        
        return functionName(mandy)
    }
}


let client = ApiClient()
client.login(name: "Miel", age: 2, functionName: printName, functionAge: printAge)

let mandy = LoggedInUser(name: "Mandy", age: 3)
let mittens = LoggedInUser(name: "Mittens", age: 1)

client.printAge(mandy)

//1
client.login(name: "Mandy", age: 3, functionName: printName, functionAge: printAge)

//2
client.login(name: "Mandy", age: 3, functionName: printName) { user in
    print("(user.age): \(user.age)")
    print("(user.name): \(user.name)")
    return user.age
}

//3 $0
client.login(name: "Mandy", age: 3, functionName: printName) {
    print("(user.age):  \($0.age)")
    print("(user.name): \($0.name)")
    return $0.age
}

let printAgeOlder: printUserAge = { (user: LoggedInUser) -> Int in
    let newAge = user.age + 10
    print("(user): \(newAge)")
    return newAge
}

client.login(name: "Mittens", age: 1, functionName: printName, functionAge: printAgeOlder)
client.printAge(mittens)

//: [Next](@next)
