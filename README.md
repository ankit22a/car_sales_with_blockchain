This is basic smart contract interaction client developed in React. 

## Environment Requirements

  - Node
  - Yarn/Npm 
  
## Clone the repository 

```
  git clone git@github.com:bring/ethbasiccontract.git
  cd ethbasiccontract
 ```

## Basic Setup 
  
  **Ganache**
  
  Ganache is a fast and customizable blockchain emulator. It allows you to make calls to the blockchain without the overheads     of running an actual Ethereum node in local. On running on local , it gives you 10 account by default with 100 ethers each.

  *Installation*
  
  Open a new terminal in the command line and execute below comands 
  
    npm install -g ganache-cli
    ganache-cli
  
  It will start local blockchain instance at http://127.0.0.1:8545 and you can start seeing the the default account details.
  
  Take a note of account public and private addresses in a notepad
  
  More configuration option can be found [here](https://www.npmjs.com/package/ganache-cli)
  
  Alternatively there is also one [GUI](https://www.trufflesuite.com/docs/ganache/quickstart) version available. 
  
  **Metamask**
  
MetaMask is the easiest way to interact with dapps in a browser. It is an extension for Chrome or Firefox that connects to an Ethereum network without running a full node on the browser's machine. It can connect to the main Ethereum network, any of the testnets (Ropsten, Kovan, and Rinkeby), or a local blockchain such as the one created by Ganache.

Installation guidelines can be found [here](https://metamask.io/). 

After installation you will need create an wallet and configure the test accounts in the wallet . 

**Step 1**: First switch to the network running on local on port 8545 from the Networks Dropdown. 
![Alt Text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2012.24.47.png)

**Step 2**:Then click on the logo next to the network dropdown . This will give you details about the accounts you have configured in metmask for this network. 

![Alt Text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2012.26.35.png)

**Step 3** You can choose `Import Account` to add accounts received from ganache in the MetaMask wallet.

![Alt Text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2012.33.02.png)




**Remix**

Remix is a online IDE which can be used to write , compile and deploy smart contracts. It will also  provides option to execute smart contract methods from the online IDE


**1.** Open https://remix.ethereum.org/ in browser 

**2.** Activate  below plugin's in the IDE
   
  - Solidity compiler
  - Deploy & run transactions
  - Debugger
  - Solidity static analysis
  
  ![Alt Text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2012.40.37.png)
  
  After adding the plugin , it will look something like this 
  
  ![Alt Text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2012.41.58.png)
   

**3.** Open the File Explorer and create a new file `SimpleStorage`  

![Alt Text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2012.43.51.png)


**4.** Paste below Smart Contracts inside `SimpleStorage.sol`
    
  ```
        pragma solidity ^0.5.12;
        contract SimpleStore {

          string value;
          event NewValueAssigned(string value);

          function set(string memory _value) public {
            value = _value;
            emit NewValueAssigned(_value);
          }

          function get()  public view returns (string memory) {
            return value;
          }
        }
```

**5.** Doing `cmd + s ` in the editor will save the smart contract and compile it. 

![ALt Text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2012.45.14.png)

Alternatively you can navigate to the second tab `SOLIDITY COMPILER` on the left panel to compile the contract. Make sure you choose the right compiler version based the the `pragma solidity` version defined in the smart contract. For this example it is `0.5.12`. 

Copy the ABI code of the contract by clicking on `ABI` option at the bottom of the panel. It will be copied in the clipboard. 

Create New file Called "SimpleStorage.json" in your local repository at the path "ethbasiccontract/src/Contracts" and paste the copied ABI content inside 

![Alt Text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2012.46.27.png)

**6** Copy Bytecode of the contract by clicking `Bytecode` option at the bottom of the panel. It will be copied in the clipboard.

Create New file Called "SimpleStorageByteCode.json" in your local repository  at the path "ethbasiccontract/src/Contracts" in the repository and paste the copied bytecode inside it

![Alt Text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2018.28.55.png)



**7.** Navigate to third tab (`DEPLOY & RUN TRANSACTIONS`) in the left panel.

Select `Web3 Provider` option from the environment dropdown. A modal will show up to put RPC endpoint url for the blockchain node . You can put local block chain URL (http://127.0.0.1:8545) created using Ganache.

You can start seeing the default accounts given by Ganache. 

![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2012.49.29.png)


**8.** Click on `Deploy` to publish the smart contract in the block chain. You can see the deployed contracts at the bottom of the same panel. It is also possible to copy the contract address from the deployed contracts. 

  Copy the contract address and configure it in [Constants](https://github.com/bring/ethbasiccontract/blob/master/src/Contants.js) file in the repository

![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2012.52.17.png)

More information on Remix can be found [here](https://remix-ide.readthedocs.io/)

## Running the app 

The app only includes a frontend and we are directly communicating with the Ethereum blockchain from the frontend 
 

```
 cd ethbasiccontract
 yarn add packages 
 yarn start
 
```

You should see something like this


![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-12%20at%2018.36.54.png)


## Deploying To Public Ropsten Test Network 

**Step 1** First Create an Account for Ropsten Test Network 

![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-15%20at%2022.44.09.png)

Then 

![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-15%20at%2022.45.21.png)

Then 

![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-15%20at%2022.46.54.png)

**Step 2** Deposit some Ether's from Test Faucet

![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-15%20at%2022.47.32.png)

Then 

![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-15%20at%2022.48.09.png)

Then 

![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-15%20at%2022.50.02.png)

Then 

![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-15%20at%2022.50.37.png)

**Step 3** Try Deploying the Contract to Ropsten Network 

![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-15%20at%2023.13.37.png)

You will get transaction confirmed after the transaction in mined 

![Alt text](https://github.com/bring/ethbasiccontract/blob/master/images/Screenshot%202019-12-15%20at%2023.12.51.png)



  


  





      
      
    
    



