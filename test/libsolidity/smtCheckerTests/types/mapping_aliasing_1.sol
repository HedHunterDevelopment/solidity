contract C
{
	mapping (uint => uint) a;
	mapping (uint => uint) b;

	function f(uint x) public {
		a[1] = x;
		b[1] = x;
		a[1] = 2;
		mapping (uint => uint) storage c = a;
		assert(c[1] == 2);
		// False negative! Needs aliasing.
		assert(a[1] == b[1]);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (233-253): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (a' = a) && (b' = b)) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(c[1] == 2)\n<errorCode> = 2 -> Assertion failed at assert(a[1] == b[1])\n
