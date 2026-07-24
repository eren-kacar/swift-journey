# Step 3 - Functions

## Objective

Learn how to write reusable and organized code using functions.

---

## Topics

### Basic Function

A function is a reusable block of code that performs a specific task.

```swift
func greet() {
    print("Hello!")
}
```

---

### Parameters

Functions can receive input values.

```swift
func greet(name: String) {
    print("Hello, \(name)!")
}
```

Call:

```swift
greet(name: "Eren")
```

---

### Multiple Parameters

```swift
func introduce(name: String, age: Int) {
    print("My name is \(name).")
}
```

---

### Return Values

Functions can return a value.

```swift
func add(a: Int, b: Int) -> Int {
    return a + b
}
```

---

### Bool Return

Instead of writing:

```swift
if age >= 18 {
    return true
} else {
    return false
}
```

Prefer:

```swift
return age >= 18
```

This is more concise and considered more "Swifty".

---

### External Parameter Names

Swift uses argument labels to make function calls more readable.

```swift
func square(of number: Int) -> Int {
    return number * number
}

square(of: 5)
```

---

## Mini Project

### Student GPA Calculator

Features:

- Calculate average
- Calculate letter grade
- Check scholarship eligibility

---

## Key Takeaways

- Functions help avoid code duplication.
- Functions should perform one specific task.
- Return values make functions reusable.
- Prefer descriptive parameter names.
- Return Boolean expressions directly when possible.

---

## Common Mistakes

- Creating multiple functions that do the same job.
- Printing inside every function instead of returning values.
- Using unclear function names.
- Returning `true` or `false` with unnecessary `if-else` blocks.