<template>
  <div>
    <h2 class="reset-password-title">ĐẶT LẠI MẬT KHẨU</h2>
    <div class="reset-password-form">
      <v-form>
        <v-text-field label="Email" placeholder="...@gmail.com"></v-text-field>
      </v-form>
    </div>

    <div class="container-btn-reset-password">
      <h6>Chúng tôi sẽ gửi cho bạn một email để đặt lại mật khẩu của bạn.</h6>

      <div>
        <button
          class="btn-reset-pass btn-reset-password-account"
          @click="snackbar = true"
        >
          Gửi
        </button>
      </div>

      <!-- ve trang chu -->
      <div>
        <router-link to="/login">
          <p class="text-reset-password">
            Trở về
          </p>
        </router-link>
      </div>
    </div>

    <!-- snackbars -->
    <template>
      <div class="text-center">
        <v-snackbar
          v-model="snackbar"
          :timeout="timeout"
          top="true"
          color="#203647"
        >
          {{ text }}

          <template v-slot:action="{ attrs }">
            <v-btn color="blue" text v-bind="attrs" @click="backToLogin">
              Đóng
            </v-btn>
          </template>
        </v-snackbar>
      </div>
    </template>
  </div>
</template>

<script>
export default {
  data: () => ({
    snackbar: false,
    text: "Kiểm tra email của bạn và đăng nhập lại.",
    timeout: 5000,
  }),
  methods: {
    backToLogin() {
      this.snackbar = false;
      this.$router.push("/login");
    },
  },
};
</script>

<style>
.reset-password-title {
  font-size: 36px;
  letter-spacing: 1px;
  padding: 40px 0px 20px;
  text-align: center;
  font-weight: 600;
}

.reset-password-form {
  width: 60%;
  margin: 0px auto;
}

.container-btn-reset-password {
  display: flex;
  width: 60%;
  margin: 0px auto;
  justify-content: space-between;
  flex-direction: column;
  align-items: center;
}

.btn-reset-pass {
  letter-spacing: 2px;
  text-transform: uppercase;
}

.btn-reset-pass {
  padding: 14px 40px;
  background-color: var(--btn-default);
}
.btn-reset-pass:hover {
  background-color: var(--btn-hover);
  transition: var(--tran03);
}

.btn-reset-password-account {
  color: var(--text-light);
  margin: 10px auto;
}

.text-reset-password {
  padding: 4px;
  margin-bottom: 10px;
}

.text-reset-password:hover {
  color: var(--text-hover);
}
.text-reset-password-border {
  border-bottom: 1px solid var(--text-hover);
}
</style>
