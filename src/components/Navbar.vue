<template>
  <nav class="home-nav">
    <router-link to="/">
      <div class="home-nav__image">
        <img src="@/assets/img/logo.png" alt="shoes6" />
      </div>
    </router-link>

    <!-- bo suu tap -->
    <div class="home-nav__menu">
      <ul class="nav-menu">
        <li
          v-for="(item, index) in listCollection"
          :key="index"
          class="nav-menu-item"
        >
          <router-link to="/list-product">
            {{ item }}
          </router-link>
          <!-- <i class="fas fa-caret-down"></i> -->
        </li>
      </ul>
    </div>

    <!-- ben phai -->
    <div class="home-nav__option">
      <div class="nav-option__item">
        <i class="fas fa-search"></i>
      </div>

      <div class="nav-option__item">
        <i class="fas fa-user-circle"></i>
      </div>

      <router-link to="/cart">
        <div class="nav-option__item">
          <i class="fas fa-shopping-cart"></i>
          <span class="item-in-card">2</span>
        </div>
      </router-link>
    </div>
  </nav>
</template>

<script>
export default {
  data: () => ({
    listCollection: ["Thể thao", "Leo núi", "Boots", "Oxford"],
  }),
  methods: {},
};
</script>

<style>
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
a {
  text-decoration: none;
  color: unset;
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
</style>
