contract C {
    function f(bool x, uint a) public pure {
        require(!x || a > 0);
        uint b = a;
        assert(!x || b > 0);
    }
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(!x || b > 0)\n
