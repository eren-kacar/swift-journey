import Foundation

struct Book {
    var title: String
    var author: String
    var pages: Int
    
    func displayInfo() {
        print("Book: \(title)")
        print("Author: \(author)")
    }
}


struct Rectangle {
    let width: Double
    let height: Double
    
    var area: Double {
        width * height
    }
}


//Student Manager
struct Student {
    var name: String
    var age: Int
    var gpa: Double
    var department: String
    
    var isHonorStudent: Bool{
        gpa >= 3.5
    }
    
    func introduce(){
        print("Hi! I'm \(name). I'm \(age) years old and I study \(department).")
    }
}

let student = Student (
    name: "Eren",
    age: 22,
    gpa: 3.1,
    department: "Computer Engineering"
)

student.introduce()
print(student.isHonorStudent)
