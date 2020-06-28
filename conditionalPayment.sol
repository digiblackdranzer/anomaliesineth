pragma solidity ^0.5.16;
contract conditionalPayment {

 uint public paid = 0;// to keep track of the amount paid by Alice when deciding on Bob’s transfer
 mapping (address => uint) public balances;
 address payable public A = 0x58e3f8fF066694FA146c176526D41dADf2d836fD; // the address of Alice’s account
 address payable public B = 0x29e6093EcFb9652C0B36222C205eFA7eeB567ADA; // the address of Bob’s account
 
 modifier onlyFrom(address A1)
 {
     if(msg.sender != A1) revert();
     _;
 }
  

 function sendTo(address payable B1, uint amt) onlyFrom(A) public payable { // Alice sends money to Bob
    
    if (balances[A]>=amt)
    {
        balances[A]-=amt;
        balances[B1]+=amt;
        paid=amt;
    }
    
 }
 
 function checkPayment( uint _amount) public view returns (bool) {
 if (paid == _amount)  // check that Alice paid
     return true;
     
 else 
    revert();
 }
 
 
 function sendIfReceived(address payable C,uint amt) public payable { 
    
    balances[B]-=amt;
    balances[C]+=amt;
     
 }
 
 
 function getBalance() public view returns(uint)
 {
     return address(this).balance;
 }
 
 
 function getPaid() public view returns (uint)
 {
     return paid;
 }
 
 
 
 
 }