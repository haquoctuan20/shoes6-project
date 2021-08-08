import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    isAdmin: false,
    layoutAdmin: false,
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
  },

  actions: {
    openLayoutAdmin: ({ commit }) => {
      commit("openLayoutAdmin");
    },

    closeLayoutAdmin: ({ commit }) => {
      commit("closeLayoutAdmin");
    },
  },
});
