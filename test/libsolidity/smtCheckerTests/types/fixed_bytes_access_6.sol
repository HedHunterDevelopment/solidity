contract C {
	function f() public pure {
		bytes4 x = 0x01020304;
		bytes1 b = x[3];
		assert(b == b[0]);
		assert(b == b[0][0]);
		assert(b == b[0][0][0][0][0][0][0][0][0][0][0]);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at x[3]\n<errorCode> = 2 -> Out of bounds access at b[0]\n<errorCode> = 3 -> Assertion failed at assert(b == b[0])\n<errorCode> = 4 -> Out of bounds access at b[0]\n<errorCode> = 5 -> Out of bounds access at b[0][0]\n<errorCode> = 6 -> Assertion failed at assert(b == b[0][0])\n<errorCode> = 7 -> Out of bounds access at b[0]\n<errorCode> = 8 -> Out of bounds access at b[0][0]\n<errorCode> = 9 -> Out of bounds access at b[0][0][0]\n<errorCode> = 10 -> Out of bounds access at b[0][0][0][0]\n<errorCode> = 11 -> Out of bounds access at b[0][0][0][0][0]\n<errorCode> = 12 -> Out of bounds access at b[0][0][0][0][0][0]\n<errorCode> = 13 -> Out of bounds access at b[0][0][0][0][0][0][0]\n<errorCode> = 14 -> Out of bounds access at b[0][0][0][0][0][0][0][0]\n<errorCode> = 15 -> Out of bounds access at b[0][0][0][0][0][0][0][0][0]\n<errorCode> = 16 -> Out of bounds access at b[0][0][0][0][0][0][0][0][0][0]\n<errorCode> = 17 -> Out of bounds access at b[0][0][0][0][0][0][0][0][0][0][0]\n<errorCode> = 18 -> Assertion failed at assert(b == b[0][0][0][0][0][0][0][0][0][0][0])\n
