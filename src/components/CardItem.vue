<template>
  <section class="grid__item">
    <component
      :is="setHtmlTag('a', 'div')"
      :class="setHtmlTag('cardRes__link', 'cardRes__content')"
      :href="setHtmlTag(parentData.Url, null)"
      :target="setHtmlTag(parentData.Url, null)"
    >
      <figure class="cardRes">
        <img
          class="cardRes__img"
          :src="parentData.PicURL"
          :alt="parentData.Name"
          width="400"
          height="267"
        />
        <figcaption class="cardRes__text">
          <div class="cardRes__info">
            <p class="cardRes__flag">{{ parentData.City }}</p>
            <p class="cardRes__desc cardRes__desc--italic">
              {{ parentData.Town }}
            </p>
          </div>
          <h2 class="cardRes__title">{{ parentData.Name }}</h2>
          <p class="cardRes__paragh">{{ textLimit(parentData.FoodFeature) }}</p>
        </figcaption>
      </figure>
    </component>
  </section>
</template>

<script>
export default {
  name: 'CardItem',
  props: {
    parentData: {
      type: Object,
    },
  },

  methods: {
    textLimit(str) {
      let limitStr = '';
      if (str.length > 50) {
        limitStr = str.substring(0, 50 - 1);
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
.cardRes {
  position: relative;
  height: 200px;
  overflow: hidden;
  background-image: linear-gradient(transparent 70%, rgba(14, 13, 13, 0.877));
}

.cardRes__img {
  width: 100%;
  mix-blend-mode: multiply;
  object-fit: cover;
  transition: transform 1s;
}

.cardRes:hover .cardRes__img {
  transform: scale(1.3);
}

.cardRes__text {
  position: absolute;
  top: 145px;
  padding-left: 15px;
  padding-right: 15px;
  color: #fff;
  transition: top 1s;
}

.cardRes:hover .cardRes__text {
  top: 80px;
}

.cardRes__flag {
  padding: 2px 5px;
  font-size: 12px;
  color: #fff;
  background-color: #00a2d2;
}

.cardRes__info {
  display: flex;
  align-items: center;
}

.cardRes__desc {
  padding-left: 5px;
  font-size: 13px;
  color: rgba(255, 255, 255, 0.815);
}

.cardRes__desc--italic {
  font-style: italic;
}

.cardRes__title {
  font-weight: 700;
  padding-top: 3px;
  padding-bottom: 20px;
}

.cardRes__title::after {
  content: '';
  position: absolute;
  top: 60px;
  left: 15px;
  width: 48px;
  height: 3px;
  background-color: #fff;
}

.cardRes__paragh {
  display: -webkit-box;
  font-size: 14px;
  text-overflow: none;
  overflow: hidden;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

@media screen and (max-width: 414px) {
  .cardRes {
    height: 160px;
  }

  .cardRes__text {
    top: 105px;
  }

  .cardRes:hover .cardRes__text {
    top: 40px;
  }
}
</style>
