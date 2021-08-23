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
    component: () => import("@/views/user/cart-detail-tanh/DetailCart.vue"),
  },
  {
    // thanh toán
    path: "/checkout",
    name: "Checkout",
    component: () => import("@/views/user/checkout-tanh/Checkout.vue"),
  },

  // ============== ADMIN =================

  {
    // Trang chủ admin
    path: "/admin",
    name: "Admin",

    component: () => import("@/views/admin/AdminApp.vue"),
  },
  {
    // Quan ly danh muc san pham
    path: "/admin/categories",
    name: "Categories",

    component: () => import("@/views/admin/Categories.vue"),
  },
  {
    // Quan ly san pham
    path: "/admin/products",
    name: "Products",

    component: () => import("@/views/admin/Products.vue"),
  },
  {
    // Quan ly don hang
    path: "/admin/orders",
    name: "Orders",

    component: () => import("@/views/admin/Orders.vue"),
  },
  {
    // Quan ly khach hang
    path: "/admin/customers",
    name: "Customers",

    component: () => import("@/views/admin/Customers.vue"),
  },
  {
    // Quan ly don hang hoan tra
    path: "/admin/order-refund",
    name: "OrderRefund",

    component: () => import("@/views/admin/OrderRefund.vue"),
  },
  {
    // Quan ly danh sach kho hang
    path: "/admin/stores",
    name: "Stores",

    component: () => import("@/views/admin/Stores.vue"),
  },
  {
    // Quan ly bao cao hang thang
    path: "/admin/report",
    name: "Report",

    component: () => import("@/views/admin/Report.vue"),
  },

  // =========== LOGIN ================

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
