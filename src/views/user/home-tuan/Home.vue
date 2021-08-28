<template>
  <div class="home-page">
    <!-- carousel -->

    <div class="home-carousel">
      <v-app>
        <v-carousel height="600" cycle interval="5000">
          <!-- item -->
          <v-carousel-item
            v-for="img in items_carousel"
            :key="img.id"
            :src="img.url"
          >
          </v-carousel-item>
        </v-carousel>
      </v-app>
    </div>

    <!-- san pham moi -->

    <ListNewProduct :listNewProduct="listNewProduct" />

    <!-- parallax -->
    <v-app>
      <v-lazy
        v-model="isActive"
        :options="{
          threshold: 0.8,
        }"
        min-height="200"
        transition="fade-transition"
      >
        <v-parallax
          height="600"
          src="https://cdn.shopify.com/s/files/1/1811/9799/files/banner-1.jpg?v=1494411699"
        >
          <div>
            <div class="parallax-title">
              <p>KHUYỄN MÃI MÙA HÈ NÀY</p>
              <p>
                GIẢM NGAY <span>50%</span> <br />CHO
                <span>LẦN MUA ĐẦU TIÊN</span>
              </p>
              <button class="btn-shopnow" @click="openListProduct">
                Mua ngay
              </button>
            </div>
          </div>
        </v-parallax>
      </v-lazy>
    </v-app>

    <!-- best seller -->

    <div class="best-seller">
      <h2 class="best-seller-title">BEST SELLERS</h2>
      <p class="short-title">Xem ngay</p>

      <div class="container-sellers">
        <p
          class="item-seller"
          :class="{ 'item-seller--active': item === typeActive }"
          v-for="(item, index) in listType"
          :key="index"
          @click="activeListBestSheller(item)"
        >
          {{ item }}
        </p>
      </div>

      <!-- danh sách best sellers -->
      <div class="container-product-sellers">
        <div
          class="item-product-sellers"
          v-for="(item, index) in listShoesBestSeller"
          :key="index"
        >
          <SingleProduct :product="item" />
        </div>
      </div>
    </div>

    <!-- support -->
    <div class="home-support">
      <div class="support-item">
        <div class="support-item-icon">
          <i class="fas fa-truck"></i>
        </div>
        <div class="support-item-text">
          <p>Giao hàng miễn phí</p>
        </div>
      </div>

      <div class="support-item">
        <div class="support-item-icon">
          <i class="fas fa-headset"></i>
        </div>
        <div class="support-item-text">
          <p>Lắng nghe khách hàng</p>
        </div>
      </div>

      <div class="support-item">
        <div class="support-item-icon">
          <i class="fas fa-exchange-alt"></i>
        </div>
        <div class="support-item-text">
          <p>Đổi trả</p>
        </div>
      </div>

      <div class="support-item">
        <div class="support-item-icon">
          <i class="far fa-copyright"></i>
        </div>
        <div class="support-item-text">
          <p>Nhiều thương hiệu</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ListNewProduct from "@/components/user/home-tuan/ListNewProduct.vue";
import SingleProduct from "@/components/user/home-tuan/SingleProduct.vue";
import axios from "axios";

export default {
  name: "Home",

  components: { ListNewProduct, SingleProduct },

  data: () => ({
    isActive: false,
    items_carousel: [
      {
        id: 1,
        url:
          "https://cdn.shopify.com/s/files/1/1811/9799/files/shoe9.jpg?v=1494405665",
      },
      {
        id: 2,
        url:
          "https://cdn.shopify.com/s/files/1/1811/9799/files/shoe7.jpg?v=1494405629",
      },
      {
        id: 3,
        url:
          "https://cdn.shopify.com/s/files/1/1811/9799/files/shoe8-2_b0f8ccfb-d5d1-4ba5-b412-92227077ed0f.png?v=1494423683",
      },
      {
        id: 4,
        url:
          "https://cdn.shopify.com/s/files/1/1811/9799/files/shoe9.jpg?v=1494405665",
      },
      {
        id: 5,
        url:
          "https://cdn.shopify.com/s/files/1/1811/9799/files/shoe7.jpg?v=1494405629",
      },
      {
        id: 6,
        url:
          "https://cdn.shopify.com/s/files/1/1811/9799/files/shoe8-2_b0f8ccfb-d5d1-4ba5-b412-92227077ed0f.png?v=1494423683",
      },
    ],

    listCategory: [],
    listShoes: [],
    listNewProduct: [],
    listShoesBestSeller: [],
    listType: [],
    typeActive: null,
  }),
  methods: {
    openListProduct() {
      this.$router.push("/list-product");
    },

    async getProductData() {
      try {
        const response = await axios.get("https://localhost:44380/product/all");
        // console.log(response.data);
        this.listShoes = response.data;
        // console.log(this.listShoes);

        // lay danh sach giay moi
        this.listNewProduct = this.listShoes.filter(
          (item) => item.type === "MỚI"
        );

        // lay danh sach type
        this.listType = new Set(this.listShoes.map((item) => item.type));
        this.listType = Array.from(this.listType);
        this.typeActive = this.listType[0];

        // list best seller
        this.activeListBestSheller(this.typeActive);
      } catch (error) {
        console.error(error);
      }
    },

    closeLayoutAdmin() {
      this.$store.dispatch("closeLayoutAdmin");
      console.log("Thoát admin");
    },

    activeListBestSheller(item) {
      // lay danh sach type
      this.typeActive = item;
      this.listShoesBestSeller = this.listShoes.filter(
        (item) => item.type === this.typeActive
      );
    },
  },

  created() {
    this.getProductData();
  },
};
</script>

<style>
.v-window__prev,
.v-window__next {
  z-index: 0 !important;
}

.home-carousel {
  width: 100%;
}
.v-application--wrap {
  min-height: 60vh;
}

/* parallax */
.parallax-title {
  text-align: center;
}
.parallax-title p:nth-of-type(1) {
  font-size: 20px;
  text-transform: uppercase;
  font-weight: 300;
  line-height: normal;
  letter-spacing: 0.06em;
}
.parallax-title p:nth-of-type(2) {
  font-size: 50px;
  letter-spacing: 0.175em;
  line-height: normal;
  margin: 0 0 60px;
  font-weight: 500;
}
.parallax-title span {
  color: #f01133;
}
/* css button */

.btn-shopnow {
  letter-spacing: 2px;
  text-transform: uppercase;
}

.btn-shopnow {
  padding: 14px 40px;
  background-color: var(--btn-default);
}
.btn-shopnow:hover {
  background-color: var(--btn-hover);
  transition: var(--tran03);
}

/* best seller */
.best-seller {
  padding-bottom: 50px;
}
.best-seller > h2 {
  font-size: 36px;
  letter-spacing: 1px;
  padding: 80px 0px 20px;
  text-align: center;
  font-weight: 600;
}
.best-seller .short-title {
  text-align: center;
  font-size: 20px;
  padding: 10px 0px;
  position: relative;
}
.best-seller .short-title::after {
  background: var(--btn-default);
  content: "";
  display: inline-block;
  margin: auto;
  width: 70px;
  height: 4px;
  position: absolute;
  left: 0;
  right: 0;
  top: auto;
  bottom: -5px;
}

.container-sellers {
  text-align: center;
  display: flex;
  justify-content: center;
  padding: 40px 0px;
}
.item-seller {
  text-transform: uppercase;
  font-weight: 700;
  font-size: 16px;
  display: inline-block;
  padding: 0 10px;
  cursor: pointer;
  transition: var(--tran03);
  opacity: 0.3;
}
.item-seller:hover {
  opacity: 1;
  color: var(--btn-hover);
}

.item-seller--active {
  opacity: 1;
  color: var(--btn-hover);
}

.container-product-sellers {
  width: 100%;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  align-content: stretch;
}

.item-product-sellers {
  margin: 10px 10px 30px;
}

/* support */
.home-support {
  height: 50px;
  width: 100%;
  display: flex;
  justify-content: space-between;
  padding: 50px 5px 40px;
}
.support-item {
  display: flex;
  align-items: center;
}
.support-item-icon {
  width: 50px;
  height: 50px;
  font-size: 40px;
}
.support-item-text {
  font-size: 16px;
  font-weight: 500;
  padding: 10px;
}
</style>
