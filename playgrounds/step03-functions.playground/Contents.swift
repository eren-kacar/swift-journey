import Foundation

func sayHello(name: String){
    print("Hello, \(name).")
}

sayHello(name: "Swift")


func calculateArea(width: Double, height: Double) -> Double{
    return height * width
}


func isAdult(age: Int) -> Bool{
    return age >= 18
}


func calculateAverage(math: Double, physics: Double) -> Double{
    return (math+physics)/2
}


//Student GPA Calculator

func calculateAvg(math: Double, physics: Double) -> Double{
    return (math+physics)/2
}

func calculateLetterGrade(score: Double) -> String {
    if score >= 90 {
        return "A"
    }else if score >= 80{
        return "B"
    }else if score >= 70{
        return "C"
    }else{
        return "F"
    }
}

func isEligibleForScholarship(
    average: Double,
    attendance: Int,
    disciplinaryPenalty: Bool
) -> Bool {
    if average>90.0 && attendance>=90 && disciplinaryPenalty==false{
        return true
    }else{
        return false
    }
}

let average = calculateAverage(math: 90, physics: 80)

let grade = calculateLetterGrade(score: average)

let scholarship = isEligibleForScholarship(
    average: average,
    attendance: 95,
    disciplinaryPenalty: false
)

print("Average: \(average)")
print("Letter Grade: \(grade)")
print("Scholarship: \(scholarship)")
