contract C {
	function g() public {
		require(address(this).balance == 100);
		this.h{value: 10}();
		assert(address(this).balance == 100); // should hold
		assert(address(this).balance == 90); // should fail
	}

	function h() external payable {}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (157-192): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nC.constructor()\nC.g()\n    C.h() -- trusted external call
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(address(this).balance == 100)\n<errorCode> = 2 -> Assertion failed at assert(address(this).balance == 90)\n
