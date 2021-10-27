const MelaTickets = artifacts.require("MelaTickets");

module.exports = async function (deployer, network, accounts) {
  // deployment steps
  await deployer.deploy(MelaTickets);
};
