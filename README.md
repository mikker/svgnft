# svgnft

A helper library for generating fully on-chain NFTs (ERC721) on Ethereum.

Being on-chain is fun!

## Example

See `example/`. Override `tokenUri` with something like:

```solidity
  function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
    string memory name = string(abi.encodePacked("MyToken #", tokenId.toString()));
    string memory description = "An example SVG-based, fully on-chain NFT";
    string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><circle cx={500} cy={500} r={400} fill="papayawhip" /></svg>';

    return SVG721.metadata(name, description, svg);
  }
```

That's it!

## Install

Using [hardhat](https://hardhat.org).

```sh
npm install --save-dev svgnft
# or
yarn add --dev svgnft
```

In your contract

```solidity
import "svgnft/contracts/SVG721.sol";
```

## License

MIT

`Base64.sol` by Brecht Devos.
