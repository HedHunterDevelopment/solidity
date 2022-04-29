contract C {
	uint[] a;
	uint l;
	function p() public {
		require(a.length < type(uint).max - 1);
		a.push();
		++l;
	}
	function q() public {
		require(a.length > 0);
		a.pop();
		--l;
	}
	function r() public view returns (uint) {
		require(l > 0);
		return a[l]; // oob access
	}
}
// ====
// SMTEngine: all
// SMTIgnoreOS: macos
// ----
// Warning 4984: (112-115): CHC: Overflow (resulting value larger than 2**256 - 1) might happen here.
// Warning 6368: (259-263): CHC: Out of bounds access happens here.\nCounterexample:\na = [0], l = 1\n = 0\n\nTransaction trace:\nC.constructor()\nState: a = [], l = 0\nC.p()\nState: a = [0], l = 1\nC.r()
// Info 1180: Contract invariant(s) for :C:\n(((a.length + ((- 1) * l)) <= 0) || true || true || true)\n(true || true || true || true || true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 2) = (:var 5)) && (a' = a) && (l' = l)) || true || true || true || true || true || true || true || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (a' = a) && (l' = l)) || true || true || true || true || true || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Underflow at type(uint).max - 1\n<errorCode> = 2 -> Overflow at ++l\n<errorCode> = 4 -> Empty array pop at a.pop()\n<errorCode> = 5 -> Underflow at --l\n<errorCode> = 7 -> Out of bounds access at a[l]\n
// Warning 2661: (112-115): BMC: Overflow (resulting value larger than 2**256 - 1) happens here.
