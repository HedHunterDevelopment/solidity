contract C {
    constructor() payable public {}
}
contract D {
    function createC() public returns (C) {
        C c = (new C).value(2)();
        return c;
    }
}
// ----
// TypeError 1621: (122-135): Using ".value(...)" is deprecated. Use "{value: ...}" instead.
