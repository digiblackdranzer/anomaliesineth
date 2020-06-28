pragma solidity ^0.5.16;
contract staleRead {

 mapping (address => uint) balances;
 
 function deposit() public payable
 {
     balances[msg.sender]+=msg.value;
 }
 
 function sendTenPercent(address payable B1) public payable
 {
     B1.transfer(address(B1).balance/10000000000000000000);
 }
 
 
 function sendTo(address payable B1, uint amt) public payable { // Alice sends money to Bob
    
    if(balances[msg.sender]>amt)
    {
        B1.transfer(amt);
        balances[msg.sender]-=amt;
    }
    else
    revert('Insufficient Funds for Sender"');
    
    
 }
 
 
 function getAccountBalance(address payable X) public view returns (uint)
 {
     return balances[X];
 }
 
 function() external
 {
     revert();
 }
 
 
 }