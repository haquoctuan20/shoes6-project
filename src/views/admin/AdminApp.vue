<template>
  <div>
    <Loading />
  </div>
</template>

<script>
import { mapActions } from "vuex";
import Loading from "@/components/Loading.vue";

export default {
  components: { Loading },

  methods: {
    ...mapActions([]),
  },

  created() {},

  beforeDestroy() {},
};
</script>

<style></style>
