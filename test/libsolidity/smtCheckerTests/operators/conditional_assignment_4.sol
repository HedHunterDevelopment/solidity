abstract contract D {
    function d() public virtual ;
}

contract C {
    bool a;
    uint x;
    D d;
    function g() public returns (uint) {
        x = 2;
        return x;
    }
    function f(bool b) public {
        x = 1;
        uint y = b ? g() : 3;
        assert(x == 2 || x == 1);
    }
    function h() public {
        x = 3;
    }
}
// ====
// SMTEngine: all
// ----
// Warning 2072: (240-246): Unused local variable.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true || true)\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 3) = (:var 7)) && (a' = a) && (x' = x) && (d' = d)) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 2 || x == 1)\n
