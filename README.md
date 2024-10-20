# Foundry DeFi Stablecoin Project

## Overview

This project implements a decentralized, crypto-collateralized stablecoin system using the Foundry framework. The goal is to create a minimalistic stablecoin, pegged to $1, that maintains stability through exogenous collateral (WBTC and WETH) and operates algorithmically. Inspired by DAI, this stablecoin has no governance or fees, making it fully autonomous.

## Key Features

- **Dollar-Pegged**: The stablecoin is designed to maintain a 1:1 peg with the US dollar.
- **Over-Collateralization**: The system ensures that the value of collateral (WBTC, WETH) is always greater than or equal to the value of all minted stablecoins.
- **No Governance & No Fees**: Unlike other stablecoins, this system operates without any governance or associated fees.
- **Algorithmic Stability**: The contract ensures algorithmic stability for efficient minting and redeeming of stablecoins.

## Tech Stack

- **Solidity**: Core logic and smart contract development.
- **Foundry**: Testing and development framework for Solidity.
- **OpenZeppelin**: Secure and reusable smart contract libraries.
- **Chainlink Oracles**: For fetching real-time asset prices.
- **Ethers.js**: Used for interactions with Ethereum nodes.

## Installation

To run and test the project locally:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/AYOO117/Foundry-Defi-StableCoin.git


2. **cd Foundry-Defi-StableCoin forge install**:

   ```bash
   cd Foundry-Defi-StableCoin
   forge install

3. **Run Tests**:

   ```bash
   forge test

   
4. **Deploying Contracts**:

   ```bash
   forge script script/Deploy.s.sol --rpc-url <YOUR_RPC_URL>


## Smart Contract Description

### DSCEngine.sol

- **Collateral Management**: Handles deposit/withdrawal of collateral (WETH, WBTC).
- **Minting & Redeeming**: Users can mint stablecoins using over-collateralized assets and redeem them by returning the stablecoins.
- **Stability Mechanism**: Algorithmic checks ensure stability, keeping the token's value at $1.

## Getting Started

1. **Deposit WETH or WBTC** as collateral.
2. **Mint stablecoins (DSC)** by over-collateralizing.
3. **Redeem stablecoins** to retrieve your collateral.

## Tests

Extensive unit tests have been written using the Foundry framework to ensure proper functioning of the system, covering:

- Collateral deposit/withdrawal
- Minting/redeeming DSC
- Price updates and stability mechanisms

## Contributing

Feel free to open issues or submit pull requests if you find any bugs or have suggestions for improvements.

## License

This project is licensed under the MIT License.

