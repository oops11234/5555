<template>
  <select
    class="nav__select"
    :value="parentData"
    @change="selectToUpdate($event)"
  >
    <option v-for="(item, i) in parentData" :key="i" :value="item">
      {{ item }}
    </option>
  </select>
</template>

<script>
export default {
  name: 'SelectItem',
  props: {
    parentData: {
      type: Array,
    },
  },

  methods: {
    selectToUpdate(event) {
      this.$emit('update', event.target.value);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.nav__select {
  padding-left: 15px;
  padding-right: 30px;
  height: 37px;
  font-size: 16px;
  border: none;
  border-radius: 3px;
  background: no-repeat #d5d5d5 url('../../public/arrow.png') 95% 45% /6px 6px;
  appearance: none;
  outline-color: #a6c4f6;
}

.nav__select + .nav__select {
  margin-left: 10px;
}

@media screen and (max-width: 414px) {
  .nav__select + .nav__select {
    margin-left: 0px;
  }

  .nav__select {
    width: 100%;
    margin-top: 10px;
    margin-bottom: 10px;
    text-align: left;
    background-position: 98%;
  }
}
</style>
