<template>
  <div class="screen">
    <div class="content">
      <table class="resTable">
        <thead class="resTable__hd">
          <tr class="resTable__title">
            <th class="resTable__th">編號</th>
            <th class="resTable__th">行政區域</th>
            <th class="resTable__th">鄉鎮區</th>
            <th class="resTable__th">商家</th>
            <th class="resTable__th">地址</th>
          </tr>
        </thead>
        <tbody class="resTable__content">
          <tr
            v-for="(item, i) in parentData"
            :key="item.ID"
            :class="['resTable__row', { 'resTable__row--stripe': i % 2 === 0 }]"
          >
            <td
              class="resTable__td resTable__td--textRight resTable__td--textGrey"
            >
              {{ parentPage * 10 + i + 1 }}
            </td>
            <td
              class="resTable__td resTable__td--fixWidth resTable__td--textGrey"
            >
              {{ item.City }}
            </td>
            <td
              class="resTable__td resTable__td--minWidth resTable__td--textGrey"
            >
              {{ item.Town }}
            </td>
            <td
              class="resTable__td resTable__td--noWrap"
              v-if="item.Url !== ''"
            >
              <a :href="item.Url" class="resTable__link" target="_blank">
                {{ item.Name }}
              </a>
            </td>
            <td v-else class="resTable__td resTable__td--noWrapt">
              {{ item.Name }}
            </td>
            <td class="resTable__td resTable__td--text" :title="item.Address">
              {{ textLimit(item.Address) }}
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TableComp',
  props: {
    parentData: {
      type: Array,
    },
    parentPage: {
      type: Number,
    },
  },

  methods: {
    textLimit(str) {
      let limitStr = '';
      if (str.length > 20) {
        limitStr = `${str.substring(0, 20 - 1)}...`;
        return limitStr;
      }
      return str;
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.resTable {
  width: 100%;
  white-space: nowrap;
}

.resTable__title {
  background: linear-gradient(#f6f7f8, #e3e6e6);
  border-bottom: 2px solid #cbcbcb;
}

.resTable__th {
  padding: 10px;
  font-size: 16px;
  border: 1px solid #cbcbcb;
  color: #8a8787;
  font-weight: 600;
  white-space: nowrap;
}

.resTable__row--stripe {
  background-color: #fdfdfdea;
}

.resTable__row:hover {
  background-color: #eef2f7;
}

.resTable__td {
  padding: 10px 15px;
  font-size: 15px;
  border: 1px solid #dfdddd;
  vertical-align: middle;
  box-sizing: border-box;
}

.resTable__td--indexWidth {
  width: 60px;
}

.resTable__td--fixWidth {
  width: 90px;
}

.resTable__td--minWidth {
  min-width: 80px;
}

.resTable__td--textGrey {
  color: #8a8787;
}

.resTable__td--textRight {
  text-align: right;
}

.resTable__td--noWrap {
  white-space: nowrap;
}

.resTable__td--text {
  position: relative;
}

.resTable__td--text:hover::after {
  content: attr(title);
  position: absolute;
  top: 32px;
  left: 22px;
  padding-right: 5px;
  padding-left: 5px;
  font-size: 12px;
  white-space: nowrap;
  background: linear-gradient(#f0f1f3, #e9eef5);
  border: 1px solid rgba(0, 0, 0, 0.596);
  border-radius: 2px;
  box-shadow: 1px 1px 2px 1px rgba(59, 59, 59, 0.575);
}
</style>
