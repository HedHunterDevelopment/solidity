contract C {
	uint[] a;
	function f(uint x) public {
		a.push(x);
		assert(a[a.length - 1] == x);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Underflow at a.length - 1\n<errorCode> = 2 -> Out of bounds access at a[a.length - 1]\n<errorCode> = 3 -> Assertion failed at assert(a[a.length - 1] == x)\n
