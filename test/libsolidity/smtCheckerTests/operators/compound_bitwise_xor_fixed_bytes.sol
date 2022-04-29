contract C {
    function f() public pure returns (bytes1) {
        bytes1 a = 0xff;
        bytes1 b = 0xf0;
        a ^= ~b;
        assert(a == b);

        a ^= ~b;
        assert(a != 0xff); // fails
    }
}
// ====
// SMTEngine: all
// ----
// Warning 6321: (51-57): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
// Warning 6328: (178-195): CHC: Assertion violation happens here.\nCounterexample:\n\n = 0x0\na = 0xff\nb = 0xf0\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == b)\n<errorCode> = 2 -> Assertion failed at assert(a != 0xff)\n
