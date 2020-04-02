<template>
	<div class="posting">
		<headers :login="login" @outLogin="outLogin" style="flex-shrink: 0"></headers>
		<div class="posting-bom">
			<div class="posting-top">
				<div class="posting-plate">
					<span>选择板块：</span>
					<select class="select" v-model="select">

						<option :value="item.id" v-for="item in titleList"  :key="item.id">{{item.name}}</option>
					</select>
				</div>
				<div class="posting-title">
					<span>输入标题：</span>
					<input type="text" placeholder="请输入标题,10字以上" v-model="title">
				</div>
			</div>
			<div class="posting-content">
				<el-upload
					class="avatar-uploader"
					:action="serverUrl"
					name="img"
					:show-file-list="false"
					:on-success="uploadSuccess"
					:on-error="uploadError"
					accept=".jpg,.png,.jpeg,.gif"
					:before-upload="beforeUpload">
				</el-upload>
				<!--富文本编辑器组件-->
				<el-row v-loading="quillUpdateImg">
					<quill-editor
						v-model="content"
						ref="myQuillEditor"
						:options="editorOption"
					>
					</quill-editor>
				</el-row>

			</div>
			<button class="btm" @click="postingBtm">提交</button>
			<p v-text="contentLength" style="text-align:right;color:#ccc;padding-bottom: 5px;font-size:14px;"></p>
		</div>
		<div class="footer">

		</div>
	</div>

</template>

<script type="text/ecmascript-6">

        import { quillEditor } from 'vue-quill-editor';
        import {addQuillTitle} from '../../assets/quill-title.js'
        import cookie from 'js-cookie';
        import headers from '../../components/herder.vue'





        export default {
                data(){
                        return {
                                userId:null,
                                select:'1',
                                title:'',
                                titleList:[],//保存的板块
                                quillUpdateImg: false, // 根据图片上传状态来确定是否显示loading动画，刚开始是false,不显示
                                serverUrl: '/api/posting/upload',  // 这里写你要上传的图片服务器地址
                                model: '',
                                content:'',
	                        url:'',
	                        imgs:[],
                                editorOption: {
                                        modules: {

                                                toolbar: {
                                                        container: [['bold', 'italic', 'underline', 'strike'], //加粗，斜体，下划线，删除线
                                                                ['blockquote', 'code-block'],  //引用，代码块
                                                                [{'header': 1}, {'header': 2}],  // 标题，键值对的形式；1、2表示字体大小
                                                                [{'list': 'ordered'}, {'list': 'bullet'}],  //列表
                                                                [{'script': 'sub'}, {'script': 'super'}], // 上下标
                                                                [{'indent': '-1'}, {'indent': '+1'}],  // 缩进
                                                                [{'direction': 'rtl'}],    // 文本方向
                                                                [{'size': ['small', false, 'large', 'huge']}], // 字体大小
                                                                [{'header': [1, 2, 3, 4, 5, 6, false]}],  //几级标题
                                                                [{'color': []}, {'background': []}],  // 字体颜色，字体背景颜色
                                                                [{'font': []}],  //字体
                                                                [{'align': []}], //对齐方式
                                                                ['clean'], //清除字体样式
                                                                ['link', 'image'],//上传图片、上传视频
                                                        ],
                                                        handlers: {
                                                                'image': function (value) {
                                                                        console.log(value);
                                                                        if (value) {
                                                                                document.querySelector('.avatar-uploader input').click()
                                                                        } else {
                                                                                this.quill.format('image', false);
                                                                        }
                                                                }
                                                        }
                                                }
                                        }
                                }

                        }
                },
                components: {headers, quillEditor},
                computed: {
                        contentLength: function(){
                                return 15000-this.content.length+'个';
                        }
                },
                beforeRouteUpdate(from,to){
                        cookie.get('token')? '' : this.$router.push('/login');
                },
                created(){
                        //判断有没有cookie 判断用户是否登录

                        cookie.get('token')?this.login = true:this.login = false;

                        this.$http({url:'api/list/taber'}).then(results=>{
                                this.titleList = results.data;
                        });
                        this.$http({url:'api/posting/UersrId'}).then(res=>{
                                this.userId=res.data[0].id;
                        });
                },
                methods: {
                        postingBtm(){
                                if(this.title.length<=10){
                                        this.$message({
                                                message: '标题长度不够哟!',
                                                type: 'warning'
                                        });
                                        return;
                                }
                                if(this.content.length>250){
                                        this.$message({
                                                message: '内容不够哟!',
                                                type: 'warning'
                                        });
                                        return;
                                }
                                this.$confirm('此操作将上传到服务器, 是否继续?', '提示', {
                                        confirmButtonText: '确定',
                                        cancelButtonText: '取消',
                                        type: 'warning'
                                }).then(()=>{
                                        this.quillUpdateImg=true;
                                        this.$http({url:'/api/posting/addActive',data:{select:parseInt(this.select),title:this.title,content:this.content,imgs:this.imgs,userId:this.userId}}).then(res=>{
                                                if(res.data=='ok'){
                                                        this.$message({
                                                                message: '发布成功',
                                                                type: 'success'
                                                        });
                                                        setTimeout(()=>{
                                                                this.$router.replace('/home');
                                                        },2000);
                                                }else{
                                                        this.$message.error('错了哦，未知名错误！');
                                                }
                                                this.quillUpdateImg=false;
                                        })
                                }).catch(()=>{
                                        this.$message({
                                                message: '取消成功',
                                                type: 'success'
                                        });
                                })

                        },
                        outLogin(){
                                this.login = !this.login;
                                cookie.remove('token');
                        },
                        beforeUpload(file) {
                                // 显示loading动画
                                this.quillUpdateImg = true
                                const isLt2M = file.size / 1024 / 1024 < 2;

                                if (!isLt2M) {
                                        this.$message.error('上传头像图片大小不能超过 2MB!');
                                }
                                return  isLt2M;
                        },
                        uploadSuccess(res, file) {
                                // res为图片服务器返回的数据
                                // 获取富文本组件实例
	                        this.imgs.push(res.data);
                                let quill = this.$refs.myQuillEditor.quill
	                        this.url = 'http://localhost:3000/tmp/'+res.data;
                                // 如果上传成功
                                if (res.status == '200') {
                                        // 获取光标所在位置
                                        let length = quill.getSelection().index;
                                        // 插入图片  res.info为服务器返回的图片地址
                                        quill.insertEmbed(length, 'image', this.url)
                                        // 调整光标到最后
                                        quill.setSelection(length + 1)
                                } else {
                                        this.$message.error('图片插入失败')
                                }
                                // loading动画消失
                                this.quillUpdateImg = false
                        },

                        // 富文本图片上传失败
                        uploadError() {
                                // loading动画消失
                                this.quillUpdateImg = false
                                this.$message.error('图片插入失败');
                        },
                },
                mounted(){
                        //提示
                        addQuillTitle();
                },


        };
</script>

<style scoped>
	.btm {
		width: 100px;
		height: 40px;
		background-color: #0088ff;
		color: #fff;
		border-radius: 10px;
	}

	.ql-editor {
		height: 400px;
	}

	.posting {
		display: flex;
		flex-direction: column;
		height: 100%;
		background-color: #f6f6f6;
	}

	.posting-bom {
		flex-grow: 1;
		width: 1100px;
		margin: 5px auto 0;
		background-color: #fff;
		padding: 0 15px;

	}

	.posting-content {
		height: 600px;
	}

	.posting-top {
		height: 100px;
		padding-top: 20px;
	}

	.posting-plate {
		height: 50px;
		line-height: 50px;
	}

	.select {
		width: 100px;
		height: 30px;
		border-radius: 5px;
		outline: 0;
	}

	.posting-title {
		height: 40px;
		line-height: 40px;
		box-sizing: border-box;
	}

	.posting-title input {
		outline: 0;
		height: 30px;
		border: 1px solid #ccc;
		padding-left: 10px;
		width: 40%;
		border-radius: 5px;
	}


	.footer {
		height: 100px;
		flex-shrink: 0;
	}
	.ql-snow .ql-editor img{
		width:400px;
	}
</style>