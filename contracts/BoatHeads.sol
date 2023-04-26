// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract BoatHeads is ERC721 {
    using Counters for Counters.Counter;

    uint256 public constant MAX_BOAT_HEADS = 10000;
    Counters.Counter private _tokenIds;
    //uint256 public mintPrice = 0.1 ether;

    constructor() ERC721("BoatHeads", "BHEADS") {}

    function mintHead() public payable {
        require(
            _tokenIds.current() <= MAX_BOAT_HEADS,
            "Purchase would exceed max supply of boat heads"
        );
        _tokenIds.increment();

        /*require(
            msg.value >= mintPrice,
            "Ether value sent is not correct"
        );*/

        _safeMint(msg.sender, _tokenIds.current());
        
    }

    function _baseURI() internal view override virtual returns (string memory) {
        return "ipfs://QmRJQn2JR9RY7n44egpNzDiWHG5weU2HCoqrvMAtrkMzkH/";
    }

}
