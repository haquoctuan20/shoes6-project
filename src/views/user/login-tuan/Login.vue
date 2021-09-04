<template>
  <div>
    <h2 class="login-title">ĐĂNG NHẬP</h2>
    <div class="login-form">
      <v-form>
        <v-text-field
          ref="email"
          label="Username đăng nhập"
          :rules="[rules.required]"
          v-model="email"
        ></v-text-field>
        <v-text-field
          label="Mật khẩu"
          v-model="password"
          :rules="[rules.required, rules.min]"
          :type="show1 ? 'text' : 'password'"
          name="input-10-1"
          counter
          @click:append="show1 = !show1"
        ></v-text-field>
      </v-form>
    </div>

    <div class="container-btn-login">
      <div>
        <button class="btn-login btn-login-account" @click="openAfterLogin">
          Đăng nhập
        </button>
      </div>

      <!-- Quen mật khẩu -->
      <div>
        <router-link to="/reset-password">
          <p class="text-login">
            Quên mật khẩu?
          </p>
        </router-link>
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
import { mapActions, mapGetters } from "vuex";
export default {
  computed: {
    ...mapGetters(["userLogin"]),
  },
  data: () => ({
    show1: false,
    rules: {
      required: (value) => !!value || "Yêu cầu nhập.",
      min: (v) => v.length >= 8 || "Ít nhất 8 ký tự",
      email: (value) => {
        const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return pattern.test(value) || "Mail không hợp lệ.";
      },
    },

    email: "",
    password: "",
    userLoging: {},
  }),
  methods: {
    ...mapActions([
      "getUsers",
      "closeLayoutAdmin",
      "saveUserLogin",
      "getSnackBars",
    ]),

    openAfterLogin() {
      if (this.email.trim() === "" || this.password.trim() === "") {
        this.getSnackBars("Nhập email, mật khẩu!");
        this.$refs.email.focus();
      } else {
        const users = this.$store.getters.users;
        this.userLoging = users.filter(
          (u) => u.username === this.email && u.password === this.password
        );
        console.log(this.userLoging);
        if (this.userLoging.length > 0) {
          this.saveUserLogin(this.userLoging[0]);
          this.getSnackBars(`Xin chào ${this.userLoging[0].email}`);
          this.$router.push("/admin");
        } else {
          this.getSnackBars("Tài khoản hoặc mật khẩu không chính xác!");
        }
      }
    },
  },

  created() {
    this.getUsers();
  },

  mounted() {
    this.$refs.email.focus();
    // this.closeLayoutAdmin();
  },
};
</script>

<style>
.btn-login {
  letter-spacing: 2px;
  text-transform: uppercase;
}

.btn-login {
  padding: 14px 40px;
  background-color: var(--btn-default);
}
.btn-login:hover {
  background-color: var(--btn-hover);
  transition: var(--tran03);
}

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
