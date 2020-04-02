var express = require('express');
var router = express.Router();
var query = require('../util/dbHlper.js');
var httpResult = require('../config').httpResult; //引入返回状态码
//请求模块分类
router.post('/taber', function(req,res,next) {
	var sql = 'select * from dt_list where `fid`=0';
	res.flag = query(sql).then(results=>{
		return httpResult.success(results,'');
	})
	
	next();
})
// //请求当前板块的文章 type为模块的id
// router.post('/List',function(req,res,next){
// 	var type = req.body.type;
// 	var sql = 'select * from dt_article where `fid`=?';
// 	res.flag = query(sql,[type]).then(res=>{
// 		return httpResult.success(res,'');
// 	})
// 	next();
// })

//请求最新的文章
router.post('/newList',function(req,res,next){
	var sql = 'select T1.id,T1.title,T1.date,T1.fid,T1.hot,T1.userID ,T2.nickName from `dt_article` T1 inner join `dt_user` T2 on T1.userID = T2.id order by T1.id  desc limit 6;'
	res.flag  = query(sql).then(result=>{
	
		return httpResult.success(result,'');
	})
	next();
	 
})

//请求板块文章 返回值 total 总数量，list范围内的数据
router.post('/list',function(req,res,next){
	var {
		type,
		begin,
		count
	}=req.body;
	var sql = 'CALL p_getProductByCondition(?,?,?)';
	res.flag = query(sql,[type,begin,count]).then(res=>{
		return httpResult.success({total:res[0][0].total,list:res[1]},'');
		
	})
	next();
})
module.exports = router;
