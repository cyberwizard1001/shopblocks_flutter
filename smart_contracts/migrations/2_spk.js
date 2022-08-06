const SpecKart = artifacts.require('SupplyBlocks')
let SpecTokenInstance


module.exports = async function (deployer) {
	deployer.deploy(SpecToken, "0xA0140B09686Ff88f81Cbb81E6FfFBC45aDF22E54", 2)
}

