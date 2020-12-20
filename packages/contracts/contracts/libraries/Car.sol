// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Car is ERC20 {
  constructor(uint256 initialBalance) ERC20("Car", "CarSymbol") {
    _mint(msg.sender, initialBalance);
  }
}
