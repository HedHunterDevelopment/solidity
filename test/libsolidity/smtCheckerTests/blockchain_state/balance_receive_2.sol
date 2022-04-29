contract C {
	uint x;
	bool once;
	constructor() payable {
		x = address(this).balance;
	}
	function f() public payable {
		require(!once);
		once = true;
		require(msg.value > 0);
		assert(address(this).balance > x); // should hold
		assert(address(this).balance > x + 10); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 4984: (266-272): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 6328: (235-273): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (x' = x) && (once' = once)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(address(this).balance > x)\n<errorCode> = 2 -> Overflow at x + 10\n<errorCode> = 3 -> Assertion failed at assert(address(this).balance > x + 10)\n
