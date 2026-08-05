# Step 9 - First SwiftUI Project

## Objective

Create the first SwiftUI project and understand its basic structure.

---

## Topics

### SwiftUI App

A SwiftUI application starts from a type marked with the `@main` attribute.

```swift
@main
struct HelloSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

`@main` marks the entry point of the application.

---

### ContentView

`ContentView` is the first screen displayed by the app.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

A `View` describes how the user interface should look.

---

### body

Every SwiftUI view must provide a `body`.

```swift
var body: some View
```

The `body` describes the UI hierarchy of the view.

---

### VStack

`VStack` arranges views vertically.

```swift
VStack {
    Text("A")
    Text("B")
}
```

Output:

```
A
B
```

---

### HStack

`HStack` arranges views horizontally.

```swift
HStack {
    Text("A")
    Text("B")
}
```

Output:

```
A  B
```

---

### Views

Views can contain other views.

```swift
VStack {
    Image(systemName: "globe")
    Text("Hello")
}
```

SwiftUI builds the interface from these nested views.

---

### View Builder

Only views can become part of the UI hierarchy.

For example:

```swift
print("Hello")
```

cannot appear as a view because it returns `Void`, not a `View`.

Conditional views using `if` are supported by SwiftUI's view-building system.

---

## Key Takeaways

- A SwiftUI app starts from a type marked with `@main`.
- `ContentView` is a SwiftUI view.
- Every view describes its UI inside `body`.
- `VStack` stacks views vertically.
- `HStack` stacks views horizontally.
- SwiftUI builds the UI from nested views instead of imperative drawing code.