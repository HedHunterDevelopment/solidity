contract C
{
	modifier m(uint x) {
		require(x == 2);
		_;
		return;
	}

	modifier n(uint x) {
		require(x == 3);
		_;
	}

	function f(uint x) m(x) n(x) public pure {
		assert(x == 3);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 3)\n
