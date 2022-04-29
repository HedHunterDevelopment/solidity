
contract C {
	enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
	ActionChoices public choice;

	function f() public view {
		ActionChoices e = this.choice();
		assert(e == choice); // should hold
		assert(e == ActionChoices.SitStill); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (210-245): CHC: Assertion violation happens here.\nCounterexample:\nchoice = 0\ne = 0\n\nTransaction trace:\nC.constructor()\nState: choice = 0\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (choice' = choice)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(e == choice)\n<errorCode> = 2 -> Assertion failed at assert(e == ActionChoices.SitStill)\n
