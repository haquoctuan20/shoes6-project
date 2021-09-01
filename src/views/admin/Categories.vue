<template>
  <div class="container-products-admin">
    <!-- dialog -->
    <div>
      <v-app class="none-vapp">
        <v-dialog v-model="dialog" persistent max-width="500">
          <v-card>
            <v-card-title class="text-h5">
              Bạn có muốn xóa danh mục: <br />
              {{ categoryDelete.name }}?
            </v-card-title>
            <v-card-text>
              {{ categoryDelete.name }}
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
      <v-icon dark>
        mdi-plus
      </v-icon>
      Thêm danh mục mới
    </v-btn>

    <!-- form thêm mới, chi tiết -->
    <div class="form-chitiet" v-if="Object.keys(categoryByID).length !== 0">
      <!-- DONG SO 1 -->
      <div class="form-rows">
        <!-- COT SO 1 -->
        <div class="form-col-row-1">
          <v-text-field
            label="ID Danh mục"
            v-model="categoryByID.id"
            prepend-icon="mdi-group"
          ></v-text-field>

          <v-text-field
            label="Tên danh mục"
            v-model="categoryByID.name"
          ></v-text-field>

          <v-text-field
            label="Slug danh mục"
            v-model="categoryByID.slug"
          ></v-text-field>
        </div>
        <div class="form-col-row-1">
          <button class="btn-admin" @click="cancelAddEdit()">
            Đồng ý
          </button>
          <button class="btn-admin btn-admin-cancel " @click="cancelAddEdit()">
            Hủy
          </button>
        </div>
      </div>
    </div>

    <!-- table -->

    <div v-if="categoryBySlug.length > 0">
      <h2>Danh sách sản phẩm của danh mục: {{ categoryBySlug[0].slug }}</h2>
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
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, index) in categoryBySlug" :key="item.id">
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
              ID Danh mục
            </th>
            <th class="">
              Tên Danh mục
            </th>
            <th class="">
              Slug Danh mục
            </th>
            <th class="">
              Chức năng
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(item, index) in category"
            :key="item.id"
            @dblclick="getCategoryDataBySlug(item)"
          >
            <td>{{ index + 1 }}</td>
            <td>{{ item.id }}</td>
            <td>{{ item.name }}</td>
            <td>{{ item.slug }}</td>

            <td>
              <v-btn
                small
                class="mr-2"
                color="cyan"
                @click="getCategoryDataBySlug(item)"
              >
                <v-icon dark>
                  mdi-format-list-text
                </v-icon>
              </v-btn>

              <v-btn
                small
                class="mr-2"
                color="cyan"
                @click="getCategoryDataByID(item)"
              >
                <v-icon dark>
                  mdi-pencil
                </v-icon>
              </v-btn>

              <v-btn
                class=" color-minus"
                small
                color="cyan"
                @click="openDeleteCategory(item)"
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
    category: [],
    dialog: false,

    categoryBySlug: [],
    categoryDelete: {},
    categoryByID: {},
  }),

  methods: {
    async getCategoryData() {
      try {
        const response = await axios.get(
          "https://localhost:44380/category/all"
        );
        this.category = response.data;
        console.log(this.category);
      } catch (error) {
        console.error(error);
      }
    },

    openDeleteCategory(item) {
      this.dialog = true;
      this.categoryDelete = item;
    },

    async getCategoryDataBySlug(item) {
      try {
        const response = await axios.get(
          `https://localhost:44380/category/${item.slug}`
        );
        this.categoryBySlug = response.data;

        console.log(this.categoryBySlug);

        window.scrollTo(0, 0);
      } catch (error) {
        console.error(error);
      }
    },

    cancelAddEdit() {
      this.categoryByID = {};
    },

    openAddEdit() {
      this.categoryByID = {
        createdAt: null,
        id: "",
        name: "",
        slug: "",
        updatedAt: null,
      };
    },

    getCategoryDataByID(item) {
      this.categoryByID = item;
      console.log(this.categoryByID);
    },

    openTable() {
      window.scrollTo(0, 600);
    },
  },

  created() {
    this.getCategoryData();
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
