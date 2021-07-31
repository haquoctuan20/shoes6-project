<template>
  <div class="list-product">
    <h2>Chi tiết sản phẩm</h2>
    <p>ID sản phẩm: {{ id }}</p>
  </div>
</template>

<script>
// Trang detail nhận vào id từ đương link trên trình duyệt (gọi là route),
// lấy id đó để lấy thông tin tiét sản phẩm theo id
export default {
  data: () => ({
    id: null,
  }),

  methods: {
    /**
     * lấy id từ route
     * gọi hàm lấy ở mounted
     */
    getId() {
      this.id = this.$route.params.id;
    },
  },

  created() {
    this.getId();
  },
};
</script>

<style>
.list-product {
  min-height: 500px;
}
</style>
