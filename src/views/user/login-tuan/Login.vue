<template>
  <div>
    <h2 class="login-title">ĐĂNG NHẬP</h2>
    <div class="login-form">
      <v-form>
        <v-text-field
          ref="email"
          label="Email"
          placeholder="...@gmail.com"
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
        <button class="btn-shopnow btn-login-account" @click="openAfterLogin">
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
      required: (value) => !!value || "Required.",
      min: (v) => v.length >= 8 || "Ít nhất 8 ký tự",
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
        alert("Nhập email, mật khẩu!");
        this.$refs.email.focus();
      } else {
        const users = this.$store.getters.users;
        this.userLoging = users.filter(
          (u) => u.email === this.email && u.password === this.password
        );
        console.log(this.userLoging);
        if (this.userLoging.length > 0) {
          this.saveUserLogin(this.userLoging[0]);
          this.getSnackBars(`Xin chào ${this.userLoging[0].email}`);
          this.$router.push("/admin");
        } else {
          alert("Đăng nhập không thành công!");
        }
      }
    },
  },

  created() {
    // this.$store.dispatch("getUsers");
    this.getUsers();
  },

  mounted() {
    this.$refs.email.focus();
    // this.closeLayoutAdmin();
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
