contract C {
    function f() public pure {
        uint v = 1;
        v &= 1;
        assert(v == 1);

        v = 7;
        v &= 3;
        assert(v != 3); // fails, as 7 & 3 = 3

        uint c = 0;
        c &= v;
        assert(c == 0);

        uint8 x = 0xff;
        uint16 y = 0xffff;
        y &= x;
        assert(y == 0xff);
        assert(y == 0xffff); // fails

        y = 0xffff;
        x = 0xff;
        y &= y | x;
        assert(y == 0xffff);
        assert(y == 0xff); // fails
    }
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (144-158): CHC: Assertion violation happens here.\nCounterexample:\n\nv = 3\nc = 0\nx = 0\ny = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (347-366): CHC: Assertion violation happens here.\nCounterexample:\n\nv = 3\nc = 0\nx = 255\ny = 255\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (473-490): CHC: Assertion violation happens here.\nCounterexample:\n\nv = 3\nc = 0\nx = 255\ny = 65535\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n(true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(v == 1)\n<errorCode> = 2 -> Assertion failed at assert(v != 3)\n<errorCode> = 3 -> Assertion failed at assert(c == 0)\n<errorCode> = 4 -> Assertion failed at assert(y == 0xff)\n<errorCode> = 5 -> Assertion failed at assert(y == 0xffff)\n<errorCode> = 6 -> Assertion failed at assert(y == 0xffff)\n<errorCode> = 7 -> Assertion failed at assert(y == 0xff)\n
