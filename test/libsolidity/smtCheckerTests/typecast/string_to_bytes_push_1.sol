contract C {
	string x;

	function s() public {
		x = "abc";
		bytes(x).push("a");
		assert(bytes(x).length == 4); // should hold
		assert(bytes(x).length == 3); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (132-160): CHC: Assertion violation happens here.\nCounterexample:\nx = [0x61, 0x62, 0x63, 0x61]\n\nTransaction trace:\nC.constructor()\nState: x = []\nC.s()
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(bytes(x).length == 4)\n<errorCode> = 2 -> Assertion failed at assert(bytes(x).length == 3)\n
