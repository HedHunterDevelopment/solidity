contract C {
    function f(int a, int b) public pure returns (int) {
        return a % b; // can div by 0
    }
    function g(bool _check) public pure returns (int) {
        int x = type(int).min;
        if (_check) {
            return x / -1; // can overflow
        } else {
            unchecked { return x / -1; } // overflow not reported
        }
    }
}
// ====
// SMTEngine: all
// ----
// Warning 4281: (85-90): CHC: Division by zero happens here.\nCounterexample:\n\na = 0\nb = 0\n = 0\n\nTransaction trace:\nC.constructor()\nC.f(0, 0)
// Warning 4984: (242-248): CHC: Overflow (resulting value larger than 0x80 * 2**248 - 1) happens here.\nCounterexample:\n\n_check = true\n = 0\nx = (- 57896044618658097711785492504343953926634992332820282019728792003956564819968)\n\nTransaction trace:\nC.constructor()\nC.g(true)
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Division by zero at a % b\n<errorCode> = 4 -> Division by zero at x / -1\n<errorCode> = 6 -> Overflow at x / -1\n<errorCode> = 7 -> Division by zero at x / -1\n
