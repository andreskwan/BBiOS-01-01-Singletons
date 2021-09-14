//: [Previous](@previous)

import Foundation

class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
    deinit {
        print("deinit \(self.name)")
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
    deinit {
        print("deinit \(self.name)")
    }
}

var mathDepartment = Department(name: "Math")

var algebra: Course? = Course(name: "Algegra", in: mathDepartment)
var calculus: Course? = Course(name: "Calculus", in: mathDepartment)

algebra?.nextCourse = calculus

calculus = nil
//ARC never sets an unowned reference’s value to nil.
algebra?.nextCourse = nil
algebra?.nextCourse
//var courses = [algebra, calculus]
//: [Next](@next)
