<template>
  <div class="text-center">
    <v-snackbar
      v-model="snackBars.status"
      :vertical="vertical"
      :timeout="timeout"
      absolute
      top
      right
    >
      {{ snackBars.text }}

      <template v-slot:action="{ attrs }">
        <v-btn color="blue" text v-bind="attrs" @click="closeSnackBars">
          Đóng
        </v-btn>
      </template>
    </v-snackbar>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
export default {
  computed: {
    ...mapGetters(["snackBars"]),
  },
  data: () => ({
    timeout: 2000,
    vertical: true,
  }),
  methods: {
    ...mapActions(["closeSnackBars"]),
  },
};
</script>

<style></style>
