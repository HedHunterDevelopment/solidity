interface ERC165 {
    /// @notice Query if a contract implements an interface
    /// @param interfaceID The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    ///  uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    ///  `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

interface Simpson {
    function is2D() external returns (bool);
    function skinColor() external returns (string memory);
}

interface PeaceMaker {
    function achieveWorldPeace() external;
}

contract Homer is ERC165, Simpson {
    function supportsInterface(bytes4 interfaceID) public pure override returns (bool) {
        return
            interfaceID == this.supportsInterface.selector || // ERC165
            interfaceID == this.is2D.selector ^ this.skinColor.selector; // Simpson
    }

    function is2D() external pure override returns (bool) {
        return true;
    }

    function skinColor() external pure override returns (string memory) {
        return "yellow";
    }

    function check() public pure {
        assert(supportsInterface(type(Simpson).interfaceId));
        assert(supportsInterface(type(ERC165).interfaceId));
        assert(supportsInterface(type(PeaceMaker).interfaceId));
    }
}


// ====
// SMTEngine: all
// ----
// Warning 6328: (1340-1395): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nHomer.constructor()\nHomer.check()\n    Homer.supportsInterface(0x73b6b492) -- internal call\n    Homer.supportsInterface(0x01ffc9a7) -- internal call\n    Homer.supportsInterface(0x8b9eb9ca) -- internal call
// Info 1180: Contract invariant(s) for :Homer:\n(true || true || true || true || true || true)\nReentrancy property(ies) for :PeaceMaker:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :Homer:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\nReentrancy property(ies) for :ERC165:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :Simpson:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\n<errorCode> = 0 -> no errors\n<errorCode> = 3 -> Assertion failed at assert(supportsInterface(type(Simpson).interfaceId))\n<errorCode> = 4 -> Assertion failed at assert(supportsInterface(type(ERC165).interfaceId))\n<errorCode> = 5 -> Assertion failed at assert(supportsInterface(type(PeaceMaker).interfaceId))\n
