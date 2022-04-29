contract C {
	uint[] a;
	uint l;
	function p() public {
		require(a.length < type(uint).max - 1);
		require(l < type(uint).max - 1);
		a.push();
		++l;
	}
	function q() public {
		require(a.length > 0);
		require(l > 0);
		a.pop();
		--l;
	}
	function r() public view returns (uint) {
		require(l > 0);
		return a[l - 1]; // safe access
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || ((l + ((- 1) * a.length)) <= 0) || true || true)\n(true || true || true || true || true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 2) = (:var 5)) && (a' = a) && (l' = l)) || true || true || true || true || true || true || true || true || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (a' = a) && (l' = l)) || true || true || true || true || true || true || true || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (a' = a) && (l' = l)) || true || true || true || true || true || true || true || true || true || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (a' = a) && (l' = l)) || true || true || true || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Underflow at type(uint).max - 1\n<errorCode> = 2 -> Underflow at type(uint).max - 1\n<errorCode> = 3 -> Overflow at ++l\n<errorCode> = 5 -> Empty array pop at a.pop()\n<errorCode> = 6 -> Underflow at --l\n<errorCode> = 8 -> Underflow at l - 1\n<errorCode> = 9 -> Out of bounds access at a[l - 1]\n
