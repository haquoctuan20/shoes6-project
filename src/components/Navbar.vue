<template>
  <nav class="home-nav">
    <!--  -->

    <router-link to="/">
      <div class="home-nav__image">
        <img src="@/assets/img/logo.png" alt="shoes6" />
      </div>
    </router-link>

    <div>
      <v-app class="none-vapp">
        <v-dialog v-model="dialog" persistent max-width="400">
          <v-card>
            <v-card-title class="text-h5">
              Bạn có muốn đăng xuất ?
            </v-card-title>
            <v-card-text> </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="green darken-1" text @click="dialog = false">
                Hủy
              </v-btn>
              <v-btn color="green darken-1" text @click="LogoutUser">
                Đăng xuất
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-app>
    </div>

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
      <div class="nav-option__item" @click="testSnackbar()">
        <i class="fas fa-search"></i>
      </div>

      <!-- Hien thi email khi nguoi dung dang nhap -->
      <div class="nav-option__item nav-option__item-login">
        <span v-if="Object.keys(userLogin).length !== 0">
          {{ userLogin.email }}
        </span>
        <i class="fas fa-user-circle"></i>
        <!-- Da dang nhap -->
        <div class="menu-account">
          <div
            class="menu-account__item"
            @click="openLogoutUser"
            v-if="Object.keys(userLogin).length !== 0"
          >
            Đăng xuất
          </div>

          <div
            class="menu-account__item"
            @click="openCartDetail"
            v-if="userLogin.role === 'CUSTOMER'"
          >
            Tài khoản của bạn
          </div>

          <div
            class="menu-account__item"
            @click="openAdmin"
            v-if="userLogin.role === 'ADMIN'"
          >
            Trang quản trị admin
          </div>

          <!-- chua dang nhap -->
          <div
            class="menu-account__item"
            @click="openLogin"
            v-if="Object.keys(userLogin).length === 0"
          >
            Đăng nhập
          </div>

          <div
            class="menu-account__item"
            @click="openCreateAccount"
            v-if="Object.keys(userLogin).length === 0"
          >
            Tạo tài khoản
          </div>
        </div>
      </div>

      <!-- hien thi gio hang neu nhu user la nguoi dung -->
      <div
        class="nav-option__item nav-option__item-login"
        v-if="userLogin.role === 'CUSTOMER'"
      >
        <i class="fas fa-shopping-cart"></i>
        <span class="item-in-card">{{ listProducts.length }}</span>

        <div class="menu-cart-item">
          <Cart />
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
import Cart from "@/views/user/cart-tanh/Cart.vue";
import { mapActions, mapGetters } from "vuex";

export default {
  components: {
    Cart,
  },
  computed: {
    ...mapGetters(["userLogin", "listProducts"]),
  },
  data: () => ({
    listCollection: ["Thể thao", "Leo núi", "Boots", "Oxford"],
    dialog: false,
  }),
  methods: {
    ...mapActions(["logoutUser", "getSnackBars"]),

    openCartDetail() {
      this.$router.push("/cart-detail");
    },

    openAdmin() {
      this.$router.push("/admin");
    },

    openLogin() {
      this.$router.push("/login");
    },

    openCreateAccount() {
      this.$router.push("/create-account");
    },

    openLogoutUser() {
      this.dialog = true;
    },

    LogoutUser() {
      this.dialog = false;
      this.getSnackBars("Bạn vừa đăng xuất!");
      this.logoutUser();
      this.$router.push("/");
    },

    testSnackbar() {
      this.getSnackBars("Tim kiếm đang phát triển");
    },
  },
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
  padding-left: 20px;
  position: relative;
}
.nav-option__item:hover {
  transform: translate(0, -3px);
  color: var(--text-hover);
  transition: var(--tran03);
  z-index: 1;
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

.nav-option__item-login {
  position: relative;
}

.nav-option__item-login .menu-account {
  display: none;
  position: absolute;
  top: 20px;
  right: -30px;
  width: 180px;
  background-color: #fff;
}
.nav-option__item-login .menu-cart-item {
  display: none;
  position: absolute;
  top: 20px;
  right: 0px;
  background-color: #fff;
  z-index: 99999;
}

.nav-option__item-login .menu-account::after {
  content: "";
  position: absolute;
  top: -17%;
  left: 133px;
  margin-left: 0px;
  border-width: 7px;
  border-style: solid;
  border-color: transparent transparent var(--text-hover) transparent;
}

.nav-option__item-login:hover .menu-account {
  display: block;
  animation: fade 300ms ease forwards;
  box-shadow: var(--text-hover) 0px 5px 15px;
  z-index: 99999;
}

.nav-option__item-login:hover .menu-cart-item {
  display: block;
  animation: fade 300ms ease forwards;
  box-shadow: var(--text-hover) 0px 5px 15px;
  z-index: 99999;
}

@keyframes fade {
  0% {
    transform: translateY(30px);
    opacity: 0;
  }

  100% {
    opacity: 1;
    transform: translateY(0px);
  }
}

.menu-account__item {
  padding: 10px;
  width: 100%;
  height: 40px;
  color: var(--text-dark);
  font-size: 14px;
  border-bottom: 1px solid var(--text-hover);
}
</style>
