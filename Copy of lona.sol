pragma solidity >=0.4.22 <0.6.0;

contract lona {
    
    mapping(address => uint256) private loa_holders;
    mapping(address => uint256) private mark_holders;
    address creator;
    
    event LOA_Added(
        address indexed _to,
        uint256 _value
    );
    
     event LOA_Deleted(
        address indexed _to
    );
    
    event MARK_Added(
        address indexed _to,
        uint256 _value
    );
    
    constructor() public{
        creator = msg.sender;
        
    }
    
    function addLOA(uint256 LOA, address user) public returns (address, uint256) {
        if(msg.sender != creator) return (address(0),uint256(0));
        loa_holders[user] = LOA;
        emit LOA_Added(user, LOA) ;
        return (user, LOA);
        
    }
    
    function addMARK(uint256 MARK, address user) public returns (address, uint256) {
        if(msg.sender != creator) return (address(0),uint256(0));
        if(mark_holders[user] == uint256(0)) mark_holders[user] = MARK;
        else mark_holders[user] += MARK;
        emit MARK_Added(user, MARK);
        return (user, MARK);
    }
    
    function destroyLOA(address user) public returns (address) {
        if(msg.sender != creator) return address(0);
        delete loa_holders[user];
        emit LOA_Deleted(user);
        return user;
    }
    
    function reduceMARK(uint256 MARK, address user) public returns (address , uint256) {
        if(msg.sender != creator)return (address(0),uint256(0));
        if(mark_holders[user] == uint256(0)) return (user,MARK);
        else mark_holders[user] -= MARK;
        emit MARK_Added(user, MARK);
        return (user, MARK);
        
    }
    
    function getUserLoa(address user) public view returns (uint256){
        return loa_holders[user];
    }
    
     function getUserMark(address user) public view returns (uint256){
        return mark_holders[user];
    }
    
    
}
