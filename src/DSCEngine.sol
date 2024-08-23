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
 * @author Ayush Chauhan
 * * The system is designed to be as minimal as possible, and have the tokens maintain a 1
 * token == $1 peg.
 * This stablecoin has the properties:
 * - Exogenous Collateral
 * - Dollar Pegged
 * - Algoritmically Stable
 * * It is similar to DAI if DAI had no governance, no fees, and was only backed by WETH and
 * WBTC.
 * our DSC system should always be overcollateralized  meaning value of collatteral >= value of all the DSC
 * * @notice This contract is the core of the DSC System. It handles all the logic for minting
 * and redeeming DSC, as well as depositing & withdrawing collateral.
 * @notice This contract is VERY loosely based on DAI
 *
 */

contract DSCEngine is ReentrancyGuard {
    ///////////////////
    // Errors        //
    ///////////////////

    error DSCEngine__TokenAddressesAndPriceFeedAddressesMustBeSameLength();
    error DSCEngine__NeedsMoreThanZero();
    error DSCEngine__NotAllowedToken(address token);
    error DSCEngine__TransferFailed();
    error DSCEngine__BreaksHealthFactor(uint256 healthFactorValue);
    error DSCEngine__MintFailed();
    error DSCEngine__HealthFactorOk();
    error DSCEngine__HealthFactorNotImproved();

    //////////////////////
    // stable variables //
    /////////////////////

    DecentralizedStableCoin private immutable i_dsc;

    mapping(address token => address priceFeed) private s_priceFeeds;

    // The amount of collateral that has been deposited by each user
    mapping(address user => mapping(address token => uint256 amount)) private s_collateralDeposited;

    // The amount of DSC that has been minted by each user
    mapping(address user => uint256 amount) private s_DSCMinted;

    address[] private s_collateralTokens;

    //////////////////////
    // modifiers       //
    /////////////////////
    modifier moreThenZero(uint256 amount) {
        if(amount == 0){
            revert DSCEngine__NeedsMoreThanZero();
        }
        _;
    }
    modifier isAllowedToken(address token) {
        if(s_priceFeeds[token] == address(0))
    }

    //////////////////////
    // Functions        //
    /////////////////////

    constructor(address[] memory tokenAddresses, address[] memory priceFeedAddress, address dscAddress){
        if(tokenAddresses.length != priceFeedAddress.length){
            revert DSCEngine__TokenAddressesAndPriceFeedAddressesMustBeSameLength();
        }
        for(uint256 i = 0; i< tokenAddresses.length; i++){
            s_priceFeeds[tokenAddresses[i]] = priceFeedAddress[i];
        }
        i_dsc = DecentralizedStableCoin(dscAddress);
    }

    //////////////////////
    // External Functions //
    /////////////////////

    function depositCollateralAndMintDsc() external {}
    /**
     * @param tokenCollateralAddress the address of the token to be deposited
     * @param amountCollateral the amount to be deposited
     */
    function depositCollateral(address tokenCollateralAddress, uint256 amountCollateral)
        external
        moreThenZero(amountCollateral) isAllowedToken(tokenCollateralAddress) nonReentrant
    {
        s_collateralDeposited[msg.sender][tokenCollateralAddress] += amountCollateral;
        emit collateralDeposited(msg.sender, tokenCollateralAddress, amountCollateral);
    } 

    function redeemCollateralForDsc() external {}

    function redeemCollateral() external {}

    function mintDsc() external {}

    function burnDsc() external {}

    function liquidate() external {}

    function getHealthFactor() external {}
    //////////////////////
    // events          //
    /////////////////////

    event collateralDeposited(address indexed user, address indexed token, uint256 indexed amount);
    event collateralRedeemed(address indexed redeemFrom, address indexed redeemTo, address token, uint256 amount);

}
