contract C
{
	function f(bytes memory b1, bytes memory b2) public pure {
		require(b2.length > 2);
		b1 = b2;
		// Knowledge about b2 is lost because of potential aliasing, so we re-add the length constraint.
		require(b2.length > 2);
		assert(b1[1] == b2[1]);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (237-259): CHC: Assertion violation happens here.
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at b1[1]\n<errorCode> = 2 -> Out of bounds access at b2[1]\n<errorCode> = 3 -> Assertion failed at assert(b1[1] == b2[1])\n
