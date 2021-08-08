<template>
  <div>
    Chi tiet gio hang

    <button @click="openCheckout">
      THANH TOAN
    </button>
  </div>
</template>

<script>
export default {
  methods: {
    openCheckout() {
      this.$router.push("/checkout");
    },
  },
};
</script>

<style></style>
