# Step 10.2 - Layout with Stacks

## Objective

Learn how to build layouts by combining stacks and controlling spacing and alignment.

---

## Topics

### HStack

Arranges views horizontally.

```swift
HStack {
    Image(systemName: "person")
    Text("Eren Kaçar")
}
```

---

### VStack

Arranges views vertically.

```swift
VStack {
    Text("Name")
    Text("Job")
}
```

---

### Nested Stacks

Stacks can contain other stacks because stacks are also Views.

Example:

```swift
HStack {
    Image(systemName: "person")

    VStack {
        Text("Eren Kaçar")
        Text("Computer Engineering Student")

        HStack {
            Image(systemName: "mappin")
            Text("Muğla")
        }
    }
}
```

Complex interfaces are built by combining simple stacks.

---

### Spacer

A Spacer takes all available remaining space.

Example:

```swift
VStack {
    Text("Top")

    Spacer()

    Text("Bottom")
}
```

Spacer can be used in both VStack and HStack.

---

### spacing

The spacing parameter controls the distance between child views.

```swift
HStack(spacing: 24) {
    ...
}
```

Using `spacing` is usually cleaner than adding padding to every child view.

---

### alignment

Alignment controls how child views are aligned.

```swift
VStack(alignment: .leading) {
    ...
}
```

Common values:

- `.leading`
- `.center`
- `.trailing`

For HStack:

```swift
HStack(alignment: .top) {
    ...
}
```

Alignment determines how views are positioned on the opposite axis.

---

## View Tree

SwiftUI layouts are built as a tree of views.

Example:

```text
HStack
├── Image
└── VStack
    ├── Text
    ├── Text
    └── HStack
        ├── Image
        └── Text
```

Thinking in terms of a View Tree makes complex layouts much easier to understand.

---

## Key Takeaways

- HStack arranges views horizontally.
- VStack arranges views vertically.
- Stacks can contain other stacks.
- Spacer occupies the remaining available space.
- spacing controls the distance between child views.
- alignment controls how child views are aligned.
- Every SwiftUI interface can be viewed as a tree of nested views.