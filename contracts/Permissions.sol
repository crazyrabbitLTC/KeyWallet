pragma solidity ^0.5.0;

import "zos-lib/contracts/Initializable.sol";
import "openzeppelin-eth/contracts/ownership/Ownable"; 

contract Permissions is Initializable, Ownable {
    
    struct Owner {
        address owner;
        Key[] activeKeys;
        mapping(address => bool) isKeyActive;
        uint totalKeys;
        uint totalActiveKeys;
        MultiSig multiSig;
        CallRecord[] callHistoryArray;
        mapping(uint => CallRecord) callHistoryMapping;
        uint256 callCount;
        uint256 delayEnabled;
        Delay delay;
    }
    
    struct Key {
        address keyAddress;
        //address[] revokePermission;
        //address[] alterLimits;
        ContractPermission[] contractList;
        CallRecord[] callHistoryArray;
        mapping(uint => CallRecord) callHistoryMapping;
        uint256 callCount;
        uint256 delayEnabled;
        Delay delay;
    }
    
    struct ContractPermission {
        address allowedContract;
        MultiSig coSigners;
        AllowedFunction[] functionList;
        CountInterval callLimit;
        GasLimit txCost;
        EthValueLimit ethValue;
        TokenValueLimit tokenValue;
        NFTLimit nftLimits;
        DestinationAddress destination;
        bool enabled;
    }
    
    struct AllowedFunction {
        bytes func;
        MultiSig coSigners;
        CountInterval callLimit;
        GasLimit txCost;
        EthValueLimit ethValue;
        TokenValueLimit tokenValue;
        NFTLimit nftLimits;
        DestinationAddress destination;
        
        bool enabled;
    }

    struct MultiSig {
        address[] coSigners;
        bool enabled;
    }
    
    struct CountInterval {
        uint256 count;
        uint256 timePeriod;
        bool enabled;
    }
    
    struct Delay {
        uint256 start;
        uint256 delay;
        bool enabled;
    }
    
    struct CallRecord {
        address contractAddress;
        bytes func;
        uint256 time;
        uint256 valueEth;
        uint256 valueToken;
        uint256 txCost;
        uint256[] nftID;
        address[] key;
     }
    struct GasLimit {
        uint256 gas;
        uint256 gasPrice;
        bool enabled;
    }
    
    struct EthValueLimit {
        uint256 value;
        bool enabled;
    }
    
    struct TokenValueLimit {
        uint256 value;
        bool enabled;
    }
    
    struct NFTLimit {
        uint256[] allowedTokenIDs;
        uint256[] disallowedTokenIDs;
        bool enabled;
    }
    
    struct DestinationAddress {
        address destination;
        bool enabled;
    }

    Owner public owner;

    //ERC20[] public erc20s;
    //ERC721[] public erc721;
    //ERC777[] public erc777;


    function initialize(address _sender) public initializer {
        Ownable.initialize(_sender);
        owner.owner = _sender;
    }

//require onlyOwner
    function SetPermissions() public onlyOwner {}

    function AddPermissionKey(address _key, bool _isKeyActive, ContractPermission[] _contractList, uint256 _delayEnabled, Delay _delay) public onlyOwner{

    Key _newKey = Key({keyAddress: _key, contractList: _contractList, delayEnabled: _delayEnabled, delay: _delay});

    owner.activeKeys.push(_newKey);
    owner.isKeyActive[_key] = _isKeyActive;
    owner.totalKeys += 1;

    }


    // function getEthBalance() {}

    // function getERC20TokenBalance(ERC20 _contractAddress) {}

    // function getERC20TokenCount() returns(uint){}

    // function getERC20TokenList() returns(address[]){}

    // function getERC721TokenCount() returns(uint){}

    // function getERC721TokenList()returns(address[]){}

    // function getERC777TokenCount() returns(uint){}

    // function getERC777TokenList() returns(address[]){}

    
    //Maybe this should be done in one global registry of Tokens also
    function _registerERC20() {}
    function _registerERC721() {}
    function _registerERC777() {}



    
}