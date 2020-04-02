<template>
	<div class="login">
		<div class="login-box">
			<div class="login-top">
				<h3>内部论坛</h3>
			</div>
			<div class="login-bom">
				<div class="login-item">
					<div class="login-item-left">
						<span>账号：</span>
					</div>
					<div class="login-item-right">
						<input type="text" placeholder="手机号/姓名/昵称" v-model="userData.name">
					</div>
				</div>
				<div class="login-item">
					<div class="login-item-left">
						<span>密码：</span>
					</div>
					<div class="login-item-right">
						<input type="password" placeholder="请输入密码" v-model="userData.pwd">
					</div>
				</div>
				<div class="login-error" v-text="error">

				</div>
				<div class="login-btm-box">
					<div class="login-btm" @click="user">登录</div>
				</div>
				<div class="login-password">
					<router-link to="../ar">注册</router-link>
					<router-link to="">忘记密码？</router-link>
				</div>
			</div>
		</div>
	</div>
</template>

<script type="text/ecmascript-6">
	import cookie from 'js-cookie'
        export default {
		data(){
		        return {
		                userData:{
		                        name:'',
			                pwd:"",
		                },
			        error:''
		        }
		},
	        watch:{
		        'userData.name'(newValue){
		                if(newValue===''){
		                        this.userData.pwd='';
		                }
		        }
	        }
	        ,
	        methods:{
		        user(){
				if(this.userData.name!==''){
					if(this.userData.pwd!==''){
					        this.error='';
						this.$http({url:'/api/user/login/pwd',data:{name:this.userData.name,pwd:this.userData.pwd}}).then(res=>{
								if(res.message!==''){
								        this.error=res.message;

								}else{

                                                                        cookie.set('token',res.data);
                                                                        this.$router.replace('/home');
								}
						})
					}else{
					        this.error='请输入密码'
					}
				}else{
				        this.error='请输入账号';
				}
		        }
	        }

        };
</script>

<style scoped>
	.login {
		background:url(../../assets/timg.jpg);
		position: absolute;
		width: 100%;
		height: 100%;
		/*background-color: red;*/
	}

	.login-box {
		background-color: #fff;
		width: 400px;
		border-radius: 10px;
		padding: 20px 10px;
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		border: 1px solid #e0e0e0;
	}

	.login-top {
		text-align: center;
		height: 60px;
		line-height: 60px;
		color: #333;
	}

	.login-bom {
		padding: 10px;
	}

	.login-item {
		height: 40px;
		display: flex;
		margin-top: 5px;
	}

	.login-item-left {
		width: 15%;
		flex-shrink: 0;
		line-height: 40px;
	}

	.login-item-right {
		flex-grow: 1;
		line-height: 40px;
		border: 1px solid #e0e0e0;
		border-radius: 5px;
	}

	.login-item-right input {
		border: 0;
		outline: 0;
		padding-left: 10px;
		color: #666;
		width: 100%;
		box-sizing: border-box;
	}

	.login-error {
		margin-top: 10px;
		line-height: 30px;
		color: red;
		height: 30px;
		font-size: 12px;

	}

	.login-btm-box {
		height: 40px;
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

	.login-password {
		height: 40px;
		text-align: right;
		line-height: 40px;
	}

	.login-password > a {
		margin-left: 10px;
		color: #666;
	}

	.login-password > a:first-child {
		color: #0084ff;
	}
</style>