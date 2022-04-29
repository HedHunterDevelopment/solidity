contract C {
	function g(uint y) public {
		uint z = L.f(y);
		assert(z == y);
	}
}

library L {
	function f(uint x) internal returns (uint) {
		return x;
	}
}

// ====
// SMTEngine: all
// ----
// Warning 2018: (98-157): Function state mutability can be restricted to pure
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nContract invariant(s) for :L:\n(true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\nReentrancy property(ies) for :L:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(z == y)\n
