/**
 *Submitted for verification at Etherscan.io on 2020-03-20
*/

pragma solidity ^0.5.14;


contract Leaderboard {

    uint256 public totalCount;
    
    int256[9999999] public netProfit;
    address[9999999] public playerAddress;
    
    function getLeaderboard () public view returns (address firstPlace, address secondPlace, address thirdPlace, int256 firstPlaceProfit, int256 secondPlaceProfit, int256 thirdPlaceProfit){

    uint256 firstPlaceIndex;
    uint256 secondPlaceIndex;
    uint256 thirdPlaceIndex;
    
    for (uint256 i = 1; i <= totalCount; i++) {
    
    if (firstPlaceProfit < netProfit[i]) {
        
        thirdPlaceProfit = secondPlaceProfit;
        thirdPlaceIndex = secondPlaceIndex;
        secondPlaceProfit = firstPlaceProfit;
        secondPlaceIndex = firstPlaceIndex;
        firstPlaceProfit = netProfit[i];
        firstPlaceIndex = i;
  
    }
    
    else if (secondPlaceProfit < netProfit[i]) {
        
        thirdPlaceProfit = secondPlaceProfit;
        thirdPlaceIndex = secondPlaceIndex;
        secondPlaceProfit = netProfit[i];
        secondPlaceIndex = i;
        
    }
    
    else if (thirdPlaceProfit < netProfit[i]) {
        
        thirdPlaceProfit = netProfit[i];
        thirdPlaceIndex = i;
        
    }
        
    }
    
    firstPlace = playerAddress[firstPlaceIndex];
    secondPlace = playerAddress[secondPlaceIndex];
    thirdPlace = playerAddress[thirdPlaceIndex];
    
    }

    function enterUserProfit(address userAddress, int256 userProfit) public {
    
    totalCount = totalCount + 1;
    
    playerAddress[totalCount] = userAddress;
    netProfit[totalCount] = userProfit;
    
    }

    
}
