pragma solidity ^0.7.0;
import "./ERC20.sol";

contract Bike is ERC20 {
    string public constant name = "Bike";
    string public constant symbol = "Bike-present";
    uint8 public constant decimals = 18;

    address public minter;
}
