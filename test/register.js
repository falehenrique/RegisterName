var Register = artifacts.require("RegisterName");

const BigNumber = web3.BigNumber

const should = require('chai')
	.use(require('chai-as-promised'))
	.use(require('chai-bignumber')(BigNumber))
    .should()

contract('RegisterName', function(accounts) {
    var owner = accounts[0];
    var name = "GoBlockchain";

    it("deploy", async function() {
        register = await Register.new();
    });

    it("Register the name", async function() {
        await register.registerName(name);
    });      

    it("The size should be 1", async function() {
        (await register.getNameSize()).should.bignumber.equal(1);
    });       

    it("should prevent register with the same name", async function() {
        await register.registerName(name).should.be.rejectedWith('VM Exception while processing transaction: revert');
    }); 
});    