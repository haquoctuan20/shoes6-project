<template>
  <!-- Trang danh mục sản phẩm
       Created by: TDCHIEN on 15/8/2021
   -->
  <div class="list-product">
    <!-- Header list product -->
    <div class="title-page">
      <div class="name-page">
        <p>{{ product.name }}</p>
      </div>
    </div>

    <div class="content">
      <div class="image-product">
        <div class="img">
          <img
            :src="require('../../../assets'.concat(product.avatar))"
            alt=""
          />
        </div>
      </div>
      <div class="deltail">
        <p>{{ product.name }}</p>
        <div class="star">
          <div v-for="index in product.rate" :key="index">
            <img src="../../../assets/img/icon/star1.png" alt="" />
          </div>
          <div v-for="index in 5 - product.rate" :key="'A' + index">
            <img src="../../../assets/img/icon/star.png" alt="" />
          </div>
        </div>
        <span class="description">{{ product.description }}</span>
        <div class="price title">
          <p>GIÁ NIÊM YẾT:</p>
          <p>
            {{
              product.originPrice.toLocaleString("vi-VN", {
                style: "currency",
                currency: "VND",
              })
            }}
          </p>
        </div>
        <div class="priceSale title material">
          <p>GIÁ BÁN:</p>
          <p>
            {{
              product.salePrice.toLocaleString("vi-VN", {
                style: "currency",
                currency: "VND",
              })
            }}
          </p>
        </div>
        <div class="material title">
          <p>MATERIAL:</p>
          <p>{{ product.material }}</p>
        </div>
        <div class="material title">
          <p>SỐ LƯỢNG CÒN:</p>
          <p>{{ product.quantity }}</p>
        </div>
        <div class="material title">
          <p>CHỌN SỐ LƯỢNG:</p>
          <div class="selectQuality">
            <div class="sub action" v-on:click="countSub">-</div>
            <div class="quality">{{ count }}</div>
            <div class="add action" v-on:click="count++">+</div>
          </div>
        </div>
        <div class="material title">
          <p>TỔNG TIỀN:</p>
          <p>
            {{
              (product.salePrice * count).toLocaleString("vi-VN", {
                style: "currency",
                currency: "VND",
              })
            }}
          </p>
        </div>
        <div class="acction">
          <div class="addToCart">
            ADD TO CART
            <span>
              <img
                id="cart"
                src="../../../assets/img/icon/card-white.png"
                alt=""
            /></span>
          </div>
          <div class="buyNow">BUY IT NOW</div>
          <div class="addToWishList">
            <span>
              <img id="heart" src="../../../assets/img/icon/heart.png" alt=""
            /></span>
            ADD TO WISH LIST
          </div>
        </div>
      </div>
    </div>
    <div class="related">
      <div class="title-related">
        <p>Related Products</p>
        <p>From this Collection</p>
      </div>
      <div class="list-related">
        <ul>
          <li
            class="product"
            v-for="item in productRelated"
            :key="item.id"
            @click="viewDetail(item)"
          >
            <div>
              <!-- filter nền khi hover vào ảnh -->
              <span id="filterProduct">
                <div id="view" class="actionProduct">
                  <img src="../../../assets/img/icon/eye.png" alt="" />
                </div>
                <div id="link" class="actionProduct">
                  <img src="../../../assets/img/icon/link.png" alt="" />
                </div>
                <div id="heart" class="actionProduct">
                  <img src="../../../assets/img/icon/heart.png" alt="" />
                </div>
              </span>
              <!-- Hình ảnh chính và phụ -->
              <div>
                <span id="positionImage">
                  <img
                    id="mainImage"
                    :src="require('../../../assets'.concat(item.avatar))"
                    alt=""
                  />
                  <img
                    id="extraImage"
                    :src="require('../../../assets'.concat(item.avatar))"
                    alt=""
                  />
                </span>
              </div>
            </div>
            <!-- Detail sản phẩm -->
            <div class="productDetail">
              <p class="nameProduct">
                {{ item.name }}
              </p>
              <div>
                <div class="costProduct">
                  <p>{{ item.salePrice }}₫</p>
                  <!-- Sao đánh giá -->
                  <div class="star">
                    <div v-for="index in item.rate" :key="index">
                      <img src="../../../assets/img/icon/star1.png" alt="" />
                    </div>
                    <div v-for="index in 5 - item.rate" :key="'A' + index">
                      <img src="../../../assets/img/icon/star.png" alt="" />
                    </div>
                  </div>
                </div>
                <div class="card">
                  <img src="../../../assets/img/icon/card.png" alt="" />
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import * as axios from "axios";
// Trang detail nhận vào id từ đương link trên trình duyệt (gọi là route),
// lấy id đó để lấy thông tin tiét sản phẩm theo id
export default {
  data: () => ({
    slug: "",
    product: {},
    count: 1,
    productRelated: {},
  }),

  methods: {
    /**
     * lấy id từ route
     * gọi hàm lấy ở mounted
     */
    viewDetail(item) {
      this.$router.push("/list-product/" + item.slug);
      location.reload();
    },
    getSlug() {
      this.slug = this.$route.params.id;
      console.log(this.$route);
    },

    // Lấy giữu liệu từ API
    async getData() {
      const response = await axios.get(
        "https://localhost:44380/product/" + this.slug
      );
      this.product = response.data;
      const relateds = await axios.get("https://localhost:44380/product/all");
      this.productRelated = relateds.data.filter(
        (o) => o.type == this.product.type
      );
      console.log(this.product);
      console.log(this.productRelated);
    },

    countSub() {
      if (this.count > 1) {
        this.count--;
      }
    },
  },

  created() {
    this.getSlug();
    this.getData();
    console.log(this.product);
  },
};
</script>

<style>
.list-product {
  min-height: 100vh;
}

.title-page {
  width: 100%;
  height: 136px;
  background-color: #f4f4f4;
  display: flex;
  align-items: center;
  justify-content: center;
}
.name-page {
  text-align: center;
}
.name-page p {
  font-weight: bold;
  font-size: 30px;
  padding: 15px;
  letter-spacing: 2px;
}
.name-page > span {
  cursor: pointer;
  font-size: 14px;
}
.name-page > span:hover {
  color: #4da8da;
}

/* Style content */
.content {
  display: flex;
  width: 100%;
  margin-top: 50px;
}
.image-product {
  width: 45%;
  height: 100vh;
  margin-right: 70px;
}

.image-product .img img {
  width: 577px;
}

.deltail {
  width: 55%;
  padding: 20px;
}

.deltail > p {
  font-size: 30px;
  font-weight: bold;
  margin-bottom: 20px;
}
.star {
  display: flex;
}

.star img {
  width: 20px;
  margin-bottom: 20px;
}

.description {
  font-size: 17px;
}

.title {
  display: flex;
}

.price {
  margin-top: 50px;
}

.material {
  margin-top: 20px;
}

.material > p {
  line-height: 30px;
}

.title p {
  font-size: 18px;
}

.title p:first-child {
  font-weight: bold;
  width: 200px;
}

.selectQuality {
  display: flex;
  font-weight: bold;
  border: 1px solid #f4f4f4;
  height: 30px;
  line-height: 30px;
  cursor: pointer;
}

.selectQuality .action {
  width: 30px;
  text-align: center;
  border: 1px solid #f4f4f4;
}

.quality {
  width: 30px;
  text-align: center;
}
.acction {
  display: flex;
  width: 550px;
  margin-top: 20px;
}
.acction div {
  background-color: #571f9c;
  color: white;
  margin: 5px;
  font-size: 16px;
  /* padding: 15px 20px; */
  height: 50px;
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
  padding-left: 20px;
  padding-right: 20px;
  transition-duration: 1s;
}

#cart {
  width: 13px;
}

#heart {
  width: 17px;
}

.acction div:hover {
  background-color: black;
  transition: 1s;
  transition-duration: 1s;
}

.related {
  width: 100%;
  height: 600px;
}

.title-related {
  font-size: 25px;
  font-weight: bold;
  text-align: center;
  letter-spacing: 2px;
}

.title-related p {
  margin: 10px;
}

.title-related p:last-child {
  font-weight: 400;
  font-size: 13px;
}

.list-related {
  width: 100%;
  margin-top: 50px;
}

.product {
  width: 225px;
  height: 365px;
}

.list-related ul li {
  float: left;
  margin-left: 20px;
  margin-top: 50px;
  position: relative;
  cursor: pointer;
}

.list-related ul li:hover .nameProduct {
  color: darkorchid;
}

.list-related ul li > div:first-child {
  position: relative;
  overflow: hidden;
  box-sizing: border-box;
  box-shadow: 3px 3px 10px rgb(0 0 0 / 0.2);
  width: 210px;
  height: 210px;
}

#filterProduct {
  width: 210px;
  height: 210px;
  position: absolute;
  left: -210px;
  z-index: 3;
  background-color: rgba(0, 0, 0, 0.1);
  display: flex;
  justify-content: center;
}

.actionProduct {
  margin-top: 150px !important;
  width: 40px !important;
  margin-right: 10px;
  height: 40px !important;
  background-color: black;
  padding-top: 7px;
  text-align: center;
}

.actionProduct img {
  width: 25px !important;
}

.actionProduct:hover {
  background-color: rgb(132, 0, 255);
}

.list-related ul li > div > div > span img {
  width: 210px;
}

.list-related ul li div span {
  display: flex;
  position: absolute;
  left: 0;
  top: 0;
  transition: left 0.4s linear;
}

.list-related ul li div:hover span {
  left: -210px;
  transition-duration: 0.4s;
}

#positionImage.left {
  left: 0;
}

.list-related ul li > div:first-child:hover {
  border: 1px solid black;
  transition-duration: 0.5s;
}

.list-related ul li div:hover #filterProduct {
  left: 0px;
}

.productDetail {
  width: 210px;
}

.productDetail > div {
  display: flex;
}

.productDetail > div .card img {
  width: 30px;
}

.card {
  position: relative;
}

.card img {
  position: absolute;
  bottom: 0;
}

.productDetail .nameProduct {
  font-weight: bold;
  font-size: 21px;
  height: 80px;
  padding-top: 25px;
  padding-bottom: 20px;
  border-bottom: 1px solid #e4e4e4;
  text-align: center;
}

.costProduct {
  width: 150px;
}

.costProduct p {
  font-size: 25px;
  font-weight: bold;
  margin-top: 15px;
  margin-bottom: 5px;
}

.star img {
  float: left;
}
</style>
