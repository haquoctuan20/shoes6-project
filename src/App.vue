<template>
  <div>
    <div class="wrapper" v-if="!layoutAdmin">
      <!-- header -->
      <Header />

      <!-- nav -->
      <Navbar />

      <transition name="slide">
        <router-view> </router-view>
      </transition>
      <!-- footer -->
      <Footer />
    </div>

    <!-- ADMIN LAYOUT -->
    <div class="wrapper-admin" v-if="layoutAdmin">
      <div class="sidebar-admin-app">
        <Sidebar />
      </div>

      <div class="content-admin-app">
        <HeaderAdmin />

        <transition name="slide">
          <router-view> </router-view>
        </transition>
      </div>
    </div>

    <SnackBars />
  </div>
</template>

<script>
import Footer from "@/components/Footer.vue";
import Header from "@/components/Header.vue";
import Navbar from "@/components/Navbar.vue";
import SnackBars from "@/components/SnackBars.vue";
// admin

import Sidebar from "@/components/admin/Sidebar.vue";
import HeaderAdmin from "@/components/admin/HeaderAdmin.vue";

export default {
  components: { Footer, Header, Navbar, Sidebar, HeaderAdmin, SnackBars },
  name: "App",

  data: () => ({}),

  computed: {
    /**
     * lấy data từ store
     */
    layoutAdmin() {
      return this.$store.state.layoutAdmin;
    },
  },
};
</script>

<style>
/* RESET CSS */
@import "./assets/css/reset.css";
/* Google font */
@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap");

/* ROOT - Biến css */
:root {
  /* text */
  --text-dark: #12232e;
  --text-light: #eefbfb;
  --text-hover: #4da8da;

  /* background */
  --backgound-gray: #efefef;
  --background-dark: #203647;

  /* button */
  --btn-default: #4da8da;
  --btn-hover: #007cc7;
  --btn-text-hover: #eefbfb;

  /* transition */
  --tran02: ease 0.2s;
  --tran03: ease-in-out 0.3s;
  --tran06: ease-in-out 0.6s;
}

body {
  font-family: "Roboto", sans-serif !important;
  font-size: 14px;
  color: var(--text-dark);
}
a {
  color: var(--text-dark) !important;
  text-decoration: none !important;
}

.wrapper {
  margin: auto 20px;
}

.wrapper-admin {
  display: flex;
  background-color: var(--backgound-gray);
}

.sidebar-admin-app {
  width: 220px;
  height: 100vh;
}
.content-admin-app {
  width: calc(100% - 220px);
  height: 100vh;
}

.slide-leave-active {
  transition: opacity 300ms ease;
  opacity: 0;
  animation: slide-out 300ms ease-out forwards;
}

.slide-leave {
  opacity: 1;
  transform: translateY(0);
}

@keyframes slide-out {
  0% {
    transform: translateY(0);
  }

  100% {
    transform: translateY(30px);
  }
}

/* width */
::-webkit-scrollbar {
  width: 6px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 0px grey;
  border-radius: 10px;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: var(--btn-default);
  border-radius: 3px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: var(--btn-hover);
}
</style>
