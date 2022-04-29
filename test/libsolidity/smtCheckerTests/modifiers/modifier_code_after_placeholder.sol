contract C
{
	uint x;

	modifier m {
		require(x > 0);
		_;
		// Fails because of overflow behavior.
		assert(x > 1);
	}

	function f() m public {
		assert(x > 0);
		unchecked { x = x + 1; }
	}

	function g(uint _x) public {
		x = _x;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (103-116): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\n\nTransaction trace:\nC.constructor()\nState: x = 0\nC.g(115792089237316195423570985008687907853269984665640564039457584007913129639935)\nState: x = 115792089237316195423570985008687907853269984665640564039457584007913129639935\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x > 0)\n<errorCode> = 3 -> Assertion failed at assert(x > 1)\n
