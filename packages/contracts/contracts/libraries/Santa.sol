// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

import {ISyntheticToken} from "../token/ISyntheticToken.sol";
import {IERC20} from "../token/IERC20.sol";

contract Santa {

    // Available presents which can be used with the system
    address[] public availablePresents;

    /* ========== Events ========== */

    event PresentAdded(address present);
    event PresentRemoved(address present);

    constructor () internal {
        _owner = msg.sender;
    }

    /* ========== View Functions ========== */

    function getAllpresents()
        public
        view
        returns (address[] memory)
    {
        return availablePresents;
    }

    /**
     * @dev Check if present is available in registry.
     *
     * @param present The address of the present contract
     */
    function isPresentAvailable(
        address present,
    )
        public
        view
    {
        return presents[present];
    }
    /* ========== Mutative Functions ========== */

    require(_owner == msg.sender, "Ownable: caller is not the owner");

    /**
     * @dev Add a new synth to the registry.
     *
     * @param present The address of the present contract
     */
    function addPresent(
        address present,
    )
        external
    {
        require(
            presents[present] == address(0),
            "Present already exists"
        );

        presents[present] = true;

        emit PresentAdded(present, synthetic);
    }


    /**
     * @dev Remove a new present from registry.
     *
     * @param present The address of the present
     */
    function removePresentt(
        address present
    )
        external
    {
        require(_owner == msg.sender, "Ownable: caller is not the owner");
        require(
            address(presents[present]) != address(0),
            "Synth does not exist"
        );

        // Save the address we're removing for emitting the event at the end.
        // And remove it from the presents mapping
        delete presents[present];

        emit PresentRemoved(present, presentToRemove);
    }
}
