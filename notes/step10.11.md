# Step 10.11 - ScrollView

## Objective

Learn how `ScrollView` works and how it allows content that does not fit on the screen to become scrollable.

---

## ScrollView

`ScrollView` allows the user to scroll through content when that content does not fit inside the available space.

Basic usage:

```swift
ScrollView {
    VStack {
        Text("1")
        Text("2")
        Text("3")
    }
}
```

By default, `ScrollView` scrolls vertically.

```text
ScrollView
    ↓
Vertical scrolling
```

---

## Vertical ScrollView

The default behavior is vertical:

```swift
ScrollView {
    VStack {
        Text("1")
        Text("2")
        Text("3")
    }
}
```

If the content is taller than the available space, the user can scroll vertically.

```text
┌─────────────────┐
│ Text 1          │
│ Text 2          │
│ Text 3          │
│ Text 4          │
│ Text 5          │
│ ...             │
│       ↓         │
└─────────────────┘
```

---

## Horizontal ScrollView

A `ScrollView` can also scroll horizontally.

```swift
ScrollView(.horizontal) {
    HStack {
        Text("A")
        Text("B")
        Text("C")
        Text("D")
    }
}
```

Now the user can scroll from left to right.

```text
A → B → C → D → ...
```

---

## ScrollView Does Not Change Layout Direction

The direction of the `ScrollView` and the layout direction of the Stack inside it are separate concepts.

For example:

```swift
ScrollView {
    HStack {
        Text("A")
        Text("B")
        Text("C")
    }
}
```

The `HStack` still places the Texts horizontally:

```text
A   B   C
```

while the `ScrollView` itself is vertically scrollable.

The `ScrollView` does not turn the `HStack` into a `VStack`.

---

## ScrollView with VStack

A common combination is:

```swift
ScrollView {
    VStack {
        Text("Post 1")
        Text("Post 2")
        Text("Post 3")
        // ...
    }
}
```

This is useful for screens containing a vertical list of content.

For example:

```text
ScrollView
    ↓
VStack
    ├── Post 1
    ├── Post 2
    ├── Post 3
    ├── Post 4
    └── ...
```

---

## ScrollView Does Not Necessarily Scroll

Having a `ScrollView` does not mean that the content will always visibly move.

If the content already fits inside the available space, there is nothing to scroll.

For example:

```swift
ScrollView {
    VStack {
        Text("Post 1")
        Text("Post 2")
        Text("Post 3")
    }
}
```

If these three Texts fit completely inside the available space, the ScrollView will not need to scroll.

Therefore:

> `ScrollView` provides scrolling capability; it does not force scrolling when it is unnecessary.

---

## ForEach with ScrollView

`ScrollView` is commonly combined with `ForEach`.

```swift
ScrollView {
    VStack {
        ForEach(1...20, id: \.self) { number in
            Text("Text \(number)")
        }
    }
}
```

`ForEach` creates the Views:

```text
Text 1
Text 2
Text 3
...
Text 20
```

and `ScrollView` makes the resulting content scrollable when necessary.

---

## Our Project

We added a ScrollView below the profile section:

```swift
ScrollView {
    VStack {
        ForEach(1...20, id: \.self) { number in
            Text("Text \(number)")
        }
    }
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(20)
    .shadow(color: .black.opacity(0.5), radius: 10)
}
```

The overall structure is now:

```text
VStack
├── HStack
│   ├── Profile Image
│   ├── Profile Information
│   └── Spacer
│
└── ScrollView
    └── VStack
        └── ForEach
            ├── Text 1
            ├── Text 2
            ├── ...
            └── Text 20
```

Initially, the `ScrollView` was placed inside the profile `HStack`.

That caused the text list to appear beside the profile:

```text
Profile        Text 1
               Text 2
               Text 3
```

After moving the `ScrollView` outside the `HStack`, it became a sibling of the profile section:

```text
Profile
   ↓
Text 1
Text 2
Text 3
...
```

This demonstrated how the position of a View inside a Stack determines its layout.

---

## Important Concept

`ScrollView` does not determine how its content is arranged.

The content's own layout determines its arrangement.

For example:

```swift
ScrollView {
    VStack {
        ...
    }
}
```

means:

```text
VStack → vertical arrangement
ScrollView → scrolling
```

while:

```swift
ScrollView(.horizontal) {
    HStack {
        ...
    }
}
```

means:

```text
HStack → horizontal arrangement
ScrollView → horizontal scrolling
```

---

## What I Learned

- `ScrollView` makes content scrollable.
- The default scrolling direction is vertical.
- `ScrollView(.horizontal)` provides horizontal scrolling.
- `VStack` and `HStack` still determine how their children are arranged.
- `ScrollView` does not automatically change the layout direction of its content.
- `ScrollView` is commonly used with `VStack`.
- `ForEach` can be used inside a `ScrollView` to create repeated content.
- If the content fits on the screen, scrolling may not be necessary.
- The position of a `ScrollView` inside a parent Stack affects where it appears.
- A `ScrollView` placed inside an `HStack` becomes one of the HStack's horizontally arranged children.

---

## What I Realized

`ScrollView` and layout containers have different responsibilities.

```text
VStack / HStack
        ↓
How Views are arranged

ScrollView
        ↓
Whether that content can be scrolled
```

This means I should think about the hierarchy first.

For example:

```text
VStack
├── Profile
└── ScrollView
```

means the profile and scrollable content are placed vertically.

Whereas:

```text
HStack
├── Profile
└── ScrollView
```

means they are placed horizontally.

The location of a View in the hierarchy is therefore just as important as the View's own modifiers.