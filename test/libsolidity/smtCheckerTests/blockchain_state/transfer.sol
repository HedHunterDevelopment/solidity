contract C {
	function f(address payable a) public {
		require(address(this).balance > 1000);
		a.transfer(666);
		assert(address(this).balance > 100);
		// Fails.
		assert(address(this).balance > 500);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (166-201): CHC: Assertion violation happens here.
// Info 1180: Reentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(address(this).balance > 100)\n<errorCode> = 2 -> Assertion failed at assert(address(this).balance > 500)\n
