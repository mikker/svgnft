const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MyToken", function () {
  let MyToken;
  let myToken;

  before(async function () {
    MyToken = await ethers.getContractFactory("MyToken");
    myToken = await MyToken.deploy();
    await myToken.deployed();
  });

  it("has a tokenUri that returns an inline SVG", async function () {
    const uri = await myToken.tokenURI(0);
    expect(uri).to.match(/^data:application\/json;base64,.+/);

    let base64;
    [_, base64] = uri.split(",");
    const json = JSON.parse(Buffer.from(base64, "base64").toString("utf-8"));

    expect(json["name"]).to.eq("MyToken #0");
    expect(json["description"]).to.eq(
      "An example SVG-based, fully on-chain NFT"
    );

    const image = json["image"];
    expect(image).to.match(/^data:image\/svg/);

    [_, base64] = image.split(",");
    const svg = Buffer.from(base64, "base64").toString("utf-8");

    expect(svg).to.eq(
      '<svg viewBox="0 0 1000 1000"><circle cx={500} cy={500} r={400} fill="papayawhip" /></svg>'
    );
  });
});
