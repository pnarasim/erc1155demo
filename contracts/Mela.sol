// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC1155/presets/ERC1155PresetMinterPauser.sol";

// deployed to 0xaaa05EB2b9591D559c9E627cBd52Cc25d500325F


contract Mela is ERC1155PresetMinterPauser {

    uint256 public TOTAL_MELAS = 0;

    struct Mela_Deets {
        string name;
        uint total_tickets;
    }
    
    Mela_Deets[] public Melas;
    
    
    constructor(uint num_tickets)  ERC1155PresetMinterPauser("https://github.com/pnarasim/hohum/blob/main/MelaTicketsERC1155/{id}.json") {
        _mint(msg.sender, TOTAL_MELAS, num_tickets, "");
        TOTAL_MELAS = TOTAL_MELAS + 1;
        Mela_Deets memory new_mela = Mela_Deets({
           name: Strings.toString(TOTAL_MELAS),
           total_tickets: num_tickets
        });
        Melas.push(new_mela);
        
    }
    
    function uri(uint256 _tokenId) override pure public  returns (string memory) {
        return string(
            abi.encodePacked(
                "https://github.com/pnarasim/hohum/blob/main/MelaTicketsERC1155/",
                Strings.toString(_tokenId),
                ".json"
                )
            );
    }
    
    function  getMelaDetails(uint mela_id) public view returns (string memory name, uint total_tickets) {
        return (
            Melas[mela_id].name,
            Melas[mela_id].total_tickets
        );
    }
}


/*contract MelaTicketsFactory {
    address[] deployedMelas;
    
    // TBD : add the tickets URI to the constructor later.
    function createMela(uint num_tickets) public {
        address new_mela = address( new Mela(num_tickets));
        deployedMelas.push(new_mela);
    }
    
    function getMelas() public view returns (address[] memory) {
        return deployedMelas;
    }
    
}
*/
