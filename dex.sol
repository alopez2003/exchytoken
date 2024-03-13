// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DEX {

   IERC20 token;
   address public tokenAddress;
   uint256 rate;

   constructor(address _token) {
      tokenAddress = _token;
      token = IERC20(address(tokenAddress));
      rate = 100;
   }

   function buy() payable public returns(bool) {
      uint256 amountTobuy = msg.value * rate;
      uint256 dexBalance = token.balanceOf(address(this));
      require(amountTobuy > 0, "You must send ETH");
      require(amountTobuy <= dexBalance, "Too much tokens");
      
      token.transfer(msg.sender, amountTobuy);
      
      return true;
   }

   //requiere un previo approve de la dirección de este contrato DEX --> al contrato del token
   function sell(uint256 amount) public returns(bool) {
      require(amount > 0, "No tokens for sale");
      
      token.transferFrom(msg.sender, payable(address(this)), amount);
      payable(msg.sender).transfer(amount/rate);
      
      return true;
   }
}