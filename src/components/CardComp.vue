<template>
  <div class="screen grid">
    <CardItem v-for="(item, i) in parentData" :parentData="item" :key="i" />
  </div>
</template>

<script>
import CardItem from './CardItem.vue';

export default {
  name: 'CardComp',
  components: { CardItem },
  props: {
    parentData: {
      type: Array,
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 30px 30px;
}

@media screen and (max-width: 414px) {
  .grid {
    grid-template-columns: 1fr;
    gap: 20px 15px;
  }
}
</style>
