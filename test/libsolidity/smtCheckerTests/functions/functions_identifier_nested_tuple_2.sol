library L {
	struct S {
		uint256[] data;
	}
	function f(S memory _s) internal pure returns (uint256) {
		require(_s.data.length > 0);
		return 42;
	}
}

contract C {
	using L for L.S;
	function f() public pure returns (uint256 y) {
		L.S memory x;
		y = (x.f)();
		assert(y == 42); // should hold
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :L:\n(true || true)\nReentrancy property(ies) for :L:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == 42)\n
