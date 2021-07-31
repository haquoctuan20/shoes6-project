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
    path: "/cart",
    name: "Cart",
    component: () => import("@/views/user/cart-tanh/Cart.vue"),
  },
  {
    // thanh toán
    path: "/checkout",
    name: "Checkout",
    component: () => import("@/views/user/checkout-tanh/Checkout.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
