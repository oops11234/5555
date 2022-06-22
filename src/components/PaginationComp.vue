<template>
  <nav class="pageList">
    <p class="pageList__text">
      美食頁次
      <span class="pageList__number">
        {{ parentPage + 1 }}/{{ parentLength }}
      </span>
    </p>
    <div class="pageList__content">
      <button
        v-for="(item, i) in parentLength"
        :key="i"
        :class="[
          'pageList__btn',
          { 'pageList__btn--active': i === parentPage },
        ]"
        type="button"
        @click="clickToUpdate(i)"
      >
        {{ item }}
      </button>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'PaginationComp',
  props: {
    parentLength: {
      type: Number,
    },
    parentPage: {
      type: Number,
    },
  },

  methods: {
    clickToUpdate(num) {
      this.$emit('update', parseInt(num, 10));
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.pageList {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-top: 15px;
  padding-bottom: 30px;
}

.pageList__btn {
  padding: 7px 13px;
  font-size: 16px;
  color: #aaafae;
  border: none;
  background-color: #dcdcdc;
  cursor: pointer;
}

.pageList__btn + .pageList__btn {
  margin-left: 5px;
}

.pageList__btn--active {
  color: #fff;
  background-color: #00a2d2;
}

@media screen and (max-width: 414px) {
  .pageList {
    padding: 10px 15px 40px;
  }

  .pageList__text {
    display: none;
  }

  .pageList__btn {
    margin-top: 10px;
    margin-right: 15px;
  }

  .pageList__btn + .pageList__btn {
    margin-left: 0;
  }
}
</style>
