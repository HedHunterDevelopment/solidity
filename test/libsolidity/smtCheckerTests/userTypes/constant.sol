type T is int224;
pragma solidity >= 0.0.0;
contract C {
	T constant public s = T.wrap(int224(165521356710917456517261742455526507355687727119203895813322792776));
	T constant public t = s;
	int224 constant public u = T.unwrap(t);

	function f() public pure {
		assert(T.unwrap(s) == 165521356710917456517261742455526507355687727119203895813322792776);
		assert(T.unwrap(t) == 165521356710917456517261742455526507355687727119203895813322792776);
		assert(u == 165521356710917456517261742455526507355687727119203895813322792776);
		assert(T.unwrap(s) == 0); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (531-555): CHC: Assertion violation happens here.\nCounterexample:\nu = 165521356710917456517261742455526507355687727119203895813322792776\n\nTransaction trace:\nC.constructor()\nState: u = 165521356710917456517261742455526507355687727119203895813322792776\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 3) = (:var 7)) && (s' = s) && (t' = t) && (u' = u)) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 3) = (:var 7)) && (s' = s) && (t' = t) && (u' = u)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(T.unwrap(s) == 165521356710917456517261742455526507355687727119203895813322792776)\n<errorCode> = 2 -> Assertion failed at assert(T.unwrap(t) == 165521356710917456517261742455526507355687727119203895813322792776)\n<errorCode> = 3 -> Assertion failed at assert(u == 165521356710917456517261742455526507355687727119203895813322792776)\n<errorCode> = 4 -> Assertion failed at assert(T.unwrap(s) == 0)\n
