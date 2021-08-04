pragma solidity ^0.8.0;

import "./ERC721.sol";
import "./ERC20.sol";  // fix compiler versions

 contract TransferOwnership is ERC721Holder {
     bool deal_on; 
     
     
     
     struct Deal {
         uint ID;
         address payable Lender;
         address payable borrower;
         address NFT_address;     //collateral
         uint principal;
         uint ROI;
         uint time;
         uint installment;
         uint n_EMI;
         uint[] tokenID;
         
     }
     
     mapping (uint => Deal) public deals; 
     
     function safeTransferFrom(
         address from, 
         address to, 
         uint tokenID) external;
         
    
    
    function initiate(
             uint _principal, 
             uint _ROI, 
             uint _time, 
             address _NFT_address,
             address _Lender) external payable {
                 // require( conditions to check );
                 // deals[ID] = assign id no to deal ;
            
            deals[ID].principal = _principal
            deals[ID].ROI = _ROI;
            deals[ID].time = _time;
            deals[ID].borrower = msg.sender;
            deals[ID].Lender = _Lender;
            
            
             } 
     
    
    function transferNFT(bool _deal_on) external payable {
         require (msg.sender == borrower && _deal_on == TRUE, "Invalid Request");
         
          safeTransferFrom(
             msg.sender,
             address(this), 
             tokenID);   // NFT Transferred to Contract
    }
    
     function payEMI() external payable {
            require (msg.sender == borrower, "Invalid Request"); 
            
            if(msg.sender.balanceOf() >= installment)
                transfer(Lender, installment);
            else 
            { "Insufficient funds";
            }
            
            
        }
    
    
 }
 
             /*  
             
             constructor (uint _principal, uint _ROI, uint _time)  // Set terms of conditions (ROI, DATE, Principal)
            
            { 
                Principal = _principal;
                ROI = _ROI;
                time = _time;            // [curr_date.timestamp + n days;]
             
            } 
            
            */
