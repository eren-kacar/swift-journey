# Step 10.3 - Styling Views

## Objective

Learn how to style SwiftUI Views and create a more polished user interface.

---

## Topics

### frame()

`frame()` controls the area a View occupies.

```swift
.frame(width: 80, height: 80)
```

This gives the View an 80 × 80 area.

The View's content does not necessarily become 80 × 80. The frame is the area given to the View.

---

### maxWidth

```swift
.frame(maxWidth: .infinity)
```

Allows a View to use as much horizontal space as is available.

Example:

```swift
VStack(alignment: .leading) {
    Text("Eren Kaçar")
    Text("Computer Engineering Student")
}
.frame(maxWidth: .infinity)
```

The VStack expands horizontally while its contents remain leading-aligned.

---

### frame Alignment

`alignment` can also be used with `frame()`.

```swift
.frame(width: 200, alignment: .trailing)
```

This gives the View a 200-point-wide frame and positions the View's content toward the trailing side of that frame.

This is different from:

```swift
VStack(alignment: .leading)
```

`VStack(alignment:)` controls how the VStack's child Views are aligned.

`frame(alignment:)` controls the position of the View inside its frame.

---

## foregroundStyle()

Changes the foreground appearance of a View.

```swift
.foregroundStyle(.blue)
```

For example:

```swift
Image(systemName: "person")
    .foregroundStyle(.blue)
```

---

### secondary

```swift
.foregroundStyle(.secondary)
```

`.secondary` represents information with lower visual importance.

It adapts to the current system appearance instead of simply forcing a specific color such as `.gray`.

Example:

```swift
Text("Computer Engineering Student")
    .foregroundStyle(.secondary)
```

This creates visual hierarchy:

```text
Eren Kaçar
Computer Engineering Student
```

The name is visually more important than the secondary information.

---

## background()

Adds a background behind a View.

```swift
.background(.blue.opacity(0.25))
```

The position of `background()` in the modifier chain matters.

For example:

```swift
Text("Eren")
    .padding()
    .background(.yellow)
```

The padding is included in the yellow background.

But:

```swift
Text("Eren")
    .background(.yellow)
    .padding()
```

The padding is outside the yellow background.

---

## opacity

Controls how opaque a color or View is.

```swift
.blue.opacity(0.25)
```

`0.25` means 25% opacity.

Lower values make the color more transparent.

---

## clipShape()

Clips a View to a specified shape.

```swift
.clipShape(Circle())
```

Example:

```swift
Image(systemName: "person")
    .frame(width: 80, height: 80)
    .background(.blue.opacity(0.25))
    .clipShape(Circle())
```

The 80 × 80 area is clipped into a circle.

---

## cornerRadius()

Rounds the corners of a View.

```swift
.cornerRadius(20)
```

A larger value creates more rounded corners.

Example:

```swift
HStack {
    ...
}
.padding()
.background(.blue.opacity(0.1))
.cornerRadius(20)
```

---

## shadow()

Adds a shadow around a View.

```swift
.shadow(radius: 5)
```

A more customized shadow can be created with:

```swift
.shadow(
    color: .black.opacity(0.15),
    radius: 8,
    x: 0,
    y: 4
)
```

Parameters:

- `color` → shadow color
- `radius` → spread/softness of the shadow
- `x` → horizontal offset
- `y` → vertical offset

The visibility of a shadow depends on its contrast with the background.

---

## fontWeight()

Controls the weight of a font.

```swift
.fontWeight(.bold)
```

Common weights include:

```swift
.light
.regular
.medium
.semibold
.bold
.heavy
```

---

## bold()

A shorter way to make text bold.

```swift
Text("Eren Kaçar")
    .bold()
```

This is equivalent to using:

```swift
.fontWeight(.bold)
```

when bold is the desired weight.

---

## Modifier Order

Modifier order can affect the final result.

Example:

```swift
HStack {
    ...
}
.padding()
.background(.blue.opacity(0.1))
.cornerRadius(20)
```

The operations happen in order:

```text
HStack
  ↓
padding
  ↓
background
  ↓
corner radius
```

This creates a rounded background that also includes the padding area.

---

## Visual Hierarchy

Different pieces of information should not necessarily have the same visual weight.

Example:

```swift
Text("Eren Kaçar")
    .font(.title3)
    .bold()

Text("Computer Engineering Student")
    .font(.subheadline)
    .foregroundStyle(.secondary)
```

The user's name becomes the primary information while the profession becomes secondary information.

---

## Profile Card

The concepts from this step were combined to create a profile card.

The structure was approximately:

```text
HStack
├── Profile Image
└── VStack
    ├── Name
    ├── Profession
    └── Location
```

The card was styled using:

- `frame()`
- `background()`
- `opacity`
- `clipShape()`
- `cornerRadius()`
- `shadow()`
- `foregroundStyle()`
- `fontWeight()`

---

## What I Learned

- `frame()` controls the area available to a View.
- `.infinity` can be used to make a View fill available space.
- `alignment` can refer to different levels depending on where it is used.
- `background()` and other modifiers are affected by modifier order.
- `clipShape()` can turn a rectangular View into a circle or another shape.
- `cornerRadius()` rounds a View's corners.
- `shadow()` adds depth to a View.
- `.secondary` is useful for visually de-emphasizing secondary information.
- `.bold()` is a convenient way to make text bold.
- Styling should create visual hierarchy rather than simply adding effects.

---

## What I Realized

SwiftUI styling is not just about making Views look different.

The order and location of modifiers determine what they affect.

I also realized that a good interface should have visual hierarchy. Important information should stand out, while secondary information should be visually quieter.

The profile card was built by combining simple Views, modifiers, and layout concepts learned in previous steps.