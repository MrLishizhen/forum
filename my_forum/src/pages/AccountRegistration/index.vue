<template>
	<div class="ar">
		<div class="ar-box">
			<div class="ar-box-top">
				<h3>欢迎来到注册页</h3>
			</div>
			<div class="ar-box-bom">
				<div class="login-item">
					<div class="login-item-left">
						<span>昵称：</span>
					</div>
					<div class="login-item-right">
						<input type="text" placeholder="昵称 ~ 5-10字符" v-model="dataList.nickName"
						       @change="_nickName">
						<i class="b iconfont icon-bitian"></i>
					</div>
				</div>
				<div class="login-item">
					<div class="login-item-left">
						<span>密码：</span>
					</div>
					<div class="login-item-right">
						<input type="password"  maxlength="16" placeholder="请输入密码 ~ max16"
						       v-model="dataList.password" @change="_password">
						<i class="b iconfont icon-bitian"></i>
					</div>
				</div>
				<div class="login-item">
					<div class="login-item-left">
						<span>请确认密码：</span>
					</div>
					<div class="login-item-right">
						<input type="password" maxlength="16" placeholder="请确认密码" v-model="dataList.pwd" @change="_pwd">
						<i class="b iconfont icon-bitian"></i>
					</div>
				</div>

				<div class="login-item">
					<div class="login-item-left">
						<span>性别：</span>
					</div>
					<div class="login-item-right login-item-radio">
						<input type="radio" name="sex" value="0" checked="checked"
						       v-model="dataList.sex">男
						<input type="radio" name="sex" value='1' v-model="dataList.sex">女
						<i class="b iconfont icon-bitian"></i>
					</div>
				</div>

				<div class="login-item">
					<div class="login-item-left">
						<span>电话：</span>
					</div>
					<div class="login-item-right">
						<input type="text" placeholder="电话 ~ 用于找回密码" @change="_phone" v-model="dataList.phone">
						<i class="b iconfont icon-bitian"></i>
					</div>
				</div>
				<div class="login-item">
					<div class="login-item-left">
						<span>email：</span>
					</div>
					<div class="login-item-right">
						<input type="text" placeholder="邮箱地址" v-model="dataList.email" @change="_email">
						<i class="b iconfont icon-bitian"></i>
					</div>
				</div>
				<div class="login-error" v-text="error">

				</div>
				<div class="login-btm-box">
					<div class="login-btm" @click="_ar">注册</div>
				</div>
				<div class="xieyi-box">
					<div class="xieyi-box-top">
						<router-link to="/login" style="color:#0086ff">登录</router-link>
						<span>注册前阅读此协议</span>
					</div>

				</div>
			</div>
		</div>
	</div>
</template>

<script type="text/ecmascript-6">
	import axios from 'axios';
        export default {
                data(){
                        return {
                                dataList: {
                                        nickName: '',//昵称
                                        sex: "0",//性别
                                        password: '',//密码
                                        phone: '',//手机号
                                        email: '',//邮箱
                                        pwd: '',//确认密码
                                },
                                error: '',
                        }
                },
                methods: {
                        _funcLength(obj,text,min,max){
                                if(obj.length<min||obj.length>max){
                                        this.error=`请注意${text}的字数范围`
                                }else{
                                        this.error='';
                                }

                        },
	                _ajaxDataList(key,name,value){
                                let data = {};
                                data[key] = value;
                                axios({
                                        method: 'post',
                                        url: '/api/user/login/ar',
                                        data: data
                                }).then(result=>{
                                        if(result.status===200){
                                                let res = result.data.message;
                                                res === "no" ? this.error=`该${name}已经存在`:this.error='';
                                        }
                                });
	                },
	                _nickName(){
                                //解决长度问题
                                this._funcLength(this.dataList.nickName,'昵称',5,10);
                                //判断用户昵称是否存在
		                if(this.error===''){
                                        this._ajaxDataList("nickName","昵称",this.dataList.nickName);
		                }

	                },
			_password(){
	                        //判断密码的长度
				if(this.dataList.password.length<=8){
				        this.error='请注意密码的长度';
				}else{
				        this.error='';
				}
			},
                        _pwd(){
			        this.error='';
			        console.log(1);
			        if(!(this.dataList.password==this.dataList.pwd)){
			                this.error = '两次密码不一致';
			        }else{
                                        this.error='';
			        }
                        },
	                _phone(){
                                let  phone = this.dataList.phone;
                                if(!(/^1(3|4|5|6|7|8|9)\d{9}$/.test(phone))){
                                        this.error='手机号格式不正确';
                                        return false;
                                }else{
                                        this.error='';
                                }
                        },
	                _email(){
                                let email = this.dataList.email;
                                if(!/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/.test(email)){
                                        this.error='邮箱地址不正确';
                                        return false;
                                }else{
                                        this.error='';
                                }

	                },
                        getNowTime() {
                                let date = new Date();
                                this.year = date.getFullYear();
                                this.month = date.getMonth() + 1;
                                this.date = date.getDate();
                                this.hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                                this.minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                                this.second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
                                this.milliSeconds = date.getMilliseconds();
                                let currentTime = this.year+'-'+this.month + '-' + this.date + ' ' + this.hour + ':' + this.minute + ':' + this.second + '.' + this.milliSeconds;
                                return currentTime;
                        }
	                ,
	                //用户注册
                        _ar(){
				if(this.dataList.nickName!==''&&this.dataList.password!==''&&this.dataList.email&&this.dataList.phone!==''){
				        let data={
				                nickName:this.dataList.nickName,
					        password:this.dataList.password,
					        email:this.dataList.email,
					        phone:this.dataList.phone,
//						date:this.getNowTime(),
					        sex:this.dataList.sex,
				        };
				        this.$http({url:'/api/user/login/addUser',data:data}).then(res=>{
						if(res.data=='ok'){
						        this.$router.push('/login');
						}
				        })
				}
                        }

                }
        };
</script>

<style scoped>
	.ar {
		background:url(../../assets/timg.jpg);
		position: absolute;
		width: 100%;
		height: 100%;

	}

	.ar-box {
		width: 600px;
		padding: 40px;
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		border: 1px solid #e0e0e0;
		border-radius: 5px;
		background-color: #fff;
	}

	.ar-box-top {
		height: 50px;
		line-height: 50px;
		text-align: center;
	}

	.ar-box-bom {
		padding: 10px;
	}

	.login-item {
		height: 40px;
		display: flex;
		margin-top: 10px;
	}

	.login-item-left {
		text-align: center;
		width: 20%;
		flex-shrink: 0;
		line-height: 40px;
	}

	.login-item-right {
		flex-grow: 1;
		line-height: 40px;
		border: 1px solid #e0e0e0;
		border-radius: 5px;
		position: relative;
	}

	.login-item-right input {
		border: 0;
		outline: 0;
		padding-left: 10px;
		color: #666;
		width: 100%;
		box-sizing: border-box;
	}

	.login-item-radio input {
		width: auto;
	}

	.login-item-radio {
		border: 0;
		padding-left: 20px;
	}

	.b {
		position: absolute;
		top: 50%;
		transform: translateY(-50%);
		right: -15px;
		color: red;
		height: 14px;
		width: 14px;
		line-height: 14px;
		text-align: center;
	}

	.login-btm-box {
		height: 40px;
		margin-top: 20px;
		margin-bottom: 15px;

	}

	.login-btm {
		cursor: pointer;
		width: 50%;
		height: 100%;
		line-height: 40px;
		margin: 0 auto;
		text-align: center;
		background-color: #0084ff;
		color: #fff;
		border-radius: 5px;
	}

	.xieyi-box {
		height: 18px;
		line-height: 18px;
		font-size: 14px;
		cursor: pointer;
	}

	.xieyi-box-top {
		text-align: right;
	}

	.login-error {
		margin-top: 10px;
		line-height: 30px;
		color: red;
		height: 30px;
		font-size: 12px;

	}
</style>