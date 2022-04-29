contract C {
	function f(int a, uint b) public view {
		a >>= tx.gasprice;
		require(a == 16 && b == 2);
		a >>= b;
		assert(a == 4); // should hold
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == 4)\n
