// SPDX License Identifier: MIT
 pragma solidity ^0.8.19:
 contract webButton(){
     function connect(){
        if(windows.ethereum !== "undefined"){
            console.log("there is metamask")
            await ethereum.request({method: eth_requestAccounts,})
        }
        else {
            console.log("intsall metamask");
        }
     }
    //  function connect() public {
    //        if(window.ethereum !== "undefined"){
    //     conosle.log("there is metamask")
    //     await ethereum.request({method: "eth_requestAccounts",})
    //     connectButton.innerHTML = "connected"
    //      }
    //      else {
    //          console.log("install metamask")
    //      }
    //  }
 }

   
