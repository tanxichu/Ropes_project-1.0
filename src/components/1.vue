<template>
    <div>
        <div id="body">
            Recommended For You
            <div style="position: relative;">
                <img @click="move(-1)" class="leftright left-arrow" src="@/../picture/left.png">
                <div class="swiper-container">
                    <div class="image-container" :style="containerStyle">
                        <div v-for="item in images" :key="item" class="recommend">
                            <img :src="item" id="picture">
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
            currentIndex: 0,
            images: [
                require('@/../picture/image1.jpg'),
                require('@/../picture/image2.jpg'),
                require('@/../picture/image3.jpg'),
            ],
        };
    },
    computed: {containerStyle() {return { transform: `translateX(${-100 * this.currentIndex}%)` };},},
    methods: {
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

#picture{
    width: 100%;
    height: 300px;
    overflow: hidden;
}
</style>
