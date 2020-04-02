<template>
	<div class="header">
		<div class="header-content">
			<div class="logo">
				<router-link class="logo-a" to="/home">内部论坛</router-link>
			</div>
			<div class="home">
				<ul class="home-ul">
					<li class="home-li">
						<router-link to="/home">首页</router-link>
					</li>

				</ul>
				<search></search>
			</div>
			<div class="logins">
				<div class="login-first" v-if="!login">
					<router-link to="/login">登录</router-link>
					<span>|</span>
					<router-link to="/ar">注册</router-link>
				</div>
				<div class="login-last" v-else>
					<img src="../assets/face.jpg" alt="" @click="show">
					<ul class="login-last-box" v-show="isShow">
						<li>
							<router-link to="#">我的主页</router-link>
						</li>
						<li @click="$emit('outLogin')">
							退出登录
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</template>

<script type="text/ecmascript-6">
	import search from './search.vue'
        export default {
	        data(){
	                return {
	                        isShow:false,
	                }
	        }
	        ,
	        components:{
	                search
	        },
	        props:['login'],
	        methods:{
	                show(){
				this.isShow=!this.isShow;
	                }
	        }
        };
</script>

<style scoped>
	.header {
		height: 50px;
		box-shadow: 3px 3px 3px #ccc;
		background-color: #fff;
	}

	.header-content {
		width: 1100px;
		height: 100%;
		margin: 0 auto;
		display: flex;
	}

	.logo {
		width: 150px;
		height: 100%;
		line-height: 50px;
		font-weight: 700;
		flex-shrink: 0;
		text-align: center;
	}

	.logo > a {
		font-size: 18px;
	}
	.home{
		flex-grow: 1;
		display:flex;
		align-items: center;
		/*border-right:1px solid #ccc;*/
	}
	.search{
		width:300px;
		flex-shrink: 0;
	}
	.home-ul{
		flex-grow: 1;
		display:flex;
		justify-content: flex-end;
		align-items: center;
		padding-right: 20px;
	}
	.home-ul .home-li{
		text-align: center;
		/*width:100px;*/
		height:100%;
		padding:10px 20px;
		/*line-height: 50px;*/
		margin-left:10px;

	}
	.home-ul .home-li a{
		color:#333;
		font-size:16px;
	}
	.home-ul .home-li:hover a{
		color:#0088ff;
	}
	.logins{
		width:150px;
		height:100%;
		flex-shrink: 0;
	}
	.login-first{
		display:flex;
		align-items: center;
		height:100%;
	}
	.login-first a{
		padding:0 10px;
		font-size:16px;
	}
	.login-last{
		height:100%;
		/*text-align:center;*/
		display:flex;
		justify-content: center;
		align-items: center;
		position:relative;


	}
	.login-last-box{
		position:absolute;
		bottom: -100px;
		width:100px;
		padding:5px;
		z-index:15;
		border:1px solid #e0e0e0;
		border-radius: 5px;
		background-color: #fff;
	}
	.login-last-box li{
		height:40px;
		line-height:40px;
		text-align: center;
		color:#333;
		font-size:14px;
		cursor: pointer;
	}
	.login-last-box li:hover{
		background-color: #f6f6f6;
	}
</style>