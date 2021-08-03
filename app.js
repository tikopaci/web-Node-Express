var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const dotenv = require('dotenv');
const session = require('express-session');
const {verifyUser, verifyAdmin} = require('./middlewares/auth');

dotenv.config();
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
const adminIndexRouter = require('./routes/admin/index');
const adminProductosRouter = require('./routes/admin/productos');
const adminUsuariosRouter = require('./routes/admin/usuarios');
const registroRouter = require('./routes/registro');
const categoriasRouter = require('./routes/categorias');
const productosRouter = require('./routes/productos');
const loginRouter = require('./routes/login');
const carritoRouter = require('./routes/carrito');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
  secret : 'paswordSecreto',
  cookie : {maxAge: null},
  resave : true,
  saveUninitialized : true,
}));
//ALL
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/registro', registroRouter);
app.use('/categorias', categoriasRouter);
app.use('/productos', productosRouter);
app.use('/login', loginRouter);
//ADMIN
app.use('/admin', verifyAdmin, adminIndexRouter);
app.use('/admin/productos', adminProductosRouter);
app.use('/admin/usuarios', adminUsuariosRouter);
//USERS
app.use('/carrito', verifyUser, carritoRouter);

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
