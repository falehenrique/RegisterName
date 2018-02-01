//defini a versão de compilação do solidty
pragma solidity ^0.4.18;

contract RegisterName {
    //variável map onde a chave é uma array de bytes e o valor booleano(true ou false)
    mapping (bytes32=>bool) mapNames;
    //array de bytes
    bytes32[] public names;
    //evento para ser utilizado como callback pela nossa aplicação web
    event LogNameRegistered(string _name, uint256 time);
    //contrutor que utiliza o modificador 
    function RegisterName() public {

    }
    //função pública que recebe uma string e retorna um tipo bytes32
    function registerName(string _name) public returns(bytes32) {
        // keccak256 retorna um hash do parâmetro _name
        bytes32 nameHash = keccak256(_name);
        //assert verifica se o nome já existe no map, se existir ele interrompe a execução
        assert(!mapNames[nameHash]);
        //adiciona na lista
        names.push(nameHash);
        //seta o valor da chave do hash para true
        mapNames[nameHash] = true;
        //dispara o evento para ser feito algo na nossa aplicação web ou api, etc.
        LogNameRegistered(_name, now);
        // retorna a nome convertido em hash
        return nameHash;
    }

    //Retorna o tamanho da lista de nomes
    function getNameSize() public view returns(uint256) {
        return names.length;
    }
}