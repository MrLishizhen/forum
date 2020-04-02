var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var httpResult = require('./config').httpResult;
var ToKen = require('./util/token.js');//工具的变量名潜规则大写
// var indexRouter = require('./routes/index');
// var usersRouter = require('./routes/users');
var login = require('./routes/user.js');
var list= require('./routes/list.js');
var posting = require('./routes/posting.js');

var defaults = require('./routes/default.js');
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static('public'));
// app.use('/', indexRouter);
// app.use('/users', usersRouter);
app.use('/api/user', login);
app.use('/api/list',list);
app.use('/api/posting',posting);
app.use('/api/default',defaults);


app.use(function(req, res, next) {
	if(res.flag){
		
		res.flag.then(result => res.send(result))
		.catch(message => res.send(httpResult.error(null,message)));
	}else{
		next();
	}
});
// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
