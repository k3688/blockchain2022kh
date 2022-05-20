// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Inbox{

    string public message;
    address private ownerAddress;

    constructor(string memory initialMessage){
       ownerAddress = msg.sender;
        message = initialMessage;

    }

    function getMessage() public view returns(string memory){
        return message;
    }

    function setMessage(string memory newMessage) public{
        //require( bytes(newMessage).length>20, "Invalid Length");
        require(msg.sender == ownerAddress,"Has to be the owner");
        message = newMessage;
    }
}