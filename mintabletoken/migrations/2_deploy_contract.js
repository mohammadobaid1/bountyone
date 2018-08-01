const TestToken = artifacts.require("./Myminttoken.sol");
module.exports = function(deployer) {
  deployer.deploy(TestToken);
};