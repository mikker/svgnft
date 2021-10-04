// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Base64.sol";

library SVG721 {
  function metadata(
    string memory tokenName,
    string memory tokenDescription,
    string memory svgString
  ) internal pure returns (string memory) {
    string memory json = string(abi.encodePacked('{"name":"', tokenName, '","description":"', tokenDescription, '","image": "data:image/svg+xml;base64,', Base64.encode(bytes(svgString)), '"}'));
    return string(abi.encodePacked("data:application/json;base64,", Base64.encode(bytes(json))));
  }
}
