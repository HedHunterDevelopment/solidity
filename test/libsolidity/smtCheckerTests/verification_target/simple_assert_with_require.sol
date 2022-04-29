contract C {
    function f(uint a) public pure { require(a < 10); assert(a < 20); }
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a < 20)\n
