<template>
  <div class="screen">
    <ListItem v-for="(item, i) in parentData" :parentData="item" :key="i" />
  </div>
</template>

<script>
import ListItem from './ListItem.vue';

export default {
  name: 'ListComp',
  components: { ListItem },
  props: {
    parentData: {
      type: Array,
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.res__content {
  position: relative;
  display: flex;
  padding: 15px;
  background-color: #fff;
  box-shadow: 1px 1px 1px 1px rgba(192, 190, 190, 0.377);
}

@media screen and (max-width: 414px) {
  .res__content {
    display: block;
  }
}
</style>
