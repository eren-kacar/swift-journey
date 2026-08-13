# Step 10.7 - Spacer and Flexible Layout

## Objective

Learn how `Spacer()` distributes available space inside SwiftUI stacks and understand the difference between flexible spacing and fixed spacing.

---

## Topics

### Spacer()

`Spacer()` is a flexible View that expands to occupy available space.

Its behavior depends on the Stack it is inside.

```swift
VStack {
    Text("A")
    Spacer()
    Text("B")
}
```

If the VStack has extra vertical space, the Spacer consumes it:

```text
A


    Spacer


B
```

---

## Spacer in VStack

`VStack` arranges Views vertically.

Therefore, a `Spacer()` inside a VStack consumes available **vertical** space.

```swift
VStack {
    Text("A")
    Spacer()
    Text("B")
}
```

Result:

```text
A

[ flexible vertical space ]

B
```

---

## Spacer in HStack

`HStack` arranges Views horizontally.

Therefore, a `Spacer()` inside an HStack consumes available **horizontal** space.

```swift
HStack {
    Text("Eren")
    Spacer()
    Image(systemName: "heart")
}
```

Result:

```text
Eren                         ❤️
```

The Spacer pushes the Image toward the trailing side.

---

## Spacer and Alignment

`Spacer()` can be used to push Views toward an edge.

Example:

```swift
HStack {
    Text("Profile")
    Spacer()
}
```

The Text stays toward the leading side.

To push a View toward the trailing side:

```swift
HStack {
    Spacer()
    Text("Profile")
}
```

The Text moves toward the trailing side.

---

## Spacer Does Not Automatically Create Space

A Spacer does not create unlimited space by itself.

It uses **available space provided by its parent**.

For example:

```swift
VStack {
    Text("A")
    Spacer()
    Text("B")
}
```

may show very little visible space if the VStack is only as large as its content.

Giving the VStack more height:

```swift
VStack {
    Text("A")
    Spacer()
    Text("B")
}
.frame(height: 300)
```

gives the Spacer extra space to consume.

---

## Multiple Spacers

Multiple Spacers can be used in the same Stack.

```swift
VStack {
    Text("A")
    Spacer()
    Text("B")
    Spacer()
    Text("C")
}
.frame(height: 300)
```

The available flexible space is distributed between the Spacers.

Conceptually:

```text
A

[ Spacer 1 ]

B

[ Spacer 2 ]

C
```

Under equal conditions, the Spacers receive approximately equal portions of the available space.

---

## Spacer(minLength:)

A minimum length can be specified:

```swift
Spacer(minLength: 20)
```

This means the Spacer should have at least 20 points of space when possible, while still being able to expand when more space is available.

It does not mean the Spacer will always be exactly 20 points.

---

## Spacer vs padding

`padding()` and `Spacer()` both create space, but they solve different problems.

### padding

```swift
Text("Hello")
    .padding(.bottom, 20)
```

Adds a fixed amount of space around a View.

The amount remains 20 points regardless of how much additional space the parent has.

### Spacer

```swift
VStack {
    Text("Hello")
    Spacer()
    Text("World")
}
```

Uses available flexible space inside the Stack.

The amount of space can grow or shrink depending on the available size.

---

## Spacer vs frame

`frame(maxWidth: .infinity)` and `Spacer()` can sometimes produce visually similar layouts, but they operate differently.

```swift
VStack(alignment: .leading)
    .frame(maxWidth: .infinity)
```

makes the VStack use the available horizontal width.

On the other hand:

```swift
HStack {
    Text("Hello")
    Spacer()
}
```

uses the Spacer to consume the remaining horizontal space.

The first changes the size of the View's frame.

The second distributes available space inside the Stack.

---

## Responsive Layout

One of the major advantages of `Spacer()` is flexible layout.

For example:

```swift
HStack {
    Text("Eren Kaçar")
    Spacer()
    Image(systemName: "heart")
}
```

The distance between the Text and Image changes depending on the available width.

This is more flexible than using a fixed spacing value.

---

## spacing vs Spacer

These are different concepts.

```swift
HStack(spacing: 24) {
    Text("A")
    Text("B")
}
```

creates a fixed 24-point distance between the Views.

Whereas:

```swift
HStack {
    Text("A")
    Spacer()
    Text("B")
}
```

uses the remaining available space between them.

---

## Important Rule

A useful rule for remembering Spacer is:

```text
VStack → Spacer distributes vertical space
HStack → Spacer distributes horizontal space
```

More generally:

> `Spacer()` expands along the main axis of the Stack and consumes available space.

---

## What I Learned

- `Spacer()` consumes available space inside a Stack.
- `VStack` uses `Spacer()` for flexible vertical spacing.
- `HStack` uses `Spacer()` for flexible horizontal spacing.
- `Spacer()` can push Views toward the leading or trailing edge.
- Multiple Spacers can divide available space.
- `Spacer(minLength:)` provides a minimum desired space.
- A Spacer needs available space from its parent to become visibly large.
- `padding()` provides fixed spacing around a View.
- `Spacer()` provides flexible spacing inside a Stack.
- `frame(maxWidth: .infinity)` changes the size of a View's frame, while Spacer distributes remaining space inside a Stack.
- Flexible layouts are more adaptable to different screen sizes.

---

## What I Realized

`Spacer()` is not simply a way to "add empty space."

It is a way to control how **available space is distributed**.

The important distinction is:

```text
padding
   ↓
fixed space around a View

Spacer
   ↓
flexible space inside a Stack
```

This makes `Spacer()` especially useful for responsive layouts where the available screen size can change.

Instead of manually calculating distances, I can let SwiftUI distribute the available space for me.