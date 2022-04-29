contract C {
  function f() public pure {
    uint x = 1234;
    uint y = 0;
    assert(x != y);
    assert(x == uint(1234));
    assert(y == uint(0));
  }
  function g() public pure {
    uint a = uint(0);
    uint b = type(uint256).max;
    uint c = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    int d = -1;
    uint e = uint(d);
    assert(a != b);
    assert(b == c);
    assert(b == e);
  }
  function h() public pure {
    uint32 a = uint32(0);
    uint32 b = type(uint32).max;
    uint32 c = 4294967295;
    int32 d = -1;
    uint32 e = uint32(d);
    assert(a != b);
    assert(b == c);
    assert(b == e);
  }
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true || true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x != y)\n<errorCode> = 2 -> Assertion failed at assert(x == uint(1234))\n<errorCode> = 3 -> Assertion failed at assert(y == uint(0))\n<errorCode> = 5 -> Assertion failed at assert(a != b)\n<errorCode> = 6 -> Assertion failed at assert(b == c)\n<errorCode> = 7 -> Assertion failed at assert(b == e)\n<errorCode> = 9 -> Assertion failed at assert(a != b)\n<errorCode> = 10 -> Assertion failed at assert(b == c)\n<errorCode> = 11 -> Assertion failed at assert(b == e)\n
