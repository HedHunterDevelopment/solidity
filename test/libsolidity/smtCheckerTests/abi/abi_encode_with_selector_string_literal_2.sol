contract C {
	function abiEncodeStringLiteral(bytes4 sel) public pure {
		bytes memory b1 = abi.encodeWithSelector("");
		require(sel == "");
		bytes memory b2 = abi.encodeWithSelector(sel);
		assert(b1.length == b2.length); // should hold
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(b1.length == b2.length)\n
