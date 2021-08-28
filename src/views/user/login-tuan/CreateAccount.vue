<template>
  <div>
    <h2 class="create-title">TẠO TÀI KHOẢN</h2>
    <div class="create-form">
      <v-form>
        <v-text-field label="Họ và tên"></v-text-field>
        <v-text-field label="Địa chỉ"></v-text-field>
        <v-text-field label="Số điện thoại"></v-text-field>
        <v-text-field label="Email" placeholder="...@gmail.com"></v-text-field>
        <v-text-field label="Mật khẩu" placeholder="********"></v-text-field>
      </v-form>
    </div>

    <div class="container-btn-create">
      <div>
        <button class="btn-create-acc btn-create-account">
          Tạo tài khoản
        </button>
      </div>

      <div>
        <router-link to="/">
          <p class="return-home">
            Trở về Trang chủ
          </p>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.btn-create-acc {
  letter-spacing: 2px;
  text-transform: uppercase;
}

.btn-create-acc {
  padding: 14px 40px;
  background-color: var(--btn-default);
}
.btn-create-acc:hover {
  background-color: var(--btn-hover);
  transition: var(--tran03);
}

.create-title {
  font-size: 36px;
  letter-spacing: 1px;
  padding: 40px 0px 20px;
  text-align: center;
  font-weight: 600;
}

.create-form {
  width: 60%;
  margin: 0px auto;
}

.container-btn-create {
  display: flex;
  width: 60%;
  margin: 0px auto;
  justify-content: space-between;
  align-items: center;
}

.btn-create-account {
  color: var(--text-light);
  margin: 10px auto;
}

.return-home {
  padding: 4px;
}

.return-home:hover {
  border-bottom: 1px solid var(--btn-hover);
}
</style>
