contract C {
    function f() public pure {
        uint v = 7;
        v ^= 3;
        assert(v != 4); // fails, as 7 ^ 3 = 4

        uint c = 0;
        c ^= v;
        assert(c == 4);

        uint16 x = 0xff;
        uint16 y = 0xffff;
        y ^= x;
        assert(y == 0xff); // fails
        assert(y == 0xff00);

        y = 0xf1;
        x = 0xff00;
        y ^= x | y;
        assert(y == 0xffff); // fails
        assert(x == 0xff00);
    }
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (88-102): CHC: Assertion violation happens here.\nCounterexample:\n\nv = 4\nc = 0\nx = 0\ny = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (265-282): CHC: Assertion violation happens here.\nCounterexample:\n\nv = 4\nc = 4\nx = 255\ny = 65280\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (389-408): CHC: Assertion violation happens here.\nCounterexample:\n\nv = 4\nc = 4\nx = 65280\ny = 65280\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(v != 4)\n<errorCode> = 2 -> Assertion failed at assert(c == 4)\n<errorCode> = 3 -> Assertion failed at assert(y == 0xff)\n<errorCode> = 4 -> Assertion failed at assert(y == 0xff00)\n<errorCode> = 5 -> Assertion failed at assert(y == 0xffff)\n<errorCode> = 6 -> Assertion failed at assert(x == 0xff00)\n
