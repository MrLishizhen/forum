var express = require('express');
var router = express.Router();
var query = require('../util/dbHlper.js'); //引入操作数据库的函数
var httpResult = require('../config').httpResult; //引入返回状态码
var Token = require('../util/token.js'); //引入token验证
//用户登录
router.post('/login/pwd', function(req, res, next) {
	console.log(req.body);
	var {
		name,
		pwd
	} = req.body;
	var sql = 'select * from `dt_user` where `nickName`= ? and `password` = ?';
	res.flag = query(sql, [name, pwd]).then(results => {
		console.log(results);
		if (results.length > 0) {
			return httpResult.success(Token.sign(name));
		} else {
			return httpResult.failure(null, '账号或者密码错误');
		}
		
	})
	next();
})
//判断用户注册时的数据是否和数据库存在重复
router.post('/login/ar',function(req,res,next){
	
	var sql
	for(let key in req.body){
		sql = 'select * from dt_user where '+key+'= ?';
		console.log(sql)
		res.flag = query(sql,[req.body[key]]).then(results=>{
			if(results.length>0){
				return httpResult.failure(null,'no');
			}else{
				return httpResult.success(null,'yes');
			}
		})
	}
	next();
	// console.log(sql)
})
//注册
router.post('/login/addUser',function(req,res,next){
	
	var {
		sex,
		nickName,
		password,
		email,
		phone,
		
	}=req.body;

	var sql = 'insert into `dt_user`(`password`,`sex`,`email`,`phone`,nickName) values (?,?,?,?,?)';
	res.flag = query(sql,[password,sex,email,phone,nickName]).then(results=>{
		if(results.affectedRows==1){
			return httpResult.success('ok','');
		}
	})
	next();
})


module.exports = router;
