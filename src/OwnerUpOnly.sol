pragma solidity ^0.8.0;

contract OwnerUpOnly {
  address public immutable owner;
  uint256 public count;

  constructor() {
    owner = msg.sender;
  }

  function increment() external {
    require(
      msg.sender == owner,
      "only the owner can increment the count"
    );
    count++;
  }
}


