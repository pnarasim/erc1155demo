import React, { Component } from "react";
import mela from "../ethereum/mela";
import web3 from "../ethereum/web3";


class MelaTicketsHome extends Component {
	static async getInitialProps() {
		const accounts = await web3.eth.getAccounts();
		console.log("Address of account0 is ", accounts[0]);
		//const my_balance = await mela.methods.balanceOf(accounts[0], 0).call();
		//console.log("My balance is ", my_balance);
		
		const uri = await mela.methods.uri(0).call();
		console.log("URI of 0 is ", uri);

		const summary = await mela.methods.getMelaDetails(0).call();
		console.log(summary[0], summary[1]);
		return { 
			name: summary[0],
			total_tickets: summary[1]
		 }
	}

	render() {
		const { name, total_tickets } = this.props;

		return <div> Music Mela Tickets {name} {total_tickets} </div>
	}
}

export default MelaTicketsHome;
