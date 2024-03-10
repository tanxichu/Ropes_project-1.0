<template>
    <div style="font-size: 20px;padding: 0% 5% 5% 5%;float:left;">
        <div style="width: 100%;">
            <div :class="jobs_class" @click="change_type(1)">Jobs</div>
            <div :class="projects_class" @click="change_type(2)">Projects</div>
        </div>
        <div style="float:left;width: 100%;padding-top: 5%;">
            <div style="font-size: 25px;margin-bottom: 2%;">Home Repairs</div>
            <div style="float: left;width: 100%;margin-bottom: 2%;">
                <div class="filter"><img src="@/../picture/filter.png" style="width: 9%;">Filters</div>
                <div class="filter"><img src="@/../picture/sorts.png" style="width: 8%;">Sorts</div>
            </div>
            <div style="padding-top: 7%;float:left;" v-for="a in 2" :key="a">
                <router-link to="/list/product/">
                    <img src="@/../picture/home_repair.jpg" style="width: 100%;height: 230px;">
                </router-link>
                <div style="float:left">
                    <router-link to="/list/product/" id="title">Best home repair</router-link>
                    <img src="@/../picture/person.jpg" style="width: 40px;height: 40px;border-radius: 50px;float: right;">
                    <div style="font-size: 15px;margin: 3% 2%;float:right;">Mark</div>
                    <div style="float: left;font-size: 18px">
                        I can help family to fix their home, including leaking, roof, fences, outlook.
                    </div>
                    <div style="float: left;font-size: 17px;margin-top: 2%">From 25-40$ per hour</div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                type: true,
                jobs_class: "type_clicked",
                projects_class: "type",
            }
        },
        methods: {
            change_type(click){
                if(click==1){
                    this.projects_class = "type"
                    this.jobs_class = "type_clicked"
                }else{
                    this.jobs_class = "type"
                    this.projects_class = "type_clicked"
                }
            },
        },
    }
</script>

<style scoped>
img{
    object-fit: cover;
    object-position: center;
}
.type{
    font-size: 30px;
    width: 48%;
    float: left;
    text-align: center;
    border-bottom: 3px solid rgb(160, 160, 160);
    color: rgb(85, 85, 85);
    margin-left: 1%;
    padding: 2% 0%;
}
.type_clicked{
    font-size: 30px;
    width: 48%;
    float: left;
    text-align: center;
    border-bottom: 3px solid rgb(0, 0, 0);
    color: rgb(0, 0, 0);
    margin-left: 1%;
    padding: 2% 0%;
    font-weight: 600;
}
.filter{
    padding: 2% 0%;
    width: 49%;
    border: 1px solid rgb(166, 166, 166);
    text-align: center;
    float: left;
    font-size: 15px;
}
#title{
    float: left;
    margin-top: 2%;
    font-size: 23px;
    font-weight: 600;
    color: black;
    text-decoration: none;
}
</style>