contract BaseBase {
	uint x;
	function init(uint a, uint b) public virtual {
		x = a;
	}
}
contract Base is BaseBase {
	function init(uint a, uint b) public override {
	}
}
contract Child is Base {
	function bInit(uint c, uint d) public {
		BaseBase.init(c, d);
		assert(x == c);
		assert(x == d); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 5667: (52-58): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 6328: (282-296): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :BaseBase:\n(true || true)\nContract invariant(s) for :Child:\n(true || true || true || true)\nContract invariant(s) for :Base:\n(true || true)\nReentrancy property(ies) for :Child:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\nReentrancy property(ies) for :BaseBase:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)))\nReentrancy property(ies) for :Base:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)))\n<errorCode> = 0 -> no errors\n<errorCode> = 3 -> Assertion failed at assert(x == c)\n<errorCode> = 4 -> Assertion failed at assert(x == d)\n
