contract C {
    function f(bool b1, bool b2) public pure {
        require(b1 || b2);
        uint c = b1 ? 3 : (b2 ? 2 : 1);
        assert(c > 1);
    }
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(c > 1)\n
// Warning 6838: (114-116): BMC: Condition is always true.
