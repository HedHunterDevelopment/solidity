contract C {
    function f() public pure returns (bytes1) {
        bytes1 a = 0xff;
        bytes1 b = 0xf0;
        b |= a;
        assert(a == b);

        a |= ~b;
        assert(a == 0); // fails
    }
}
// ====
// SMTEngine: all
// ----
// Warning 6321: (51-57): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
// Warning 6328: (177-191): CHC: Assertion violation happens here.\nCounterexample:\n\n = 0x0\na = 0xff\nb = 0xff\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == b)\n<errorCode> = 2 -> Assertion failed at assert(a == 0)\n
