// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyCoolNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // pass the name of our NFTs token and its symbol.
    constructor() ERC721("GHRAMNFT", "GHRAM") {
        console.log("This is my NFT contract. cool!");
    }

    function makeCoolNFT() public {
        // Get the current tokenId, starts at 0.
        uint256 newItemId = _tokenIds.current();

        // mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);

        // Set the NFTs data.
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/1CWK");
        console.log(
            "An NFT w/ ID %s has been minted to %s",
            newItemId,
            msg.sender
        );

        // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();
    }
}
