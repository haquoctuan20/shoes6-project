<template>
  <tr class="detail-product">
    <td>
      <div class="product">
        <div class="image">
          <a href=""
            ><img
              :src="require('../../../assets'.concat(image))"
              alt="Bast shoe"
          /></a>
        </div>
        <div class="title">
          <a href=""
            ><div>{{ title }}</div></a
          >
          <div class="size-color-material">
            {{ size }} / {{ color }} / {{ material }}
          </div>
        </div>
      </div>
    </td>
    <td>
      <div class="price">{{ price }} ₫</div>
    </td>
    <td>
      <div class="quantity">
        <input
          type="button"
          value="-"
          class="down"
          v-on:click.prevent="downQuantity(id)"
        />
        <input type="number" min="1" v-bind:value="quantity" id="quantity" />
        <input
          type="button"
          value="+"
          class="up"
          v-on:click.prevent="upQuantity(id)"
        />
      </div>
    </td>
    <td>
      <div class="total">{{ subTotal(quantity, price) }} ₫</div>
    </td>
    <td>
      <div class="remove">
        <a href="#" title="Remove This Item" v-on:click.prevent="deleteItem(id)"
          ><i class="fas fa-trash-alt"></i
        ></a>
      </div>
    </td>
  </tr>
</template>

<script>
export default {
  props: [
    "id",
    "title",
    "size",
    "color",
    "material",
    "quantity",
    "price",
    "image",
  ],

  inject: ["deleteItem", "upQuantity", "downQuantity"],

  name: "detail-cart-item",

  methods: {
    subTotal(q, p) {
      return q * p;
    },
  },

  components: {},
};
</script>

<style scoped>
/* @import url("https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"); */

.detail-product {
  width: 1285px;
}
tr > td {
  text-align: center;
  border-bottom: 1px solid #ccc;
  vertical-align: middle;
}

input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  margin: 0;
}

.product {
  width: 100%;
  text-align: center;
  display: flex;
}

.product .image,
.product .title {
  font-size: 19px;
  width: 50%;
  margin: auto;
}

.product .image img {
  width: 240px;
  height: 240px;
  max-width: 240px;
  max-height: 240px;
}

.product .title a,
.remove i {
  color: black;
  text-decoration: none;
}

.product .title a:hover,
.price,
.total {
  color: #571f9c;
}

.product .size-color-material {
  margin-top: 10px;
  font-size: 13px;
}

.quantity .up,
.quantity .down,
.quantity #quantity {
  box-sizing: border-box;
  font-size: 14px;
  text-align: center;
  vertical-align: auto;
  width: 40px;
  height: 40px;

  border: 1px solid #ccc;
}

.quantity #quantity {
  border: 1px solid #ccc;
}

.quantity .down,
.quantity .up {
  background-color: rgb(245, 239, 239);
}
</style>
