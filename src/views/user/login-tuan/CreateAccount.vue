<template>
  <div>
    <h2 class="create-title">TẠO TÀI KHOẢN</h2>
    <div class="create-form">
      <v-form>
        <v-text-field
          label="Tên đăng nhập"
          :rules="[rules.required]"
          counter
          v-model="username"
          @blur="validateInput('username')"
        ></v-text-field>

        <v-text-field
          label="Email"
          placeholder="...@gmail.com"
          :rules="[rules.required, rules.email]"
          v-model="email"
          @blur="validateInput('email')"
        ></v-text-field>

        <v-text-field
          label="Số điện thoại"
          :rules="[rules.required]"
          v-model="phone"
          type="number"
          @blur="validateInput('phone')"
        ></v-text-field>

        <v-text-field
          label="Mật khẩu"
          placeholder="********"
          :rules="[rules.required, rules.min]"
          v-model="password"
          counter
          @blur="validateInput('password')"
        ></v-text-field>
      </v-form>
    </div>

    <div class="container-btn-create">
      <div @click="createAccount">
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
import { mapActions } from "vuex";
import { mapGetters } from "vuex";
import axios from "axios";

export default {
  computed: {
    ...mapGetters(["users"]),
  },

  data: () => ({
    email: "",
    password: "",
    phone: "",
    role: "CUSTOMER",
    username: "",

    validateDone: false,

    //
    rules: {
      required: (value) => !!value || "Yêu cầu nhập.",
      min: (v) => v.length >= 8 || "Ít nhất 8 ký tự",
      email: (value) => {
        const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return pattern.test(value) || "Mail không hợp lệ.";
      },
    },
  }),

  methods: {
    ...mapActions(["getUsers", "getSnackBars"]),

    validateInput(name) {
      if (name === "username") {
        if (this.users.some((item) => item.username === this.username)) {
          this.getSnackBars("Tên đăng nhập đã tôn tại!");
          this.validateDone = false;
        } else if (this.username === "") {
          this.getSnackBars("Không được bỏ trống tên đăng nhập!");
        } else {
          this.validateDone = true;
        }
      }

      if (name === "email") {
        if (this.users.some((item) => item.email === this.email)) {
          this.getSnackBars("Email đã tôn tại!");
          this.validateDone = false;
        } else if (this.email === "") {
          this.getSnackBars("Không được bỏ trống email!");
        } else {
          this.validateDone = true;
        }
      }

      if (name === "phone") {
        if (this.users.some((item) => item.phone === this.phone)) {
          this.getSnackBars("Số diện thoại đã tôn tại!");
          this.validateDone = false;
        } else {
          this.validateDone = true;
        }
      }

      if (name === "password") {
        if (this.password.length < 8) {
          this.getSnackBars("Mật khẩu ít nhất 8 ký tự");
          this.validateDone = false;
        } else {
          this.validateDone = true;
        }
      }
    },

    createAccount() {
      if (this.validateDone === false) {
        this.getSnackBars("Yêu cầu nhập chính xác thông tin của bạn!");
      } else {
        this.getSnackBars("đúng");
        const me = this;
        const user = {
          email: this.email,
          password: this.password,
          phone: this.phone,
          role: this.role,
          username: this.username,
        };

        axios
          .post("https://localhost:44380/user", user)
          .then(function(response) {
            me.getSnackBars("Đăng ký tài khoản thành công, mời bạn đăng nhập");
            console.log(response);
            me.$router.push("/login");
          })
          .catch(function(error) {
            me.getSnackBars("Đăng ký thất bại, hãy thử lại");
            console.log(error);
            me.$router.push("/create-account");
          });
      }
    },
  },

  created() {
    this.getUsers();
  },
};
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
