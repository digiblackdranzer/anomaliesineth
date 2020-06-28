pragma solidity ^0.5.16;
contract conditionalPayment2 {

 uint public paidB = 0;// to keep track of the amount paid by Alice when deciding on Bob’s transfer
 uint public paidC = 0;
 uint public dp = 0;
 address payable public A = 0x2B5CD482281C2c9EC73Ad80D1e19F94846E5d701; // the address of Alice’s account
 address payable public B = 0xb89b989AF3D517676B6f6021978A3259e1658F05; // the address of Bob’s account
 address payable public C = 0x76067aC563c0516D09b5e76FB14F9F6F1c0cA02D;

 modifier onlyFrom(address A1)
 {
     if(msg.sender != A1) revert();
     _;
 }

 function sendToB() onlyFrom(A) public payable { // Alice sends money to Bob
     paidB += msg.value;
     B.transfer(paidB);
 }
 
 
 function checkPayment( uint _amount) onlyFrom(B) public view returns (bool) {
     
 if (paidB >= _amount) 
     return true;
     
 else 
    revert();
 }
 
 
 function sendIfReceivedB() onlyFrom(B) public payable { // Alice sends money to Bob
    checkPayment(msg.value);
    
 }
 
 
 function withdrawToB() onlyFrom(B) public payable { 
    
    address payable  X = msg.sender;
    X.transfer(paidB);
     
 }
 
 function deposit() public payable 
 {
         dp+=msg.value;
 }
 
 function withdraw() public payable
 {
    address payable  X = msg.sender;
    X.transfer(dp); 
 }
 
 
 function withdrawToC() onlyFrom(C) public payable { 
    
    address payable  X = msg.sender;
    X.transfer(paidB);
     
 }
 
 
 function getBalance() public view returns(uint)
 {
     return address(this).balance;
 }
 
 
 function getPaidB() public view returns (uint)
 {
     return paidB;
 }
 
 function getPaidC() public view returns (uint)
 {
     return paidB;
 }
 
 
 
 
 
 }