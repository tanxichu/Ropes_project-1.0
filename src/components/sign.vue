<template>
    <div>
        <div style="padding: 5% 10%;float: left;width: 80%;" v-show="information==0">
            <div id="title">Join as a client or a freelancer</div>
            <div :class="box_class1" @click="switch_select(1)">
                <img src="@/../picture/client.jpg" style="width: 40%;margin-bottom: 5%;">
                <div style="font-size: 18px;">I'm a client, hiring for a project</div>
            </div>
            <div :class="box_class2" style="margin: 7% 0%;" @click="switch_select(2)">
                <img src="@/../picture/freelancer.jpg" style="width: 40%;margin-bottom: 5%;">
                <div style="font-size: 18px;">I'm a freelancer, looking for work</div>
            </div>
            <div style="margin-bottom: 5%;font-size: 15px;">
                Already have a account? Sign In
            </div>
            <div :id="account" @click="information=box">Create Account</div>
        </div>
        <div style="padding: 0% 10% 5% 4%;float: left;width: 86%;" v-show="information==1">
            <div style="margin-bottom: 5%;position: relative;" @click="reset()">
                <img src="@/../picture/left_arrow.png" style="width: 8%;float: left;">
                <div style="font-size: 20px;">Back</div>
            </div>
            <div style="padding-left: 8%;width: 92%;">
                <div id="title">Create a new account</div>
                <div style="margin-bottom: 10%;">Already have a account? Sign In</div>
                <div class="link">
                    <img src="@/../picture/google.png" style="width: 7%;float: left;margin: 0% 20% 0% 5%;">
                    Continue with Google
                </div>
                <div class="link">
                    <img src="@/../picture/email.png" style="width: 8%;float: left;margin: 0% 20% 0% 5%;">
                    Continue with Email
                </div>
            </div>
        </div>
        <div style="padding: 5% 7%;float: left;width: 86%;background: rgb(237, 245, 255);" v-show="information==2">
            <div style="background: white;width: 90%;padding: 5% 5%;float: left;">
                <div style="margin-bottom: 5%;position: relative;" @click="reset()">
                    <img src="@/../picture/left_arrow.png" style="width: 8%;float: left;">
                    <div style="font-size: 20px;">Back</div>
                </div>
                <div id="title" style="font-size: 25px;margin: 0% 0% 5% 25%;">Join as freelancer</div>
                <div style="padding: 0% 5%;width: 90%;">
                    <div class="user_information">
                        <div style="margin: 1px 0px;font-size: 15px;">Name</div>
                        <input class="input" placeholder="First and Last Name" v-model="username">
                        <div class="nothing" v-show="isusername">Please input your UserName!</div>
                    </div>
                    <div class="user_information">
                        <div style="margin: 1px 0px;font-size: 15px;">Email</div>
                        <input class="input" placeholder="Email" v-model="email">
                        <div class="nothing" v-show="isemail">Please input your Email!</div>
                    </div>
                    <div class="user_information">
                        <div style="margin: 1px 0px;font-size: 15px;">Phone Number</div>
                        <input class="input" placeholder="e.g. 12345678900" v-model="iphone">
                        <div class="nothing" v-show="isiphone">Please input your Phone Number!</div>
                    </div>
                    <div class="user_information">
                        <div style="margin: 1px 0px;font-size: 15px;">Language</div>
                        <div class="input" @click="show_language_list=!show_language_list">
                            <div style="float: left;width: 90%;">{{language}}</div>
                            <img src="@/../picture/down_arrow.png" style="width: 7%;">
                        </div>
                        <div style="position: absolute;width: 70%;z-index: 2;overflow: auto;height: 300px;" v-show="show_language_list">
                            <div v-for="list in language_list" :key="list" id="language_list" 
                            @click="language=list,show_language_list=false">{{ list }}</div>
                        </div>
                        <div class="nothing" v-show="islanguage">Please choose your Language!</div>
                    </div>
                    <div class="user_information">
                        <div style="margin: 1px 0px;font-size: 15px;">Description</div>
                        <textarea class="input" placeholder="Description" style="height: 100px;overflow: auto;"
                        v-model="description"></textarea>
                        <div class="nothing" v-show="isdescription">Please describe your personal Description!</div>
                    </div>
                    <div class="user_information">
                        <div style="margin: 1px 0px;font-size: 15px;">Password at least 10 characters</div>
                        <input class="input" placeholder="Password" v-model="password" type="password">
                        <div class="nothing" v-show="ispassword">Please input your Password!</div>
                    </div>
                    <div class="user_information">
                        <div style="margin: 1px 0px;font-size: 15px;">Address *private</div>
                        <input class="input" placeholder="Address" v-model="address">
                        <div class="nothing" v-show="isaddress">Please input your Address!</div>
                    </div>
                    <div class="user_information">
                        <div style="margin: 1px 0px;font-size: 15px;">Your Occupation</div>
                        <div class="input" @click="show_occupation_list=!show_occupation_list">
                            <div style="float: left;width: 90%;">{{occupation}}</div>
                            <img src="@/../picture/down_arrow.png" style="width: 7%;">
                        </div>
                        <div style="position: absolute;width: 70%;z-index: 2;overflow: auto;height: 300px;" v-show="show_occupation_list">
                            <div v-for="list in occupation_list" :key="list" id="language_list" 
                            @click="occupation=list,show_occupation_list=false">{{ list }}</div>
                        </div>
                        <div class="nothing" v-show="isoccupation">Please select your Occupation!</div>
                    </div>
                    <div class="user_information">
                        <div style="margin: 1px 0px;font-size: 15px;">Choose <b>two and five</b> of your best skills</div>
                        <div class="experience"> + Add experience</div>
                        <div class="nothing" v-show="isexperience">Please add your Experience!</div>
                    </div>
                    <div class="user_information">
                        <div style="margin: 1px 0px;font-size: 15px;">Vehicles</div>
                        <div class="input" @click="show_vehicle_list=!show_vehicle_list">
                            <div style="float: left;width: 90%;">{{vehicle}}</div>
                            <img src="@/../picture/down_arrow.png" style="width: 7%;">
                        </div>
                        <div style="position: absolute;width: 70%;z-index: 2;overflow: auto;height: 300px;" v-show="show_vehicle_list">
                            <div v-for="list in vehicle_list" :key="list" id="language_list" 
                            @click="vehicle=list,show_vehicle_list=false">{{ list }}</div>
                        </div>
                    </div>
                    <div class="user_information">
                        <div style="margin: 1px 0px;font-size: 15px;">Personal Website</div>
                        <input class="input" placeholder="Website Link" style="font-size: 13px;">
                    </div>


                    <div>Upload photos</div>


                    <div style="margin-bottom: 10%;">Already have a account? Sign In</div>
                    <div style="background: steelblue;color: white;border-radius: 5px;padding: 2% 40%;width: 20%;
                    font-size: 20px;" @click="join()">Join</div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            select: 0,
            account: "before_account",
            box_class1: "box",
            box_class2: "box",
            box: 0,
            information: 0,
            language_list: ["English","Chinese","Spanish","German","French","Arabic","Russian","Portuguese","Japanese",
                            "Hindi","Italian","Korean"],
            show_language_list: false,
            occupation_list: ["None","Plumbing","Carpentry","Drywall repair","Landscaping","Painting","HVAC","Art hanging",
                                "Door Hardware","Electrical work","Furniture","Gutter","Repair, Appliances","Electricity",
                                "Fix fences","Flooring","General maintenance","Handyman subcontractor","Power washing",
                                "Smart appliance setup","Building maintenance","Light fixture installation","Screen Repair",
                                "Tile replacement","Window cleaning"],
            show_occupation_list: false,
            vehicle_list: ["None","Normal Car","Truck","RV"],
            show_vehicle_list: false,
            vehicle: "Select Your Vehicle",

            username: "",
            isusername: false,
            email: "",
            isemail: false,
            iphone: "",
            isiphone: false,
            language: "Select One",
            islanguage: false,
            description: "",
            isdescription: false,
            password: "",
            ispassword: false,
            address: "",
            isaddress: false,
            occupation: "Select Your Occupation",
            isoccupation: false,
            experience: "",
            isexperience: false,
        }
    },
    methods:{
        join(){
            this.isusername = false
            this.isemail = false
            this.isiphone = false
            this.islanguage = false
            this.isdescription = false
            this.ispassword = false
            this.isaddress = false
            this.isexperience = false
            if(this.username==""){this.isusername = true}
            if(this.email==""){this.isemail = true}
            if(this.iphone==""){this.isiphone = true}
            if(this.language=="Select One"){this.islanguage = true}
            if(this.occupation=="Select Your Occupation"){this.isoccupation = true}
            if(this.description==""){this.isdescription = true}
            if(this.password==""){this.ispassword = true}
            if(this.address==""){this.isaddress = true}
        },
        switch_select(select_input){
            console.log(select_input)
            this.box=select_input
            if(this.box==1){
                this.box_class1 = "after_change_box"
                this.box_class2 = "box"
                this.account = "after_account"
            }else{
                this.box_class2 = "after_change_box"
                this.box_class1 = "box"
                this.account = "after_account"
            }
        },
        reset(){
            this.select = 0
            this.account = "before_account"
            this.box_class1 = "box"
            this.box_class2 = "box"
            this.box = 0
            this.information = 0
        }
    }
}
</script>

<style scoped>
#title{
    font-size: 27px;
    letter-spacing: -1px;
    font-family: Georgia, serif;
    margin-bottom: 5%;
}

.box{
    border: 2px solid rgb(225, 225, 225);
    padding: 5%;
    padding-bottom: 7%;
    width: 90%;
    border-radius: 10px;
}

.after_change_box{
    background: rgb(215, 255, 204);
    border: 2px solid green;
    padding: 5%;
    padding-bottom: 7%;
    width: 90%;
    border-radius: 10px;
}

#before_account{
    background: rgb(214, 214, 214);
    font-size: 23px;
    padding: 2% 23%;
    border-radius: 50px;
    float: left;
    width: 54%;
    border: 2px solid;
}

#after_account{
    background: rgb(72, 255, 40);
    font-size: 23px;
    padding: 2% 23%;
    border-radius: 50px;
    float: left;
    width: 54%;
    border: 2px solid;
}

.link{
    padding: 3% 25% 3% 0%;
    border: 2px solid rgb(203, 203, 203);
    border-radius: 7px;
    margin: 5% 0%;
}

.input{
    width: 96%;
    padding: 5% 2%;
    font-size: 17px;
    background: rgb(237, 245, 255);
    border: 2px solid rgb(204, 204, 204);
    border-radius: 5px;
    color: rgb(106, 106, 106);
}

.user_information{
    margin: 6% 0%;
    float: left;
    width: 100%;
}

.experience{
    color: rgb(123, 205, 0);
    border: 2px solid rgb(123, 205, 0);
    font-size: 15px;
    padding: 2.5% 5%;
    border-radius: 50px;
    width: auto;
    float: left;
}

.nothing{
    color: red;
    width: 100%;
    position: absolute;
    float: left;
    font-size: 15px;
}

#language_list{
    font-size: 19px;
    background: rgb(237, 245, 255);
    border: 1px solid rgb(218, 218, 218);
    padding: 4% 0%;
    width: 99%;
    text-align: center;
}
</style>