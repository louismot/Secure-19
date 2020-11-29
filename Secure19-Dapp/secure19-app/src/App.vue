<template>
  <div id="app">
    <Header/>
    <Buttons/>
  </div>
</template>

<script>
import Buttons from './components/Buttons.vue'
import Header from "@/components/Header";

export default {
  name: 'App',
  components: {
    Header,
    Buttons
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
  margin-top: 60px;
}
</style>
