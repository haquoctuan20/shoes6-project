<template>
  <!-- Trang danh mục sản phẩm
       Created by: TDCHIEN on 1/8/2021
   -->
  <div class="list-product">
    <!-- Header list product -->
    <div class="title-page">
      <div class="name-page">
        <p>PRODUCTS</p>
        <span>Home</span><span> / products</span>
      </div>
    </div>

    <!-- Nội dung chính  -->
    <div class="content">
      <!-- Option -->
      <div class="option">
        <!-- Catagory -->
        <div class="category title-option">
          <p>Category</p>
          <ul>
            <li>Home</li>
            <li>
              Collection
              <span class="toggle-category" @click="hidden_collection">+</span>
              <transition name="fade">
                <ul v-if="hiddenCollection">
                  cls
                  <li>Mid Waterproof</li>
                  <li>Brogue shoe</li>
                  <li>Firecamp</li>
                  <li>Forclaz</li>
                </ul>
              </transition>
            </li>
            <li>
              Shoes <span class="toggle-category" @click="hidden_shoes">+</span>
              <transition name="fade">
                <ul v-if="hiddenShoes">
                  <li>Court shoe</li>
                  <li>Diabetic shoe</li>
                  <li>Elevator shoes</li>
                  <li>Blucher shoe</li>
                </ul>
              </transition>
            </li>
            <li>
              Boots <span class="toggle-category" @click="hidden_boots">+</span>
              <transition name="fade">
                <ul v-if="hiddenBoots">
                  <li>Thigh-hight</li>
                  <li>Chap boots</li>
                  <li>Rigger boots</li>
                </ul>
              </transition>
            </li>
            <li>
              Climbing
              <span class="toggle-category" @click="hidden_climbing">+</span>
              <transition name="fade">
                <ul v-if="hiddenClimbing">
                  <li>Thigh-hight</li>
                  <li>Chap boots</li>
                  <li>Rigger boots</li>
                </ul>
              </transition>
            </li>
            <li>Pages</li>
          </ul>
        </div>

        <!-- Shop By Color -->
        <div class="byColor title-option">
          <p>Shop By Color</p>
          <ul>
            <li>
              <div class="icon-color red" id="red"></div>
              <span>Red</span>
            </li>
            <li>
              <div class="icon-color black" id="black"></div>
              <span>Black</span>
            </li>
            <li>
              <div class="icon-color silver" id="silver"></div>
              <span>Silver</span>
            </li>
            <li>
              <div class="icon-color white" id="white"></div>
              <span>White</span>
            </li>
          </ul>
        </div>

        <!-- Shop By Size -->
        <div class="bySize title-option">
          <p>Shop By Size</p>
          <ul>
            <li>7</li>
            <li>7.5</li>
            <li>8</li>
            <li>9</li>
          </ul>
        </div>

        <!-- Shop By Brand -->
        <div class="byBrand title-option">
          <p>Shop By Brand</p>
          <ul>
            <li>Havaianas</li>
            <li>Geox</li>
            <li>Bontoni</li>
            <li>Atlectica</li>
          </ul>
        </div>

        <!-- Shop by Price -->
        <div class="byPrice title-option">
          <p>Shop By Price</p>
          <ul>
            <li>$100 - $200</li>
            <li>$200 - $300</li>
            <li>$300 - $400</li>
            <li>$400 - $500</li>
            <li>$500 - $700</li>
            <li>$700 - $1000</li>
          </ul>
        </div>

        <!-- Shop by Meterial -->
        <div class="byMaterial title-option">
          <p>Shop By Material</p>
          <ul>
            <li>Plastics</li>
          </ul>
        </div>
      </div>

      <!-- danh sách sản phẩm -->
      <div class="list">
        <!-- Lọc sản phẩm theo điều kiện -->
        <div class="sort">
          <div class="positonSort">
            <div class="SelectSort">
              <span>Sort by &nbsp; &nbsp; &nbsp; </span>
              <div class="select" v-on:click="clickSelectSort">
                {{ valueSelected }}
              </div>
            </div>
            <ul class="values" v-if="hiddenValuesSort" v-on:click="selectValue">
              <li
                v-for="item in valueSelect"
                :value="item.value"
                :key="item.value"
              >
                {{ item.text }}
              </li>
            </ul>
          </div>
        </div>

        <!-- Danh sách sản phẩm -->
        <div class="listProduct">
          <ul>
            <li class="product" v-for="item in products" :key="item.text">
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
                    <img id="mainImage" :src="item.linkImageProduct" alt="" />
                    <img
                      id="extraImage"
                      :src="item.linkImageProductPlus"
                      alt=""
                    />
                  </span>
                </div>
              </div>
              <!-- Detail sản phẩm -->
              <div class="productDetail">
                <p class="nameProduct">
                  {{ item.text }}
                </p>
                <div>
                  <div class="costProduct">
                    <p>$ {{ item.cost }}</p>
                    <!-- Sao đánh giá -->
                    <div class="star">
                      <div v-for="index in item.star" :key="index">
                        <img src="../../../assets/img/icon/star1.png" alt="" />
                      </div>
                      <div v-for="index in 5 - item.star" :key="index">
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
  </div>
</template>

<script>
export default {
  methods: {
    // Sự kiện ấn hiện option
    hidden_collection(e) {
      this.hiddenCollection = !this.hiddenCollection;
      if (this.hiddenCollection) {
        e.target.innerText = "-";
      } else {
        e.target.innerText = "+";
      }
    },
    hidden_shoes(e) {
      this.hiddenShoes = !this.hiddenShoes;
      if (this.hiddenShoes) {
        e.target.innerText = "-";
      } else {
        e.target.innerText = "+";
      }
    },
    hidden_boots(e) {
      this.hiddenBoots = !this.hiddenBoots;
      if (this.hiddenBoots) {
        e.target.innerText = "-";
      } else {
        e.target.innerText = "+";
      }
    },
    hidden_climbing(e) {
      this.hiddenClimbing = !this.hiddenClimbing;
      if (this.hiddenClimbing) {
        e.target.innerText = "-";
      } else {
        e.target.innerText = "+";
      }
    },

    // Sự kiến click Sort By
    clickSelectSort() {
      this.hiddenValuesSort = !this.hiddenValuesSort;
    },

    // Sự liện chọn option sort
    selectValue: function(e) {
      this.valueSelected = e.target.innerText;
      this.hiddenValuesSort = !this.hiddenValuesSort;
    },
  },

  data() {
    return {
      hiddenCollection: false,
      hiddenShoes: false,
      hiddenBoots: false,
      hiddenClimbing: false,
      hiddenValuesSort: false,
      valueSelect: [
        { text: "Featured", value: "featured" },
        { text: "Price, low to hight", value: "lowToHight" },
        { text: "Price, hight to low", value: "hightToLow" },
        { text: "A-Z", value: "A-Z" },
        { text: "Z-A", value: "Z-A" },
        { text: "Date, old to new", value: "oldToNew" },
        { text: "Date, new to old", value: "newToOld" },
        { text: "Best Selling", value: "bestSelling" },
      ],
      valueSelected: "Featured",
      products: [
        {
          text: "TỔ ONG",
          linkImageProduct:
            "https://cf.shopee.vn/file/2727c633dc6d296510dee58d61ff5cd9",
          linkImageProductPlus:
            "https://cf.shopee.vn/file/fe3909de2221c995d26da63b6d09e504",
          cost: "106.00",
          star: 2,
        },
        {
          text: "TỔ ONG",
          linkImageProduct:
            "https://cf.shopee.vn/file/2727c633dc6d296510dee58d61ff5cd9",
          linkImageProductPlus:
            "https://cf.shopee.vn/file/fe3909de2221c995d26da63b6d09e504",
          cost: "160.00",
          star: 3,
        },
        {
          text: "TỔ ONG",
          linkImageProduct:
            "https://cf.shopee.vn/file/2727c633dc6d296510dee58d61ff5cd9",
          linkImageProductPlus:
            "https://cf.shopee.vn/file/fe3909de2221c995d26da63b6d09e504",
          cost: "189.00",
          star: 5,
        },
        {
          text: "TỔ ONG",
          linkImageProduct:
            "https://cf.shopee.vn/file/2727c633dc6d296510dee58d61ff5cd9",
          linkImageProductPlus:
            "https://cf.shopee.vn/file/fe3909de2221c995d26da63b6d09e504",
          cost: "199.00",
          star: 3,
        },
        {
          text: "TỔ ONG",
          linkImageProduct:
            "https://cf.shopee.vn/file/2727c633dc6d296510dee58d61ff5cd9",
          linkImageProductPlus:
            "https://cf.shopee.vn/file/fe3909de2221c995d26da63b6d09e504",
          cost: "106.00",
          star: 1,
        },
        {
          text: "TỔ ONG",
          linkImageProduct:
            "https://cf.shopee.vn/file/2727c633dc6d296510dee58d61ff5cd9",
          linkImageProductPlus:
            "https://cf.shopee.vn/file/fe3909de2221c995d26da63b6d09e504",
          cost: "106.00",
          star: 3,
        },
        {
          text: "TỔ ONG",
          linkImageProduct:
            "https://cf.shopee.vn/file/2727c633dc6d296510dee58d61ff5cd9",
          linkImageProductPlus:
            "https://cf.shopee.vn/file/fe3909de2221c995d26da63b6d09e504",
          cost: "106.00",
          star: 0,
        },
        {
          text: "TỔ ONG",
          linkImageProduct:
            "https://cf.shopee.vn/file/2727c633dc6d296510dee58d61ff5cd9",
          linkImageProductPlus:
            "https://cf.shopee.vn/file/fe3909de2221c995d26da63b6d09e504",
          cost: "106.00",
          star: 3,
        },
      ],
    };
  },
};
</script>

<style>
.list-product {
  min-height: 500px;
  width: 100%;
}

.content {
  display: flex;
  /* position: relative; */
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
  font-size: 21px;
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

.content {
  margin-top: 40px;
}

.option {
  width: 318px;
}

.title-option p {
  font-weight: bold;
  font-size: 25px;
  padding-top: 30px;
}

.title-option > ul {
  border-bottom: 2px solid #e4e4e4;
  padding-bottom: 30px;
}

/* css Category */
.title-option {
  padding-left: 20px;
  padding-right: 20px;
}

.title-option > ul > li {
  padding-top: 20px;
  margin-left: 20px;
  cursor: pointer;
}

.title-option > ul > li > ul {
  margin-left: 20px;
  overflow: hidden;
}

.title-option > ul > li > ul > li {
  padding-top: 20px;
}

/* Css Category */
.category > ul > li {
  list-style: square;
}

.toggle-category {
  float: right;
  cursor: pointer;
}

.fade-enter-active,
.fade-leave-active {
  transition: max-height 1s ease;
  max-height: 400px;
}

.fade-enter,
.fade-leave-to {
  max-height: 0;
  overflow: hidden;
}

/* Css By Color */
.icon-color {
  width: 20px;
  height: 20px;
  border-radius: 15px;
  margin-right: 15px;
}

.byColor li {
  display: flex;
  align-content: center;
}

.byColor li span {
  line-height: 21px;
}

.red {
  background-color: red;
}
.black {
  background-color: black;
}
.silver {
  background-color: silver;
}
.white {
  border: 1px solid #e4e4e4;
}

/* Css By Size */

.bySize ul {
  margin-top: 30px;
  display: flex;
}

.bySize ul li {
  width: 40px;
  height: 30px;
  border: 1px solid #e4e4e4;
  display: flex;
  justify-content: center;
  line-height: 30px;
  padding-top: 0px;
}

/* Css Brand */
.byBrand > ul > li {
  list-style: square;
}

/* Css Price */
.byPrice > ul > li {
  list-style: square;
}

/* Css Material */
.byMaterial > ul > li {
  list-style: square;
}

/* Css list */
/* Css Sort By */

.list {
  width: calc(100% - 318px);
}

.sort {
  position: relative;
  width: 100%;
  z-index: 6;
}

.positonSort {
  position: absolute;
  right: 0;
}

.SelectSort {
  display: flex;
}

.select {
  width: 191px;
  height: 40px;
  cursor: pointer;
  border-bottom: 1px solid #e4e4e4;
  border-radius: 4px;
  line-height: 40px;
  padding-left: 15px;
}

.select:hover {
  background-color: black;
  color: white;
}

.sort span {
  height: 40px;
  line-height: 40px;
}

.values {
  position: absolute;
  right: 0;
  width: 191px;
  padding-left: 15px;
  border: 1px solid #e4e4e4;
  background-color: white;
}

.values li {
  height: 40px;
  line-height: 40px;
  cursor: pointer;
}

.listProduct {
  width: 100%;
  margin-top: 50px;
}

.product {
  width: 225px;
  height: 365px;
}

.listProduct ul li {
  float: left;
  margin-left: 20px;
  margin-top: 50px;
  position: relative;
  cursor: pointer;
}

.listProduct ul li:hover .nameProduct {
  color: darkorchid;
}

.listProduct ul li > div:first-child {
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

.listProduct ul li > div > div > span img {
  width: 210px;
}

.listProduct ul li div span {
  display: flex;
  position: absolute;
  left: 0;
  top: 0;
  transition: left 0.4s linear;
}

.listProduct ul li div:hover span {
  left: -210px;
  transition-duration: 0.4s;
}

#positionImage.left {
  left: 0;
}

.listProduct ul li > div:first-child:hover {
  border: 1px solid black;
  transition-duration: 0.5s;
}

.listProduct ul li div:hover #filterProduct {
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
