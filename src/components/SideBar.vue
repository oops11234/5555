<template>
  <aside class="sideBar">
    <template v-for="(item, i) in parentData">
      <ImgAd
        v-if="i === parentData.length - 1"
        :key="i"
        :parent-data="item"
        :parent-last="true"
      />
      <ImgAd v-else :key="i" :parentData="item" />
    </template>
  </aside>
</template>

<script>
import ImgAd from './ImgAd.vue';

export default {
  name: 'SideBar',
  props: {
    parentData: {
      type: Array,
    },
  },
  components: {
    ImgAd,
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.sideBar {
  width: 25%;
  margin-left: 15px;
  padding-left: 15px;
  box-sizing: border-box;
}
</style>
