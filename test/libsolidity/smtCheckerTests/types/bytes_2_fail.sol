contract C
{
	function f(bytes memory b1, bytes memory b2) public pure {
		b1 = b2;
		require(b1.length > 2 && b2.length > 2);
		assert(b1[1] == b2[2]);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (129-151): CHC: Assertion violation happens here.
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at b1[1]\n<errorCode> = 2 -> Out of bounds access at b2[2]\n<errorCode> = 3 -> Assertion failed at assert(b1[1] == b2[2])\n
