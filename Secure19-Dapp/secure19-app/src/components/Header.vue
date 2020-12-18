<template>
  <div>
    <b-jumbotron style="background-color: #1C9ADD" text-variant="grey">
      <template #header>Secure-19</template>

      <template #lead>
        To use this COVID-19 test tracker, you must connect to MetaMask.
      </template>

      <b-button pill v-b-modal.meatMask style="background-color: orangered;  color: black">Connect</b-button>

      <hr class="my-4">

    </b-jumbotron>
  </div>
</template>

<script>
export default {
  name: "Header"
}
</script>

<style scoped>

</style>