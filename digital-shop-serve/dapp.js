// 引入express模块等第三方模块
const express=require("express");
const bodyParser=require('body-parser');
// 引入路由器
const index=require("./routes/index");
const user=require("./routes/user");
const product=require("./routes/product");
const cors=require("cors");
//const mysql = require("mysql");
// 设置监听端口
var app=express();
app.listen(3000);
// 配置跨域
app.use(cors({
  origin:"http://127.0.0.1:8080"//不能用*
}));
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));
/*使用路由器来管理路由*/
app.use("/index",index);
app.use("/product",product);
// app.use("/industy",industry);
app.use("/user",user);


