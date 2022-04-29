contract C {
    function f() public pure {
        bytes memory x = hex"00112233";
        assert(x[0] == 0x00);
        assert(x[1] == 0x11);
        assert(x.length == 3);
    }
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (152-173): CHC: Assertion violation happens here.\nCounterexample:\n\nx = [0x0, 0x11, 0x22, 0x33]\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at x[0]\n<errorCode> = 2 -> Assertion failed at assert(x[0] == 0x00)\n<errorCode> = 3 -> Out of bounds access at x[1]\n<errorCode> = 4 -> Assertion failed at assert(x[1] == 0x11)\n<errorCode> = 5 -> Assertion failed at assert(x.length == 3)\n
