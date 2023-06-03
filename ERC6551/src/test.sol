// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC6551Registry.sol";
import "./examples/simple/SimpleERC6551Account.sol";

contract AccountTest {
    ERC6551Registry public registry;
    SimpleERC6551Account public implementation;
    address public deployedAccount;
    address public predictedAccount;

    function setUp() public {
        registry = new ERC6551Registry();
        implementation = new SimpleERC6551Account();
    }

    function predictAccount(address nftContract, uint tokenId) public {
        predictedAccount = registry.account(
            address(implementation),
            block.chainid,
            nftContract,
            tokenId,
            0
        );
    }

    function deploy(address nftContract, uint tokenId) public {
        deployedAccount = registry.createAccount(
            address(implementation),
            block.chainid,
            nftContract,
            tokenId,
            0,
            ""
        );
    }

    function testCall() public {
        IERC6551Account accountInstance = IERC6551Account(payable(deployedAccount));

        // accountInstance.executeCall(payable(), 0.5 ether, "");
    }
}
