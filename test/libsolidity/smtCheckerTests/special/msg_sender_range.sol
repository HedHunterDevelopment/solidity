contract C {

	function f() public view {
		assert(msg.sender >= address(0)); // should hold
		assert(msg.sender <= address(2**160-1)); // should hold
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(msg.sender >= address(0))\n<errorCode> = 2 -> Assertion failed at assert(msg.sender <= address(2**160-1))\n
