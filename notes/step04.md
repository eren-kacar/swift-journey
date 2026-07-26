# Step 4 - Optionals

## Objective

Understand how Swift safely handles the absence of values using Optionals.

---

## Topics

### Optionals

An Optional is a type that can either contain a value or no value (`nil`).

```swift
var name: String?
```

---

### nil

`nil` means that a variable currently has no value.

```swift
var name: String?

name = "Eren"
name = nil
```

---

### Force Unwrapping

Force unwrapping uses `!` to access the value inside an Optional.

```swift
print(name!)
```

⚠️ If the Optional is `nil`, the program crashes.

Use it only when you are absolutely sure the value exists.

---

### Optional Binding

The safest way to access an Optional.

```swift
if let name = name {
    print(name)
}
```

Swift unwraps the value only if it exists.

---

### Nil Coalescing Operator

Provides a default value when an Optional is `nil`.

```swift
let username = name ?? "Guest"
```

If `name` is `nil`, `"Guest"` is used instead.

---

## Mini Project

### User Profile Viewer

Features:

- Display user's name
- Display user's email
- Display user's phone number
- Show **"Not Available"** when a value is `nil`

---

## Key Takeaways

- Optionals can store either a value or `nil`.
- Never force unwrap (`!`) unless you are certain the value exists.
- Prefer Optional Binding (`if let`) for safe access.
- Use the Nil Coalescing Operator (`??`) to provide default values.
- Optionals are one of Swift's core safety features.

---

## Common Mistakes

- Force unwrapping a `nil` value.
- Forgetting that an Optional must be unwrapped before use.
- Using `!` instead of `if let` in simple situations.
- Not providing a default value when one is appropriate.