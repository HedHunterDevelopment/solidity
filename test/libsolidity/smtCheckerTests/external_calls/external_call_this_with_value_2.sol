contract C {
	function g(uint i) public {
		require(address(this).balance == 100);
		this.h{value: i}();
		assert(address(this).balance == 100); // should hold
		assert(address(this).balance == 90); // should fail
	}

	function h() external payable {}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (162-197): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(address(this).balance == 100)\n<errorCode> = 2 -> Assertion failed at assert(address(this).balance == 90)\n
