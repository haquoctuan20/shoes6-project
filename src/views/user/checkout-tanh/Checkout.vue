<template>
  <div class="checkout">
    <div class="list">
      <checkout-list></checkout-list>
    </div>
    <div class="checkout-form">
      <checkout-form></checkout-form>
    </div>
  </div>
</template>

<script>
import CheckoutForm from "./CheckoutForm.vue";
import CheckoutList from "./CheckoutList.vue";
export default {
  name: "checkout",

  components: { CheckoutForm, CheckoutList },
};
</script>

<style scoped>
@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css");
@import url("https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css");
.checkout {
  display: flex;
  width: 100%;
  /* padding: 0px 100px; */
  background-color: #fafafa;
  margin-bottom: 20px;
}
.checkout-form {
  width: 50%;
}

.list {
  border-right: 1px solid #ccc;
  /* width: 50%; */
  flex: 1;
}
</style>
