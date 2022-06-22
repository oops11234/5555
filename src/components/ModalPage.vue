<template>
  <div class="loadingPage">
    <ModalContent />
  </div>
</template>

<script>
import ModalContent from './ModalContent.vue';

export default {
  name: 'ModalPage',
  components: { ModalContent },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.loadingPage {
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  z-index: 1;
  width: 100%;
  height: 100vh;
  font-size: 15px;
  color: #f2f2f2;
  background-color: rgba(71, 71, 71, 0.8);
}
</style>
