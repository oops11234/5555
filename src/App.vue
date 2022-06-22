<template>
  <div id="app">
    <ModalPage v-if="isLoadingPageShow" />
    <header class="hd">
      <h1 class="hd__title">農村地方美食小吃特色料理</h1>
    </header>
    <div class="container row mx-auto">
      <main class="main">
        <nav class="nav">
          <div class="nav__selector">
            <SelectItem :parentData="cityArr" @update="setCurCity" />
            <SelectItem :parentData="townArr" @update="setCurTown" />
          </div>
          <div class="nav__mode">
            <span class="nav__switchDesc">檢視模式 :</span>
            <div class="nav__modeSwitch">
              <ModeBtn
                v-for="(item, i) in modeIcon"
                :parent-icon="item"
                :parent-active="i === curMode ? true : false"
                :parent-index="i"
                :key="i"
                @update="setCurMode"
              />
            </div>
          </div>
        </nav>
        <ListComp v-if="curMode === 0" :parent-data="filterData[curPage]" />
        <TableComp
          v-else-if="curMode === 1"
          :parent-data="filterData[curPage]"
          :parentPage="curPage"
        />
        <CardComp v-else :parent-data="filterData[curPage]" />
        <PaginationComp
          :parent-length="filterData.length"
          :parent-page="curPage"
          @update="setCurPage"
        />
      </main>
      <SideBar v-if="isSideShow" :parent-data="adData" />
    </div>
    <FooterComp />
  </div>
</template>

<script>
import ModalPage from './components/ModalPage.vue';
import SelectItem from './components/SelectItem.vue';
import FooterComp from './components/FooterComp.vue';
import SideBar from './components/SideBar.vue';
import ModeBtn from './components/ModeBtn.vue';
import PaginationComp from './components/PaginationComp.vue';
import ListComp from './components/ListComp.vue';
import CardComp from './components/CardComp.vue';
import TableComp from './components/TableComp.vue';

export default {
  name: 'App',

  components: {
    ModalPage,
    SelectItem,
    FooterComp,
    SideBar,
    ModeBtn,
    PaginationComp,
    ListComp,
    CardComp,
    TableComp,
  },

  data() {
    return {
      jsonData: [],
      adData: [
        {
          url: 'adv1.png',
          alt: 'google-pixel4',
        },
        {
          url: 'adv2.png',
          alt: '飆股狙擊室',
        },
        {
          url: 'adv3.png',
          alt: '森聯摩天41',
        },
      ],
      currentCityData: '全部',
      currentTownData: '全部',
      curMode: 0,
      curPage: 0,
      isSideShow: false,
      isLoadingPageShow: true,
      showAmount: 10,
      modeIcon: [
        'fa-solid fa-list',
        'fa-solid fa-align-justify',
        'fa-solid fa-border-all',
      ],
    };
  },

  async created() {
    await this.fetchData();
    this.isLoadingPageShow = false;
  },

  mounted() {
    if (window.innerWidth > 414) {
      this.isSideShow = true;
    }
  },

  computed: {
    filterData() {
      let arr = [];
      if (this.currentCityData !== '全部' && this.currentTownData !== '全部') {
        arr = this.jsonData.filter(
          (item) => item.City === this.currentCityData
          && item.Town === this.currentTownData,
        );
      } else if (this.currentCityData !== '全部') {
        arr = this.jsonData.filter(
          (item) => item.City === this.currentCityData,
        );
      } else {
        arr = this.jsonData;
      }
      return this.paginatedData(arr);
    },

    cityArr() {
      let arr = [];
      arr = this.jsonData.map((item) => item.City);
      arr.unshift('全部');
      return [...new Set(arr)];
    },

    townArr() {
      let arr = [];
      arr = this.jsonData
        .filter((item) => item.City === this.currentCityData)
        .map((item) => item.Town);
      arr.unshift('全部');
      return [...new Set(arr)];
    },
  },

  methods: {
    async fetchData() {
      const dataUrl = 'https://data.coa.gov.tw/Service/OpenData/ODwsv/ODwsvTravelFood.aspx';
      try {
        const res = await this.$http.get(dataUrl);
        this.jsonData = res.data;
      } catch (e) {
        console.log(e.message);
      }
    },

    paginatedData(data) {
      const arr = [];
      const filerArr = [];
      data.forEach((item, i) => {
        arr.push(item);
        if ((i + 1) % this.showAmount === 0) {
          filerArr.push(arr.splice(0));
        } else if (i + 1 === data.length) {
          filerArr.push(arr);
        }
      });
      return filerArr;
    },

    setCurCity(city) {
      this.currentCityData = city;
      this.curPage = 0;
    },

    setCurTown(town) {
      this.currentTownData = town;
      this.curPage = 0;
    },

    setCurMode(num) {
      this.curMode = num;
    },

    setCurPage(num) {
      this.curPage = num;
    },
  },

  watch: {
    currentCityData() {
      this.currentTownData = '全部';
    },
  },
};

</script>

<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  line-height: 1.5;
  background-color: #ededed;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.mx-auto {
  margin-right: auto;
  margin-left: auto;
}

.container {
  max-width: 1200px;
  box-sizing: border-box;
}

.row {
  display: flex;
}

.hd {
  padding-top: 20px;
  padding-bottom: 20px;
}

.main {
  width: 75%;
}

.hd__title {
  font-size: 32px;
  font-weight: 600;
  text-align: center;
  color: #000;
}

.nav {
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-radius: 3px;
}

.nav__mode {
  display: flex;
}

.nav__switchDesc {
  font-size: 16px;
  color: #868383;
}

.screen {
  padding-top: 15px;
}

@media screen and (max-width: 414px) {
  .main {
    width: 100%;
  }

  .hd__title {
    font-size: 26px;
  }

  .screen {
    padding-right: 15px;
    padding-left: 15px;
  }

  .content {
    margin-top: 5px;
    overflow: auto;
  }

  .row {
    min-height: calc(100vh - 150px);
  }

  .nav {
    display: block;
    padding-right: 15px;
    padding-left: 15px;
    background-color: transparent;
  }

  .nav__mode {
    padding-top: 5px;
    justify-content: center;
  }
}
</style>
