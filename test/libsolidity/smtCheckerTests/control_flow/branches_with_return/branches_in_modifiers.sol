contract C {

	uint x;

	modifier check() {
		require(x == 0);
		_;
		assert(x == 1); // should fail;
		assert(x == 0); // should hold;
	}

	modifier inc() {
		if (x == 0) {
			return;
		}
		x = x + 1;
		_;
	}

	function test() check inc public {
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (70-84): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\n\nTransaction trace:\nC.constructor()\nState: x = 0\nC.test()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 1\n<errorCode> = 2 -> Assertion failed at assert(x == 1)\n<errorCode> = 3 -> Assertion failed at assert(x == 0)\n
