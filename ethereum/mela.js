import web3 from "./web3.js";
import Mela from "../build/contracts/Mela.json";
import ERC1155preset from "../build/contracts/ERC1155PresetMinterPauser.json";

// contract was deployed to 0xaaa05EB2b9591D559c9E627cBd52Cc25d500325F from remix

//console.log(MelaTickets.abi);

const instance = new web3.eth.Contract(
	JSON.parse(JSON.stringify(Mela.abi)),
	"0xaaa05EB2b9591D559c9E627cBd52Cc25d500325F"
);

export default instance;