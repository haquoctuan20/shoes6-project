<template>
  <!-- Trang danh mục sản phẩm
       Created by: TDCHIEN on 1/8/2021
   -->
  <div class="list-product">

    <!-- Header list product -->
    <div class="title-page">
      <div class="name-page">
        <p>SẢN PHẨM</p>
        <span>Trang chủ</span><span>  / sản phẩm</span>
      </div>  
    </div>

    <!-- Nội dung chính  -->
    <div class="content">
      <!-- Option -->
      <div class="option">
        <!-- Catagory -->
        <div class="category title-option">
          <p>Thể loại</p>
          <ul>
            <li>Trang chủ</li>
            <li>Sưu tập <span class="toggle-category" @click="hidden_collection">+</span>
              <transition name="fade">
                <ul v-if="hiddenCollection">
                  <li>Chống nước</li>
                  <li>Giày Brogue</li>
                  <li>Giày da</li>
                  <li>Ủng</li>
                </ul> 
              </transition> 
            </li>
            <li>Giày <span class="toggle-category" @click="hidden_shoes">+</span>
              <transition name="fade">
                  <ul v-if="hiddenShoes">
                    <li>Giày công sở</li>
                    <li>Giày sinh viên</li>
                    <li>Giày thanh niên</li>
                  </ul> 
                </transition> 
            </li>
            <li>Ủng <span class="toggle-category" @click="hidden_boots">+</span>
              <transition name="fade">
                  <ul v-if="hiddenBoots">
                    <li>Ủng dài</li>
                    <li>Ủng ngắn</li>
                    <li>Ủng Rigger</li>
                  </ul> 
                </transition> 
            </li>
            <li>Giày leo núi <span class="toggle-category" @click="hidden_climbing">+</span>
              <transition name="fade">
                  <ul v-if="hiddenClimbing">
                    <li>Giày cao cổ</li>
                    <li>Giày ma sát tốt</li>
                    <li>Giày cổ ngắn</li>
                  </ul> 
                </transition> 
            </li>
            <li>Trang</li>
          </ul>
        </div>

        <!-- Shop By Color -->
        <div class="byColor title-option">
          <p>Chọn theo màu sắc</p>
          <ul>
            <li><div class="icon-color red" id="red"></div><span>Đỏ</span></li>
            <li><div class="icon-color black" id="black"></div><span>Đen</span></li>
            <li><div class="icon-color silver" id="silver"></div><span>Bạc</span></li>
            <li><div class="icon-color white" id="white"></div><span>Trắng</span></li>
          </ul>
        </div>

        <!-- Shop By Size -->
        <div class="bySize title-option">
          <p>Chọn theo màu kích cỡ</p>
          <ul>
            <li>7</li>
            <li>7.5</li>
            <li>8</li>
            <li>9</li>
          </ul>
        </div>

        <!-- Shop By Brand -->
        <div class="byBrand title-option">
          <p>Chọn theo thương hiệu</p>
          <ul>
            <li>Havaianas</li>
            <li>Geox</li>
            <li>Bontoni</li>
            <li>Atlectica</li>
          </ul>
        </div>

        <!-- Shop by Price -->
        <div class="byPrice title-option">
          <p>Chọn theo giá</p>
          <ul>
            <li>100.000 - 300.000</li>
            <li>300.000 - 500.000</li>
            <li>500.000 - 700.000</li>
            <li>700.000 - 1.000.000</li>
            <li>1.000.000 - 1.500.000</li>
            <li>1.500.000 - 3.000.000</li>
          </ul>
        </div>

        <!-- Shop by Meterial -->
        <div class="byMaterial title-option">
          <p>Chọn theo chất liệu</p>
          <ul>
            <li>Chất dẻo</li>
          </ul>
        </div>
      </div>

      <!-- danh sách sản phẩm -->
      <div class="list">
        <!-- Lọc sản phẩm theo điều kiện -->
        <div class="sort">
          <div class="positonSort">
            <div class="SelectSort">
            <span>Sắp xếp &nbsp; &nbsp; &nbsp; </span>
            <div class="select" v-on:click="clickSelectSort">
              {{ valueSelected }}
            </div>
          </div>
          <ul class="values" v-if="hiddenValuesSort"
              v-on:click="selectValue">
            <li v-for="itemSelect in valueSelect"
                :value="itemSelect.value"
                :key="itemSelect.value"
            >
            {{itemSelect.text}}
            </li>
          </ul>
          </div>
        </div>

        <!-- Danh sách sản phẩm -->
        <div class="listProduct">
          <ul>
              <li class="product"
                  v-for="item in products"
                  :key="item.id"
                  @click="viewDetail(item)"
              >
                <div>
                  <!-- filter nền khi hover vào ảnh -->
                  <span id="filterProduct">
                    <div id="view" class="actionProduct">
                      <img src="../../../assets/img/icon/eye.png" alt="">
                    </div>
                    <div id="link" class="actionProduct">
                      <img src="../../../assets/img/icon/link.png" alt="">
                    </div>
                    <div id="heart" class="actionProduct">
                      <img src="../../../assets/img/icon/heart.png" alt="">
                    </div>
                  </span>
                  <!-- Hình ảnh chính và phụ -->
                  <div>
                    <span id="positionImage">
                      <img id="mainImage" :src="require('../../../assets'.concat(item.avatar))" alt="">
                      <img id="extraImage" :src="require('../../../assets'.concat(item.avatar))" alt="">
                    </span>
                  </div>
                </div>
                <!-- Detail sản phẩm -->
                <div class="productDetail">
                  <p class="nameProduct">
                    {{item.name}}
                  </p>
                  <div>
                    <div class="costProduct">
                      <p>{{item.salePrice}}₫</p>
                      <!-- Sao đánh giá -->
                        <div class="star">
                          <div v-for="index in item.rate"
                            :key="index">
                              <img src="../../../assets/img/icon/star1.png" alt="">
                          </div>
                          <div v-for="index in 5 - item.rate"
                            :key="'A'+index">
                              <img src="../../../assets/img/icon/star.png" alt="">
                          </div>
                        </div>
                    </div>
                    <div class="card">
                      <img src="../../../assets/img/icon/card.png" alt="">
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
// import { eventBus } from '../../../main.js';
import * as axios from "axios";
export default {
  created() {
    this.getData()
  },
  methods: {

  // Lấy giữu liệu từ API
  async getData() {
    const response = await axios.get("https://localhost:44380/product/all");  
    this.products = response.data;
    console.log(response.data)
  },

    // Sự kiện ấn hiện option
    hidden_collection(e) {
      this.hiddenCollection = !this.hiddenCollection;
      if(this.hiddenCollection) {
        e.target.innerText = '-';
      } else {
        e.target.innerText = '+';
      }
    },
    hidden_shoes(e) {
      this.hiddenShoes = !this.hiddenShoes;
      if(this.hiddenShoes) {
        e.target.innerText = '-';
      } else {
        e.target.innerText = '+';
      }
    },
    hidden_boots(e) {
      this.hiddenBoots = !this.hiddenBoots;
       if(this.hiddenBoots) {
        e.target.innerText = '-';
      } else {
        e.target.innerText = '+';
      }
    },
    hidden_climbing(e) {
      this.hiddenClimbing = !this.hiddenClimbing;
      if(this.hiddenClimbing) {
        e.target.innerText = '-';
      } else {
        e.target.innerText = '+';
      }
    },

    // Sự kiến click Sort By
    clickSelectSort() {
      this.hiddenValuesSort = !this.hiddenValuesSort;
    },

    // Sự liện chọn option sort
    selectValue : function(e) {
      this.valueSelected = e.target.innerText;
      this.hiddenValuesSort = !this.hiddenValuesSort;
      switch (this.valueSelected) {
        // sắp xếp theo giá tăng dần
        case 'Price, low to hight':
          this.products.sort((a, b) => a.salePrice - b.salePrice);
          break;
        // Sắp xếp theo giá giảm dần
        case 'Price, hight to low':
          this.products.sort((a, b) => b.salePrice - a.salePrice);
          break;
        // Sắp xếp tên sản phẩm theo A -> Z
        case 'A-Z':
          this.products.sort(function(a, b){
              var typeA = a.name.toUpperCase();
              var typeB = b.name.toUpperCase();
              if (typeA > typeB) {
                return 1;
              } else if (typeA < typeB) {
                return -1;
              } else return 0;
            });
          break;
        // Sắp xếp tên sản phẩm theo Z -> A
        case 'Z-A':
          this.products.sort(function(a, b){
              var typeA = a.name.toUpperCase();
              var typeB = b.name.toUpperCase();
              if (typeA < typeB) {
                return 1;
              } else if (typeA > typeB) {
                return -1;
              } else return 0;
            });
          break;
        default:
          break;
      }
    },

    viewDetail(item) {
      this.$router.push("/list-product/" + item.slug);
    },
  },

  data() {
    return {
      hiddenCollection : false,
      hiddenShoes : false,
      hiddenBoots : false,
      hiddenClimbing : false,
      hiddenValuesSort : false,
      valueSelect : [
        {text: 'Tính năng', value: 'featured'},
        {text: 'Giá từ thấp đến cao', value: 'lowToHight'},
        {text: 'Giá từ cao xuống thấp', value: 'hightToLow'},
        {text: 'A-Z', value: 'A-Z'},
        {text: 'Z-A', value: 'Z-A'},
        {text: 'Ngày thêm lâu nhất', value: 'oldToNew'},
        {text: 'Ngày thêm mới nhất', value: 'newToOld'},
        {text: 'Bán chạy', value: 'bestSelling'},
      ],
      valueSelected: 'Tính năng',
      products : [],
      productSelected: [],
    }
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
.name-page > span:hover{
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

.bySize ul{
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
.byPrice > ul > li{
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

.sort{
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

.select{
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

.listProduct{
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

.listProduct ul li:hover .nameProduct{
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

#filterProduct{
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

.actionProduct img{
  width: 25px !important;
}

.actionProduct:hover {
  background-color: rgb(132, 0, 255);
}

.listProduct ul li > div > div > span img {
   width: 210px;
}

.listProduct ul li div span{
  display: flex;
  position: absolute;
  left: 0;
  top: 0;
  transition: left 0.4s linear;
}

.listProduct ul li div:hover span{
  left: -210px;
  transition-duration: 0.4s;
}

#positionImage.left {
  left: 0;
}

.listProduct ul li > div:first-child:hover{
  border: 1px solid black;
  transition-duration: 0.5s;
}

.listProduct ul li div:hover #filterProduct{
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
