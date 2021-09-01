<template>
  <div class="container-products-admin">
    <!-- dialog -->
    <div>
      <v-app class="none-vapp">
        <v-dialog v-model="dialog" persistent max-width="500">
          <v-card>
            <v-card-title class="text-h5">
              Bạn có muốn xóa người dùng: <br />
              {{ userDelete.username }}?
            </v-card-title>
            <v-card-text>
              {{ userDelete.username }}
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="green darken-1" text @click="dialog = false">
                Hủy
              </v-btn>
              <v-btn color="green darken-1" text @click="deleteUserByID">
                Xóa
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-app>
    </div>

    <!-- button thêm mới -->
    <v-btn class="mb-2" depressed color="primary" @click="openFormAdd()">
      <v-icon dark>
        mdi-plus
      </v-icon>
      Thêm người dùng mới
    </v-btn>

    <v-btn class="mb-2 ml-2" depressed color="primary" @click="getUserData()">
      <v-icon dark>
        mdi-refresh
      </v-icon>
      Làm mới danh sách
    </v-btn>

    <!-- form thêm mới, chi tiết -->
    <div class="form-chitiet" v-if="formAddEdit === true">
      <div class="form-rows">
        <div class="form-col-row-1">
          <v-text-field
            label="ID nguời dùng"
            v-model="userByID.id"
            prepend-icon="mdi-group"
            disabled
          ></v-text-field>

          <v-text-field
            label="Tên đăng nhập"
            v-model="userByID.username"
          ></v-text-field>

          <v-text-field
            label="Mật khẩu"
            v-model="userByID.password"
          ></v-text-field>
        </div>

        <div class="form-col-row-1"></div>

        <div class="form-col-row-1">
          <v-text-field
            label="Email"
            v-model="userByID.email"
            prepend-icon="mdi-email"
          ></v-text-field>

          <v-text-field
            label="Số điện thoại"
            v-model="userByID.phone"
            prepend-icon="mdi-phone"
          ></v-text-field>

          <v-combobox
            v-model="userByID.role"
            :items="items"
            label="Quyền người dùng"
            chips
          ></v-combobox>
        </div>

        <div class="form-col-row-222">
          <!-- hien thi khi ...byID rong -->
          <button class="mb-2 btn-admin" v-if="btnAdd" @click="addUser()">
            Thêm
          </button>
          <button class="btn-admin" v-if="btnEdit" @click="editUser()">
            Sửa
          </button>
          <button class="btn-admin btn-admin-cancel " @click="cancelAddEdit">
            Hủy
          </button>
        </div>
      </div>
    </div>

    <!-- table -->
    <v-simple-table fixed-header height="70vh">
      <template v-slot:default>
        <thead>
          <tr>
            <th class="">
              STT
            </th>
            <th class="">
              ID
            </th>
            <th class="">
              Tên đăng nhập
            </th>
            <th class="">
              Email
            </th>
            <th class="">
              Mật khẩu
            </th>
            <th class="">
              Số điện thoại
            </th>
            <th class="">
              Role
            </th>
            <th class="">
              Chức năng
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(item, index) in users"
            :key="item.id"
            @dblclick="getUserDataByID(item)"
          >
            <td>{{ index + 1 }}</td>
            <td>{{ item.id }}</td>
            <td>{{ item.username }}</td>
            <td>{{ item.email }}</td>
            <td>{{ item.password }}</td>
            <td>{{ item.phone }}</td>
            <td>{{ item.role }}</td>

            <td>
              <v-btn small color="cyan" @click="getUserDataByID(item)">
                <v-icon dark>
                  mdi-pencil
                </v-icon>
              </v-btn>

              <v-btn
                class="ml-2 color-minus"
                small
                color="cyan"
                @click="openDeleteUser(item)"
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
import { mapActions } from "vuex";

export default {
  data: () => ({
    users: [],
    dialog: false,
    userDelete: {},
    userByID: {},

    formAddEdit: false,

    btnAdd: false,
    btnEdit: false,

    userAdd: {},

    select: [],
    items: ["CUSTOMER", "ADMIN"],
  }),

  methods: {
    ...mapActions(["getSnackBars"]),

    async getUserData() {
      try {
        const response = await axios.get("https://localhost:44380/user/all");
        this.users = response.data;
        console.log(this.users);
      } catch (error) {
        console.error(error);
      }
    },

    getUserDataByID(item) {
      this.formAddEdit = true;
      this.btnEdit = true;
      this.btnAdd = false;
      this.userByID = { ...item };
    },

    openDeleteUser(item) {
      this.dialog = true;
      this.userDelete = item;
    },

    /**
     * formAddEdit = fale, ...byID = rong
     */
    cancelAddEdit() {
      this.userByID = {
        createdAt: null,
        email: "",
        id: 0,
        password: "",
        phone: "",
        role: "",
        updatedAt: null,
        username: "",
      };
      this.formAddEdit = false;
    },

    /**
     * formAdd = true ; làm trắng ...byId
     */
    openFormAdd() {
      this.formAddEdit = true;
      this.btnEdit = false;
      this.btnAdd = true;
      this.userByID = {
        createdAt: null,
        email: "",
        id: 0,
        password: "",
        phone: "",
        role: "",
        updatedAt: null,
        username: "",
      };
    },

    /**
     * goi api them moi
     */
    addUser() {
      this.btnEdit = false;
      const me = this;
      console.log(this.userByID);
      if (
        this.userByID.email === "" ||
        this.userByID.username === "" ||
        this.userByID.password === "" ||
        this.userByID.phone === "" ||
        this.userByID.role === ""
      ) {
        this.getSnackBars("Bạn chưa nhập đầy đủ thông tin!");
      } else {
        axios
          .post("https://localhost:44380/user", this.userByID)
          .then(function(response) {
            me.getSnackBars("Thêm mới thành công!");
            me.getUserData();
            console.log(response);
          })
          .catch(function(error) {
            me.getSnackBars("Thêm mới thất bại!");
            me.getUserData;
            console.log(error);
          });
      }
    },

    /**
     * xoa user by id
     */
    deleteUserByID() {
      this.dialog = false;
      const me = this;
      axios
        .delete(`https://localhost:44380/user/${me.userDelete.id}`)
        .then(function(response) {
          me.getSnackBars(`Đã xóa ${me.userDelete.username} !`);
          me.getUserData();
          me.userDelete = {};
          console.log(response);
        })
        .catch(function(error) {
          me.getSnackBars("Xóa thất bại!");
          me.getUserData;
          me.userDelete = {};
          console.log(error);
        });
    },

    /**
     * goi api sua du lieu
     */
    editUser() {
      console.log(this.userByID);

      const me = this;
      axios
        .put(`https://localhost:44380/user/${me.userByID.id}`, me.userByID)
        .then(function(response) {
          me.getSnackBars(
            `Đã cập nhật thông tin cho ${me.userByID.username} !`
          );
          me.getUserData();
          me.userByID = {};
          console.log(response);
        })
        .catch(function(error) {
          me.getSnackBars("Cập nhật thất bại!");
          me.getUserData;
          me.userByID = {};
          console.log(error);
        });
    },

    openTable() {
      window.scrollTo(0, 600);
    },
  },

  created() {
    this.getUserData();
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
