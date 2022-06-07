// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Lottery{
    address[] public players;
    address public manager;

    constructor(){
        manager = msg.sender;
    }

    function enter() public payable{
        require(msg.value > 2 ether);
        players.push(msg.sender);
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

    function pickWinner() public{
        require(msg.sender == manager, "You are not authorized to pick a winner");
        //return random() % players.length;

        uint index = random() % players.length;
        payable(players[index]).transfer(address(this).balance);
        players = new address[](0);
    }
}