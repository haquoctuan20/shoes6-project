<template>
  <div class="container-products-admin">
    <!-- dialog -->
    <div>
      <v-app class="none-vapp">
        <v-dialog v-model="dialog" persistent max-width="500">
          <v-card>
            <v-card-title class="text-h5">
              Chắc chắn hủy đơn hàng này? <br />
            </v-card-title>
            <v-card-text> </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="green darken-1" text @click="dialog = false">
                Giữ lại
              </v-btn>
              <v-btn color="green darken-1" text @click="cancelCart">
                Hủy đơn
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-app>
    </div>

    <!-- button thêm mới -->

    <v-btn class="mb-2 ml-2" depressed color="primary" @click="getCartData()">
      <v-icon dark>
        mdi-refresh
      </v-icon>
      Làm mới danh sách
    </v-btn>

    <!-- form thêm mới, chi tiết -->

    <Loading v-if="loading" />

    <!-- table -->

    <div v-if="cartItemByID.length > 0">
      <v-simple-table class="mb-4" fixed-header>
        <template v-slot:default>
          <thead>
            <tr>
              <th class="">
                STT
              </th>
              <th class="">
                ID Sản phẩm
              </th>
              <th class="">
                Màu sắc
              </th>
              <th class="">
                Kích thước
              </th>
              <th class="">
                Số lượng
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, index) in cartItemByID" :key="item.id">
              <td>{{ index + 1 }}</td>
              <td>{{ item.productID }}</td>
              <td>{{ item.color }}</td>
              <td>{{ item.size }}</td>
              <td>{{ item.number }}</td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </div>

    <!-- table -->
    <v-simple-table fixed-header>
      <template v-slot:default>
        <thead>
          <tr>
            <th class="">
              STT
            </th>
            <th class="">
              ID Khách hàng
            </th>
            <th class="">
              Địa chỉ khách hàng
            </th>
            <th class="">
              Số điện thoại
            </th>
            <th class="">
              Tổng tiền
            </th>
            <th class="">
              Trạng thái
            </th>
            <th class="">
              Chức năng
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(item, index) in cart"
            :key="item.id"
            @dblclick="getCartItemByID(item)"
          >
            <td>{{ index + 1 }}</td>
            <td>{{ item.userID }}</td>
            <td>{{ item.address }}</td>
            <td>{{ item.phone }}</td>
            <td>
              {{
                item.totalMoney.toLocaleString("vi-VN", {
                  style: "currency",
                  currency: "VND",
                })
              }}
            </td>
            <td>{{ item.status }}</td>

            <td>
              <v-btn
                small
                class="mr-2"
                color="cyan"
                @click="getCartItemByID(item)"
              >
                <v-icon dark>
                  mdi-format-list-text
                </v-icon>
              </v-btn>

              <v-btn small class="mr-2" color="cyan" @click="acceptCart(item)">
                Xác nhận
              </v-btn>

              <v-btn
                class="color-minus"
                small
                color="cyan"
                @click="OpenCancelCart(item)"
              >
                Hủy đơn
              </v-btn>
            </td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>

    <Loading v-if="loading" />
  </div>
</template>

<script>
import axios from "axios";
import Loading from "@/components/Loading.vue";
import { mapActions } from "vuex";

export default {
  components: { Loading },
  data: () => ({
    cart: [],
    dialog: false,

    cartItemByID: [],

    cartCancel: {},

    loading: false,
  }),

  methods: {
    ...mapActions(["getSnackBars"]),

    async getCartData() {
      this.cartByID = [];
      this.loading = true;
      try {
        const response = await axios.get("https://localhost:44380/cart/all");
        this.cart = response.data;
        console.log(this.cart);
        this.loading = false;
      } catch (error) {
        console.error(error);
      }
    },

    async getCartItemByID(item) {
      this.loading = true;
      try {
        const response = await axios.get(
          `https://localhost:44380/cart-item/${item.id}`
        );
        this.cartItemByID = response.data;

        console.log(this.cartItemByID);

        window.scrollTo(0, 0);

        this.loading = false;
      } catch (error) {
        console.error(error);
      }
    },

    async acceptCart(item) {
      this.loading = true;
      item.status = "Đã xác nhận";
      const me = this;
      axios
        .put(`https://localhost:44380/cart/${item.id}`, item)
        .then(function(response) {
          console.log(response);
          me.getSnackBars(`Đã xác nhận đơn`);
          me.getCartData();
        })
        .catch(function(error) {
          console.log(error);
        });
    },

    async cancelCart() {
      this.loading = true;
      this.dialog = false;
      this.cartCancel.status = "Hủy đơn";
      const me = this;
      axios
        .put(`https://localhost:44380/cart/${me.cartCancel.id}`, me.cartCancel)
        .then(function(response) {
          console.log(response);
          me.getSnackBars(`Đã hủy đơn`);
          me.getCartData();
        })
        .catch(function(error) {
          console.log(error);
        });
    },

    openTable() {
      window.scrollTo(0, 600);
    },

    OpenCancelCart(item) {
      this.dialog = true;
      this.cartCancel = item;
    },
  },

  created() {
    this.getCartData();
  },
};
</script>

<style>
.v-text-field {
  margin: 0px !important;
  padding: 0px !important;
}

table tr {
  cursor: pointer;
}

.none-vapp,
.v-application--wrap {
  min-height: 0px !important;
}

.color-minus {
  background-color: #ec006c !important;
}

.theme--light.v-btn.v-btn--has-bg {
  background-color: var(--btn-default);
}

.container-products-admin {
  margin: 10px;
  height: 80%;
}
.theme--light.v-data-table > .v-data-table__wrapper > table > thead > tr > th {
  color: var(--text-dark);
  opacity: 1;
  text-align: left;
  font-size: 16px;
  font-weight: 800;
  padding-top: 10px;
}
.v-data-table > .v-data-table__wrapper > table > tbody > tr > td,
.v-data-table > .v-data-table__wrapper > table > thead > tr > td,
.v-data-table > .v-data-table__wrapper > table > tfoot > tr > td {
  font-size: 0.875rem;
  height: 48px;
  line-height: 48px;
}

/* form chi tiet */
.form-chitiet {
  width: 100%;
  background-color: #fff;
  padding: 10px;
  margin-bottom: 10px;
}
.form-rows {
  display: flex;
  width: 100%;
}

.form-col-row-1 {
  width: 30%;
  padding: 0px 4px;
}

.form-col-row-1:nth-of-type(2) {
  width: 10%;
}

.form-col-row-1 > img {
  width: 95%;
  padding-bottom: 20px;
  border-radius: 50%;
}

.form-col-row-222:nth-of-type(1) {
  width: 60%;
  padding: 0px 4px;
}
.form-col-row-222:nth-of-type(2) {
  width: 30%;
  padding: 0px 12px;
}
.form-col-row-222:nth-of-type(3) {
  width: 10%;
  margin: 0px auto;
}

.form-col-row-222:nth-of-type(3) > div {
  margin: 10px 0px;
}

.btn-admin {
  padding: 10px 20px;
  width: 100%;
  border-radius: 4px;
  font-weight: 500;
  color: var(--text-light);
  background-color: var(--btn-default);
}

.btn-admin-cancel {
  margin-top: 10px;
  background-color: #ec006c;
}

.btn-admin:hover {
  background-color: var(--btn-hover);
  transition: var(--tran03);
}

.btn-admin-cancel:hover {
  background-color: #c40058;
}
</style>
