<template>
  <div id="app">
    <Header/>
    <Buttons/>
  </div>
</template>

<script>
import Buttons from './components/Buttons.vue';
import Header from "@/components/Header";
import Web3 from "web3";



export default {
  name: 'App',
  components: {
    Header,
    Buttons
  },
  data() {
    return {
      metaMaskConnection: false,
      connectMsg: "Install MetaMask",
    }
  },
  methods :{
    connectMetaMask() {
      if (window.ethereum) {
        window.ethereum.enable().then(accounts => { this.connectMsg = accounts[0].substring(0, 12)+"..."; this.metaMaskConnection = true; })
      } else {
        window.location.href = "https://metamask.io"
      }
    },
    mounted() {

      if (window.ethereum) {
        this.connectMsg = "Connect to MetaMask";
      }
      window.web3 = new Web3();
      window.web3.eth.getAccounts().then(accounts => {
        if (accounts.length == 0) {
          this.connectMsg = "Connect to MetaMask";
        } else {
          this.connectMsg = accounts[0].toLowerCase().substring(0, 12) + "...";
          this.metaMaskConnection = true;
        }
      });
    }
  }

}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 30px;
}
</style>
