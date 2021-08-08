<template>
  <div>
    giao dien admin
  </div>
</template>

<script>
export default {
  components: {},

  methods: {
    closeLayoutAdmin() {
      this.$store.dispatch("closeLayoutAdmin");
      console.log("Thoát admin");
    },

    openLayoutAdmin() {
      this.$store.commit("openLayoutAdmin");
      console.log("Vào admin");
    },
  },

  created() {
    this.openLayoutAdmin();
  },

  beforeDestroy() {
    // this.closeLayoutAdmin();
  },
};
</script>

<style></style>
