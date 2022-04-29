library L {
	function l(address payable a) internal {}
}

contract C {
	using L for address payable;
	uint x;
	function f(address payable a) public payable {
		require(msg.value > 1);
		uint b1 = address(this).balance;
		a.l();
		uint b2 = address(this).balance;
		assert(b1 == b2); // should hold
		assert(x == 0); // should hold
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :L:\n(true || true)\nContract invariant(s) for :C:\n((x <= 0) || true)\n(true || true || true)\nReentrancy property(ies) for :L:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(b1 == b2)\n<errorCode> = 2 -> Assertion failed at assert(x == 0)\n
