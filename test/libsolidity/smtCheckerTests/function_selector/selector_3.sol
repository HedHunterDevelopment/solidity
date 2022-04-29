
contract C {
    int public x;
    int public y;

    function f() public pure {
        assert(this.x.selector != this.y.selector);
        assert(this.x.selector == this.y.selector);
    }
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (142-184): CHC: Assertion violation happens here.\nCounterexample:\nx = 0, y = 0\n\nTransaction trace:\nC.constructor()\nState: x = 0, y = 0\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (x' = x) && (y' = y)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(this.x.selector != this.y.selector)\n<errorCode> = 2 -> Assertion failed at assert(this.x.selector == this.y.selector)\n
