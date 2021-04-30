pragma solidity ^0.7.0;

contract BookWallet{
    
    // model of the book
    struct Book{
        string title;
        string author;
    }
    
    // book store with sender address and book details
    mapping(address => mapping(uint8 => Book)) public book;
    
    // user add new book on his book wallet
    function addNewBook(uint8 _id , string memory _title, string memory _author) public {
        
        // take the book details and sender address add it to his book wallet
        book[msg.sender][_id] = Book(_title,_author);
    }
    
}
