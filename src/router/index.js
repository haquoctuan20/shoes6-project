import Vue from "vue";
import VueRouter from "vue-router";
import { store } from "../store/store.js";

Vue.use(VueRouter);

const routes = [
  { path: "*", redirect: "/" },
  {
    path: "/",
    name: "Home",
    component: () => import("@/views/user/home-tuan/Home.vue"),
    beforeEnter: (to, from, next) => {
      store.state.layoutAdmin = false;
      next();
    },
  },
  {
    // danh sách sản phẩm
    path: "/list-product",
    name: "ListProduct",
    component: () => import("@/views/user/list-product-chien/ListProduct.vue"),
    beforeEnter: (to, from, next) => {
      store.state.layoutAdmin = false;
      next();
    },
  },
  {
    // chi tiết sản phẩm theo id
    path: "/list-product/:id",
    name: "DetailProduct",
    component: () =>
      import("@/views/user/detail-product-chien/DetailProduct.vue"),
    beforeEnter: (to, from, next) => {
      store.state.layoutAdmin = false;
      next();
    },
  },
  {
    // giỏ hàng
    path: "/cart-detail",
    name: "CartDetail",
    component: () => import("@/views/user/cart-detail-tanh/DetailCart.vue"),
    beforeEnter: (to, from, next) => {
      store.state.layoutAdmin = false;
      next();
    },
  },
  {
    // thanh toán
    path: "/checkout",
    name: "Checkout",
    component: () => import("@/views/user/checkout-tanh/Checkout.vue"),
    beforeEnter: (to, from, next) => {
      store.state.layoutAdmin = false;
      next();
    },
  },

  // ============== ADMIN =================

  {
    // Trang chủ admin
    path: "/admin",
    name: "Admin",

    component: () => import("@/views/admin/AdminApp.vue"),
    beforeEnter: (to, from, next) => {
      console.log(store.getters.userLogin.role);
      if (store.getters.userLogin.role === "ADMIN") {
        store.state.layoutAdmin = true;
        next();
      } else next("/");
    },
  },
  {
    // Quan ly danh muc san pham
    path: "/admin/categories",
    name: "Categories",

    component: () => import("@/views/admin/Categories.vue"),
    beforeEnter: (to, from, next) => {
      console.log(store.getters.userLogin.role);
      if (store.getters.userLogin.role === "ADMIN") {
        store.state.layoutAdmin = true;
        next();
      } else next("/");
    },
  },
  {
    // Quan ly san pham
    path: "/admin/products",
    name: "Products",

    component: () => import("@/views/admin/Products.vue"),
    beforeEnter: (to, from, next) => {
      console.log(store.getters.userLogin.role);
      if (store.getters.userLogin.role === "ADMIN") {
        store.state.layoutAdmin = true;
        next();
      } else next("/");
    },
  },
  {
    // Quan ly don hang
    path: "/admin/orders",
    name: "Orders",

    component: () => import("@/views/admin/Orders.vue"),
    beforeEnter: (to, from, next) => {
      console.log(store.getters.userLogin.role);
      if (store.getters.userLogin.role === "ADMIN") {
        store.state.layoutAdmin = true;
        next();
      } else next("/");
    },
  },
  {
    // Quan ly khach hang
    path: "/admin/customers",
    name: "Customers",

    component: () => import("@/views/admin/Customers.vue"),
    beforeEnter: (to, from, next) => {
      console.log(store.getters.userLogin.role);
      if (store.getters.userLogin.role === "ADMIN") {
        store.state.layoutAdmin = true;
        next();
      } else next("/");
    },
  },
  {
    // Quan ly don hang hoan tra
    path: "/admin/order-refund",
    name: "OrderRefund",

    component: () => import("@/views/admin/OrderRefund.vue"),
    beforeEnter: (to, from, next) => {
      console.log(store.getters.userLogin.role);
      if (store.getters.userLogin.role === "ADMIN") {
        store.state.layoutAdmin = true;
        next();
      } else next("/");
    },
  },
  {
    // Quan ly danh sach kho hang
    path: "/admin/stores",
    name: "Stores",

    component: () => import("@/views/admin/Stores.vue"),
    beforeEnter: (to, from, next) => {
      console.log(store.getters.userLogin.role);
      if (store.getters.userLogin.role === "ADMIN") {
        store.state.layoutAdmin = true;
        next();
      } else next("/");
    },
  },
  {
    // Quan ly bao cao hang thang
    path: "/admin/report",
    name: "Report",

    component: () => import("@/views/admin/Report.vue"),
    beforeEnter: (to, from, next) => {
      console.log(store.getters.userLogin.role);
      if (store.getters.userLogin.role === "ADMIN") {
        store.state.layoutAdmin = true;
        next();
      } else next("/");
    },
  },

  // =========== LOGIN ================

  {
    // Đăng nhập
    path: "/login",
    name: "Login",

    component: () => import("@/views/user/login-tuan/Login.vue"),
    beforeEnter: (to, from, next) => {
      store.state.layoutAdmin = false;
      next();
    },
  },

  {
    // Tạo tài khoản
    path: "/create-account",
    name: "CreateAccount",

    component: () => import("@/views/user/login-tuan/CreateAccount.vue"),
    beforeEnter: (to, from, next) => {
      store.state.layoutAdmin = false;
      next();
    },
  },

  {
    // reset mat khau
    path: "/reset-password",
    name: "ResetPassword",

    component: () => import("@/views/user/login-tuan/ResetPassword.vue"),
    beforeEnter: (to, from, next) => {
      store.state.layoutAdmin = false;
      next();
    },
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
