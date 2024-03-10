<template>
    <div>
        <div style="width: 96%;padding: 2%;background: rgb(230, 230, 230);float: left;">
            <div class="white_box">
                <div style="width: 100%;float:left;">
                    <img src="@/../picture/profile.png" id="profile">
                    <div style="float:left;font-size:25px;margin: 5% 2%">Mark Recovery</div>
                    <div style="float:right;font-size:22px;margin: 6% 2%;color:blue">Edit</div>
                </div>
                <div style="width: 100%;float:left;margin-top:5%;font-size: 28px;">
                    Rating:
                    <div style="float:right;width: 10%">0</div>
                    <img src="@/../picture/star.png" style="width: 8%;float:right;">
                </div>
                <div style="width: 100%;float:left;margin-top:5%;font-size: 28px;">
                    Inbox
                    <div style="float:right;color:blue;font-size: 20px">View all</div>
                </div>
            </div>
            <div class="white_box" style="margin-top: 3%;">
                <div style="width: 100%;float:left;">
                    <div style="float: left;">{{ order_list[order_index] }} order - {{ order_list_number[order_index] }}</div>
                    <div class="scroll">{{ order_list[order_index] }}</div>
                    <div id="scroll_list">
                        <div v-for="(order,index) in order_list" :key="index" class="order_list">
                            {{ order }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                order_list: ["Active", "Completed", "Canceled"],
                order_list_number: [5, 13, 2],
                order_index: 0,
            }
        },
    }
</script>

<style scoped>
#profile {
    float: left;
    width: 70px;
    height: 70px;
    border-radius: 50px;
    overflow: hidden;
    object-fit: cover;
    object-position: center;
}

.white_box{
    width: 90%;
    background: white;
    padding: 5%;
    float: left;
    font-size: 25px;
}

.scroll{
    padding: 1% 0%;
    border: 1px solid;
    float: right;
    font-size: 20px;
    width: 35%;
    text-align: center;
    border-radius: 2px;
}

#scroll_list{
    position: absolute;
    width: 32.2%;
    right: 5%;
    margin-top: 9%;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
    border: 1px solid rgb(197, 197, 197);
}

.order_list{
    padding: 5% 0%;
    float: right;
    font-size: 20px;
    width: 100%;
    text-align: center;
    background: white;
    transition: background-color 0.5s ease;
}

.order_list:hover{
    background: rgb(206, 206, 206);
}
</style>