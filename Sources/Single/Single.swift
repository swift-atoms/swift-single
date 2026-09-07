public struct Single<Element: ~Copyable & ~Escapable>: ~Copyable, ~Escapable {

    public var element: Element

    @inlinable
    @_lifetime(copy element)
    public init(_ element: consuming Element) {
        self.element = element
    }
}

extension Single: Swift.Copyable where Element: Swift.Copyable & ~Escapable {}

extension Single: Swift.Escapable where Element: Swift.Escapable & ~Copyable {}
