<template>
  <div class="container-products-admin">
    <!-- dialog -->
    <div>
      <v-app class="none-vapp">
        <v-dialog v-model="dialog" persistent max-width="500">
          <v-card>
            <v-card-title class="text-h5">
              Bạn có muốn xóa sản phẩm: <br />
              {{ productDelete.name }}?
            </v-card-title>
            <v-card-text>
              {{ productDelete.name }}
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="green darken-1" text @click="dialog = false">
                Hủy
              </v-btn>
              <v-btn color="green darken-1" text @click="dialog = false">
                Xóa
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-app>
    </div>

    <!-- button thêm mới -->
    <v-btn class="mb-2" depressed color="primary" @click="openAddEdit()">
      Thêm mới
    </v-btn>

    <!-- form thêm mới, chi tiết -->
    <div class="form-chitiet" v-if="Object.keys(productBySlug).length !== 0">
      <!-- DONG SO 1 -->
      <div class="form-rows">
        <!-- avatar -->
        <div class="form-col-row-1" v-if="productBySlug.avatar !== ''">
          <img :src="require('@/assets'.concat(productBySlug.avatar))" alt="" />
        </div>

        <div class="form-col-row-1" v-if="productBySlug.avatar === ''">
          <v-file-input
            accept="image/png, image/jpeg, image/bmp"
            placeholder="Chọn ảnh sản phẩm"
            prepend-icon="mdi-camera"
            label="Ảnh sản phẩm 1"
          ></v-file-input>

          <v-file-input
            accept="image/png, image/jpeg, image/bmp"
            placeholder="Chọn ảnh sản phẩm"
            prepend-icon="mdi-camera"
            label="Ảnh sản phẩm 2"
          ></v-file-input>
        </div>

        <div class="form-col-row-1" v-if="productBySlug.avatar !== ''">
          <img
            :src="require('@/assets'.concat(productBySlug.avatarr))"
            alt=""
          />
        </div>

        <div class="form-col-row-1" v-if="productBySlug.avatar === ''"></div>

        <!-- COT SO 2 -->
        <div class="form-col-row-1">
          <v-text-field
            label="ID sản phẩm"
            v-model="productBySlug.id"
            disabled
            prepend-icon="mdi-group"
          ></v-text-field>

          <v-text-field
            label="ID Category"
            v-model="productBySlug.categoryID"
          ></v-text-field>

          <v-text-field
            label="Tên sản phẩm"
            v-model="productBySlug.name"
          ></v-text-field>

          <v-text-field
            label="Slug sản phẩm"
            v-model="productBySlug.slug"
          ></v-text-field>

          <v-text-field
            label="Chất liệu sản phẩm"
            v-model="productBySlug.material"
          ></v-text-field>
        </div>

        <!-- COT SO 3 -->
        <div class="form-col-row-1">
          <v-text-field
            label="Đánh giá sao"
            v-model="productBySlug.rate"
            disabled
          ></v-text-field>

          <v-text-field
            label="Số lượng còn"
            v-model="productBySlug.quantity"
          ></v-text-field>

          <v-text-field label="Giá gốc" v-model="originPrice"></v-text-field>

          <v-text-field label="Giá đang bán" v-model="salePrice"></v-text-field>

          <v-text-field
            label="Loại giày"
            v-model="productBySlug.type"
          ></v-text-field>
        </div>
      </div>

      <!-- DONG SO 2 -->
      <div class="form-rows ">
        <!-- COT SO 1 -->
        <div class="form-col-row-222">
          <v-textarea
            class="pt-4"
            label="Mô tả"
            v-model="productBySlug.description"
          ></v-textarea>
        </div>

        <!-- COT SO 2 -->
        <div class="form-col-row-222">
          <v-text-field
            label="Màu sắc"
            v-model="productBySlug.color"
          ></v-text-field>

          <v-text-field
            label="Kích thước giày"
            v-model="productBySlug.size"
          ></v-text-field>
        </div>

        <!-- COT SO 3 -->
        <div class="form-col-row-222">
          <button class="btn-admin" @click="cancelAddEdit()">
            Đồng ý
          </button>
          <button class="btn-admin btn-admin-cancel " @click="cancelAddEdit()">
            Hủy
          </button>
          <button class="btn-admin btn-admin-cancel " @click="openTable()">
            Danh sách sản phẩm
          </button>
        </div>
      </div>
    </div>

    <!-- table -->
    <v-simple-table fixed-header height="80vh">
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
              Tên sản phẩm
            </th>
            <th class="">
              Giá gốc
            </th>
            <th class="">
              Giá bán
            </th>
            <th class="">
              Loại
            </th>
            <th class="">
              Chức năng
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(item, index) in products"
            :key="item.id"
            @dblclick="getProductDataBySlug(item)"
          >
            <td>{{ index + 1 }}</td>
            <td>{{ item.id }}</td>
            <td>{{ item.name }}</td>
            <td>
              {{
                item.originPrice
                  ? item.originPrice.toLocaleString("vi-VN", {
                      style: "currency",
                      currency: "VND",
                    })
                  : 0
              }}
            </td>
            <td>
              {{
                item.salePrice.toLocaleString("vi-VN", {
                  style: "currency",
                  currency: "VND",
                })
              }}
            </td>
            <td>{{ item.type }}</td>
            <td>
              <v-btn small color="cyan" @click="getProductDataBySlug(item)">
                <v-icon dark>
                  mdi-pencil
                </v-icon>
              </v-btn>

              <v-btn
                class="ml-2 color-minus"
                small
                color="cyan"
                @click="openDeleteProduct(item)"
              >
                <v-icon dark>
                  mdi-minus
                </v-icon>
              </v-btn>
            </td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: () => ({
    products: [],
    dialog: false,
    productDelete: {},
    productBySlug: {},
    originPrice: 0,
    salePrice: 0,
  }),

  methods: {
    async getProductData() {
      try {
        const response = await axios.get("https://localhost:44380/product/all");
        this.products = response.data;
        console.log(this.products);
      } catch (error) {
        console.error(error);
      }
    },

    openDeleteProduct(item) {
      this.dialog = true;
      this.productDelete = item;
    },

    async getProductDataBySlug(item) {
      try {
        const response = await axios.get(
          `https://localhost:44380/product/${item.slug}`
        );
        this.productBySlug = response.data;

        if (this.productBySlug.originPrice) {
          this.originPrice = this.productBySlug.originPrice.toLocaleString(
            "vi-VN",
            {
              style: "currency",
              currency: "VND",
            }
          );
        }

        this.salePrice = this.productBySlug.salePrice.toLocaleString("vi-VN", {
          style: "currency",
          currency: "VND",
        });

        console.log(this.productBySlug);

        window.scrollTo(0, 0);
      } catch (error) {
        console.error(error);
      }
    },

    cancelAddEdit() {
      this.productBySlug = {};
    },

    openAddEdit() {
      this.productBySlug = {
        avatar: "",
        avatarr: "",
        categoryID: "",
        color: "",
        createdAt: null,
        description: "",
        id: "",
        material: "",
        name: "",
        originPrice: 0,
        quantity: 0,
        rate: 0,
        salePrice: 0,
        size: "",
        slug: "",
        type: "",
        updatedAt: null,
      };

      this.originPrice = 0;
      this.salePrice = 0;
    },

    openTable() {
      window.scrollTo(0, 600);
    },
  },

  created() {
    this.getProductData();
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
