pragma solidity ^0.4.2;

contract Concurrent {   
  
  address a;
  address b;
  mapping (address => uint) public credit;
  
    
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
  
  function t1() public {
      uint abal = credit[a];
      abal-=50;
      credit[a]=abal;
      abal = credit[b];
      abal+=50;
      credit[b]=abal;
  }
  
  function t2() public {
      uint abal = credit[a];
      uint bbal = abal/10;
      abal = abal-bbal;
      credit[a]=abal;
      abal = credit[b];
      abal+=bbal;
      credit[b]=abal;
  }
  
  
}