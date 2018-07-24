pragma solidity ^ 0.4.21;


contract ERC20Interface {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}



contract MyFirsttoken is ERC20Interface {
    
    address public owner;
    uint totalsupply;
    string tokenname;
    string tokensymbol;
    uint8 decimal;
    mapping(address=>uint256)public balances;
    
    function MyFirsttoken(uint tokensupply,uint8 decimals, string symbol, string name){
    balances[owner] = totalsupply;   
    totalsupply = tokensupply;
    decimal = decimals;
    tokenname =   name;  
    tokensymbol = symbol;    
    
    }
    
    function totalSupply()public constant returns(uint){
        return totalsupply;
        
    }
    
    function balanceOf(address tokenholder)public constant returns(uint balance){
        return balances[owner];
    }
    
    
    
    
    
    function transfer(address tos,uint amount)public returns(bool success){
    require(amount <= balances[msg.sender]);
    balances[msg.sender]-= amount;
    balances[tos] +=amount;
    emit Transfer(msg.sender,tos,amount);   
    }    
    
    
    function transferFrom(address from, address to ,uint tokens)public returns (bool success){
        
        
        uint allowedbalance = allowance(from ,to);
        require(tokens <= allowedbalance);
        balances[from] -= tokens;
        balances[to] += tokens;
        emit Transfer(from,to,tokens);
        
        
    }
    
}
