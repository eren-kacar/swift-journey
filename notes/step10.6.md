# Step 10.6 - Multiple States and Dynamic UI

## Objective

Learn how to use multiple `@State` values together and make different parts of a SwiftUI interface respond to state changes.

---

## Topics

### Multiple @State Values

A View can have multiple pieces of state.

```swift
@State private var isFollowing = false
@State private var isLiked = false
@State private var likeCount = 0
```

Each state represents a different piece of information.

For example:

```text
isFollowing → whether the user is following
isLiked     → whether the user liked something
likeCount   → total number of likes
```

---

## Bool State

A `Bool` is useful when something has two possible states.

```swift
@State private var isLiked = false
```

Possible states:

```text
false → not liked
true  → liked
```

The value can be toggled:

```swift
isLiked.toggle()
```

---

## Int State

An `Int` can be used when the state needs to represent a number.

```swift
@State private var likeCount = 0
```

The value can be increased or decreased:

```swift
likeCount += 1
likeCount -= 1
```

Unlike a `Bool`, an `Int` can represent many different values.

```text
0
1
2
3
...
```

---

## Updating Multiple States

One Button action can change multiple state values.

Example:

```swift
Button {
    if isLiked {
        likeCount -= 1
    } else {
        likeCount += 1
    }

    isLiked.toggle()
} label: {
    ...
}
```

The action first checks the current state.

If the item is already liked:

```text
likeCount -= 1
```

Otherwise:

```text
likeCount += 1
```

Then:

```swift
isLiked.toggle()
```

changes the Boolean state.

---

## Keeping Related State Consistent

The two states have different responsibilities:

```text
isLiked
    ↓
Does the current user like it?

likeCount
    ↓
How many total likes are there?
```

For example, if the initial count is 37:

```text
isLiked = false
likeCount = 37
```

After liking:

```text
isLiked = true
likeCount = 38
```

After unliking:

```text
isLiked = false
likeCount = 37
```

The initial count does not have to be zero.

---

## Conditional Views

State can determine which View is displayed.

```swift
if isLiked {
    Image(systemName: "heart.fill")
} else {
    Image(systemName: "heart")
}
```

The icon changes depending on `isLiked`.

---

## Dynamic Text

State can also be displayed as text.

```swift
Text("\(likeCount)")
```

The `\(likeCount)` syntax is string interpolation.

It inserts the current value of `likeCount` into the String.

---

## Singular and Plural Text

The ternary operator can be used to choose between different Strings.

```swift
Text("\(likeCount) \(likeCount == 1 ? "like" : "likes")")
```

This produces:

```text
0 likes
1 like
2 likes
```

The ternary operator selects a value:

```swift
likeCount == 1 ? "like" : "likes"
```

If the condition is true:

```text
"like"
```

Otherwise:

```text
"likes"
```

---

## Button Hit Area

The Button's label defines the View presented as the interactive content.

For example:

```swift
Button {
    ...
} label: {
    HStack {
        Image(systemName: "heart")
        Text("0 likes")
    }
    .padding()
    .background(.red.opacity(0.1))
    .clipShape(Capsule())
}
.buttonStyle(.plain)
```

Putting the padding and visual styling **inside the label** makes the padded area part of the Button's label.

This means the visually empty space around the content can also be part of the interactive area.

---

## Final Like Button

The final Like Button combines multiple concepts:

```swift
Button {
    if isLiked {
        likeCount -= 1
    } else {
        likeCount += 1
    }

    isLiked.toggle()
} label: {
    HStack {
        if isLiked {
            Image(systemName: "heart.fill")
        } else {
            Image(systemName: "heart")
        }

        Text("\(likeCount) \(likeCount == 1 ? "like" : "likes")")
    }
    .foregroundStyle(isLiked ? .red : .secondary)
    .padding(.horizontal, 12)
    .padding(.vertical, 8)
    .background(
        isLiked
            ? .red.opacity(0.1)
            : .gray.opacity(0.1)
    )
    .clipShape(Capsule())
    .font(.headline)
}
.buttonStyle(.plain)
```

The Button changes:

- icon
- like count
- text (`like` / `likes`)
- foreground color
- background color

depending on the current state.

---

## What I Learned

- A SwiftUI View can have multiple `@State` values.
- `Bool` is useful for two-state information.
- `Int` is useful for numerical state.
- One Button action can modify multiple states.
- Related state values should remain logically consistent.
- `+=` and `-=` can modify numerical state.
- String interpolation displays state values inside text.
- Ternary expressions can dynamically select Strings.
- A Button's label can contain both its content and its padded interactive area.
- State can control many different aspects of a View at the same time.

---

## What I Realized

State does not have to be limited to a single Boolean.

Different pieces of state can represent different aspects of the UI and can work together.

For the Like Button:

```text
isLiked
    ↓
user's like status

likeCount
    ↓
total number of likes
```

The same state can also control the icon, text, color, and background.

I also realized that the structure of the Button's label affects its interactive area. Putting padding and styling inside the label makes the whole styled area behave as part of the Button.

The important idea is that the UI is a representation of the current state:

```text
State
  ↓
UI
  ↓
User interaction
  ↓
State changes
  ↓
UI updates
```