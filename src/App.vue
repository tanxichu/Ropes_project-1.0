<template>
    <div>
        <div style="padding: 5%;float: left;width: 90%;">
            <img src="../picture/menubars.jpg" style="width: 35px;float: left;" @click="listshow = !listshow">
            <router-link to="/" style="color: black;">
                <div style="font-size:25px;margin-left: 50px;float: left;">AladdinCome</div>
            </router-link>
            <router-link style="color: black;text-decoration: none;" to="/sign/">
                <div style="font-size:25px;margin: 3px 0 0 50px;float: left;">Join</div>
            </router-link>
            <div style="width: 100%;float:left;margin-top: 3%;">
                <input style="font-size: 13px;padding: 5px;width: 85%;float:left;" placeholder="Find service ...">
                <router-link to="/list/">
                    <img src="@/../picture/Search.png" style="background: green;width: 5%;padding: 1.5%;float:left;">
                </router-link>
            </div>
        </div>
        <router-view></router-view>
        <div id="bottom">
            <router-link to="/home/" class="word">Home</router-link>
            <div class="word">Post</div>
            <div class="word">Order</div>
            <router-link to="/setting/" class="word" style="margin: 0%;float:right;">Setting</router-link>
        </div>
        <div style="background: white;float: left;padding: 2%;float: left;width: 96%;">
            <div style="width: 85%;height: 100%;background: black;color: white;border-radius: 10px;float: left;padding: 7.5%;">
                <div style="float: left;width: 100%;" v-for="ending in endings" :key="ending">
                    <div class="ending_page">{{ending}}</div>
                    <img style="float: right;width: 5%;" class="ending_page" src="@/../picture/downarrow.png">
                    <hr style="float: left;width: 100%;">
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            listshow: false,
            endings: ["For Clients", "For Talent", "Resources", "Company"],
        }
    }
}
</script>

<style scoped>

#list{
    position: absolute;
    background: white;
    float: left;
    width: 100%;
    height: 1000px;
    margin-top: 18%;
    z-index: 3;
}

#join_button{
    width: 20%;
    padding: 2% 12%;
    background: rgb(28, 226, 28);
    float: left;
    font-size: 25px;
    border-radius: 10px;
    color: white;
    margin: 5% 10%;
}

.button{
    float: left;
    margin: 2.5% 10%;
    width: 80%;
    font-size: 20px;
}

#bottom{
    padding: 4% 7%;
    width: 86%;
    position: fixed;
    background: black;
    z-index: 10000;
    top: 92%;
}

.word{
    margin-right: 17%;
    color: white;
    float:left;
    text-decoration: none;
}
</style>