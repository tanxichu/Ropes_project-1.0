import Vue from 'vue';
import VueRouter from 'vue-router';

import home from '../components/home.vue';
import test from '../components/1.vue';
import sign from '../components/sign.vue';
import list from '../components/list.vue';
import product from '../components/product.vue';
import setting from '../components/setting.vue';

Vue.use(VueRouter);

export default new VueRouter({
    routes: [
        { path: '/', component: home },
        { path: '/home', component: home },
        { path: '/test', component: test },
        { path: '/sign', component: sign },
        { path: '/list', component: list },
        { path: '/list/product', component: product },
        { path: '/setting', component: setting },
    ]
});
