<template>
  <!-- https://huge-shoes.myshopify.com/ -->

  <ul>
    <div class="hasCart" v-if="listProducts.length">
      <div class="view-item">
        <cart-item
          v-for="pro in listProducts"
          v-bind:key="pro.id"
          v-bind:id="pro.id"
          v-bind:title="pro.title"
          v-bind:size="pro.size"
          v-bind:material="pro.material"
          v-bind:quantity="pro.quantity"
          v-bind:price="pro.price"
          v-bind:image="pro.image"
        />
      </div>

      <li class="cart-total">
        CART TOTAL: &nbsp;&nbsp; <span class="total">${{ cartTotal }} USD</span>
        <div class="btn-cart">
          <button class="btn-checkout btn-cart__item" @click="openCheckout">
            <i class="fas fa-check-circle"> </i>
            <span>THANH TOÁN</span>
          </button>
          <button class="btn-viewcart btn-cart__item" @click="openCartDetail">
            <i class="fas fa-shopping-cart"></i> <span>GIỎ HÀNG</span>
          </button>
        </div>
      </li>
    </div>
    <div v-else>
      <li class="empty-cart">
        Giỏ hàng của bạn đang trống!
      </li>
    </div>
  </ul>
</template>

<script>
import CartItem from "./CartItem.vue";
export default {
  name: "cart",

  components: { CartItem },

  data: () => ({
    // listProducts: [
    //   {
    //     id: "1",
    //     title: "Derby shoe - sandal",
    //     size: 7,
    //     material: "rubber",
    //     quantity: 1,
    //     price: 756,
    //     image: "shoe2.jpg",
    //   },
    //   {
    //     id: "2",
    //     title: "Derby shoe - sandal",
    //     size: 7,
    //     material: "rubber",
    //     quantity: 2,
    //     price: 756,
    //     image: "shoe1.jpg",
    //   },
    //   {
    //     id: "3",
    //     title: "Derby shoe - sandal",
    //     size: 7,
    //     material: "rubber",
    //     quantity: 3,
    //     price: 756,
    //     image: "shoe1.jpg",
    //   },
    //   {
    //     id: "4",
    //     title: "Derby shoe - sandal",
    //     size: 7,
    //     material: "rubber",
    //     quantity: 4,
    //     price: 756,
    //     image: "shoe1.jpg",
    //   },
    // ],
  }),

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

  methods: {
    deleteItem(proId) {
      const index = this.$store.state.listProducts.findIndex(
        (item) => item.id === proId
      );
      this.listProducts.splice(index, 1);
    },

    openCheckout() {
      this.$router.push("/checkout");
    },

    openCartDetail() {
      this.$router.push("/cart-detail");
    },
  },

  provide() {
    return {
      deleteItem: this.deleteItem,
    };
  },
};
</script>

<style scoped>
@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css");
@import url("https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css");
ul {
  width: 350px;
  border-top: 1px solid rgb(241, 237, 237);
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.15);
}

.hasCart {
  padding-top: 5px;
}

.view-item {
  max-height: 340px;
  overflow-y: auto;
}

li {
  width: 100%;
}

.btn-cart {
  display: flex;
  margin-top: 10px;
}

.cart-total {
  margin-top: 20px;
  font-size: 18px;
  text-align: center;
  padding-bottom: 10px;
  font-family: "Roboto", sans-serif !important;
}

.cart-total .total {
  color: #571f9c;
}

.cart-total .btbtn-cartn {
  margin-top: 30px;
  text-align: center;
}

.cart-total .btn-cart button {
  width: 140px;
  height: 42px;
  background: var(--btn-default);
  color: var(--text-light);
  font-weight: 300;
  font-size: 14px;
  text-align: center;
  transition: var(--tran03);
}

.cart-total .btn-cart button:hover {
  background: var(--btn-hover);
}

.cart-total .btn-cart .btn-checkout {
  margin-left: 28px;
  margin-right: 10px;
}

.empty-cart {
  font-size: 14px;
  padding: 15px 25px;
}

.btn-cart__item > span {
  font-weight: 500;
}

.btn-cart__item > i {
  padding-right: 10px;
}
</style>
