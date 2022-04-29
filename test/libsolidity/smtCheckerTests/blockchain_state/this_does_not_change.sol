contract C {
	address t;
	constructor() {
		t = address(this);
	}
	function inv() public view {
		assert(address(this) == t);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreOS: macos
// ----
// Info 1180: Contract invariant(s) for :C:\n((((address(this) + ((- 1) * t)) <= 0) && ((address(this) + ((- 1) * t)) >= 0)) || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (t' = t)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(address(this) == t)\n
