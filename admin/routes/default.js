var express = require('express');
var router = express.Router();
var httpResult = require('../config').httpResult;
var query = require('../util/dbHlper.js');
var Token = require('../util/token.js');


router.post('/default',function(req,res,next){
	var id =  req.body.id;
	
	var sql =  'select T1.id,T1.title,T1.content,T1.date,T1.fid,T1.hot,T1.userID ,T2.nickName,T2.profiles,T2.time,T2.id as userid from `dt_article` T1 inner join `dt_user` T2 on T1.userID = T2.id AND  T1.id=? '
	res.flag=query(sql,[id]).then(res=>{
		return httpResult.success(res[0],'');
	})
	next();
})

module.exports=router;