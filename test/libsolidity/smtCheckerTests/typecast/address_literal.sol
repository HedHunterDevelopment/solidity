contract C {
  address x; // We know that this is "zero initialised".
  function f() public view {
    address a = address(0);
    assert(x == address(0));
    assert(x == a);
  }

  function g() public pure {
    address a = address(0);
    address b = address(1);
    address c = address(0);
    address d = a;
    address e = address(0x12345678);
    assert(c == d);
    assert(a == c);
    assert(e == address(305419896));
    // This is untrue.
    assert(a == b);
  }
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (454-468): CHC: Assertion violation happens here.\nCounterexample:\nx = 0x0\na = 0x0\nb = 0x01\nc = 0x0\nd = 0x0\ne = 0x12345678\n\nTransaction trace:\nC.constructor()\nState: x = 0x0\nC.g()
// Info 1180: Contract invariant(s) for :C:\n((x <= 0) || true || true)\n(true || true || (x <= 0))\n(true || true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == address(0))\n<errorCode> = 2 -> Assertion failed at assert(x == a)\n<errorCode> = 4 -> Assertion failed at assert(c == d)\n<errorCode> = 5 -> Assertion failed at assert(a == c)\n<errorCode> = 6 -> Assertion failed at assert(e == address(305419896))\n<errorCode> = 7 -> Assertion failed at assert(a == b)\n
