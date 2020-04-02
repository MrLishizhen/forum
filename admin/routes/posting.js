var express = require('express');
var router = express.Router();
var httpResult = require('../config').httpResult;
var file = require('../util/file.js'); //这是一个删除修改文件的包
var assetsPath = require('../config').assetsPath;
var query = require('../util/dbHlper.js');
var upload = require('../util/upload.js');
var Token = require('../util/token.js')
var path = require('path'); //node操作路径的包，本身自带

//请求用户信息
router.post('/UersrId', Token.verify, function(req, res, next) {
	let name = req.token.name;

	res.flag = query('select * from dt_user where `nickName` = ?', [name]).then(result => {
		
		return httpResult.success(result, '');
	})
	next();
})
//上传图片
router.post('/upload', upload.single('img'), function(req, res, next) {
	res.flag = Promise.resolve(httpResult.success(req.file.filename)); //返回的是这个图片保存的名字
	next();
})
//文章上传
router.post('/addActive', Token.verify, function(req, res, next) {
	var data=req.body;
	if(data.imgs.length!=0){
		data.imgs.forEach(item=>{
			if(data.content.indexOf(item)==-1){
				var imgPath = path.join(assetsPath.tmp, item);
				file.unlink(imgPath);
			}
		})
	}
	query('update `dt_user` set `integral` = `integral` + 1 where `id` = ?;',[data.userId]);
	var sql = 'insert into `dt_article` (title,fid,content,userID) values(?,?,?,?)';
	res.flag = query(sql,[data.title,data.select,data.content,data.userId]).then(res=>{
		if(res.affectedRows==1){
			return httpResult.success('ok','');
		}
	})
	next();
})

module.exports = router;
