import Foundation

// MARK: - Age Check
//let age = 22
//
//if age >= 18 {
//    print("You are an adult.")
//}else{
//    print("You are a minor.")
//}

// MARK: - Grade Evaluation
let score = 81

if score >= 90 {
    print("A")
}else if score >= 80{
    print("B")
}else if score >= 70{
    print("C")
}else{
    print("F")
}


// MARK: - Day of the Weeklet day = 4
let day = 4
switch day {
case 1:
    print("Monday")
case 2:
    print("Tuesday")
case 3:
    print("Wednesday")
case 4:
    print("Thursday")
case 5:
    print("Friday")
case 6:
    print("Saturday")
case 7:
    print("Sunday")
default:
    print("Invalid day")
}

// MARK: - Online Status
let isOnline = true
let status = isOnline ? "Online" : "Offline"
print(status)


// MARK: - Mini Project: Student Eligibility Checker
let age = 22
let gpa = 3.15
let englishLevel = "B1"

if age >= 18 && gpa >= 3.00 && englishLevel == "B1" {
    print("The student is eligible for an internship")
}else{
    print("The student is not eligible for an internship")
}
