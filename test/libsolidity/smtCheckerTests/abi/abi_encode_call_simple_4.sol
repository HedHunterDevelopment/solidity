abstract contract D {
	function no(uint a, uint b) external virtual;
}

contract C {
	function callMeMaybe(uint a, uint b) external {}

	function abiEncodeSimple(uint x, uint y, uint z) public pure {
		require(x == y);
		bytes memory b1 = abi.encodeCall(D.no, (x, z));
		bytes memory b2 = abi.encodeCall(D.no, (y, z));
		assert(b1.length == b2.length); // should hold
		assert(b1[0] == b2[0]); // should hold

		bytes memory b3 = abi.encodeCall(D.no, (3, z));
		assert(b1.length == b3.length); // should hold but we don't compute the length precisely
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6368: (377-382): CHC: Out of bounds access happens here.
// Warning 6368: (386-391): CHC: Out of bounds access happens here.
// Warning 6328: (462-492): CHC: Assertion violation happens here.
// Info 1180: Reentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(b1.length == b2.length)\n<errorCode> = 2 -> Out of bounds access at b1[0]\n<errorCode> = 3 -> Out of bounds access at b2[0]\n<errorCode> = 4 -> Assertion failed at assert(b1[0] == b2[0])\n<errorCode> = 5 -> Assertion failed at assert(b1.length == b3.length)\n
