<template>
  <div>
    <h2 class="login-title">ĐĂNG NHẬP</h2>
    <div class="login-form">
      <v-form>
        <v-text-field label="Email" placeholder="...@gmail.com"></v-text-field>
        <v-text-field label="Mật khẩu" placeholder="********"></v-text-field>
      </v-form>
    </div>

    <div class="container-btn-login">
      <!-- Quen mật khẩu -->
      <div>
        <router-link to="/reset-password">
          <p class="text-login">
            Quên mật khẩu?
          </p>
        </router-link>
      </div>

      <div>
        <button class="btn btn-login-account" @click="openAfterLogin">
          Đăng nhập
        </button>
      </div>

      <!-- Tao tai khoan -->
      <div>
        <router-link to="/create-account">
          <p class="text-login text-login-border">
            Tạo tài khoản mới
          </p>
        </router-link>
      </div>

      <!-- ve trang chu -->
      <div>
        <router-link to="/">
          <p class="text-login">
            Trở về Trang chủ
          </p>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    openAfterLogin() {
      this.$router.push("/admin");
    },
  },
};
</script>

<style>
.login-title {
  font-size: 36px;
  letter-spacing: 1px;
  padding: 40px 0px 20px;
  text-align: center;
  font-weight: 600;
}

.login-form {
  width: 60%;
  margin: 0px auto;
}

.container-btn-login {
  display: flex;
  width: 60%;
  margin: 0px auto;
  justify-content: space-between;
  flex-direction: column;
  align-items: center;
}

.btn-login-account {
  color: var(--text-light);
  margin: 10px auto;
}

.text-login {
  padding: 4px;
  margin-bottom: 10px;
}

.text-login:hover {
  color: var(--text-hover);
}
.text-login-border {
  border-bottom: 1px solid var(--text-hover);
}
</style>
