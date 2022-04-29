contract C {
    function f() public pure {
        bytes3 y = "def";
        y &= "def";
        assert(y == "def");

        y |= "dee";
        assert(y == "def"); // fails

        y ^= "fed";
        assert(y == (bytes3("def") | bytes3("dee")) ^ bytes3("fed"));
    }
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (147-165): CHC: Assertion violation happens here.\nCounterexample:\n\ny = 0x646567\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == "def")\n<errorCode> = 2 -> Assertion failed at assert(y == "def")\n<errorCode> = 3 -> Assertion failed at assert(y == (bytes3("def") | bytes3("dee")) ^ bytes3("fed"))\n
