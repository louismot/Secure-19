<template>
  <div id="app">
    <Buttons msg="Welcome to the Secure-19 Tracking App"/>
  </div>
</template>

<script>
import Buttons from './components/Buttons.vue'

export default {
  name: 'App',
  components: {
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
