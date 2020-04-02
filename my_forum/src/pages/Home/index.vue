<template>
	<div class="home">
		<headers :login="login" @outLogin="outLogin"></headers>
		<div class="content hide-scroll-bar">
			<div class="bom-body">
				<div class="left-body">
					<ul class="left-body-ul">
						<li class="left-body-li" v-for="item in list" :key="item.id"
						    v-text="item.name" :class="{show:type==item.name?true:false}"
						    @click="_list(item.name,item.id)">
						</li>
					</ul>
				</div>
				<div class="bom-bom-body">
					<div class="new-body-list">
						<h3 style="padding:5px 5px;background-color: #e0e0e0; border-radius: 5px;">
							最新文章：</h3>
						<ul class="new-list-ul">
							<li class="new-list-li" v-for="(item,i) in newList" :key="i">
								<router-link :to='{path:"/default",query:{pId:item.id,userId:item.userID}}' class="new-list-li-a"
								             v-text="item.title"></router-link>
								<div class="new-list-box">
									<span v-text="item.nickName"
									      class="user"></span>
									<span v-text="item.date" class="date"></span>
								</div>
							</li>
						</ul>
					</div>
					<div class="body-list">
						<h3 style="padding:5px 5px;background-color: #e0e0e0; border-radius: 5px;">
							文章：</h3>
						<ul class="new-list-ul">
							<li class="new-list-li" v-for="(item,i) in List" :key="i">
								<router-link :to='{path:"/default",query:{pId:item.id,userId:item.userID}}' class="new-list-li-a"
								             v-text="item.title"></router-link>
								<div class="new-list-box">
									<span v-text="item.categoryName"
									      class="user"></span>
									<span v-text="item.date" class="date"></span>
								</div>
							</li>
							<li class="show" v-show="show">没有更多了呢！！！</li>

						</ul>
						<div class="pagination">
							<el-pagination
								background
								:page-size="20"
								layout="prev, pager, next, jumper"
								:total="total"
								@current-change="_currentChange"
							>
							</el-pagination>
						</div>
					</div>
				</div>
				<div class="right-body">
					<div class="right-login" v-if="login">
						<div class="right-login-top">
							<img src="../../assets/face.jpg" alt="">
							<h3>{{user.nickName}}</h3>
						</div>
						<div class="right-login-bom">
							<ul>
								<li>
									<span>积分：</span>
									<span v-text="user.integral"></span>
								</li>
								<li class="profiles"
								    v-text="user.profiles==''?'这家伙很懒，什么都没留下。':user.profiles">
								</li>
							</ul>
							<router-link to="/posting" class="addUrl">发布文章</router-link>
						</div>
					</div>
				</div>
			</div>
			<div class="footer">
				<div class="footer-box">
					<p>公告：本论坛暂时只供内部使用，请各位遵守使用规则</p>
					<ul>
						<li>1.不要发布没有价值的内容</li>
						<li>2.请把内容放到特定分类中，方便各位浏览和回答</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</template>

<script type="text/ecmascript-6">
        import cookie from 'js-cookie';
        import headers from '../../components/herder.vue';

        export default {
                name: 'home',
                components: {headers},
                data(){
                        return {
                                show: false,
                                total: 0,//分页总数
                                type: 'HTML',
                                login: false,
                                list: [],//列表
                                user: [],
                                List: [],//内容列表
                                newList: [],//最新文章
                                ListData: {type: 1, begin: 0, count: 20}
                        }
                },
                created(){
                        //判断有没有cookie 判断用户是否登录
                        cookie.get('token')?this.login = true:this.login = false;
                        if(cookie.get('token')){
                                this.$http({url: 'api/posting/UersrId'}).then(res =>{
                                        this.user = res.data[0];
                                })
                        }
                        //获取模块分类
                        this.$http({url: 'api/list/taber'}).then(results =>{
                                this.list = results.data;

                        });
                        //获取最新的文章列表
                        this.$http({url: 'api/list/newList'}).then(res =>{
                                if(res.status == 200){
                                        this.newList = res.data;
                                        this.newList.forEach(item =>{
                                                let time = item.date;
                                                item.date = this.date(time);
                                        })
                                }
                        })

                        //获取初始值获取文章列表
                        this._listData();

                },
                methods: {
                        _listData(){
                                this.$http({
                                        url: 'api/list/list',
                                        data: {
                                                type: this.ListData.type,
                                                begin: this.ListData.begin,
                                                count: this.ListData.count
                                        }
                                }).then(res =>{
                                        this.List = res.data.list;
                                        this.total = res.data.total;
                                        this.List.forEach(item =>{
                                                let time = item.date;
                                                item.date = this.date(time);
                                        });
                                        if(this.List.length < 20){
                                                console.log(1);
                                                this.show = true;
                                        }

                                })


                        },
                        _currentChange(i){
                                this.ListData.begin = i * this.ListData.count - this.ListData.count;
                                this.ListData.count = i * 20;
                                this._listData();


                        },
                        date(date){
                                //获取T，Z的下标
                                let T_pos = date.indexOf('T');
                                let Z_pos = date.indexOf('Z');

                                let year = date.substr(0, T_pos);
                                let hour = date.substr(T_pos + 1, Z_pos - T_pos - 1);

                                let newDate = year + ' ' + hour;
                                let dateDefault = new Date(Date.parse(newDate));
                                dateDefault = dateDefault.getTime();

                                dateDefault = dateDefault / 1000

                                dateDefault = dateDefault + 8 * 60 * 60;
                                let dateNew = new Date(parseInt(dateDefault) * 1000).toLocaleDateString();
                                return dateNew;
                        },
                        outLogin(){
                                this.login = !this.login;
                                cookie.remove('token');
                        },
                        _list(name, i = 1){
                                this.type = name;
                                this.ListData.type=i;
                                this._listData();
                        }
                }

        };
</script>

<style scoped>
	.addUrl{
		display:block;
		width:50%;
		height:40px;
		line-height:40px;
		margin: 0 auto;
		text-align: center;
		margin-top:10px;
		background-color: #0088ff;
		color:#fff;
		border-radius: 10px;
	}
	.show {
		margin-top: 10px;
		font-size: 12px;
		color: #ccc;
		text-align: center;
	}

	.body-list > ul {
		flex-grow: 1;
	}

	.body-list > h3 {
		flex-shrink: 0;
	}

	.pagination {
		height: 60px;
		flex-shrink: 0;
	}

	.body-list {
		min-height: 600px;
		padding: 15px;
		display: flex;
		flex-direction: column;
	}

	.new-list-box span.date {
		color: #999;
		font-size: 12px;
	}

	.new-list-box span.user {
		font-size: 14px;
		cursor: pointer;
		color: #999;
	}

	.new-list-box {
		display: flex;
		padding: 0 15px;
		justify-content: space-between;
		align-items: center;
		flex-grow: 1;
	}

	.new-list-li-a:hover {
		color: #0088ff;
	}

	.new-list-li-a {
		width: 400px;
		padding-right: 15px;
		font-size: 16px;
		color: #666;
		flex-shrink: 0;
	}

	.new-list-li {
		display: flex;
		padding: 8px 0;
	}

	.new-list-ul {
		padding: 10px;
	}

	.new-body-list {
		padding: 15px;

	}

	.footer-box ul {

		margin-left: 20px;
	}

	.footer-box li {
		font-size: 14px;

	}

	.footer-box {
		padding: 20px;
		width: 900px;
		margin: 0 auto;
		color: #fff;
		text-align: center;

	}

	.footer {
		height: 100px;
		background-color: #0088ff;
		margin-top: 15px;
	}

	.left-body-ul li.show {
		color: #fff;
		background-color: #0088ff;
		border-radius: 20px;
	}

	.home {
		height: 100%;
		display: flex;
		flex-direction: column;
	}

	.header {
		flex-shrink: 0;
	}

	.content {
		flex-grow: 1;
		/*overflow:hidden;*/
		overflow: auto;
		margin-top: 5px;
		background-color: #f6f6f6;
		/*background-color: #f0f0f0;*/
	}

	.bom-body {

		display: flex;
		width: 1200px;
		margin: 0 auto;
		background-color: #f6f6f6;
		margin-top: 5px;
	}

	.left-body {
		width: 150px;
		flex-shrink: 0;

		background-color: #fff;
		margin-right: 15px;
		height: 330px;
		padding: 10px;
	}

	.bom-bom-body {
		flex-grow: 1;
		background-color: #fff;
		min-height: 900px;
		border-radius: 5px;
	}

	.right-body {
		width: 250px;
		flex-shrink: 0;
		margin-left: 15px;
	}

	.left-body-ul {

	}

	.left-body-ul li {
		width: 150px;
		height: 40px;
		line-height: 40px;
		text-align: center;
		cursor: pointer;
		margin-bottom: 5px;

	}

	.left-body-ul li:hover {
		color: #fff;
		background-color: #94cdff;
		border-radius: 20px;
	}

	.right-login {
		height: 140px;
		margin-top: 10px;
		padding: 20px 10px;
		background-color: #fff;

	}

	.right-login-top {
		height: 40px;
		display: flex;
		align-items: center;
	}

	.right-login-top h3 {
		margin-left: 15px;
	}

	.right-login-bom {
		height: 60px;
		padding-top: 10px;
	}

	.profiles {
		color: #ccc;
	}
</style>