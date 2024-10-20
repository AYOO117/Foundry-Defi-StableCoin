** Foundry DeFi Stablecoin Project
Overview
This project implements a decentralized, crypto-collateralized stablecoin system using the Foundry framework. The goal is to create a minimalistic stablecoin, pegged to $1, that maintains stability through exogenous collateral (WBTC and WETH) and operates algorithmically. Inspired by DAI, this stablecoin has no governance or fees, making it fully autonomous.

Key Features
Dollar-Pegged: The stablecoin is designed to maintain a 1:1 peg with the US dollar.
Over-Collateralization: The system ensures that the value of collateral (WBTC, WETH) is always greater than or equal to the value of all minted stablecoins.
No Governance & No Fees: Unlike other stablecoins, this system operates without any governance or associated fees.
Algorithmic Stability: The contract ensures algorithmic stability for efficient minting and redeeming of stablecoins.
Tech Stack
Solidity: Core logic and smart contract development.
Foundry: Testing and development framework for Solidity.
OpenZeppelin: Secure and reusable smart contract libraries.
Chainlink Oracles: For fetching real-time asset prices.
Ethers.js: Used for interactions with Ethereum nodes.
