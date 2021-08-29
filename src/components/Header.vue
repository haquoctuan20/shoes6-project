<template>
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
      <a
        class="home-header__title"
        href="https://github.com/haquoctuan20/shoes6-project"
        target="_blank"
      >
        <i class="fab fa-github"></i>
        Địa chỉ cửa hàng(Github)
      </a>
    </div>
  </header>
</template>

<script>
export default {};
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
</style>
