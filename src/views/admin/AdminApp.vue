<template>
  <div>
    giao dien admin
  </div>
</template>

<script>
import { mapActions } from "vuex";

export default {
  components: {},

  methods: {
    ...mapActions(["closeLayoutAdmin", "openLayoutAdmin"]),
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
