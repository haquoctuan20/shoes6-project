import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: () => import("@/views/user/home-tuan/Home.vue"),
  },
  {
    // danh sách sản phẩm
    path: "/list-product",
    name: "ListProduct",
    component: () => import("@/views/user/list-product-chien/ListProduct.vue"),
  },
  {
    // chi tiết sản phẩm theo id
    path: "/list-product/:id",
    name: "DetailProduct",
    component: () =>
      import("@/views/user/detail-product-chien/DetailProduct.vue"),
  },
  {
    // giỏ hàng
    path: "/cart-detail",
    name: "CartDetail",
    component: () => import("@/views/user/cart-detail-tanh/CartDetail.vue"),
  },
  {
    // thanh toán
    path: "/checkout",
    name: "Checkout",
    component: () => import("@/views/user/checkout-tanh/Checkout.vue"),
  },

  {
    // Trang chủ admin
    path: "/admin",
    name: "Admin",

    component: () => import("@/views/admin/AdminApp.vue"),
    children: [
      {
        // quan ly san pham
        path: "/management-list-products",
        name: "MListProducts",
        component: () => import("@/views/admin/MListProducts.vue"),
      },
      {
        // Quản lý đơn hàng
        path: "/management-don-hang",
        name: "MDonHang",

        component: () => import("@/views/admin/MDonHang.vue"),
      },
    ],
  },

  {
    // Đăng nhập
    path: "/login",
    name: "Login",

    component: () => import("@/views/user/login-tuan/Login.vue"),
  },

  {
    // Tạo tài khoản
    path: "/create-account",
    name: "CreateAccount",

    component: () => import("@/views/user/login-tuan/CreateAccount.vue"),
  },

  {
    // reset mat khau
    path: "/reset-password",
    name: "ResetPassword",

    component: () => import("@/views/user/login-tuan/ResetPassword.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
