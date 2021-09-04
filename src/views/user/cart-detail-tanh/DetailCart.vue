<template>
  <div class="cart-detail">
    <div class="top">
      <h5 style="font-weight: bold;">GIỎ HÀNG CỦA BẠN</h5>
      <div style="font-size: 14px; margin-top: 10px;">
        <span>Trang chủ</span>
        <span>&ensp;/&ensp;</span>
        <span>Giỏ hàng của bạn</span>
      </div>
    </div>
    <div v-if="listProducts.length">
      <table>
        <tr class="header-title">
          <th>Sản phẩm</th>
          <th>Giá</th>
          <th>Số lượng</th>
          <th>Tổng</th>
          <th>Hủy</th>
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
                >Thêm ghi chú cho đơn hàng</a
              >
            </div>
            <div class="note-open" v-if="openNote">
              <p style="margin-bottom: 12px;">
                Special instructions for seller
              </p>
              <textarea
                style="margin: 0px 0px 20px; width: 711px; height: 140px;"
              ></textarea>
            </div>
          </td>
          <td colspan="3">
            <div class="cart-total-detail">
              <div class="total">
                Tổng &nbsp;&nbsp;
                {{
                  cartTotal.toLocaleString("vi-VN", {
                    style: "currency",
                    currency: "VND",
                  })
                }}
              </div>
              <div class="shipping">
                Phí vận chuyển, thuế và chiết khấu sẽ được tính khi thanh toán.
              </div>
              <div class="btn-group">
                <input
                  type="button"
                  value="TIÊP TỤC MUA SẮM"
                  @click="openHome"
                />
                <input type="submit" value="THANH TOÁN" @click="openCheckout" />
              </div>
            </div>
          </td>
        </tr>
      </table>
    </div>

    <div class="empty" v-else>
      <p style="font-size: 36px; margin-bottom: 15px;">Giỏ hàng của bạn</p>
      <p style="margin-bottom: 15px;">
        Giỏ hàng của bạn đang trống
      </p>
      <p style="margin-bottom: 15px;">
        <router-link to="/">Tiếp tục mua sắp!</router-link>.
      </p>
    </div>
  </div>
</template>

<script>
import DetailCartItem from "./DetailCartItem.vue";
export default {
  props: ["id", "title", "size", "material", "quantity", "price", "image"],

  name: "detail-cart",

  data: () => ({
    openNote: false,
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
    openCheckout() {
      this.$router.push("/checkout");
    },
    openHome() {
      this.$router.push("/");
    },
    deleteItem(proId) {
      const index = this.$store.state.listProducts.findIndex(
        (item) => item.id === proId
      );
      this.listProducts.splice(index, 1);
    },
    upQuantity(proId) {
      const index = this.$store.state.listProducts.findIndex(
        (item) => item.id === proId
      );
      this.listProducts[index].quantity += 1;
    },
    downQuantity(proId) {
      const index = this.$store.state.listProducts.findIndex(
        (item) => item.id === proId
      );
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

.cart-detail {
  width: 100%;
}

.top {
  padding-top: 40px;
  width: 100%;
  height: 136px;
  background: #fafafa;
  margin: 30px auto;
  text-align: center;
}

table {
  width: 100%;
  margin: 0px 20px;
  padding-top: 10px;
  margin: auto;
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
  margin-bottom: 20px;
}

.cart-total .btn-group input {
  height: 48px;
  background: chartreuse;
  padding: 5px 30px;
  margin-left: 20px;
  font-size: 14px;
  color: white;
  background: var(--btn-default);
}

.cart-total .btn-group input:hover {
  background: var(--btn-hover);
}

.empty {
  padding: 10px 76px 20px;
}
</style>
