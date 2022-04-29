contract C {
    uint a;
    function f(uint x) public {
        this.g(x);
        assert(a == x);
        assert(a != 42);
    }

    function g(uint x) public {
        a = x;
    }
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (108-123): CHC: Assertion violation happens here.\nCounterexample:\na = 42\nx = 42\n\nTransaction trace:\nC.constructor()\nState: a = 0\nC.f(42)\n    C.g(42) -- trusted external call
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == x)\n<errorCode> = 2 -> Assertion failed at assert(a != 42)\n
