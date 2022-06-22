<template>
  <footer class="footer">
    <div class="container mx-auto">
      <h3 class="footer__title">CMoney 全曜財經資訊</h3>
      <p class="footer__desc">
        資料來源 : <span class="footer__info">政府資料開放平台</span>
      </p>
    </div>
  </footer>
</template>

<script>
export default {
  name: 'FooterComp',
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.footer {
  padding-top: 10px;
  padding-bottom: 10px;
  color: #c7cacd;
  background-color: #989898;
}

.footer__title {
  font-size: 20px;
  font-weight: 600;
}

.footer__desc {
  font-size: 14px;
}

.footer__info {
  color: #fff;
}

@media screen and (max-width: 414px) {
  .footer {
    text-align: center;
  }
}
</style>
