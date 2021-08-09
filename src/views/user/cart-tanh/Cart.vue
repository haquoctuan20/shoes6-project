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
        <div class="btn">
          <button class="btn-checkout" @click="openCheckout">
            <i class="far fa-check-circle"> &nbsp;&nbsp; CHECK OUT</i>
          </button>
          <button class="btn-viewcart" @click="openCartDetail">
            <i class="far fa-shopping-cart"> &nbsp;&nbsp; VIEW CART</i>
          </button>
        </div>
      </li>
    </div>
    <div v-else>
      <li class="empty-cart">
        Your cart is currently empty!
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
    listProducts: [
      {
        id: "1",
        title: "Derby shoe - sandal",
        size: 7,
        material: "rubber",
        quantity: 1,
        price: 756,
        image: "../../../assets/img/shoe1.jpg",
      },
      {
        id: "2",
        title: "Derby shoe - sandal",
        size: 7,
        material: "rubber",
        quantity: 2,
        price: 756,
        image: "../../../assets/img/shoe1.jpg",
      },
      {
        id: "3",
        title: "Derby shoe - sandal",
        size: 7,
        material: "rubber",
        quantity: 3,
        price: 756,
        image: "../../../assets/img/shoe1.jpg",
      },
      {
        id: "4",
        title: "Derby shoe - sandal",
        size: 7,
        material: "rubber",
        quantity: 4,
        price: 756,
        image: "../../../assets/img/shoe1.jpg",
      },
    ],
  }),

  computed: {
    cartTotal() {
      return this.listProducts
        .map((item) => item.price * item.quantity)
        .reduce((total, amount) => total + amount);
    },
  },

  methods: {
    deleteItem(proId) {
      const index = this.listProducts.findIndex((item) => item.id === proId);
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
ul {
  width: 350px;
  border-top: 1px solid rgb(241, 237, 237);
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.15);

  margin-bottom: 200px;
}

.hasCart {
  padding-top: 5px;
}

.view-item {
  max-height: 400px;
  overflow: auto;
}

li {
  width: 100%;
}

.btn {
  display: flex;
}

.cart-total {
  margin-top: 20px;
  font-size: 18px;
  text-align: center;
  padding-bottom: 10px;
}

.cart-total .total {
  color: #571f9c;
}

.cart-total .btn {
  margin-top: 30px;
  text-align: center;
}

.cart-total .btn button {
  width: 140px;
  height: 42px;
  background: black;
  color: black;
  font-weight: 300;
  font-size: 14px;
  text-align: center;
}

.cart-total .btn button:hover {
  background: #571f9c;
  color: white;
}

.cart-total .btn .btn-checkout {
  margin-left: 28px;
  margin-right: 10px;
}

.empty-cart {
  font-size: 14px;
  padding: 15px 25px;
}
</style>
