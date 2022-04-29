contract C {
    bytes20 x;
    function f(bytes16 b) public view {
        b[uint8(x[2])];
    }
}
// ====
// SMTEngine: all
// ----
// Warning 6368: (76-90): CHC: Out of bounds access might happen here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at x[2]\n<errorCode> = 2 -> Out of bounds access at b[uint8(x[2])]\n
