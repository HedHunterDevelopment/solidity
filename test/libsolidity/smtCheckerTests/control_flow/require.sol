contract C {
	function f() pure public {
		require(false);
		// This is not reachable.
		assert(false);
	}

	function g() pure public {
		require(false, "require message");
		// This is not reachable.
		assert(false);
	}

	function h(bool b) pure public {
		if (b)
			require(false);
		assert(!b);
	}

	// Check that arguments are evaluated.
	bool x = false;
	function m() view internal returns (string memory) {
		assert(x != true);
	}
	function i() public {
		x = true;
		require(false, m());
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6321: (396-409): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
// Warning 6328: (415-432): CHC: Assertion violation happens here.\nCounterexample:\nx = true\n\nTransaction trace:\nC.constructor()\nState: x = false\nC.i()\n    C.m() -- internal call
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(false)\n<errorCode> = 3 -> Assertion failed at assert(false)\n<errorCode> = 5 -> Assertion failed at assert(!b)\n<errorCode> = 7 -> Assertion failed at assert(x != true)\n
