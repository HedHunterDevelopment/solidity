interface D {
	function ext(C c) external returns (uint);
}

contract C {
	uint x;
	function s(uint _x) public { x = _x; }
	constructor(D d) {
		uint a = d.ext(this);
		assert(x == 0); // should hold because there's no reentrancy from the constructor
		assert(a == 2); // should fail
	}
}
// ====
// SMTIgnoreCex: yes
// ----
// Warning 6328: (253-267): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n<errorCode> = 2 -> Assertion failed at assert(a == 2)\n
