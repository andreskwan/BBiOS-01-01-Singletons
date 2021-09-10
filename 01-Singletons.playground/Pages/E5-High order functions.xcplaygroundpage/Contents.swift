//: [Previous](@previous)

import Foundation
let mandy = "Mandi"

let characteres = mandy.map{ $0 }
characteres
let variable = characteres.reduce(""){ $0 + String($1) }
variable

var vowels = mandy.filter{"aeiou".contains($0)}

let vowels2 = "Kira".map{ char -> String? in
    if("aeiou".contains(char)) {
        return String(char)
    }
    return nil
}.compactMap{ $0 }

vowels2

let eages = [(name: "Kira",6),(name: "Mandy",2),(name: "Miel",1)].map{ $0.name }
eages

let informationalResponses = (190...199)
informationalResponses.map{ print($0)}

let openinformationalResponses = (0..<10)
//: [Next](@next)
