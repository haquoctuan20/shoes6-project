<template>
  <div class="home-page">
    <!-- header -->
    <header class="home-header">
      <div class="home-header__left">
        <span class="home-header__title"
          ><i class="fas fa-phone"></i> 0123456789</span
        >
        <span class="home-header__title"
          ><i class="fas fa-envelope"></i> shoes6.project@gmail.com</span
        >
      </div>
      <div class="home-header__right">
        <span class="home-header__title">Địa chỉ cửa hàng</span>
      </div>
    </header>

    <!-- nav -->
    <nav class="home-nav">
      <div class="home-nav__image">
        <img src="../../../assets/img/logo.png" alt="shoes6" />
      </div>

      <div class="home-nav__menu">
        <ul class="nav-menu">
          <li
            v-for="(item, index) in listCollection"
            :key="index"
            class="nav-menu-item"
          >
            {{ item }}
            <i class="fas fa-caret-down"></i>
          </li>
        </ul>
      </div>

      <div class="home-nav__option">
        <div class="nav-option__item">
          <i class="fas fa-search"></i>
        </div>

        <div class="nav-option__item">
          <i class="fas fa-user-circle"></i>
        </div>

        <div class="nav-option__item">
          <i class="fas fa-shopping-cart"></i>
          <span class="item-in-card">2</span>
        </div>
      </div>
    </nav>

    <!-- carousel -->
    <div class="home-carousel">
      <v-app>
        <v-carousel v-model="model" height="600" interval="5000">
          <!-- item -->
          <v-carousel-item
            v-for="img in items_carousel"
            :key="img.id"
            :src="img.url"
            reverse-transition="fade-transition"
            transition="fade-transition"
          >
          </v-carousel-item>
        </v-carousel>
      </v-app>
    </div>

    <!-- san pham moi -->
    <ListNewProduct />

    <!-- parallax -->
    <v-app>
      <v-parallax
        height="600"
        src="https://cdn.shopify.com/s/files/1/1811/9799/files/banner-1.jpg?v=1494411699"
      >
        <div>
          <div class="parallax-title">
            <p>KHUYỄN MÃI MÙA HÈ NÀY</p>
            <p>
              GIẢM NGAY <span>50%</span> <br />CHO <span>LẦN MUA ĐẦU TIÊN</span>
            </p>
            <button class="btn">Mua ngay</button>
          </div>
        </div>
      </v-parallax>
    </v-app>

    <!-- best seller -->
    <div class="best-seller">
      <h2 class="best-seller-title">BEST SELLERS</h2>
      <p class="short-title">Xem ngay</p>

      <div class="container-sellers">
        <p
          class="item-seller"
          v-for="(item, index) in listFeature"
          :key="index"
        >
          {{ item }}
        </p>
      </div>

      <div class="container-product-sellers">
        <div
          class="item-product-sellers"
          v-for="(item, index) in 10"
          :key="index"
        >
          <SingleProduct />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ListNewProduct from "@/components/user/home-tuan/ListNewProduct.vue";
import SingleProduct from "@/components/user/home-tuan/SingleProduct.vue";
export default {
  name: "Home",

  components: { ListNewProduct, SingleProduct },

  data: () => ({
    listCollection: ["Thể thao", "Leo núi", "Boots", "Oxford"],

    model: 0,

    listFeature: ["Tất cả", "Khuyến mại", "Bán chạy", "Mới"],

    items_carousel: [
      {
        id: 1,
        url:
          "https://cdn.shopify.com/s/files/1/1811/9799/files/shoe9.jpg?v=1494405665",
      },
      {
        id: 2,
        url:
          "https://cdn.shopify.com/s/files/1/1811/9799/files/shoe7.jpg?v=1494405629",
      },
      {
        id: 3,
        url:
          "https://cdn.shopify.com/s/files/1/1811/9799/files/shoe8-2_b0f8ccfb-d5d1-4ba5-b412-92227077ed0f.png?v=1494423683",
      },
    ],
  }),
};
</script>

<style>
.home-header {
  width: 100%;
  height: 52px;
  background-color: var(--backgound-gray);
  padding: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  /* border-radius: 0px 0px 8px 8px; */
}
.home-header__title {
  padding: 0px 8px;
  cursor: pointer;
}
.home-header__title:hover {
  display: inline-block;
  color: var(--text-hover);
  transition: var(--tran03);
  transform: translate(0, -3px);
}

/* nav */
.home-nav {
  width: 100%;
  height: 96px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.home-nav__image img {
  cursor: pointer;
  height: 100%;
  object-fit: fill;
}

.nav-menu-item {
  cursor: pointer;
  display: inline-block;
  padding: 0px 16px;
}
.nav-menu-item:hover {
  font-size: 15px;
  transform: translate(0, -3px);
  color: var(--text-hover);
  transition: var(--tran03);
}

.home-nav__option {
  display: flex;
}

.nav-option__item {
  cursor: pointer;
  font-size: 20px;
  padding-left: 10px;
  position: relative;
}
.nav-option__item:hover {
  transform: translate(0, -3px);
  color: var(--text-hover);
  transition: var(--tran03);
}
.item-in-card {
  position: absolute;
  top: -16px;
  left: 14px;
  display: inline-block;
  width: 20px;
  height: 20px;
  text-align: center;
  color: var(--text-light);
  border-radius: 10px;
  background-color: #ff0000;
}

.home-carousel {
  width: 100%;
}
.v-application--wrap {
  min-height: 60vh;
}

/* parallax */
.parallax-title {
  text-align: center;
}
.parallax-title p:nth-of-type(1) {
  font-size: 20px;
  text-transform: uppercase;
  font-weight: 300;
  line-height: normal;
  letter-spacing: 0.06em;
}
.parallax-title p:nth-of-type(2) {
  font-size: 50px;
  letter-spacing: 0.175em;
  line-height: normal;
  margin: 0 0 60px;
  font-weight: 500;
}
.parallax-title span {
  color: #f01133;
}
.btn {
  letter-spacing: 2px;
  text-transform: uppercase;
}

/* best seller */

.best-seller > h2 {
  font-size: 36px;
  letter-spacing: 1px;
  padding: 80px 0px 20px;
  text-align: center;
  font-weight: 600;
}
.best-seller .short-title {
  text-align: center;
  font-size: 20px;
  padding: 10px 0px;
  position: relative;
}
.best-seller .short-title::after {
  background: var(--btn-default);
  content: "";
  display: inline-block;
  margin: auto;
  width: 70px;
  height: 4px;
  position: absolute;
  left: 0;
  right: 0;
  top: auto;
  bottom: -5px;
}

.container-sellers {
  text-align: center;
  display: flex;
  justify-content: center;
  padding: 40px 0px;
}
.item-seller {
  text-transform: uppercase;
  font-weight: 700;
  font-size: 16px;
  display: inline-block;
  padding: 0 10px;
  cursor: pointer;
  transition: var(--tran03);
  opacity: 0.3;
}
.item-seller:hover {
  opacity: 1;
  color: var(--btn-hover);
}

.container-product-sellers {
  width: 100%;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  align-content: stretch;
}

.item-product-sellers {
  margin: 10px 10px 30px;
}
</style>
