<template>
  <section class="res">
    <component
      :is="setHtmlTag('a', 'div')"
      :class="setHtmlTag('res__link', 'res__content')"
      :href="setHtmlTag(parentData.Url, null)"
      :target="setHtmlTag(parentData.Url, null)"
    >
      <figure class="res__fig">
        <img
          class="res__img"
          :src="parentData.PicURL"
          :alt="parentData.Name"
          width="400"
          height="267"
        />
      </figure>
      <div class="res__text">
        <h2 class="res__title">{{ parentData.Name }}</h2>
        <div class="res__info">
          <p class="res__flag">{{ parentData.City }}</p>
          <p class="res__desc">{{ parentData.Town }}</p>
        </div>
        <p class="res__paragh">{{ textLimit(parentData.FoodFeature) }}</p>
      </div>
    </component>
  </section>
</template>

<script>
export default {
  name: 'ListItem',
  props: {
    parentData: {
      type: Object,
    },
  },

  methods: {
    textLimit(str) {
      let limitStr = '';
      if (str.length > 101) {
        limitStr = `${str.substring(0, 101 - 1)}...`;
        return limitStr;
      }
      return str;
    },

    setHtmlTag(params1, params2) {
      const config = this.parentData.Url !== '' ? params1 : params2;
      return config;
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.res + .res {
  margin-top: 15px;
}

.res__link {
  position: relative;
  display: flex;
  padding: 15px;
  color: #000;
  background-color: #fff;
  box-shadow: 1px 1px 1px 1px rgba(192, 190, 190, 0.377);
  text-decoration: none;
}

.res__fig {
  width: 27.5%;
  height: auto;
  overflow: hidden;
  background-color: rgba(8, 8, 8, 0.226);
}

.res__img {
  width: 100%;
  height: auto;
  mix-blend-mode: multiply;
  vertical-align: middle;
  transition: transform 1s;
}

.res__fig:hover .res__img {
  mix-blend-mode: initial;
  transform: scale(1.3);
}

.res__text {
  width: 72.5%;
  padding-left: 30px;
  box-sizing: border-box;
}

.res__title {
  padding-bottom: 5px;
  font-size: 30px;
  font-weight: 600;
}

.res__link .res__title {
  color: #00a2d2;
}

.res__info {
  position: absolute;
  left: -52px;
  top: 0;
  color: #3f3d3d;
}

.res__flag {
  padding: 3px 5px;
  font-size: 14px;
  color: #fff;
  background-color: #00a2d2;
}

.res__desc {
  margin-top: 10px;
  margin-left: auto;
  margin-right: 10px;
  letter-spacing: 5px;
  writing-mode: vertical-lr;
}

.res__paragh {
  font-size: 15px;
  color: #636161;
}

@media screen and (max-width: 414px) {
  .res__link {
    display: block;
  }

  .res__fig {
    width: 100%;
  }

  .res__text {
    width: 100%;
    padding-left: 0;
  }

  .res__title {
    font-size: 22px;
    padding-top: 15px;
  }

  .res__info {
    position: static;
    display: flex;
    align-items: center;
  }

  .res__flag {
    padding: 3px 4px;
    font-size: 14px;
  }

  .res__desc {
    margin-top: 0px;
    margin-left: 10px;
    letter-spacing: 0px;
    writing-mode: unset;
  }

  .res__paragh {
    display: -webkit-box;
    padding-top: 15px;
    font-size: 15px;
    text-overflow: none;
    overflow: hidden;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
}
</style>
