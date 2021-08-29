<template>
  <div class="header-admin">
    <!-- left -->
    <div class="header-left">
      <router-link tag="h2" to="/">
        <i class="fas fa-arrow-circle-left"></i>
        Trang chủ
      </router-link>
    </div>

    <div>
      <v-app class="none-vapp">
        <v-dialog v-model="dialog" persistent max-width="400">
          <v-card>
            <v-card-title class="text-h5">
              Bạn có muốn đăng xuất ?
            </v-card-title>
            <v-card-text> </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="green darken-1" text @click="dialog = false">
                Hủy
              </v-btn>
              <v-btn color="green darken-1" text @click="LogoutUser">
                Đăng xuất
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-app>
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
      <i class="fas fa-power-off" @click="openLogoutUser"></i>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";
export default {
  data: () => ({
    dialog: false,
  }),
  methods: {
    ...mapActions(["logoutUser", "getSnackBars"]),

    openLogoutUser() {
      this.dialog = true;
    },

    LogoutUser() {
      this.dialog = false;
      this.getSnackBars("Bạn vừa đăng xuất!");
      this.logoutUser();
      this.$router.push("/");
    },
  },
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
</style>
