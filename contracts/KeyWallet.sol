pragma solidity ^0.5.0;

contract Permissions {
    
    struct Owner {
        address owner;
        Key[] activeKeys;
        Key[] disabledKeys;
        MultiSig multiSig;
        CallRecord[] callHistoryArray;
        mapping(uint => CallRecord) callHistoryMapping;
        uint256 callCount;
        uint256 delayEnabled;
        Delay delay;
    }
    
    struct Key {
        address[] revokePermission;
        address[] alterLimits;
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
}