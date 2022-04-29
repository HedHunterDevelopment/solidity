contract C {
    function f() public pure {
        string memory x = "\x12\x34";
        bytes memory y = bytes(x);
        assert(y[0] == 0x12);
        assert(y[1] == 0x34);
        assert(y.length == 2);
    }
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at y[0]\n<errorCode> = 2 -> Assertion failed at assert(y[0] == 0x12)\n<errorCode> = 3 -> Out of bounds access at y[1]\n<errorCode> = 4 -> Assertion failed at assert(y[1] == 0x34)\n<errorCode> = 5 -> Assertion failed at assert(y.length == 2)\n
