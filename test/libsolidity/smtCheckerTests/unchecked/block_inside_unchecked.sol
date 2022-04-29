contract C {
  function f() public pure returns (uint y) {
    unchecked{{
        uint max = type(uint).max;
        uint x = max + 1; // overflow not reported
        y = x;
    }}
	assert(y == 0);
  }
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == 0)\n
