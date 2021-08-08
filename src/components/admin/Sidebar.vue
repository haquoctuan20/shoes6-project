<template>
  <div class="slidebar">
    <router-link to="/">
      <div class="sidebar__image">
        <img src="@/assets/img/logo.png" alt="shoes6" />
      </div>
    </router-link>

    <!-- menu -->
    <div class="container-sidebar">
      <div class="sidebar-item">
        <router-link to="/admin/management-list-products">
          danh sach san pham
        </router-link>
      </div>

      <div class="sidebar-item">
        <router-link to="/admin/management-don-hang">
          don hang
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.slidebar {
  width: 100%;
  height: 100%;
  background: var(--background-dark);
  color: var(--text-light);
}

.sidebar__image img {
  cursor: pointer;
  width: 100%;
  object-fit: fill;
}
</style>
