# Step 10.4 - Interaction with Button and State

## Objective

Learn how to make SwiftUI interfaces interactive by responding to user actions and changing the UI based on state.

---

## Topics

### Button

`Button` is a View that performs an action when the user interacts with it.

A Button can be created using an action and a label:

```swift
Button {
    // action
} label: {
    Text("Follow")
}
```

The two closures have different purposes:

```text
Button
├── action → what happens when the Button is pressed
└── label  → what the Button looks like
```

---

### Button Action

The action closure runs when the user presses the Button.

Example:

```swift
Button {
    print("Follow tapped")
} label: {
    Text("Follow")
}
```

The `print()` statement appears in the Xcode console.

---

## @State

`@State` is used for values whose changes should cause SwiftUI to update the related Views.

Example:

```swift
@State private var isFollowing = false
```

The initial value is:

```text
isFollowing = false
```

When the value changes, SwiftUI updates Views that depend on that state.

---

## toggle()

`toggle()` switches a Boolean value to its opposite.

```swift
isFollowing.toggle()
```

The value changes like this:

```text
false → true
true  → false
```

This is useful for on/off states.

---

## Conditional Views

SwiftUI can use `if` statements to decide which View should be displayed.

Example:

```swift
if isFollowing {
    Text("Following")
} else {
    Text("Follow")
}
```

When `isFollowing` changes, SwiftUI updates the displayed View.

---

## Conditional Image

The same idea can be used with other Views.

```swift
if isFollowing {
    Image(systemName: "checkmark")
    Text("Following")
} else {
    Image(systemName: "person.badge.plus")
    Text("Follow")
}
```

A single state value can therefore control multiple Views.

---

## Ternary Operator

The ternary operator provides a compact way to choose between two values.

```swift
isFollowing ? .green : .blue
```

It means:

```text
if isFollowing is true  → .green
if isFollowing is false → .blue
```

Example:

```swift
.foregroundStyle(isFollowing ? .green : .blue)
```

---

## State Controlling Multiple Views

The same state can control several parts of an interface.

For example:

```text
              @State
                 │
          isFollowing
           /      |      \
          /       |       \
       Image     Text     Color
         │         │         │
       👤+       Follow     blue
         ↓         ↓         ↓
        ✓       Following   green
```

Changing one state value can therefore update multiple Views at once.

---

## Final Button

The profile card's Follow button became interactive:

```swift
Button {
    isFollowing.toggle()
} label: {
    HStack {
        if isFollowing {
            Image(systemName: "checkmark")
            Text("Following")
        } else {
            Image(systemName: "person.badge.plus")
            Text("Follow")
        }
    }
    .foregroundStyle(isFollowing ? .green : .blue)
}
```

Behavior:

```text
Initial:

[ 👤+ Follow ]
      ↓
   tap button
      ↓
[ ✓ Following ]
      ↓
   tap button
      ↓
[ 👤+ Follow ]
```

---

## What I Learned

- `Button` creates an interactive View.
- A Button has an `action` and a `label`.
- The action runs when the user interacts with the Button.
- `@State` stores UI-related state that SwiftUI observes.
- Changing a `@State` value can cause dependent Views to update.
- `toggle()` switches a Boolean between `true` and `false`.
- `if` can be used to conditionally display Views.
- The ternary operator can choose between two values.
- One state value can control multiple parts of the interface.

---

## What I Realized

SwiftUI interfaces are not just static Views.

The UI can be described as a function of its current state:

```text
State
  ↓
View
  ↓
User interaction
  ↓
State changes
  ↓
View updates
```

Instead of manually changing individual UI elements, I change the state and SwiftUI updates the Views that depend on it.

This makes the connection between data and UI much easier to understand.