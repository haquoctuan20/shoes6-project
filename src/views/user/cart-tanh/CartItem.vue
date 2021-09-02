<template>
  <li class="li-item">
    <div class="item">
      <div class="product-image">
        <a href="" v-bind:title="title"
          ><img :src="require('../../../assets'.concat(image))"
        /></a>
      </div>
      <div class="product-detail">
        <div class="title">
          <a href="">{{ title }} / {{ size }} / {{ material }}</a>
        </div>
        <div class="quantity-price">
          <span class="quantity">{{ quantity }}</span>
          <span> x </span>
          <span class="price"> {{ price }} ₫ </span>
        </div>
      </div>
      <div class="delete-product">
        <a href="#" title="Remove This Item" v-on:click.prevent="deleteItem(id)"
          ><div><i class="fas fa-times"></i></div
        ></a>
      </div>
    </div>
  </li>
</template>

<script>
export default {
  props: ["id", "title", "size", "material", "quantity", "price", "image"],

  inject: ["deleteItem"],

  name: "cart-item",

  components: {},
};
</script>

<style scoped>
.item {
  display: flex;
  width: 100%;
  align-items: center;
}

.product-image img {
  width: 90px;
  height: 90px;
  max-width: 90px;
  max-height: 90px;
  padding: 10px;
}

.product-detail {
  padding: 10px;
  width: 200px;
  font-size: 16px;
}

.product-detail .title a {
  text-decoration: none;
  color: black;
}

.product-detail .title a:hover {
  color: #571f9c;
}

.product-detail .quantity-price {
  margin-top: 10px;
  font-size: 14px;
}

.li-item {
  box-sizing: border-box;
  width: 100%;
  padding: 10px 0px;
  list-style: none;
  border-bottom: 1px solid #ccc;
  transition: var(--tran03);
}

.li-item:hover {
  background: rgba(64, 185, 241, 0.15);
}

.delete-product {
  width: 40px;
}

.delete-product > a > div {
  width: 20px;
  height: 20px;
  color: black;
  float: right;
}
</style>
