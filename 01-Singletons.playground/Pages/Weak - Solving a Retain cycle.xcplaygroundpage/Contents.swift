//: [Previous](@previous)

import Foundation

class Person {
    let name: String
    unowned var apartment: Apartment?
    
    init(name: String) { self.name = name
//        print("init - \(name) is being initialized")
        print("init - Person")
    }
    
    deinit {
//        print("deinit - \(name) is being deinitialized")
        print("deinit - Person")
    }
}

class Apartment {
    let unit: String
    unowned(unsafe) var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
        print("init - Apartment")
    }
    
    @discardableResult
    func printTenatName() -> String? {
        print("Tenant Name: \(String(describing: tenant?.name))")
        return tenant?.name
    }
    
    deinit {
//        self.tenant = nil
//        print("deinit - Tenat Name: \(String(describing: tenant?.name))")
        print("deinit - Apartment")
    }
}

var michael: Person = Person(name: "Michael")
var tempPerson: Person = Person(name: "Temporal")
//    Person(name: "Michael", apto:Apartment(unit: "unit 5", tenat:michael))
var apto: Apartment = Apartment(unit: "unit 5")

michael.apartment = apto
apto.tenant = michael

michael = tempPerson

apto.printTenatName()
//apto = nil

//: [Next](@next)
