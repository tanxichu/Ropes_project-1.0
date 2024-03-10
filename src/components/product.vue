<template>
    <div>
        <div style="float:left;width: 100%">
            <div style="font-size: 35px;text-align: center;margin-bottom:3%">Best Home Repair</div>
            <div style="position: relative;">
                <img @click="move(-1)" class="leftright" src="@/../picture/left.png" style="left: 0%;">
                <div class="swiper-container">
                    <div class="image-container" :style="containerStyle">
                        <div v-for="item in images" :key="item" class="recommend">
                            <img :src="item" id="picture">
                        </div>
                    </div>
                </div>
                <img @click="move(1)" class="leftright" src="@/../picture/right.png" style="right: 0%;">
            </div>
            <div style="padding: 3% 6%;float:left;width:88%" id="main_body">
                <img src="@/../picture/profile.png" id="profile">
                <div style="margin:3% 4%;width:69%">
                    <div style="font-size: 28px;float:left;width:100%">David S</div>
                    <div style="margin: 2% 0%;float:left">Palo Alto</div>
                </div>
                <div style="font-size: 22px;margin-top: 4%;">$25-40/hr</div>
                <div style="font-size: 17px;">10 jobs done</div>
                <div style="font-size: 17px;">Vehicles: Truck</div>
                <div style="font-size: 17px;">Employment-type: Full-time</div>
                <div>
                    I can help family to fix their home, including leaking, roof, fences, outlook.
                    I can help family to fix their home, including leaking, roof, fences, outlook.
                </div>
            </div>
            <div style="padding: 3%;float:left;width: 94%;">
                <div class="button" style="color: white;background: rgb(25, 25, 182);">Apply Now</div>
                <div class="button">Save this Job</div>
                <div class="button">Report Job</div>
            </div>
            <div>
                <div style="font-size: 23px;margin: 0% 5% 2% 8%">Work History</div>
                <div style="width: 100%;">
                    <div :class="jobs_class" @click="change_type(1)">Completed jobs (58)</div>
                    <div :class="projects_class" @click="change_type(2)">In progress (20)</div>

                    
                    <div style="padding: 5%;float:left;width:90%;color: gray;" v-show="history==1">
                        <div style="color: black;font-size: 19px">Graham Repair Est</div>
                        <div style="margin: 3% 0%;">Nov 2 2023 - Nov 16 2023</div>
                        <div style="margin: 6% 0% 3% 0%;">No feedback given</div>
                        <div>Private</div>
                        <hr style="width: 100%;">
                    </div>
                    <div style="padding: 5%;float:left;width:90%;color: gray;" v-show="history==2">
                        <div style="color: black;font-size: 19px">Xichu Repair Est</div>
                        <div style="margin: 3% 0%;">Feb 2 2024 - furture</div>
                        <div style="margin: 6% 0% 3% 0%;">Very good, the job is finishing very fast</div>
                        <div>Private</div>
                        <hr style="width: 100%;">
                    </div>
                </div>
            </div>
        </div>
        <div id="recommendbody">
            Recommended For You
            <div style="position: relative;">
                <img @click="move(-1)" class="leftright left-arrow" src="@/../picture/left.png">
                <div class="swiper-container">
                    <div class="image-container" :style="containerStyle">
                        <div v-for="item in recommend" :key="item" class="recommend">
                            <div style="width: 48%;float:left;margin-right:4%;">
                                <img src="@/../picture/image1.jpg" style="width: 100%;">
                                <div>
                                    <img src="@/../picture/profile.png" id="recommendprofile">
                                    <div style="margin-top: 15px;font-size: 18px;float:left">Mark Recovery</div>
                                </div>
                                <div style="font-size: 18px;margin-top: 5%;width: 100%;float:left">
                                    I can help family to fix their home ...
                                </div>
                                <div style="font-size: 20px;margin-top: 5%;float:left">
                                    From 30 - 50 $
                                </div>
                            </div>
                            <div style="width: 48%;float:left;">
                                <img src="@/../picture/image1.jpg" style="width: 100%;">
                                <div>
                                    <img src="@/../picture/profile.png" id="recommendprofile">
                                    <div style="margin-top: 15px;font-size: 18px;float:left">Mark Recovery</div>
                                </div>
                                <div style="font-size: 18px;margin-top: 5%;width: 100%;float:left">
                                    I can help family to fix their home ...
                                </div>
                                <div style="font-size: 20px;margin-top: 5%;float:left">
                                    From 30 - 50 $
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img @click="move(1)" class="leftright right-arrow" src="@/../picture/right.png">
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            images: [
                require('@/../picture/image1.jpg'),
                require('@/../picture/image2.jpg'),
                require('@/../picture/image3.jpg'),
            ],
            jobs_class: "type_clicked",
            projects_class: "type",
            history: 1,

            currentIndex: 0,
            recommend: ["111", "222", "333"],
        };
    },
    computed: {containerStyle() {return { transform: `translateX(${-100 * this.currentIndex}%)` };},},
    methods: {
        change_type(click){
            if(click==1){
                this.projects_class = "type"
                this.jobs_class = "type_clicked"
                this.history = 1
            }
            else if(click==2){
                this.jobs_class = "type"
                this.projects_class = "type_clicked"
                this.history = 2
            }
        },
        move(direction) {
            this.currentIndex += direction;
            if (this.currentIndex < 0) this.currentIndex = 0;
            else if (this.currentIndex >= this.recommend.length) this.currentIndex = this.recommend.length - 1;
        },
        images_move(direction) {
            this.currentIndex += direction;
            if (this.currentIndex < 0) this.currentIndex = 0;
            else if (this.currentIndex >= this.images.length) this.currentIndex = this.images.length - 1;
        },
    },
}
</script>

<style scoped>
.swiper-container {
    width: 100%;
    overflow: hidden;
}

.image-container {
    display: flex;
    transition: transform 0.5s ease;
}

.leftright {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    z-index: 10;
    background: white;
    border-radius: 50%;
    padding: 1%;
    height: 40px;
    width: 40px;
}

.left-arrow { left: -6%; }
.right-arrow { right: -6%; }

.recommend {
    width: 100%;
    flex-shrink: 0;
}

#recommendbody{
    padding: 6%;
    background: rgb(228, 228, 228);
    float: left;
    width: 88%;
    font-size: 23px;
}

#recommendprofile {
    float: left;
    width: 45px;
    height: 45px;
    border-radius: 50px;
    overflow: hidden;
    object-fit: cover;
    object-position: center;
}

#picture{
    width: 100%;
    height: 300px;
    overflow: hidden;
}

#profile {
    float: left;
    width: 80px;
    height: 80px;
    border-radius: 50px;
    overflow: hidden;
    object-fit: cover;
    object-position: center;
}

#main_body div{
    float:left;
    width: 100%;
    margin-bottom: 3%;
}

.button{
    margin-bottom: 3%;
    width: 100%;
    text-align: center;
    font-size: 23px;
    background: rgb(220, 220, 220);
    padding: 2% 0%;
    border-radius: 7px;
}

.type{
    width: 48%;
    float: left;
    text-align: center;
    margin-left: 1%;
    padding: 2% 0%;

    border-bottom: 3px solid rgb(160, 160, 160);
    color: rgb(85, 85, 85);
}

.type_clicked{
    width: 48%;
    float: left;
    text-align: center;
    margin-left: 1%;
    padding: 2% 0%;

    border-bottom: 3px solid rgb(0, 0, 0);
    color: rgb(0, 0, 0);
    font-weight: 600;
}

#box{
    width: 80%;
    margin: 4%;
    background: rgb(234, 234, 234);
    float: left;
    padding: 6%;
}
</style>