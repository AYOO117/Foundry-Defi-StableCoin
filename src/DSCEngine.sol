    // SPDX-License-Identifier: MIT

// This is considered an Exogenous, Decentralized, Anchored (pegged), Crypto Collateralized low volitility coin

// Layout of Contract:
// version
// imports
// interfaces, libraries, contracts
// errors
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity 0.8.19;

import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {DecentralizedStableCoin} from "./DecentralizedStableCoin.sol";
/**
 * @title DSCEngine
 * @author Patrick Collins
 * * The system is designed to be as minimal as possible, and have the tokens maintain a 1
 * token == $1 peg.
 * This stablecoin has the properties:
 * - Exogenous Collateral
 * - Dollar Pegged
 * - Algoritmically Stable
 * * It is similar to DAI if DAI had no governance, no fees, and was only backed by WETH and
 * WBTC.
 * our DSC system should always be overcollateralized  meaning value of collatteral >= value of all the DSC
 * * @notice This contract is the core of the DSC System. It handles all the logic for mining
 * and redeeming DSC, as well as depositing & withdrawing collateral.
 * @notice This contract is VERY loosely based on DAI
 *
 */

contract DSCEngine is ReentrancyGaurd {
    ///////////////////
    // Errors        //
    ///////////////////

    error DSCEngine__TokenAddressesAndPriceFeedAddressesAmountsDontMatch();
    error DSCEngine__NeedsMoreThanZero();
    error DSCEngine__TokenNotAllowed(address token);
    error DSCEngine__TransferFailed();
    error DSCEngine__BreaksHealthFactor(uint256 healthFactorValue);
    error DSCEngine__MintFailed();
    error DSCEngine__HealthFactorOk();
    error DSCEngine__HealthFactorNotImproved();

    //////////////////////
    // stable variables //
    /////////////////////

    DecentralizedStableCoin private immutable i_dsc;

    mapping(address collateralToken => address priceFeed) private s_priceFeeds;

    // The amount of collateral that has been deposited by each user
    mapping(address user => mapping(address collateralToken => uint256 amount)) private s_collateralDeposited;

    // The amount of DSC that has been minted by each user
    mapping(address user => uint256 amount) private s_DSCMinted;

    address[] private s_collateralTokens;

    //////////////////////
    // events          //
    /////////////////////
    event collateralDeposited(address indexed user, address indexed token, uint256 indexed amount);
    event collateralRedeemed(address indexed redeemFrom, address indexed redeemTo, address token, uint256 amount);

    //////////////////////
    // modifiers       //
    /////////////////////
}
