<template>
  <div v-if="listProducts.length">
    <table>
      <tr class="header-title">
        <th>Product</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total</th>
        <th>Remove</th>
      </tr>
      <detail-cart-item
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
      ></detail-cart-item>
      <tr class="cart-total">
        <td colspan="2">
          <div class="note" v-if="!openNote">
            <a href="" v-on:click.prevent="OpenNote"
              >Add a note to your order</a
            >
          </div>
          <div class="note-open" v-if="openNote">
            <p style="margin-bottom: 12px;">Special instructions for seller</p>
            <textarea
              style="margin: 0px 0px 20px; width: 711px; height: 140px;"
            ></textarea>
          </div>
        </td>
        <td colspan="3">
          <div class="cart-total-detail">
            <div class="total">Subtotal &nbsp;&nbsp; ${{ cartTotal }} USD</div>
            <div class="shipping">
              Shipping, taxes, and discounts will be calculated at checkout.
            </div>
            <div class="btn-group">
              <input type="button" value="CONTINUE SHOPPING" />
              <input type="submit" value="CHECK OUT" />
            </div>
          </div>
        </td>
      </tr>
    </table>
  </div>

  <div class="empty" v-else>
    <p style="font-size: 36px; margin-bottom: 15px;">Your Cart</p>
    <p style="margin-bottom: 15px;">
      Your cart is currently empty!
    </p>
    <p style="margin-bottom: 15px;">Continue browsing <a href="#">here</a>.</p>
  </div>
</template>

<script>
import DetailCartItem from "./DetailCartItem.vue";
export default {
  props: ["id", "title", "size", "material", "quantity", "price", "image"],

  name: "detail-cart",

  data: () => ({
    listProducts: [
      {
        id: "1",
        title: "Derby shoe - sandal",
        size: 7,
        color: "yellow",
        material: "rubber",
        quantity: 1,
        price: 756,
        image: "../../../assets/img/shoe1.jpg",
      },
      {
        id: "2",
        title: "Derby shoe - sandal",
        size: 7,
        color: "yellow",
        material: "rubber",
        quantity: 2,
        price: 756,
        image: "../../../assets/img/shoe1.jpg",
      },
      {
        id: "3",
        title: "Derby shoe - sandal",
        size: 7,
        color: "yellow",
        material: "rubber",
        quantity: 3,
        price: 756,
        image: "../../../assets/img/shoe1.jpg",
      },
      {
        id: "4",
        title: "Derby shoe - sandal",
        size: 7,
        color: "yellow",
        material: "rubber",
        quantity: 4,
        price: 756,
        image: "../../../assets/img/shoe1.jpg",
      },
    ],

    openNote: false,
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
    upQuantity(proId) {
      const index = this.listProducts.findIndex((item) => item.id === proId);
      this.listProducts[index].quantity += 1;
    },
    downQuantity(proId) {
      const index = this.listProducts.findIndex((item) => item.id === proId);
      if (this.listProducts[index].quantity == 1) this.quantity = 1;
      else this.listProducts[index].quantity -= 1;
    },
    OpenNote() {
      this.openNote = !this.openNote;
    },
  },

  provide() {
    return {
      deleteItem: this.deleteItem,
      upQuantity: this.upQuantity,
      downQuantity: this.downQuantity,
    };
  },

  components: { DetailCartItem },
};
</script>

<style scoped>
/* @import url("https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"); */

table {
  width: 1285px;
  margin: auto;
  margin-bottom: 200px;
}

.header-title {
  height: 55px;
  background-color: black;
  color: white;
  font-size: 18px;
}

.header-title th {
  padding: 20px;
}

.cart-total td {
  padding-top: 24px;
  vertical-align: top;
}

.cart-total .note {
  margin-left: 20px;
}

.cart-total .note,
.cart-total .note-open {
  float: left;
}

.cart-total .note-open {
  margin-left: 20px;
}

.cart-total .note-open textarea {
  border: 1px solid #ccc;
}

.cart-total .cart-total-detail {
  text-align: right;
  float: right;
  padding-right: 20px;
}

.cart-total .total {
  font-size: 16px;
}

.cart-total .shipping {
  margin-top: 20px;
  font-style: italic;
  font-size: 14px;
}

.cart-total .btn-group {
  margin-top: 20px;
}

.cart-total .btn-group input {
  height: 48px;
  background: chartreuse;
  padding: 5px 30px;
  margin-left: 20px;
  font-size: 14px;
  color: white;
  background: #571f9c;
}

.cart-total .btn-group input:hover {
  background: black;
}

.empty {
  height: 144px;
  padding: 10px 76px;
}
</style>
