# Step 10.9 - ZStack, Layering and Offset

## Objective

Learn how to place Views on top of each other using `ZStack`, control their alignment, understand their layer order, and move Views using `offset()`.

---

## Topics

### ZStack

`ZStack` places Views on top of each other.

```swift
ZStack {
    Color.yellow
    Text("Hello")
}
```

The `Text` appears on top of the yellow background.

Conceptually:

```text
┌──────────────────────┐
│                      │
│        Hello         │
│                      │
└──────────────────────┘
       ↑
  yellow background
```

---

## ZStack Layer Order

The order of Views inside a `ZStack` determines their layer order.

The View written later appears above the Views written before it.

```swift
ZStack {
    Circle()
        .fill(.blue)

    Circle()
        .fill(.red)
}
```

The red Circle is above the blue Circle.

```text
1. Blue Circle  → background layer
2. Red Circle   → foreground layer
```

Therefore:

> The last child in a ZStack is normally the topmost layer.

---

## Default ZStack Alignment

A `ZStack` uses `.center` alignment by default.

```swift
ZStack {
    Circle()
        .fill(.blue)
        .frame(width: 100, height: 100)

    Circle()
        .fill(.red)
        .frame(width: 50, height: 50)
}
```

The smaller red circle is centered on top of the blue circle.

---

## ZStack Alignment

Alignment can be specified explicitly:

```swift
ZStack(alignment: .topTrailing) {
    Circle()
        .fill(.blue)
        .frame(width: 100, height: 100)

    Circle()
        .fill(.red)
        .frame(width: 20, height: 20)
}
```

The red Circle is positioned at the top-trailing area of the ZStack.

Common alignments include:

```swift
.topLeading
.top
.topTrailing
.leading
.center
.trailing
.bottomLeading
.bottom
.bottomTrailing
```

---

## ZStack with Different Shapes

A ZStack can combine different types of Views.

```swift
ZStack {
    RoundedRectangle(cornerRadius: 20)
        .fill(.blue)
        .frame(width: 200, height: 100)

    Circle()
        .fill(.red)
        .frame(width: 20, height: 20)
}
```

This allows elements such as badges, indicators, overlays, and decorative elements to be placed on top of other Views.

---

## Practical Example: Online Indicator

A profile image can have a small online indicator placed on top of it.

```swift
ZStack(alignment: .bottomTrailing) {
    Image(systemName: "person")
        .foregroundStyle(.blue)
        .font(.system(size: 40))
        .frame(width: 70, height: 70)
        .background(.blue.opacity(0.25))
        .clipShape(Circle())

    Circle()
        .fill(.green)
        .frame(width: 15, height: 15)
}
```

The `ZStack` creates the layers:

```text
        Profile Image
       ┌───────────┐
      │            │
      │     👤     │
      │          🟢│
       └───────────┘
```

The green Circle is written after the profile image, so it appears above it.

---

# offset()

`offset()` moves a View from its current position.

Example:

```swift
Circle()
    .offset(x: 30)
```

moves the Circle 30 points horizontally.

### X axis

```text
x: +10 → right
x: -10 → left
```

### Y axis

SwiftUI's screen coordinate system starts at the top-left.

```text
          -Y
           ↑
           |
-X  ←──────┼──────→  +X
           |
           ↓
          +Y
```

Therefore:

```text
x: +10 → right
x: -10 → left

y: +10 → down
y: -10 → up
```

---

## offset(x:y:)

Both axes can be changed at the same time.

```swift
Circle()
    .offset(x: -10, y: -10)
```

This moves the Circle:

```text
10 points left
10 points up
```

---

## Modifier Scope

A modifier affects the View it is attached to.

For example:

```swift
ZStack {
    Circle()
    Circle()
}
.offset(x: 30)
```

moves the **entire ZStack** 30 points to the right.

Both Circles move together.

However:

```swift
ZStack {
    Circle()

    Circle()
        .offset(x: 30)
}
```

moves only the second Circle.

This is an important concept:

> A modifier affects the View on which it is applied.

---

## offset vs frame

`frame()` and `offset()` have different purposes.

```swift
.frame(width: 100, height: 100)
```

controls the View's layout area.

```swift
.offset(x: 20)
```

moves the View from its current position.

`offset()` is useful when a View needs a small positional adjustment without changing the basic layout structure.

---

## HStack, VStack and ZStack

The three main Stack types now have different roles:

```text
HStack
→ horizontal arrangement

VStack
→ vertical arrangement

ZStack
→ overlapping / layered arrangement
```

A useful mental model:

```text
HStack → X direction
VStack → Y direction
ZStack → depth / layers
```

ZStack does not create a real 3D coordinate system. The Z concept is simply a useful way to think about Views being placed in front of or behind one another.

---

## What I Learned

- `ZStack` places Views on top of each other.
- The last child is normally the topmost layer.
- `ZStack` uses center alignment by default.
- `ZStack(alignment:)` can position children at different edges or corners.
- `ZStack` is useful for overlays, badges, indicators, and layered UI.
- `offset()` moves a View from its current position.
- Positive X moves right.
- Negative X moves left.
- Positive Y moves down.
- Negative Y moves up.
- The modifier's location determines which View it affects.
- `frame()` controls layout size, while `offset()` changes visual position.
- `HStack`, `VStack`, and `ZStack` solve different layout problems.

---

## What I Realized

`ZStack` is useful whenever one View needs to be placed on top of another View.

For example, a profile picture and online indicator can be treated as separate layers:

```text
Profile picture
       ↓
    ZStack
       ↓
Online indicator
```

I also learned that SwiftUI's coordinate system is different from the mathematical coordinate system I was familiar with.

The screen starts at the top-left:

```text
          -Y
           ↑
           |
-X  ←──────┼──────→ +X
           |
           ↓
          +Y
```

This makes:

```swift
.offset(x: -10, y: -10)
```

mean:

```text
10 points left
10 points up
```

Finally, I realized that modifier placement matters. Applying a modifier to a parent View affects the whole parent, while applying it to a child View affects only that child.