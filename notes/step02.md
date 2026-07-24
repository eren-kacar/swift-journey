# Step 2 - Control Flow

## Objective

Learn how to make decisions in Swift using conditional statements and logical operators.

---

## Topics

### Comparison Operators

| Operator | Description |
|----------|-------------|
| `==` | Equal to |
| `!=` | Not equal to |
| `>` | Greater than |
| `<` | Less than |
| `>=` | Greater than or equal to |
| `<=` | Less than or equal to |

---

### Logical Operators

| Operator | Description |
|----------|-------------|
| `&&` | Logical AND |
| `||` | Logical OR |
| `!` | Logical NOT |

---

### if / else

Used to execute different code depending on whether a condition is true or false.

```swift
if score >= 50 {
    print("Passed")
} else {
    print("Failed")
}
```

---

### else if

Used when multiple conditions need to be checked.

```swift
if score >= 90 {
    print("A")
} else if score >= 80 {
    print("B")
} else {
    print("F")
}
```

---

### switch

Used to compare one value against multiple possible cases.

```swift
switch day {
case 1:
    print("Monday")
case 2:
    print("Tuesday")
default:
    print("Invalid day")
}
```

Unlike Java, Swift does **not** require `break` after each case.

---

### Range Operators

Closed range:

```swift
1...10
```

Half-open range:

```swift
1..<10
```

Example:

```swift
case 90...100:
```

---

### Ternary Operator

A shorter way to write a simple `if-else`.

```swift
let status = isOnline ? "Online" : "Offline"
```

---

## Mini Project

### Student Eligibility Checker

Requirements:

- Age ≥ 18
- GPA ≥ 3.0
- English Level = B1

The program determines whether a student is eligible for an internship.

---

## Key Takeaways

- Swift conditions must always evaluate to a `Bool`.
- `switch` statements must be exhaustive.
- `switch` does not require `break`.
- Use `&&`, `||`, and `!` to combine conditions.
- The ternary operator is useful for simple decisions.
- Prefer clear and readable conditions over overly complex expressions.