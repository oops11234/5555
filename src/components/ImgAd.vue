<template>
  <div :class="['file', { 'file-sticky': parentLast }]">
    <img
      class="file__img"
      :src="pathStrMaker(parentData.url)"
      alt="google-pixel4"
    />
  </div>
</template>

<script>
export default {
  name: 'ImgAd',
  props: {
    parentData: {
      type: Object,
    },

    parentLast: {
      type: Boolean,
      default: false,
    },
  },

  methods: {
    pathStrMaker(name) {
      return `./${name}`;
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.file {
  width: 280px;
  box-sizing: border-box;
}

.file + .file {
  margin-top: 15px;
}

.file__img {
  width: 100%;
  height: auto;
  vertical-align: middle;
}

.file-sticky {
  position: sticky;
  top: 0;
}
</style>
