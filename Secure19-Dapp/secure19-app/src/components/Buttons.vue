<template>

  <div>
    <!--Patient button group-->
    <b-jumbotron>
      <template #header>Patient</template>
      <b-button-group>
        <b-button pill v-b-modal.p-register style="background-color: blue; border-color: white; ">Patient Register</b-button>
        <b-button pill v-b-modal.p-pid style="background-color: blue; border-color: white">Get Patient ID</b-button>
        <b-button pill v-b-modal.p-rid style="background-color: blue; border-color: white">Get Request ID</b-button>
        <b-button pill v-b-modal.p-status style="background-color: blue; border-color: white">Check Status</b-button>
        <b-button pill v-b-modal.p-results style="background-color: blue; border-color: white">Check Results</b-button>
      </b-button-group>
    </b-jumbotron>

    <!--Test admin button group-->
    <b-jumbotron>
      <template #header>Test Administrator</template>
      <b-button-group>
        <b-button pill v-b-modal.p-register style="background-color: darkgoldenrod; border-color: white; ">Patient Register</b-button>
        <b-button pill v-b-modal.p-pid style="background-color: darkgoldenrod; border-color: white">Get Patient ID</b-button>
        <b-button pill v-b-modal.p-rid style="background-color: darkgoldenrod; border-color: white">Get Request ID</b-button>
      </b-button-group >
    </b-jumbotron>

    <!--Lab button group-->
    <b-jumbotron>
      <template #header>Laboratory</template>
      <b-button-group>
        <b-button pill v-b-modal.p-register style="background-color: orange; border-color: white; ">Patient Register</b-button>
        <b-button pill v-b-modal.p-pid style="background-color: orange; border-color: white">Get Patient ID</b-button>
        <b-button pill v-b-modal.p-rid style="background-color: orange; border-color: white">Get Request ID</b-button>
      </b-button-group>
    </b-jumbotron>

    <!--Authorized party button group-->
    <b-jumbotron>
      <template #header>Authorized 3rd Party</template>
      <b-button-group>
        <b-button pill v-b-modal.ap-results style="background-color: green; border-color: white; ">Check Results</b-button>
      </b-button-group>
    </b-jumbotron>

    <b-modal id="p-register" title="Sign Out" ok-title="Enter">
      <b-form-input pill v-model="bookTitle" placeholder="Enter The Book's Title:"></b-form-input>
      <b-form-input pill v-model="bookAuthor" placeholder="Enter The Author's Name:"></b-form-input>
      <b-form-input pill v-model="bookDate" placeholder="Enter Today's Date:"></b-form-input>
      <b-form-input pill v-model="studentName" placeholder="Enter Your First and Last Name:"></b-form-input>
    </b-modal>
  </div>
</template>

<script>
export default {
  name: "Buttons"
}
</script>

<style scoped>

</style>