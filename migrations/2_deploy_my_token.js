const WrappedEther = artifacts.require('./WrappedEther.sol')

module.exports = (deployer) => {
  deployer.deploy(WrappedEther)
}