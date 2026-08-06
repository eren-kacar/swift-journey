# Step 10.1 - Views & Modifiers

## Objective

Build the first SwiftUI interface and understand how views and modifiers work.

---

## Topics

### View

Everything visible on the screen is a View.

Examples:

- Text
- Image
- VStack

A View describes a part of the user interface.

---

### Text

Displays text on the screen.

```swift
Text("Hello, World!")
```

---

### Image

Displays an image.

For SF Symbols:

```swift
Image(systemName: "person")
```

---

### VStack

Stacks views vertically.

```swift
VStack {
    Text("Name")
    Text("Job")
}
```

Views appear from top to bottom.

---

## Modifiers

Modifiers change the appearance or behavior of a View.

Example:

```swift
Text("Eren Kaçar")
    .font(.largeTitle)
    .foregroundStyle(.blue)
```

---

### font()

Changes the text font.

```swift
.font(.largeTitle)
```

---

### foregroundStyle()

Changes the foreground style of a View.

It can be applied to different kinds of views such as Text and Image.

```swift
.foregroundStyle(.red)
```

---

### padding()

Adds spacing around a View.

```swift
.padding()
```

or

```swift
.padding(.bottom, 16)
```

---

## Modifier Scope

A modifier affects the View it is attached to.

```swift
Text("Hello")
    .foregroundStyle(.red)
```

Only this Text becomes red.

If a modifier is attached to a container, it can affect its child views.

```swift
VStack {
    Text("Hello")
    Text("World")
}
.foregroundStyle(.red)
```

Both Text views become red.

---

## Modifier Order

Modifier order can change the final result.

```swift
Text("Eren")
    .background(.yellow)
    .padding()
```

The background is applied first, then padding is added.

```swift
Text("Eren")
    .padding()
    .background(.yellow)
```

Padding is applied first, then the background covers the padded area.

---

## Key Takeaways

- Everything visible in SwiftUI is a View.
- VStack arranges views vertically.
- Modifiers are chained to customize views.
- A modifier affects the View it is attached to.
- Modifier order may change the final appearance.