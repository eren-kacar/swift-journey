# Step 7 - Classes

## Objective

Understand reference semantics and learn when to use classes instead of structs.

---

## Topics

### Class

A class is a reference type.

```swift
class User {
    var name: String

    init(name: String) {
        self.name = name
    }
}
```

---

### Initializer

Classes use `init` to initialize stored properties.

```swift
init(name: String) {
    self.name = name
}
```

---

### Methods

Classes can define methods.

```swift
func introduce() {
    print("Hello!")
}
```

---

### Reference Semantics

Assigning one class instance to another variable does **not** create a copy.

```swift
let user1 = User(name: "Eren")
let user2 = user1
```

Both variables refer to the same object.

---

### Identity Operator

Use `===` to check whether two variables reference the same object.

```swift
user1 === user2
```

---

## Struct vs Class

### Struct

- Value type
- Copied when assigned
- Independent values
- Preferred by default

### Class

- Reference type
- Shared object
- Suitable for shared mutable state

---

## Mini Project

### Library System

Features:

- Create a `Book` class
- Borrow a book
- Observe shared state using two references

---

## Swift vs Java/Python

### Java

Everything is reference-based.

```java
Student s1 = new Student();
Student s2 = s1;
```

### Python

Objects are also reference-based.

```python
student2 = student1
```

### Swift

Swift offers both value types (`struct`) and reference types (`class`), allowing you to choose the most appropriate model.

---

## Key Takeaways

- Classes are reference types.
- Structs are value types.
- Use `struct` unless shared reference semantics are required.
- Two variables can reference the same class instance.
- `===` checks object identity.

---

## Common Mistakes

- Using `class` for simple data models.
- Forgetting that modifying one reference affects all references.
- Confusing equality (`==`) with identity (`===`).