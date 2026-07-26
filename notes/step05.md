# Step 5 - Collections

## Objective

Learn how to store, manage, and manipulate multiple values using Swift collections.

---

## Topics

### Arrays

An Array stores multiple values of the same type in an ordered collection.

```swift
var fruits = ["Apple", "Banana", "Orange"]
```

Common methods:

```swift
fruits.append("Mango")
fruits.remove(at: 1)
fruits.count
fruits.isEmpty
fruits.contains("Apple")
```

Loop through an array:

```swift
for fruit in fruits {
    print(fruit)
}
```

---

### Dictionaries

A Dictionary stores key-value pairs.

```swift
var student = [
    "Name": "Eren",
    "University": "MSKU"
]
```

Accessing a value:

```swift
student["Name"]
```

Dictionary lookups return an Optional because the key may not exist.

```swift
if let name = student["Name"] {
    print(name)
}
```

---

### Sets

A Set stores unique values.

```swift
var numbers: Set = [1, 2, 3]

numbers.insert(4)
numbers.insert(2)
```

Duplicate values are ignored.

---

## Mini Project

### Console ToDo Manager

Features:

- Store tasks in an Array
- Display all tasks
- Add a new task
- Remove a task
- Count tasks
- Check if a task exists

---

## Swift vs Java/Python

### Java

```java
ArrayList<String> fruits = new ArrayList<>();
```

### Python

```python
fruits = ["Apple", "Banana"]
```

### Swift

```swift
var fruits = ["Apple", "Banana"]
```

Swift automatically infers the element type.

---

## Key Takeaways

- Arrays keep elements in order.
- Dictionaries store data as key-value pairs.
- Dictionary lookups return Optionals.
- Sets automatically prevent duplicate values.
- Collections make it easy to work with multiple pieces of data.

---

## Common Mistakes

- Accessing a Dictionary value without handling the Optional.
- Assuming Sets preserve insertion order.
- Removing an element using an invalid index.
- Using an Array when unique values are required.