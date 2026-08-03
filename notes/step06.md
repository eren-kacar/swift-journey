# Step 6 - Structs

## Objective

Learn how to group related data and behavior using structs.

---

## Topics

### Struct

A struct is a custom data type that groups related properties and methods into a single unit.

```swift
struct Student {
    var name: String
    var age: Int
}
```

Create an instance:

```swift
let student = Student(
    name: "Eren",
    age: 22
)
```

Access properties:

```swift
print(student.name)
```

---

### Properties

Properties store data inside a struct.

```swift
var title: String
var pages: Int
```

---

### Methods

Structs can define functions called methods.

```swift
func introduce() {
    print("Hi! I'm \(name).")
}
```

Call a method:

```swift
student.introduce()
```

---

### Computed Properties

Computed properties calculate values instead of storing them.

```swift
var area: Double {
    width * height
}
```

Another example:

```swift
var isHonorStudent: Bool {
    gpa >= 3.5
}
```

Unlike stored properties, computed properties always return a value based on other properties.

---

## Mini Project

### Student Manager

Features:

- Create a custom `Student` struct
- Store student information
- Introduce the student
- Calculate honor student status using a computed property

---

## Swift vs Java/Python

### Java

```java
class Student {
    String name;
    int age;
}
```

### Python

```python
class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age
```

### Swift

```swift
struct Student {
    var name: String
    var age: Int
}
```

Swift encourages using `struct` as the default choice unless reference semantics are required.

---

## Key Takeaways

- Structs group related data together.
- Structs can contain both properties and methods.
- Computed properties calculate values on demand.
- Swift prefers `struct` over `class` in many situations.
- Many Swift standard library types (`String`, `Array`, `Dictionary`) are structs.

---

## Common Mistakes

- Storing values that should be computed.
- Creating multiple variables instead of a single model.
- Confusing methods with computed properties.
- Assuming `struct` behaves the same as a `class`.