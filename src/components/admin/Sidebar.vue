<template>
  <div class="slidebar">
    <!--  -->
    <router-link to="/">
      <div class="sidebar__image">
        <img src="@/assets/img/logo.png" alt="shoes6" />
      </div>
    </router-link>

    <!-- menu -->
    <div class="container-sidebar">
      <div @click="setActive('admin')">
        <router-link
          tag="div"
          class="sidebar-item"
          exact
          :class="{ tabActiveClass: tabActive === 'admin' }"
          to="/admin"
        >
          <i class="fas fa-store-alt"></i> Tổng quan
        </router-link>
      </div>

      <div @click="setActive('categories')">
        <router-link
          tag="div"
          class="sidebar-item"
          exact
          to="/admin/categories"
          :class="{ tabActiveClass: tabActive === 'categories' }"
        >
          <i class="fas fa-list"></i> Danh mục
        </router-link>
      </div>

      <div @click="setActive('products')">
        <router-link
          tag="div"
          class="sidebar-item"
          to="/admin/products"
          :class="{ tabActiveClass: tabActive === 'products' }"
        >
          <i class="fas fa-shoe-prints"></i> Sản phẩm
        </router-link>
      </div>

      <div @click="setActive('orders')">
        <router-link
          tag="div"
          class="sidebar-item"
          to="/admin/orders"
          :class="{ tabActiveClass: tabActive === 'orders' }"
        >
          <i class="fas fa-shopping-basket"></i> Đơn hàng
        </router-link>
      </div>

      <div @click="setActive('customers')">
        <router-link
          tag="div"
          class="sidebar-item"
          to="/admin/customers"
          :class="{ tabActiveClass: tabActive === 'customers' }"
        >
          <i class="fas fa-users"></i> Khách hàng
        </router-link>
      </div>

      <div @click="setActive('order-refund')">
        <router-link
          tag="div"
          class="sidebar-item"
          to="/admin/order-refund"
          :class="{ tabActiveClass: tabActive === 'order-refund' }"
        >
          <i class="fas fa-bullhorn"></i> Danh sách hoàn trả
        </router-link>
      </div>

      <div @click="setActive('stores')">
        <router-link
          tag="div"
          class="sidebar-item"
          to="/admin/stores"
          :class="{ tabActiveClass: tabActive === 'stores' }"
        >
          <i class="fas fa-balance-scale-left"></i> Danh sách kho
        </router-link>
      </div>

      <div @click="setActive('report')">
        <router-link
          tag="div"
          class="sidebar-item"
          to="/admin/report"
          :class="{ tabActiveClass: tabActive === 'report' }"
        >
          <i class="fas fa-chart-line"></i> Báo cáo
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    tabActive: "admin",
  }),

  methods: {
    setActive(value) {
      this.tabActive = value;
    },
  },
};
</script>

<style>
.slidebar {
  width: 100%;
  height: 100%;
  background: var(--background-gray);
  color: var(--text-dark);
  box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
}

.sidebar__image {
  border-bottom: 1px solid #ccc;
}

.sidebar__image img {
  cursor: pointer;
  width: 100%;
  object-fit: fill;
}

/* ================== menu ==================*/
.container-sidebar {
  margin-top: 10px;
}
.sidebar-item {
  display: block;
  width: 94%;
  height: 46px;

  margin: 8px auto;
  border-radius: 4px;

  text-align: left;
  line-height: 46px;

  font-size: 16px;

  padding-left: 8px;

  cursor: pointer;
  transition: var(--tran02);
}

.sidebar-item > i {
  padding-right: 10px;
}
.sidebar-item:hover {
  background: var(--text-hover);
  color: var(--text-light);
}

.tabActiveClass {
  background: var(--background-dark) !important;
  color: var(--text-light);
  font-weight: 500;
}
</style>
