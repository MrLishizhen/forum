<template>
	<div class="default">
		<headers></headers>
		<div class="default-box">
			<div class="default-content">
				<div class="default-content-left">
					<div class="user">
						<div class="right-login-top">
							<img src="../../assets/face.jpg" alt="">
							<h3>{{defaults.nickName}}</h3>
						</div>
						<div class="right-login-bom">
							<ul>
								<li>个人简介：</li>
								<li class="profiles"
								    v-text="defaults.profiles==''?'这家伙很懒，什么都没留下。':defaults.profiles">

								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="default-content-content">
					<div class="default-content-content-top">
						<h3 v-text="defaults.title"></h3>
						<div class="title-div">
							<span v-text="defaults.nickName" style="font-size:16px; color:#0088ff;"></span>
							<span v-text="_date(defaults.date)" style="font-size:14px;margin-left:15px;"></span>
						</div>
					</div>
					<div class="content ql-editor" v-html="defaults.content"></div>


					<!--评论区-->
					<div class=""></div>
				</div>
			</div>
			<div class="footer"></div>

		</div>
	</div>
</template>

<script type="text/ecmascript-6">
        import cookie from 'js-cookie';
        import headers from '../../components/herder.vue';

        export default {
                data(){
                        return {
                                id: 0,
                                userID: 0,
                                defaults: {},
                        }
                },

                components: {
                        headers
                },
                mounted(){
                        this.id = parseInt(this.$route.query.pId);
                        this.userID = parseInt(this.$route.query.userID);
                        this.$http({url: 'api/default/default', data: {id: this.id, userID: this.userID}}).then(res =>{
                                this.defaults = res.data;
                        })
                },
                methods: {
                        _date(date){
                                if(!date){
                                        return;
                                }
                                //获取T，Z的下标
                                let T_pos = date.indexOf('T');
                                let Z_pos = date.indexOf('Z');
                                let year = date.substr(0, T_pos);
                                let hour = date.substr(T_pos + 1, Z_pos - T_pos - 1);

                                let newDate = year + ' ' + hour;
                                let dateDefault = new Date(Date.parse(newDate));
                                dateDefault = dateDefault.getTime();

                                dateDefault = dateDefault / 1000;

                                dateDefault = dateDefault + 8 * 60 * 60;
                                let dateNew = new Date(parseInt(dateDefault) * 1000).toLocaleString();
				console.log(dateNew);
                                return dateNew;
                        },
                }
        };
</script>

<style scoped>
	.footer{
		height:60px;
		flex-shrink: 0;
	}
	.content{
		min-height: 600px!important;
	}
	.content img{
		width: 600px !important;
	}
	.user{
		padding:20px;
		background-color: #fff;
	}
	.profiles{
		text-align: center;
		color:#ccc;
	}
	.right-login-top h3 {
		margin-left: 15px;
		font-weight:400;
	}
	.right-login-bom {
		height: 60px;
		padding-top: 10px;
	}

	.right-login-top {
		height: 40px;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.right-login-top h3 {
		margin-left: 15px;
	}

	.content{
		padding:15px;
	}
	.default{
		background-color: #f6f6f6;
		height:100%;
		display:flex;
		flex-direction: column;
	}
	.title-div{
		padding:0 20px;
		text-align: right;
	}
	.default-content-content-top h3 {
		font-size: 22px;
		text-align: center;
		font-weight: 500;
	}

	.default-content-content-top {
		height: 80px;
		padding: 10px;
		border-bottom:1px solid #e0e0e0;
	}

	.default-box {
		padding-top: 15px;
		overflow:auto;
		flex-grow: 1;
		display:flex;
		flex-direction: column;
	}

	.default-content {
		width: 1300px;
		margin: 0 auto;
		flex-grow: 1;
		/*background-color: #9a6e3a;*/
		display: flex;
	}

	.default-content-left {
		width: 250px;
		flex-shrink: 0;
		margin-right: 15px;

	}

	.default-content-content {
		flex-grow: 1;
		width: 1028px;
		background-color: #fff;
	}

</style>