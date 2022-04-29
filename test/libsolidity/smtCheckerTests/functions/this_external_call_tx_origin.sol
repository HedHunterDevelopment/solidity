contract C {

	function test() view public {
		require(address(this) != tx.origin);
		assert(!this.g());
	}

	function g() view public returns (bool) {
		return msg.sender == tx.origin;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(!this.g())\n
