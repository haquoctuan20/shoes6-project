import Vue from "vue";
import Vuex from "vuex";

import axios from "axios";

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    layoutAdmin: false,
    /** Danh sach nguoi dung */
    users: [],
    /** user dang dang nhap */
    userLogin: JSON.parse(localStorage.getItem("userLogin")) || {},

    // Tuan anh
    listProducts: [
      {
        id: "1",
        title: "Derby shoe - sandal",
        size: 7,
        material: "rubber",
        quantity: 1,
        price: 756,
        image: "shoe2.jpg",
      },
      {
        id: "2",
        title: "Derby shoe - sandal",
        size: 7,
        material: "rubber",
        quantity: 2,
        price: 756,
        image: "shoe2.jpg",
      },
      {
        id: "3",
        title: "Derby shoe - sandal",
        size: 7,
        material: "rubber",
        quantity: 3,
        price: 756,
        image: "shoe2.jpg",
      },
      {
        id: "4",
        title: "Derby shoe - sandal",
        size: 7,
        material: "rubber",
        quantity: 4,
        price: 756,
        image: "shoe2.jpg",
      },
    ],
  },

  getters: {
    /** getter users */
    users: (state) => state.users,
    /**getter userlogin */
    userLogin: (state) => state.userLogin,
  },

  mutations: {
    /**
     * tắt mở header, navbar, footer khi ở trang quản trị admin
     * @param {*} state
     */
    openLayoutAdmin(state) {
      state.layoutAdmin = true;
    },
    closeLayoutAdmin(state) {
      state.layoutAdmin = false;
    },

    /** Luu danh sach user vao store */
    saveUsers(state, users) {
      state.users = users;
      state.users.push({ email: "a", password: "a" });
      console.log(state.users);
    },

    /** luu user dang dang nhap */
    saveUserLogin(state, userLogin) {
      state.userLogin = userLogin;
      console.log(userLogin);
      localStorage.setItem("userLogin", JSON.stringify(userLogin));
    },
  },

  actions: {
    openLayoutAdmin: ({ commit }) => {
      console.log("Vào admin");
      commit("openLayoutAdmin");
    },

    closeLayoutAdmin: ({ commit }) => {
      commit("closeLayoutAdmin");
    },

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
  },
});
