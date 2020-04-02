//把数据库请求封装成一个函数
var mysql = require("mysql");
var dbConfig = require("../config").dbConfig;//导入模块数据库的参数

function query(sql,params){
	//返回一个promise对象
	return new Promise(function(resolve,reject){
		var connection =mysql.createConnection(dbConfig);
		connection.query(sql,params,function(err,results,fields){
			connection.end();
			if(err){
				reject(err)
			}else{
				resolve(results);
			}
		})
	})
}



module.exports=query;