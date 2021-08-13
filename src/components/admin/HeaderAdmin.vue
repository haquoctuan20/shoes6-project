<template>
  <div class="header-admin">
    <!-- left -->
    <div class="header-left">
      <router-link tag="h2" to="/">
        <i class="fas fa-arrow-circle-left"></i>
        Trang chủ
      </router-link>
    </div>

    <!-- center -->
    <div class="header-center">
      <i class="fas fa-search"></i>
      <input type="text" placeholder="Tìm kiếm..." />
    </div>

    <!-- right -->
    <div class="header-right">
      <i class="far fa-envelope"></i>
      <i class="fas fa-bell"></i>
      <i class="fas fa-cogs"></i>
      <i class="fas fa-power-off"></i>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({}),
};
</script>

<style>
.header-admin {
  width: 100%;
  height: 60px;
  background: var(--text-hover);
  color: var(--text-light);

  display: flex;
  justify-content: space-between;
  align-items: center;
}

.header-admin i {
  display: block;
  font-size: 20px;
  padding: 0px 8px;
  margin: 0px 4px;
  cursor: pointer;
  transition: var(--tran02);
}

.header-admin i:hover {
  color: var(--text-dark);
}

/* =============left============= */
.header-left {
}
.header-left > h2 {
  display: flex;
  text-align: center;
  font-size: 20px;
  cursor: pointer;
  transition: var(--tran02);
}

.header-left > h2:hover {
  color: var(--text-dark);
}

/* ==============center=============== */
.header-center,
.header-right {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.header-center > input {
  width: 140px;
  height: 38px;
  border: 1px solid #ccc;
  border-radius: 4px;
  outline: none;
  color: var(--text-dark);
  font-size: 16px;
  padding: 0px 8px;
  background: var(--backgound-gray);
  transition: var(--tran03);
}

.header-center > input:focus {
  width: 300px;
}

.header-center > input::placeholder {
  color: var(--text-dark);
  font-size: 16px;
}

/* ============== header right ================== */
.header-right {
}
</style>
