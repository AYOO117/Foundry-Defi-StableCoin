// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

/**
 * @title OracleLib
 * @author Ayush Chauhan
 * @notice this library is used to check the chainlink oracle for stale data.
 * if the price is stale the function will revert, and render the dscengine unusable - this is by design.
 * we want the dscengine to freeze if the price becomes stale.
 *
 * so if the chainlink network explodes and you have a lot of money locked in the protocol... too bad.
 *
 */
library OracleLib {
    error OracleLib__stalePrice();

    uint256 private constant TIMEOUT = 3 hours; //3 * 60 * 60 = 10800 seconds

    function staleCheckLatestRoundData(AggregatorV3Interface priceFeed)
        public
        view
        returns (uint80, int256, uint256, uint256, uint80)
    {
        (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound) =
            priceFeed.latestRoundData();

        uint256 secondsSince = block.timestamp - updatedAt;
        if (secondsSince > TIMEOUT) {
            revert OracleLib__stalePrice();
        }
        return (roundId, answer, startedAt, updatedAt, answeredInRound);
    }
}
