<template>
  <div class="single-product">
    <!-- img -->
    <div @click="viewDetail">
      <img
        class="product-img"
        src="https://cdn.shopify.com/s/files/1/1811/9799/products/shoe19.jpg?v=1494313857"
        alt=""
      />
    </div>
    <div class="product-detail">
      <!-- name -->
      <h2 class="product-name" @click="viewDetail">Shoe</h2>
      <!-- price - buy -->
      <div class="product-bottom">
        <div class="product-price">1.000.000 vnd</div>

        <button class="button-buy-product" @click="addToCart">
          <i class="fas fa-shopping-cart"></i>
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    /**
     * Thêm vào giỏ hàng và chuyển màn hinh đến trang checkout
     */
    addToCart() {
      this.$router.push("/checkout");
    },

    /**
     * Chuyển mản hinh đến chi tiết sản phẩm kèm theo id,
     * đang fix cứng id = 1
     */
    viewDetail() {
      this.$router.push("/list-product/123");
    },
  },
};
</script>

<style>
.single-product {
  width: 200px;
  transition: var(--tran03);
  margin: 0px 10px;
  cursor: pointer;

  box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
}

.single-product:hover {
  color: var(--text-hover);
}

.product-detail {
  padding: 10px 10px;
}
.product-img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.single-product:hover .product-img {
  border: 3px solid var(--btn-hover);
}
.product-img:hover {
  border: 3px solid var(--btn-hover);
}

.product-name {
  width: 100%;
  height: 40px;
  line-height: 40px;
  font-weight: 700;
  font-size: 20px;
  text-transform: uppercase;
  text-align: center;
  padding: 0px 10px;
  border-bottom: 1px solid var(--background-dark);
}

.product-bottom {
  width: 100%;
  height: 40px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.product-price {
  font-weight: 600;
  font-size: 16px;
  text-transform: uppercase;
}
.button-buy-product {
  font-size: 24px;
}
.button-buy-product:hover {
  font-size: 28px;
}
</style>
