==== Source: A ====
type MyInt is int;
type MyAddress is address;
==== Source: B ====
import {MyInt, MyAddress as OurAddress} from "A";
contract A {
	function f(int x) internal pure returns(MyInt) { return MyInt.wrap(x); }
	function f(address x) internal pure returns(OurAddress) { return OurAddress.wrap(x); }

	function g() public pure {
		assert(MyInt.unwrap(f(int(5))) == 5);
		assert(MyInt.unwrap(f(int(5))) == 0); // should fail
		assert(OurAddress.unwrap(f(address(5))) == address(5));
		assert(OurAddress.unwrap(f(address(5))) == address(0)); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (B:296-332): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nA.constructor()\nA.g()\n    A.f(5) -- internal call\n    A.f(5) -- internal call
// Warning 6328: (B:409-463): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nA.constructor()\nA.g()\n    A.f(5) -- internal call\n    A.f(5) -- internal call\n    A.f(0x05) -- internal call\n    A.f(0x05) -- internal call
// Info 1180: Contract invariant(s) for B:A:\n(true || true || true)\nReentrancy property(ies) for B:A:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(MyInt.unwrap(f(int(5))) == 5)\n<errorCode> = 2 -> Assertion failed at assert(MyInt.unwrap(f(int(5))) == 0)\n<errorCode> = 3 -> Assertion failed at assert(OurAddress.unwrap(f(address(5))) == address(5))\n<errorCode> = 4 -> Assertion failed at assert(OurAddress.unwrap(f(address(5))) == address(0))\n
