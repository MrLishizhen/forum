<template>
	<div class="search">
		<div class="search-box">
			<input type="text" v-model="search" placeholder="搜索内容">
		</div>
		<div class="search-btm iconfont icon-fangdajing1" style="font-size:20px"></div>
	</div>
</template>

<script type="text/ecmascript-6">
        export default {
               data(){
                       return {
                               search:''
                       }
               }
        };
</script>

<style scoped>
	.search{
		display:flex;
		align-items: center;
		height:30px;
		border:1px solid #0088ff;
		border-radius: 20px;
		overflow: hidden;
	}
	.search-box{
		height:30px;
		flex-grow: 1;

	}
	.search-box>input{
		border:0;
		outline:0;
		width:100%;
		height:100%;
		box-sizing: border-box;
		padding-left:15px;
	}
	.search-btm{
		height:40px;
		width:60px;
		flex-shrink: 0;
		line-height:40px;
		text-align: center;
		border-left:1px solid #ccc;
		cursor: pointer;
		background-color: #0086ff;
		color:#fff;
	}
	.search-btm:hover{


	}
</style>