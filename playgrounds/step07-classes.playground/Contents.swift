import Foundation

//struct User {
//    var name: String
//}
//
//class User {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}


class Car {
    var model: String
    var brand: String
    
    init(model: String, brand: String){
        self.model = model
        self.brand = brand
    }
    
    func displayInfo(){
        print("Model: \(model)")
        print("Brand: \(brand)")
    }
}

let car = Car(model: "Model 3", brand: "Tesla")
car.displayInfo()

struct Counter{
    var value: Int
    
    mutating func increment(){
        value += 1
    }
}
var counter = Counter(value: 0)

counter.increment()
counter.increment()

print(counter.value)


class Book {
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(title: String, author: String, isBorrowed: Bool){
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func borrow(){
        isBorrowed = true
    }
}

let book1 = Book (
    title: "Masumiyet Müzesi",
    author: "Orhan Pamuk",
    isBorrowed: false
)

let book2 = book1

book2.borrow()

print(book1.isBorrowed)
print(book2.isBorrowed)
