# Step 8 - Enums

## Objective

Learn how to represent a fixed set of related states using enums.

---

## Topics

### Enum

An enum defines a type with a fixed set of possible values.

```swift
enum TrafficLight {
    case red
    case yellow
    case green
}
```

---

### Switch with Enums

Enums work naturally with `switch`.

```swift
switch light {
case .red:
    print("Stop")
case .yellow:
    print("Ready")
case .green:
    print("Go")
}
```

When all cases are covered, `default` is not required.

---

### Raw Values

Each case can have a constant raw value.

```swift
enum HTTPStatus: Int {
    case ok = 200
    case notFound = 404
}
```

Access the raw value:

```swift
HTTPStatus.ok.rawValue
```

Create an enum from a raw value:

```swift
HTTPStatus(rawValue: 404)
```

This returns an Optional because the value may not exist.

---

### Associated Values

Cases can store additional data.

```swift
enum LoginResult {
    case success(username: String)
    case failure(reason: String)
}
```

Extract associated values:

```swift
switch result {
case .success(let username):
    print(username)

case .failure(let reason):
    print(reason)
}
```

---

### CaseIterable

Allows iterating over every case.

```swift
enum Season: CaseIterable {
    case spring
    case summer
    case autumn
    case winter
}

for season in Season.allCases {
    print(season)
}
```

---

## Raw Value vs Associated Value

### Raw Value

- Constant
- Belongs to the enum case
- Accessed using `rawValue`

Example:

```swift
case ok = 200
```

---

### Associated Value

- Dynamic
- Belongs to each enum instance
- Extracted with `switch`

Example:

```swift
case downloading(progress: Double)
```

---

## Mini Project

### Student Status

- Create a `StudentStatus` enum
- Use `switch` to display different messages
- Create a `LoginResult` enum with associated values

---

## Swift vs Java/Python

### Java

Enums usually represent fixed constants.

```java
enum Direction {
    NORTH, SOUTH
}
```

### Python

Python has enums, but associated values are not a built-in enum feature in the same way as Swift.

### Swift

Enums can represent states **and** carry additional data, making them much more expressive.

---

## Key Takeaways

- Enums create custom types with a limited number of valid values.
- Use enums instead of strings for fixed states.
- Raw values are constant.
- Associated values are dynamic.
- `CaseIterable` makes iteration easy.

---

## Common Mistakes

- Using `String` instead of an enum for fixed states.
- Confusing raw values with associated values.
- Forgetting to handle every enum case in a `switch`.
- Trying to use `rawValue` on enums that only have associated values.