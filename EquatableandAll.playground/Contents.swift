import UIKit
import Foundation

//Equatable
class Student:Equatable {
    var id = UUID()
    static func == (lhs: Student, rhs: Student) -> Bool {
        lhs.mark == rhs.mark
    }
    
    let name: String
    let mark: Int
    
    init(name: String, mark: Int) {
        self.name = name
        self.mark = mark
    }
    
    
}



// Comparable
/*class Student: Comparable  {
    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.mark < rhs.mark
    }
    
    static func > (lhs: Student, rhs: Student) -> Bool {
        return lhs.mark > rhs.mark
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.mark == rhs.mark
    }
    
    
    let name: String
    let mark: Int
    
    init(name: String, mark: Int) {
        self.name = name
        self.mark = mark
    }
    
    
}

let student1 = Student(name: "ABC", mark: 78)
let student2 = Student(name: "ABC", mark: 84)

if student1 < student2{
    print("student1 is less than student2")
}else if student1 > student2{
    print("student2 is less than student1")
}else {
    
}
*/

extension Student: Hashable  {
 
    func hash(into hasher: inout Hasher){
        hasher.combine(mark)
   
    }
}

let student1 = Student(name: "ABC", mark: 78)
let student2 = Student(name: "bnk", mark: 78)

var setStudent: Set<Student> = [student1,student2]
var try1 = Student(name: "ABC", mark: 78)

print(student1.hashValue)
print(student2.hashValue)

if setStudent.contains(try1)
{
    print("Contains")
}else{
    print("Not contains")
}

extension Student : Identifiable{
  
   
}

let student3 = Student(name: "cbn", mark: 90)
print(student3.id)
