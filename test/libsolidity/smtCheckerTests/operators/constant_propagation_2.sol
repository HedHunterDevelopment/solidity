contract C {
	uint constant x = 7;
	uint constant y = 3;
	uint constant z = x / y;

	function f() public pure {
		assert(z == 2);
		assert(z == x / 3);
		assert(z == 7 / y);
		assert(z * 3 != 7);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 3) = (:var 7)) && (x' = x) && (y' = y) && (z' = z)) || true || true)\n(true || ((<errorCode> = 0) && ((:var 3) = (:var 7)) && (x' = x) && (y' = y) && (z' = z)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(z == 2)\n<errorCode> = 2 -> Assertion failed at assert(z == x / 3)\n<errorCode> = 3 -> Assertion failed at assert(z == 7 / y)\n<errorCode> = 4 -> Assertion failed at assert(z * 3 != 7)\n
