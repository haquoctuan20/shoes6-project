<template>
  <div class="checkout-form">
    <div class="nav" style="font-size: 14px">
      <span style="color: #aaa;">Giỏ hàng</span>
      <span>&ensp;>&ensp;</span>
      <span>Thông tin</span>
      <span>&ensp;>&ensp;</span>
      <span style="color: #aaa;">Vận chuyển</span>
      <span>&ensp;>&ensp;</span>
      <span style="color: #aaa;">Thanh toán</span>
    </div>
    <h5 style="margin-top: 20px">Thông tin liên hệ</h5>
    <div class="account">
      <div class="avatar"></div>
      <div class="info">
        <div>haha hihi (hki92076@eoopy.com)</div>
        <div>
          <a href="" style="color: #cbba9c; text-decoration: none">Đăng xuất</a>
        </div>
      </div>
    </div>
    <div style="margin-top: 20px">
      <input type="checkbox" name="check" style="width: 18px; height: 18px" />
      <label for="check" style="margin-left: 10px">
        Nhận các thông tin sản phẩm và khuyến mại</label
      >
    </div>

    <h5 style="margin-top: 32px">Phí vận chuyển</h5>

    <form style="margin-top: 10px">
      <div class="form-row">
        <div class="user-input-wrp form-group col-md-6">
          <br />
          <input type="text" class="inputText" id="ho" required />
          <span class="floating-label">Họ</span>
        </div>

        <div class="user-input-wrp form-group col-md-6">
          <br />
          <input type="text" class="inputText" id="ten" required />
          <span class="floating-label">Tên</span>
        </div>

        <div class="user-input-wrp form-group col-md-12">
          <br />
          <input type="text" class="inputText" id="xa" required />
          <span class="floating-label">Phường, Xã</span>
        </div>
        <div class="user-input-wrp form-group col-md-12">
          <br />
          <input type="text" class="inputText" id="huyen" required />
          <span class="floating-label">Quận, Huyện</span>
        </div>

        <div class="user-input-wrp form-group col-md-6">
          <br />
          <select class="inputText" id="tp">
            <option selected>Tỉnh, thành phố</option>
            <option value="An Giang">An Giang</option>
            <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu </option>
            <option value="Bắc Giang">Bắc Giang </option
            ><option value="Bắc Kạn">Bắc Kạn </option>
            <option value="Bạc Liêu">Bạc Liêu </option>
            <option value="Bắc Ninh">Bắc Ninh </option>
            <option value="Bến Tre">Bến Tre </option>
            <option value="Bình Định">Bình Định </option>
            <option value="Bình Dương">Bình Dương </option>
            <option value="Bình Phước">Bình Phước </option>
            <option value="Bình Thuận">Bình Thuận </option>
            <option value="Bình Thuận">Bình Thuận </option>
            <option value="Cà Mau">Cà Mau </option>
            <option value="Cao Bằng">Cao Bằng </option>
            <option value="Đắk Lắk">Đắk Lắk </option>
            <option value="Đắk Nông">Đắk Nông </option>
            <option value="Điện Biên">Điện Biên </option>
            <option value="Đồng Nai">Đồng Nai </option>
            <option value="Đồng Tháp">Đồng Tháp </option>
            <option value="Đồng Tháp">Đồng Tháp </option
            ><option value="Gia Lai">Gia Lai </option
            ><option value="Hà Giang">Hà Giang </option
            ><option value="Hà Nam">Hà Nam </option
            ><option value="Hà Tĩnh">Hà Tĩnh </option
            ><option value="Hải Dương">Hải Dương </option
            ><option value="Hậu Giang">Hậu Giang </option
            ><option value="Hòa Bình">Hòa Bình </option
            ><option value="Hưng Yên">Hưng Yên </option
            ><option value="Khánh Hòa">Khánh Hòa </option
            ><option value="Kiên Giang">Kiên Giang </option
            ><option value="Kon Tum">Kon Tum </option
            ><option value="Lai Châu">Lai Châu </option
            ><option value="Lâm Đồng">Lâm Đồng </option
            ><option value="Lạng Sơn">Lạng Sơn </option
            ><option value="Lào Cai">Lào Cai </option
            ><option value="Long An">Long An </option
            ><option value="Nam Định">Nam Định </option
            ><option value="Nghệ An">Nghệ An </option
            ><option value="Ninh Bình">Ninh Bình </option
            ><option value="Ninh Thuận">Ninh Thuận </option
            ><option value="Phú Thọ">Phú Thọ </option
            ><option value="Quảng Bình">Quảng Bình </option
            ><option value="Quảng Bình">Quảng Bình </option
            ><option value="Quảng Ngãi">Quảng Ngãi </option
            ><option value="Quảng Ninh">Quảng Ninh </option
            ><option value="Quảng Trị">Quảng Trị </option
            ><option value="Sóc Trăng">Sóc Trăng </option
            ><option value="Sơn La">Sơn La </option
            ><option value="Tây Ninh">Tây Ninh </option
            ><option value="Thái Bình">Thái Bình </option
            ><option value="Thái Nguyên">Thái Nguyên </option
            ><option value="Thanh Hóa">Thanh Hóa </option
            ><option value="Thừa Thiên Huế">Thừa Thiên Huế </option
            ><option value="Tiền Giang">Tiền Giang </option
            ><option value="Trà Vinh">Trà Vinh </option
            ><option value="Tuyên Quang">Tuyên Quang </option
            ><option value="Vĩnh Long">Vĩnh Long </option
            ><option value="Vĩnh Phúc">Vĩnh Phúc </option
            ><option value="Yên Bái">Yên Bái </option
            ><option value="Phú Yên">Phú Yên </option
            ><option value="Tp.Cần Thơ">Tp.Cần Thơ </option
            ><option value="Tp.Đà Nẵng">Tp.Đà Nẵng </option
            ><option value="Tp.Hải Phòng">Tp.Hải Phòng </option
            ><option value="Tp.Hà Nội">Tp.Hà Nội </option
            ><option value="TP  HCM">TP HCM </option>
          </select>

          <span
            class="floating-label"
            style="top: 0px; left: 10px; font-size: 13px; opacity: 1"
            >Tỉnh, Thành phố</span
          >
        </div>

        <div class="user-input-wrp form-group col-md-6">
          <br />
          <input type="text" class="inputText" id="sdt" required />
          <span class="floating-label">Số điện thoại</span>
        </div>
      </div>

      <div style="margin-top: 20px">
        <button @click.prevent="postCart">Thanh Toán</button>
        <a href="" style="margin-left: 20px" @click="openCartDetail"
          >Quay về giỏ hàng</a
        >
      </div>
    </form>
  </div>
</template>

<script>
import axios from "axios";
import { mapActions } from "vuex";
export default {
  props: ["id", "title", "size", "material", "quantity", "price", "avatar"],

  data: () => ({
    cart: {
      phone: "b",
      address: "b",
      totalMoney: 10,
      status: 0,
      userID: null,
    },

    cartItem: {
      saleOrderID: 120,
    },

    listCartItem: [],
  }),

  // inject: ["deleteItem"],

  name: "checkout-form",

  computed: {
    listProducts() {
      return this.$store.state.listProducts;
    },

    cartTotal() {
      return this.$store.state.listProducts
        .map((item) => item.price * item.quantity)
        .reduce((total, amount) => total + amount);
    },
  },

  methods: {
    ...mapActions(["getSnackBars"]),

    openCartDetail() {
      this.$router.push("/cart-detail");
    },

    getData() {
      this.cart.address =
        document.getElementById("xa").value +
        ", " +
        document.getElementById("huyen").value +
        ", " +
        document.getElementById("tp").value;

      this.cart.phone = document.getElementById("sdt").value;
    },

    postCart() {
      this.getData();

      console.log(this.cart);
      const me = this;

      // const response = axios.post("https://localhost:44380/cart", this.cart);

      // this.cartItem.saleOrderID = response.data;
      // console.log(this.cartItem.saleOrderID);

      // const postListCart = await axios.post(
      //   "https://localhost:44380/cart-item",
      //   this.cartItem
      // );

      // console.log("cuoi");

      // this.cart.cartItem = postListCart.data;

      this.cart.userID = this.$store.state.userLogin.id;

      this.cart.status = this.cart.status + "";

      axios
        .post("https://localhost:44380/cart", this.cart)
        .then(function(response) {
          console.log("thanh cong");
          console.log(response);

          const saleOrderID = response.data;

          me.listProducts.map((item) => {
            const abc = {
              saleOrderID: saleOrderID,
              productID: item.id,
              number: item.quantity,
              color: item.color,
              size: item.size,
            };

            me.listCartItem.push(abc);
          });

          console.log(me.cartItem);

          console.log(me.listCartItem);

          const me2 = me;

          axios
            .post("https://localhost:44380/cart-item", me2.listCartItem)
            .then(function(res) {
              console.log(res);
              console.log("thanh cong cart item");
              me2.getSnackBars("Đặt hàng thành công!");
              window.scrollTo(0, 0);
              this.$store.state.listProducts = [];
            })
            .catch(function(err) {
              console.log(err + "cart item");
            });

          // console.log("cuoi");

          // this.cart.cartItem = postListCart.data;
          // alert(this.cartItem.saleOrderID);
        })
        .catch(function(error) {
          console.log("Thất bại!");
          console.log(error);
        });

      // console.log(this.cart);
      // console.log(this.cartItem);
    },
  },
};
</script>

<style scoped>
.checkout-form {
  width: 100%;
  margin: auto;
  margin: 56px 66px;
  position: relative;
}
.nav {
  font-size: 14px;
  margin-top: 10px;
}
.account {
  margin-top: 28px;
  display: flex;
}
.account .avatar {
  width: 50px;
  height: 50px;
  background: rgb(147, 158, 221);
}
.account .info {
  height: 50px;
  margin-left: 10px;
}

.user-input-wrp {
  position: relative;
  width: 50%;
}
.user-input-wrp .inputText {
  width: 100%;
  outline: none;
  border: none;
  border-bottom: 1px solid #777;
  box-shadow: none !important;
}
.user-input-wrp .inputText:focus {
  border-color: blue;
  border-width: medium medium 2px;
}
.user-input-wrp .floating-label {
  position: absolute;
  pointer-events: none;
  top: 18px;
  left: 10px;
  transition: 0.2s ease all;
}
.user-input-wrp input:focus ~ .floating-label,
.user-input-wrp input:not(:focus):valid ~ .floating-label {
  top: 0px;
  left: 10px;
  font-size: 13px;
  opacity: 1;
}
button {
  width: 184px;
  height: 60px;
  background: #cbba9c;
  border: none;
  border-radius: 5px;
}
</style>
