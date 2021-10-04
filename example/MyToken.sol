// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "../contracts/SVG721.sol";

contract MyToken is ERC721 {
  using Strings for uint256;

  constructor() ERC721("MyToken", "MTKN") {
    _safeMint(msg.sender, 0);
  }

  function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
    string memory name = string(abi.encodePacked("MyToken #", tokenId.toString()));
    string memory description = "An example SVG-based, fully on-chain NFT";
    string memory svg = '<svg viewBox="0 0 1000 1000"><circle cx={500} cy={500} r={400} fill="papayawhip" /></svg>';

    return SVG721.metadata(name, description, svg);
  }

  // required overrides

  function _beforeTokenTransfer(
    address from,
    address to,
    uint256 tokenId
  ) internal override(ERC721) {
    super._beforeTokenTransfer(from, to, tokenId);
  }

  function supportsInterface(bytes4 interfaceId) public view override(ERC721) returns (bool) {
    return super.supportsInterface(interfaceId);
  }
}
