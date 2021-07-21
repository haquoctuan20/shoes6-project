<template>
  <div class="wrapper">
    <home />
  </div>
</template>

<script>
import Home from "./views/user/home-tuan/Home.vue";
export default {
  components: { Home },
  name: "App",

  data: () => ({
    //
  }),
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

  /* transition */
  --tran03: ease-in-out 0.3s;
  --tran06: ease-in-out 0.6s;
}

body {
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  color: var(--text-dark);
  margin: auto 20px;
}
</style>
