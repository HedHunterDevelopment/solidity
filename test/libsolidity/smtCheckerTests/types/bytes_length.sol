contract C {
	function f() public pure {
		bytes memory x = hex"0123";
		assert(x.length == 2);
	}
	function g() public pure {
		bytes memory x = bytes(hex"0123");
		assert(x.length == 2);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x.length == 2)\n<errorCode> = 3 -> Assertion failed at assert(x.length == 2)\n
