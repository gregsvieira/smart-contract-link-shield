// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

contract LinkShield {

    struct Link {
        string url;
        address owner;
        uint256 fee;
    }

    mapping(string => Link) private links; 

    function addLink(string calldata url, string calldata linkId, uint256 fee) public {
        Link memory link = links[linkId];
        require(link.owner == address(0) || link.owner == msg.sender, "This linkId already has an owner");

        link.url = url;
        link.fee = fee;
        link.owner = msg.sender;

        links[linkId] = link;
    }

}