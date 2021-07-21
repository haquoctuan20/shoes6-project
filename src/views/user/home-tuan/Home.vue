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
        <v-carousel v-model="model" height="600">
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
  </div>
</template>

<script>
import ListNewProduct from "../../../components/user/home-tuan/ListNewProduct.vue";
export default {
  name: "Home",

  components: { ListNewProduct },

  data: () => ({
    listCollection: ["Thể thao", "Leo núi", "Boots", "Oxford"],

    model: 0,

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
</style>
