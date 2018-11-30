var VotingMachine = artifacts.require("./VotingMachine.sol");

module.exports = function(deployer) {
  deployer.deploy(VotingMachine);
};
