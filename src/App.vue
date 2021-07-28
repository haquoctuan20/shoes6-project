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

  /* button */
  --btn-default: #4da8da;
  --btn-hover: #007cc7;
  --btn-text-hover: #eefbfb;

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

/* css button */
.btn {
  padding: 14px 40px;
  background-color: var(--btn-default);
}
.btn:hover {
  background-color: var(--btn-hover);
  transition: var(--tran03);
}
</style>
