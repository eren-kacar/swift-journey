import Foundation

var favoriteGames = [
    "Minecraft",
    "Valorant",
    "EA FC"
]

favoriteGames.append("Red Dead Redemption 2")
favoriteGames.remove(at: 1)
print(favoriteGames.count)
print(favoriteGames)


var student = [
    "Name" : "Eren",
    "Age" : "22",
    "University" : "MSKU"
]

if let age = student["Age"]{
    print(age)
}

var numbers: Set = [1, 2, 3, 4, 5]
numbers.insert(2)
numbers.insert(3)
print(numbers)


//Console ToDo Manager
var todos = [
    "Study Swift",
    "Go to the gym",
    "Read a book"
]

print("===== TODO LIST =====")
for task in todos{
    print("- \(task)")
}
print()

todos.append("Learn SwiftUI")
todos.remove(at: 0)
print("Total tasks: \(todos.count)")
print("Contains 'Study Swift': \(todos.contains("Study Swift"))")
