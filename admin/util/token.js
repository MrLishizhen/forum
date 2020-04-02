var jwt = require('jsonwebtoken');
var httpResult = require('../config/index.js').httpResult;
var tokenkey = 'li25548985651agew';

//验证登录
module.exports = {
	sign: function(name) {
		return jwt.sign({
			name: name
		}, tokenkey, {
			expiresIn: '1h'
		}); //要藏得值 秘钥 过期时间
	},
	verify: function(req, res, next) {
		var token = req.get('Authorization');
		jwt.verify(token, tokenkey, function(err, decoded) {
			if (err) {
				res.send(httpResult.untoken());
			} else {
				req.token = decoded;
				next();
			}

		})
	}
}
