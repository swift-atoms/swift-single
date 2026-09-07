import Single
import Testing

@Suite
struct `Single values preserve storage and element capabilities` {
    @Suite struct `Single values support copyable and noncopyable elements` {}
    @Suite struct `No additional single value edge cases are defined` {}
    @Suite struct `No additional single value integration cases are defined` {}
}

extension `Single values preserve storage and element capabilities`.`Single values support copyable and noncopyable elements` {
    @Test
    func `Single stores and exposes a copyable element`() {
        let single = Single(42)
        #expect(single.element == 42)
    }

    @Test
    func `Single permits repeated borrowing of a noncopyable element`() {
        let single = Single(Token(7))

        #expect(single.element.id == 7)
        #expect(single.element.id == 7)
    }

    @Test
    func `Single is copyable when its element is copyable`() {
        let original = Single(42)
        let copy = original
        #expect(original.element == 42)
        #expect(copy.element == 42)
    }
}

private struct Token: ~Copyable {
    let id: Int
    init(_ id: Int) { self.id = id }
}
