<template>
  <h1>Page de Ticket</h1>
  <div class="ticket" v-if="Object.keys(ticket).length !== 0">
    {{ ticket }}
  </div>
  <div v-else>
    <p>Chargement...</p>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "TicketView",
  data() {
    return {
      ticket: {},
    };
  },
  mounted() {
    axios
      .get(`/api.php?t=${this.$route.params.id}/ticket/info`)
      .then((response) => {
        this.ticket = response.data;
      })
      .then((response) => {
        console.log(response);
      });
  }
};
</script>

<style scoped></style>
