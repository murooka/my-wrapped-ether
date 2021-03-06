pragma solidity ^0.4.23;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract WrappedEther is StandardToken {
  event Deposited(address indexed owner, uint value);
  event Withdrawn(address indexed owner, uint value);

  function deposit() public payable {
    require(msg.value > 0);
    balances[msg.sender] += msg.value;
    totalSupply_ += msg.value;

    emit Deposited(msg.sender, msg.value);
  }
  function withdraw(uint _value) public {
    require(_value > 0);
    require(balances[msg.sender] >= _value);
    balances[msg.sender] -= _value;
    totalSupply_ -= _value;
    msg.sender.transfer(_value);

    emit Withdrawn(msg.sender, _value);
  }
}