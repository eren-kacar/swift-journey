# Step 10.5 - Button Styling

## Objective

Learn how to customize the appearance of SwiftUI Buttons using modifiers and create a modern, state-aware button.

---

## Topics

### Button Label Styling

A Button's label is a View, so normal SwiftUI modifiers can be applied to it.

```swift
Button {
    ...
} label: {
    HStack {
        Image(systemName: "person.crop.circle.badge.plus")
        Text("Follow")
    }
}
```

Because `HStack` is a View, modifiers can be applied to the whole HStack.

---

### Padding

`padding()` adds space between a View's content and its boundaries.

```swift
.padding(.horizontal, 20)
.padding(.vertical, 10)
```

This gives the Button:

- 20 points of horizontal padding
- 10 points of vertical padding

Padding can be used to make a Button larger without changing the font size.

---

### foregroundStyle()

`foregroundStyle()` controls the color of the Button's content.

```swift
.foregroundStyle(.blue)
```

The modifier can also depend on state:

```swift
.foregroundStyle(isFollowing ? .green : .blue)
```

This makes the Button blue when not following and green when following.

---

### background()

`background()` adds a background behind the Button's label.

```swift
.background(.blue.opacity(0.1))
```

The background can also depend on state:

```swift
.background(
    isFollowing
        ? .green.opacity(0.1)
        : .blue.opacity(0.1)
)
```

This allows the Button to visually communicate its current state.

---

### Capsule()

`Capsule()` creates a pill-shaped View.

```swift
.clipShape(Capsule())
```

This is especially useful for modern action Buttons.

Compared with:

```swift
.cornerRadius(12)
```

`cornerRadius()` rounds the corners by a specific amount, while `Capsule()` creates a completely rounded pill shape.

---

### buttonStyle(.plain)

SwiftUI Buttons have a default system style.

```swift
.buttonStyle(.plain)
```

removes the extra default Button styling and allows the custom styling of the Button's label to be more apparent.

This is useful when creating a completely custom Button appearance.

---

### Font Inheritance

A modifier applied to a container can affect its child Views.

For example:

```swift
HStack {
    Image(systemName: "person.crop.circle.badge.plus")
    Text("Follow")
}
.font(.title3)
```

The `HStack`'s child Views inherit the font, so both the SF Symbol and Text become larger.

This avoids having to apply `.font(.title3)` separately to each View.

---

## State-Based Button

The final Follow Button uses the same `isFollowing` State learned in Step 10.4.

```swift
Button {
    isFollowing.toggle()
} label: {
    HStack {
        if isFollowing {
            Image(systemName: "person.crop.circle.badge.checkmark")
            Text("Following")
        } else {
            Image(systemName: "person.crop.circle.badge.plus")
            Text("Follow")
        }
    }
    .font(.title3)
    .foregroundStyle(isFollowing ? .green : .blue)
    .padding(.horizontal, 20)
    .padding(.vertical, 10)
    .background(
        isFollowing
            ? .green.opacity(0.1)
            : .blue.opacity(0.1)
    )
    .clipShape(Capsule())
}
.buttonStyle(.plain)
```

The Button now changes both its content and appearance depending on its state.

---

## Final Behavior

```text
isFollowing = false

[ 👤  Follow ]
     blue


        ↓ tap


isFollowing = true

[ ✓  Following ]
     green
```

Tapping the Button again changes the state back.

---

## What I Learned

- A Button's label is a normal SwiftUI View.
- Button labels can be styled using normal View modifiers.
- `padding()` controls the space around the Button's content.
- `background()` creates a background behind the content.
- `foregroundStyle()` controls the content's appearance.
- `Capsule()` is useful for pill-shaped Buttons.
- `.buttonStyle(.plain)` removes the Button's default styling.
- Modifiers applied to containers can affect their child Views.
- Button styling can depend on `@State`.
- A Button can communicate its current state visually through color, icon, and text.

---

## What I Realized

Button styling is not separate from the state system.

The Button's appearance can be a direct representation of its current state.

In our example, one State controls:

- the icon
- the text
- the foreground color
- the background color

This allows the UI to communicate what will happen or what has already happened without needing extra explanation.