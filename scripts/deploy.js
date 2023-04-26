const { ethers } = require("hardhat");

async function main() {
  const BoatHeads = await ethers.getContractFactory("BoatHeads");

  const boatheads = await BoatHeads.deploy();   
  console.log("Contract deployed to address:", boatheads.address);
}

main()
 .then(() => process.exit(0))
 .catch(error => {
   console.error(error);
   process.exit(1);
 });