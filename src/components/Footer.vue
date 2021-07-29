<template>
  <div class="home-footer">
    <!-- contact -->
    <div class="footer-contact">
      <div class="footer-contact__img">
        <img
          src="https://cdn.shopify.com/s/files/1/1811/9799/files/footer-logo_400x.png?v=1494426885"
          alt="shoes6"
        />
      </div>
      <!-- email -->
      <div class="footer-contact__email">
        <input type="email" placeholder="Địa chỉ email..." />
        <button class="footer-icon">
          <i class="fas fa-chevron-circle-right"></i>
        </button>
      </div>

      <!-- social link -->
      <div class="footer-contact__social">
        <button class="footer-icon social-icon">
          <i class="fab fa-facebook-square"></i>
        </button>

        <button class="footer-icon social-icon">
          <i class="fab fa-twitter-square"></i>
        </button>

        <button class="footer-icon social-icon">
          <i class="fab fa-google-plus-square"></i>
        </button>

        <button class="footer-icon social-icon">
          <i class="fab fa-pinterest-square"></i>
        </button>
      </div>
    </div>

    <!-- uniform -->
    <div class="footer-uniform">
      <!-- dịch vụ khách hàng -->
      <div class="uniform-container">
        <div class="uniform-list-title">
          Dịch vụ khách hàng
        </div>

        <div class="uniform-list">
          <ul>
            <li>
              <i class="fas fa-angle-right"></i>
              Giới thiệu
            </li>
            <li>
              <i class="fas fa-angle-right"></i>
              Chính sách thanh toán
            </li>
            <li>
              <i class="fas fa-angle-right"></i>
              Chính sách bảo hanh
            </li>
            <li>
              <i class="fas fa-angle-right"></i>
              Chính sách đổi trả hoàn tiền
            </li>
            <li>
              <i class="fas fa-angle-right"></i>
              Chính sách giao hàng
            </li>
            <li>
              <i class="fas fa-angle-right"></i>
              Chính sách bảo mật
            </li>
            <li>
              <i class="fas fa-angle-right"></i>
              Liên hệ
            </li>
          </ul>
        </div>
      </div>

      <!-- Hỗ trợ khách hàng -->
      <div class="uniform-container">
        <div class="uniform-list-title">
          Hỗ trợ khách hàng
        </div>

        <div class="uniform-list">
          <ul>
            <li>
              <i class="fas fa-angle-right"></i>
              Hướng dẫn đặt hàng
            </li>
            <li>
              <i class="fas fa-angle-right"></i>
              Hướng dẫn chọn cỡ giày
            </li>
            <li>
              <i class="fas fa-angle-right"></i>
              Bảo quản giày đúng cách
            </li>
            <li>
              <i class="fas fa-angle-right"></i>
              Vệ sinh giày
            </li>
          </ul>
        </div>
      </div>

      <!-- Thông tin hữu ích -->
      <div class="uniform-container">
        <div class="uniform-list-title">
          Các thông tin khác
        </div>

        <div class="uniform-list">
          <ul>
            <li>
              <i class="fas fa-angle-right"></i>
              Thương hiệu giày
            </li>
            <li>
              <i class="fas fa-angle-right"></i>
              ...
            </li>
            <li>
              <i class="fas fa-angle-right"></i>
              ...
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- icon thanh toán -->
    <div class="container-paypal">
      <div class="item-paypal">
        <i class="fab fa-cc-visa"></i>
      </div>
      <div class="item-paypal">
        <i class="fab fa-cc-paypal"></i>
      </div>
      <div class="item-paypal">
        <i class="fab fa-cc-mastercard"></i>
      </div>
      <div class="item-paypal">
        <i class="fas fa-credit-card"></i>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.home-footer {
  background-color: var(--background-dark);
  color: var(--text-light);
  margin: auto -20px;
  padding: 10px;
}
.footer-contact {
  color: var(--text-light);
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid var(--text-light);
  padding-bottom: 10px;
}

.footer-contact__img {
  cursor: pointer;
  height: 100%;
  object-fit: fill;
}

.footer-icon {
  font-size: 26px;
  transition: var(--tran03);
}
.footer-icon:hover {
  color: var(--text-hover);
}
.social-icon {
  font-size: 40px;
  padding: 0px 10px;
}

.footer-contact__email input {
  width: 250px;
  color: var(--text-light);
  font-size: 18px;
}

/* uniform*/
.footer-uniform {
  padding: 10px 0px;
  display: flex;
  justify-content: space-around;
}

.uniform-container {
  width: 200px;
}

.uniform-list-title {
  padding: 20px 0px;
  font-size: 18px;
  text-transform: uppercase;
}
.uniform-list li {
  cursor: pointer;
  padding: 10px 0px;
  transition: var(--tran03);
}
.uniform-list li:hover {
  padding-left: 10px;
  color: var(--text-hover);
}

/* icon thanh toan */
.container-paypal {
  display: flex;
  justify-content: flex-end;
}
.item-paypal {
  font-size: 50px;
  opacity: 0.4;
  padding: 0px 10px;
}
</style>
