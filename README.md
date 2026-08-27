# swift-single

A one-element container that preserves the ownership and lifetime capabilities of its element.

`Single<Element>` stores exactly one value and lends repeated access to it. `Element` may be copyable, move-only, escaping, or non-escaping; the container conditionally inherits the capabilities the element provides.

## Installation

Add the package from its canonical home:

```swift
dependencies: [
    .package(
        url: "https://github.com/swift-atoms/swift-single.git",
        branch: "main"
    )
]
```

Then depend on the narrowest product your target needs:

```swift
.product(name: "Single", package: "swift-single")
```

## Core

The `Single` product is Foundation-free and has no package dependencies:

```swift
import Single

let one = Single(42)
print(one.element)

let copy = one
print(copy.element)
```

When the element is move-only, the container is move-only too, while borrowed property access remains repeatable:

```swift
import Single

struct Token: ~Copyable {
    let id: Int
}

let token = Single(Token(id: 7))
print(token.element.id)
print(token.element.id)
```

## Products

- `Single` — the one-element container and its conditional ownership/lifetime conformances.
- `Single Standard Library Integration` — the standard-library integration and compatibility re-export seam.
- `Single Apple Foundation Integration` — the Apple Foundation integration seam; this is the only product that imports Foundation.

The core and standard-library integration are Foundation-free, dependency-free, and suitable for Embedded-oriented consumers.

## License

See [LICENSE.md](LICENSE.md).
