contract C
{
	uint[] a;
	function f(bool b) public {
		a.push();
		a.push();
		a.push();
		a[2] = 3;
		require(b);
		if (b)
			delete a;
		else
			delete a[2];
		assert(a.length == 0);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at a[2]\n<errorCode> = 2 -> Out of bounds access at a[2]\n<errorCode> = 3 -> Assertion failed at assert(a.length == 0)\n
// Warning 6838: (121-122): BMC: Condition is always true.
