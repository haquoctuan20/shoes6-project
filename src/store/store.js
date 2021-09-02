import Vue from "vue";
import Vuex from "vuex";

import axios from "axios";

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    layoutAdmin: false,
    /** Danh sach nguoi dung */
    users: [{ email: "a", password: "a", role: "ADMIN" }],
    /** user dang dang nhap */
    userLogin: JSON.parse(localStorage.getItem("userLogin")) || {},

    snackBars: {
      text: "",
      status: false,
    },

    // Tuan anh
    listProducts: [],
  },

  getters: {
    /** getter users */
    users: (state) => state.users,
    /**getter userlogin */
    userLogin: (state) => state.userLogin,

    /** Danh sach san pham trong gio hang */
    listProducts: (state) => state.listProducts,

    snackBars: (state) => state.snackBars,
  },

  mutations: {
    /** Luu danh sach user vao store */
    saveUsers(state, users) {
      state.users = users;
      console.log(state.users);
    },

    /** luu user dang dang nhap */
    saveUserLogin(state, userLogin) {
      state.userLogin = userLogin;
      console.log(userLogin);
      localStorage.setItem("userLogin", JSON.stringify(userLogin));
    },

    /** Dang xuat */
    logoutUser(state) {
      state.userLogin = {};
      localStorage.removeItem("userLogin");
    },

    /** get snackbars */
    getSnackBars(state, text) {
      console.log(text);

      state.snackBars.text = text;
      state.snackBars.status = true;
    },

    closeSnackBars(state) {
      state.snackBars = {
        text: "",
        status: false,
      };
    },

    // add to list TA
    addProductToList(state, product) {
      let push = true;
      state.listProducts.map((item) => {
        if (item.id === product.id) {
          console.log("object");
          push = false;
          item.quantity += product.quantity;
        }
      });

      if (push) {
        state.listProducts.push(product);
      }
      console.log(state.listProducts);
    },
  },

  actions: {
    /**
     * Lay danh sach users tu database
     * commit saveUsers
     */
    getUsers({ commit }) {
      axios
        .get("https://localhost:44380/user/all")
        .then((res) => {
          commit("saveUsers", res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    saveUserLogin({ commit }, userLogin) {
      commit("saveUserLogin", userLogin);
    },

    logoutUser({ commit }) {
      commit("logoutUser");
    },

    getSnackBars({ commit }, text) {
      commit("getSnackBars", text);
    },

    closeSnackBars({ commit }) {
      commit("closeSnackBars");
    },

    addProductToList({ commit }, product) {
      commit("addProductToList", product);
    },
  },
});
