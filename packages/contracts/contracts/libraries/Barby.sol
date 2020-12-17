pragma solidity ^0.7.0;
import "./ERC20.sol";

contract Barby is ERC20 {
    string public constant name = "Barby";
    string public constant symbol = "Barby-present";
    uint8 public constant decimals = 18;

    address public minter;
}
