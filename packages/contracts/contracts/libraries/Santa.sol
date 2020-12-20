// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

contract Santa {
    // Available presents which can be used with the system
    address private _owner;

    mapping(address => bool) public availablePresents;

    /* ========== Events ========== */

    event PresentAdded(address present);
    event PresentRemoved(address present);
    event Greeting(string greeting);

    constructor() {
        _owner = msg.sender;
    }

    /* ========== View Functions ========== */
    function greet(string memory greeting) external {
        emit Greeting(greeting);
    }

    /**
     * @dev Check if present is available in registry.
     *
     * @param present The address of the present contract
     */
    function isPresentAvailable(address present) public view returns (bool) {
        return availablePresents[present];
    }

    /**
     * @dev Add a new synth to the registry.
     *
     * @param present The address of the present contract
     */
    function addPresent(address present) external {
        require(_owner == msg.sender, 'Ownable: caller is not the owner');
        require(availablePresents[present] == false, 'Present already exists');

        availablePresents[present] = true;

        emit PresentAdded(present);
    }

    /**
     * @dev Remove a new present from registry.
     *
     * @param present The address of the present
     */
    function removePresent(address present) external {
        require(_owner == msg.sender, 'Ownable: caller is not the owner');
        require(availablePresents[present], 'Synth does not exist');

        // Save the address we're removing for emitting the event at the end.
        // And remove it from the availablePresents mapping
        delete availablePresents[present];

        emit PresentRemoved(present);
    }
}
