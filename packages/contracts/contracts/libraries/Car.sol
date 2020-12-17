pragma solidity ^0.7.0;
import "./ERC20.sol";

contract Car is ERC20 {
    string public constant name = "Car";
    string public constant symbol = "Car-present";
    uint8 public constant decimals = 18;

    address public minter;
}
