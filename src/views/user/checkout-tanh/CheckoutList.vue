<template>
  <ul class="checkout-list">
    <div class="view">
      <checkout-item
        v-for="pro in listProducts"
        v-bind:key="pro.id"
        v-bind:id="pro.id"
        v-bind:title="pro.title"
        v-bind:size="pro.size"
        v-bind:color="pro.color"
        v-bind:material="pro.material"
        v-bind:quantity="pro.quantity"
        v-bind:price="pro.price"
        v-bind:image="pro.image"
      ></checkout-item>
    </div>
    <li class="subtotal">
      <div class="col">
        <div class="col1">Tạm tính</div>
        <div class="col2" style="font-weight: 500;">{{ cartTotal }} ₫</div>
      </div>
      <div class="col">
        <div class="col1">Phí vận chuyển</div>
        <div class="col2" style="font-size: 12px">Miễn phí</div>
      </div>
    </li>
    <li class="total">
      <div class="col">
        <div class="col1" style="font-size: 16px">Tổng tiền</div>
        <div class="col2">{{ cartTotal }} ₫</div>
      </div>
    </li>
  </ul>
</template>

<script>
import CheckoutItem from "./CheckoutItem.vue";
export default {
  data: () => ({}),

  computed: {
    listProducts() {
      return this.$store.state.listProducts;
    },
    cartTotal() {
      return this.$store.state.listProducts
        .map((item) => item.price * item.quantity)
        .reduce((total, amount) => total + amount);
    },
  },

  name: "checkout-list",

  components: { CheckoutItem },
};
</script>

<style scoped>
.checkout-list {
  max-width: 420px;
  display: block;

  margin: auto;
  background-color: #fafafa;
  margin: 30px auto;
}

.view {
  max-height: 500px;
  overflow: auto;
}
.subtotal {
  margin-top: 10px;
  padding-top: 8px;
  padding-bottom: 8px;
  border-top: 2px solid #ccc;
  border-bottom: 1px solid #ccc;
}
.col {
  padding: 8px 4px;
  width: 100%;
  display: flex;
}
.col1 {
  width: 40%;
  text-align: left;
}
.col2 {
  width: 60%;
  text-align: right;
}
.total {
  margin: 8px 0px;
}
</style>
