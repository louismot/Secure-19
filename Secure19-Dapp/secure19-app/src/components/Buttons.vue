<template>

  <div>
    <!--Patient button group-->
    <b-card title="Patient">
      <b-button-group>
<!--        <b-button pill v-b-modal.p-register style="background-color: blue; border-color: white; ">Patient Register</b-button>-->
        <b-button pill v-b-modal.p-id style="background-color: blue; border-color: white">Get Patient ID</b-button>
        <b-button pill v-b-modal.p-rid style="background-color: blue; border-color: white">Get Request ID</b-button>
        <b-button pill v-b-modal.p-status style="background-color: blue; border-color: white">Check Status</b-button>
        <b-button pill v-b-modal.p-results style="background-color: blue; border-color: white">Check Results</b-button>
      </b-button-group>
    </b-card>

    <!--Test admin button group-->
    <b-card title="Test Administrator">
      <b-button-group>
        <b-button pill v-b-modal.t-reg style="background-color: darkgoldenrod; border-color: white; ">Test Admin Registration</b-button>
        <b-button pill v-b-modal.t-st style="background-color: darkgoldenrod; border-color: white">Sample Taken</b-button>
        <b-button pill v-b-modal.t-ss style="background-color: darkgoldenrod; border-color: white">Sample Shipped</b-button>
      </b-button-group >
    </b-card>

    <!--Lab button group-->
    <b-card title="Laboratory">
      <b-button-group>
        <b-button pill v-b-modal.l-reg style="background-color: orange; border-color: white; ">Get Lab ID</b-button>
        <b-button pill v-b-modal.l-sr style="background-color: orange; border-color: white; ">Sample Received</b-button>
        <b-button pill v-b-modal.l-results style="background-color: orange; border-color: white">Upload Result</b-button>
      </b-button-group>
    </b-card>

    <!--Authorized party button group-->
    <b-card title="Authorized 3rd Parties">
      <b-button-group>
        <b-button pill v-b-modal.atp-results style="background-color: green; border-color: white; ">Check Results</b-button>
      </b-button-group>
    </b-card>



    <!--Modals for the patient forms-->
    <b-modal id="p-id" title="Patient ID Registration" ok-title="Enter">
      <b-form-input pill v-model="fromAddress" placeholder="Enter your unique address:"></b-form-input>
    </b-modal>
    <b-modal id="p-rid" title="Patient Request Registration" ok-title="Enter">
      <b-form-input pill v-model="pid" placeholder="Enter your unique Patient ID Number:"></b-form-input>
    </b-modal>
    <b-modal id="p-status" title="Check Status" ok-title="Enter">
      <b-form-input pill v-model="pid" placeholder="Enter your unique Patient ID Number:"></b-form-input>
    </b-modal>
    <b-modal id="p-results" title="Check Results" ok-title="Enter">
      <b-form-input pill v-model="rid" placeholder="Enter your unique Request ID:"></b-form-input>
    </b-modal>


    <!--Modals for the test admin forms-->
    <b-modal id="t-reg" title="Test Admin Register" ok-title="Enter">
      <b-form-input pill v-model="fromAddress" placeholder="Enter your unique address:"></b-form-input>
    </b-modal>
    <b-modal id="t-st" title="Sample Taken Confirmation" ok-title="Enter">
      <b-form-input pill v-model="pid" placeholder="Enter the patient's unique ID:"></b-form-input>
      <b-form-input pill v-model="tid" placeholder="Enter your unique address:"></b-form-input>
    </b-modal>
    <b-modal id="t-ss" title="Sample Shipped Confirmation" ok-title="Enter">
      <b-form-input pill v-model="pid" placeholder="Enter the patient's unique ID:"></b-form-input>
      <b-form-input pill v-model="tid" placeholder="Enter your unique address:"></b-form-input>
    </b-modal>


    <!--Modals for the lab forms-->
    <b-modal id="l-reg" title="Lab Registration" ok-title="Enter">
      <b-form-input pill v-model="lid" placeholder="Enter your unique address:"></b-form-input>
    </b-modal>
    <b-modal id="l-reg" title="Sample Recieved" ok-title="Enter">
      <b-form-input pill v-model="pid" placeholder="Enter the patient's unique ID:"></b-form-input>
      <b-form-input pill v-model="lid" placeholder="Enter your unique address:"></b-form-input>
    </b-modal>
    <b-modal id="l-results" title="Upload Results" ok-title="Enter">
      <b-form-input pill v-model="pid" placeholder="Enter the patient's unique ID:"></b-form-input>
      <b-form-input pill v-model="pr" placeholder="Enter patient's Result:"></b-form-input>
      <b-form-input pill v-model="tid" placeholder="Enter your unique address:"></b-form-input>
    </b-modal>


    <!--Modals for the authorized 3rd parties' forms-->
    <b-modal id="atp-results" title="Check Results" ok-title="Enter">
      <b-form-input pill v-model="rid" placeholder="Enter your unique Request ID:"></b-form-input>
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