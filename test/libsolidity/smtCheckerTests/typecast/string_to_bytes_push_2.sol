contract C {
	string x;

	function s() public {
		x = "abc";
		((bytes(((x))))).push("a");
		assert(bytes(x).length == 4); // should hold
		assert(bytes(x).length == 3); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (140-168): CHC: Assertion violation happens here.
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(bytes(x).length == 4)\n<errorCode> = 2 -> Assertion failed at assert(bytes(x).length == 3)\n
