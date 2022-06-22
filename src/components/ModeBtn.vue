<template>
  <button
    :class="['nav__switchBtn', { 'nav__switchBtn--active ': parentActive }]"
    @click="clickSwitchMode()"
  >
    <i :class="parentIcon"></i>
  </button>
</template>

<script>
export default {
  name: 'ModeBtn',
  props: {
    parentIcon: {
      type: String,
    },
    parentActive: {
      type: Boolean,
      default: false,
    },
    parentIndex: {
      type: Number,
    },
  },
  methods: {
    clickSwitchMode() {
      this.$emit('update', this.parentIndex);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.nav__switchBtn {
  font-size: 20px;
  color: #757575;
  border: none;
  cursor: pointer;
}

.nav__switchBtn--active {
  color: #000;
}
</style>
