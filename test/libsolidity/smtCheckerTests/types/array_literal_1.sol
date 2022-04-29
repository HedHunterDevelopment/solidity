contract C
{
	function f() public pure {
		uint[3] memory array = [uint(1), 2, 3];
		assert(array[0] == 1);
		assert(array[1] == 2);
		assert(array[2] == 3);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at array[0]\n<errorCode> = 2 -> Assertion failed at assert(array[0] == 1)\n<errorCode> = 3 -> Out of bounds access at array[1]\n<errorCode> = 4 -> Assertion failed at assert(array[1] == 2)\n<errorCode> = 5 -> Out of bounds access at array[2]\n<errorCode> = 6 -> Assertion failed at assert(array[2] == 3)\n
