var RegisterName = artifacts.require("./register/RegisterName.sol");

module.exports = function(deployer) {
  deployer.deploy(RegisterName);
};
