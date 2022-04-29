contract C {
    function f(uint x) public pure {
        for (uint y = 2; x < 10; ) {
            assert(y == 2);
        }
    }
}
// ====
// SMTEngine: all
// SMTSolvers: z3
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == 2)\n
