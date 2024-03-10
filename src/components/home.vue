
<template>
    <div style="">
        <div style="padding: 20% 5% 10% 5%;float: left;width: 90%;background: rgb(0, 99, 0);color: white;font-size: 30px;">
            <strong style="margin-bottom: 20px;float: left;">Find the best worker to design your house!</strong>
            <input style="font-size: 18px;padding: 10px 20px;width: 73.8%;" placeholder="Search up for any service...">
            <router-link to="/list/" style="float: right;background: rgb(60, 193, 4);width: 10%;padding: 1.2% 2%;">
                <img src="@/../picture/Search.png" style="float:right;width: 100%;">
            </router-link>
            <div style="font-size: 13.5px;float: left;margin: 10px 15px 10px 0px;" v-for="word in category" :key="word">
                <div style="border: solid white 1px;float: left;padding: 1% 5%;border-radius: 40px;width: 100%;">
                    {{ word }}
                </div>
            </div>
        </div>
        <div style="margin-bottom: 5%;">
            <div style="font-size: 25px;margin: 5% 5% 2% 5%;float: left;">Popular services</div>
            <div class="swiper-container" ref="swiperContainer">
                <div class="image-container" :style="containerStyle">
                    <div v-for="(image, index) in images" :key="index" class="image-wrapper">
                        <img :src="image" :alt="'Image ' + (index + 1)">
                        <transition name="fade">
                            <div v-if="currentIndex === index" class="image-title">
                                {{ imageTitles[index] }}
                            </div>
                        </transition>
                    </div>
                </div>
            </div>
            <img @click="scrollLeft" class="leftright" src="@/../picture/left.png">
            <img @click="scrollRight" class="leftright" id="right-button" src="@/../picture/right.png">
        </div>
        <div style="padding: 5% 2%;background: burlywood;float: left;">
            <div style="float: left; width: 100%;">
                <img src="@/../picture/profile.png" style="float: right;width:55%;padding: 2.5%;background: white;">
            </div>
            <div style="font-size: 20px;padding: 6% 12%;float: left;font-family: serif;">
                <i>
                    This is the 
                    <b>best</b>
                    company that you can found on the internet, it helped me find worker a lot faster and easier!
                </i>
                <div style="margin-top: 5%;font-size: 18px;">
                    <b>John Dickson</b>
                    <div>Customer of AladdinCome</div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            currentIndex: 0,
            containerWidth: 0,
            category: ["Gardening fixing", "House fixing", "Car fixing", "Cleaning"],
            endings: ["For Clients", "For Talent", "Resources", "Company"],
            images: [
                require('@/../picture/image1.jpg'),
                require('@/../picture/image2.jpg'),
                require('@/../picture/image3.jpg'),
            ],
            imageTitles: [
                'House Repair',
                'Garden Service',
                'Roof Repair',
            ],
        };
    },
    computed: {
        containerStyle() {
            return {
                transform: `translateX(${-this.containerWidth * this.currentIndex}px)`,
            };
        },
    },
    mounted() {
        this.updateContainerWidth();
        window.addEventListener('resize', this.updateContainerWidth);
    },
    methods: {
        updateContainerWidth() {
            if(this.$refs.swiperContainer) {
                this.containerWidth = this.$refs.swiperContainer.clientWidth;
            }
        },
        scrollRight() {
            if (this.currentIndex < this.images.length - 1) {
                this.currentIndex++;
                this.$nextTick(() => {});
            }
        },
        scrollLeft() {
            if (this.currentIndex > 0) {
                this.currentIndex--;
                this.$nextTick(() => {});
            }
        },
    },
}
</script>

<style scoped>
.fade-enter-active, .fade-leave-active {transition: opacity .5s;}
.fade-enter, .fade-leave-to {opacity: 0;}

.image-title {
    position: absolute;
    top: 10%;
    left: 5%;
    transform: translateY(-50%);
    background: white;
    z-index: 2;
    padding: 2%;
    font-size: 25px;
}

.image-wrapper {
    position: relative;
    width: 100%;
    height: 100%;
}

.swiper-container {
    position: relative;
    width: 90%;
    overflow: hidden;
    left: 5%;
}

.image-container {
    display: flex;
    transition: transform 0.5s ease;
}

.image-container .image-wrapper img {
    height: 300px;
    object-fit: cover;
}

.leftright {
    width: 10%;
    position: absolute;
    top: 100%;
    transform: translateY(-50%);
    z-index: 2;
    background: white;
    border-radius: 50%;
    padding: 1%;
}
#right-button {right: 0%;}
</style>