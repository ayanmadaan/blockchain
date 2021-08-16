

pragma solidity ^0.8.0;

import "./ERC721.sol";
import "./ERC20.sol";  // fix compiler versions

 contract TransferOwnership is ERC721Holder {
     // bool deal_on; 
     
     enum Status{
              ACTIVE,
              DEFAULTED,
              COMPLETED,
              TERMINATED
            }
            enum TokenType{ ERC721, ERC1155 } // NFTs
    
     
     
     struct Deal {
         
         uint ID;
         address payable Lender;
         address payable borrower;
         address NFT_address;     //collateral
         uint principal;
         Status status;
         uint ROI;
         uint time;
         uint n_installments;   // Agreed upon by both parties or calculated by the portal
         uint EMI;
         uint[] tokenID;
         
     }
     
        mapping (uint => Deal) public deals; 
     
     function safeTransferFrom(
         address from, 
         address to, 
         uint tokenID) external;
         
    
    
     function initiate(
             uint _principal, 
             uint _n_installments,
             uint _ROI, 
             uint _time, 
             address _NFT_address,
             address _Lender) external payable {
                 require( n_installments> 0, "Loan must have at least 1 installment");
                 require( principal > 0, "Loan amount must be higher than 0");
                // Add more conditions
                 // deals[ID] = assign id no to deal ;
            
            deals[ID].principal = _principal
            deals[ID].ROI = _ROI;
            deals[ID].time = _time;
            deals[ID].borrower = msg.sender;
            deals[ID].Lender = _Lender;
            deals[ID].status = Status.ACTIVE;
           
           
            emit NewDeal (ID);
            
            
             }  
             
     function terminate(
             uint ID) external {
            require(deals[ID].status != Status.CANCELLED || deals[ID].status != Status.TERMINATED; , "This loan is inactive");
            require(msg.sender == deals[ID].borrower || msg.sender == deals[ID].Lender, "Not permitted");
            require( time.now > installment date) // Borrower bad
                deals[ID].status = Status.TERMINATED;
                forfeitNFTNFT(_NFT_address); //Transfer NFT to Lender
            
            if (EMI == 0 || n_installments == 0)
            transferNFT(borrower); //separate functions for each type transfer?
            // Loan COMPLETED
            deals[ID].status = Status.COMPLETED;
            
            
             }
     
    
     function transferNFT() external payable {
         require (msg.sender == borrower && _deal_on == TRUE, "Invalid Request");
         
          safeTransferFrom(
             msg.sender,
             address(this), 
             tokenID);   // NFT Transferred to Contract
             }
             
              
     function forfeitNFT() internal {
        
         safeTransferFrom(
             address(this),
             _Lender,
             tokenID);   // NFT Transferred to Lender
             }
        
    
    
     function payEMI() external payable {
            require (msg.sender == borrower, "Invalid Request"); 
            
                if(balanceOf(msg.sender) >= installment)
                    transfer(Lender, installment);
                else 
                { 
                    "Insufficient funds";
                }
            
            
             }
        
        
    event NewDeal(
        uint ID);
        
         
    
 }
 
             /*  
             
             constructor (uint _principal, uint _ROI, uint _time)  // Set terms of conditions (ROI, DATE, Principal)
            
            { 
                Principal = _principal;
                ROI = _ROI;
                time = _time;            // [curr_date.timestamp + n days;]
             
            } 
            
            
            function getLoanInstallmentCost(
                     uint ID,
                     uint _n_installments,
                     uint _ROI, 
                     uint _time, 
                     address _NFT_address,
                  ) {
                    require(_n_installments <= deals[ID]._n_installments, "Number of installments too high");
                
            
            */
