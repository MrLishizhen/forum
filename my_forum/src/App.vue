<template>
	<div id="app">
		<router-view/>
	</div>
</template>

<script>
        export default {
                name: 'App'
        }
</script>

<style>
	#app {
		font-family: 'Avenir', Helvetica, Arial, sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		color: #2c3e50;
		/*background-color: #f6f6f6;*/
		height: 100%;
	}

	.ql-snow .ql-editor img {
		width: 600px;

	}

	.ql-editor {
		height: 500px;
	}
	p img{
		width:600px;
	}
</style>
