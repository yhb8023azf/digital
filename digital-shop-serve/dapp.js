// 引入express模块等第三方模块
const express = require("express");
//mysql驱动
const mysql = require("mysql");
//跨域
const cors = require("cors");
//session
const session = require("express-session");
const bodyParser=require('body-parser');
//2:配置数据库连接池:提高数据效率
var pool1 = mysql.createPool({
   host:"127.0.0.1",  //数据库地址
   user:"root",       //数据库用户名
   password:"",       //数据库密码
   port:3306,         //数据库端口
   database:"digital",     //数据库名称
   connectionLimit:15 //连接数量
});
// 引入路由器
const index=require("./routes/index");
const user=require("./routes/user");
const product=require("./routes/product");
const details=require("./routes/details");
const psearch=require("./routes/psearch");
// 设置监听端口
var app=express();
// 配置跨域
app.use(cors({
  origin:["http://127.0.0.1:8080",//不能用*
  "http://localhost:8080"],
  credentials:true //请求验证
}));
//4:配置session模块
app.use(session({
 secret:"128位字符串",  //安全字符串
 resave:true,          //请求时更新数据
 saveUninitialized:true//保存初始数据
}));
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));
app.listen(3000);

//2.用户登录**********************************************************************
app.get('/log',function(req,res){
  //2.1获取数据
  var obj=req.query;
  //2.2验证数据为空
  if(!obj.phone){
    res.send({code:401,msg:'phone required'});
	return;
  }
  if(!obj.upwd){
    res.send({code:402,msg:'pwd required'});
	return;
  }
  //2.3执行SQL语句
  pool1.query('SELECT uid FROM digital_user WHERE phone=? AND upwd=?',[obj.phone,obj.upwd],function(err,result){
    if(err) throw err;
    console.log(result)
	//判断数据长度是否大于0
	if(result.length==0){
	res.send({code:-1,msg:"用户名或密码有误"});
	}else{
	//1:将登录成功凭据保存session
	req.session.uid = result[0].uid;
	//2:将成功消息发送脚手架  
	res.send({code:1,msg:"登录成功"})  
	}
  });
});
// 验证：http://127.0.0.1:3000/user/login?uname=yanghongbin&upwd=123456
//功能三:将指定商品加入购物车************************************
//#此功能先行条件先登录
//1:GET /addcart
app.get("/addcart1",(req,res)=>{
 //2:参数
 //2.1:获取当前登录用户id值
 var uid = req.session.uid;
 //2.2:如果当前用户没有登录
 if(!uid){
 //2.3:返回错误消息  
   res.send({code:-1,msg:"请先登录"});
   return;
 }
 //2.4:获取商品编号 商品价格 商品名称
 var aid = req.query.lid;
 var price = req.query.price;
 var title = req.query.title;
 var img=req.query.img
 //3:查询指定用户是否购买过此商品
 var sql = "SELECT cid FROM digital_carts";
 sql+=" WHERE uid = ? AND aid1 = ?";
 pool1.query(sql,[uid,aid],(err,result)=>{
  if(err)throw err;
  var sql = "";
  if(result.length==0){
    //4:没有购买过此商品添加
    sql=`INSERT INTO digital_carts VALUES(NULL,${aid},'','',${uid},1,'${title}','${price}','${img}');`;
  }else{
    sql=`UPDATE digital_carts SET count=count+1 WHERE uid=${uid} AND aid1=${aid}`;
  }
  //5:购买过此商品更新
  pool1.query(sql,(err,result)=>{
    if(err)throw err;
    console.log(result);
    res.send({code:1,msg:"添加成功"})
  })
  //6:json
 })
})
// 添加台式机商品到购物车***********************
app.get("/addcart2",(req,res)=>{
 //2:参数
 //2.1:获取当前登录用户id值
 var uid = req.session.uid;
 //2.2:如果当前用户没有登录
 if(!uid){
 //2.3:返回错误消息  
   res.send({code:-1,msg:"请先登录"});
   return;
 }
 //2.4:获取商品编号 商品价格 商品名称
 var aid2 = req.query.did;
 var price = req.query.price;
 var title = req.query.title;
 var img=req.query.img
 var count=req.query.count
 //3:查询指定用户是否购买过此商品
 var sql = "SELECT cid FROM digital_carts";
 sql+=" WHERE uid = ? AND aid2 = ?";
 pool1.query(sql,[uid,aid2],(err,result)=>{
  if(err)throw err;
  var sql = "";
  if(result.length==0){
    //4:没有购买过此商品添加
    sql=`INSERT INTO digital_carts VALUES(NULL,'',${aid2},'',${uid},${count},'${title}','${price}','${img}');`;
  }else{
    sql=`UPDATE digital_carts SET count=count+1 WHERE uid=${uid} AND aid2=${aid2}`;
  }
  //5:购买过此商品更新
  pool1.query(sql,(err,result)=>{
    if(err)throw err;
    console.log(result);
    res.send({code:1,msg:"添加成功"})
  })
  //6:json
 })
})

// 添加外设设备商品到购物车***********************
app.get("/addcart3",(req,res)=>{
 //2:参数
 //2.1:获取当前登录用户id值
 var uid = req.session.uid;
 //2.2:如果当前用户没有登录
 if(!uid){
 //2.3:返回错误消息  
   res.send({code:-1,msg:"请先登录"});
   return;
 }
 //2.4:获取商品编号 商品价格 商品名称
 var aid3 = req.query.pid;
 var price = req.query.price;
 var title = req.query.title;
 var img=req.query.img
 //3:查询指定用户是否购买过此商品
 var sql = "SELECT cid FROM digital_carts";
 sql+=" WHERE uid = ? AND aid3 = ?";
 pool1.query(sql,[uid,aid3],(err,result)=>{
  if(err)throw err;
  var sql = "";
  if(result.length==0){
    //4:没有购买过此商品添加
    sql=`INSERT INTO digital_carts VALUES(NULL,'','',${aid3},${uid},1,'${title}','${price}','${img}');`;
  }else{
    sql=`UPDATE digital_carts SET count=count+1 WHERE uid=${uid} AND aid3=${aid3}`;
  }
  //5:购买过此商品更新
  pool1.query(sql,(err,result)=>{
    if(err)throw err;
    console.log(result);
    res.send({code:1,msg:"添加成功"})
  })
  //6:json
 })
})
//功能四:查询当前登录用户购物车信息
//#此功能先行条件先登录
//1:请求方式 GET 请求地址 /cart

//http://127.0.0.1:3000/cart
//http://127.0.0.1:3000/login?uname=tom&upwd=123
//http://127.0.0.1:3000/cart

app.get("/list",(req,res)=>{
  //2:获取uid 并且判断如果没有请求登录
  var uid = req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请登录"});
    return;
  }
  //3:创建sql查询用户购物车内容  
  var sql = " SELECT cid,aid1,aid2,aid3,title";
  sql+=" ,price,count,img";
  sql+=" FROM digital_carts";
  sql+=" WHERE uid = ?"
  //4:获取返回结果并且发送客户端
  pool1.query(sql,[uid],(err,result)=>{
     if(err)throw err;
     res.send({code:1,msg:"查询成功",data:result});  
  })  
})

//功能五:删除购物车中指定一个商品
//http://127.0.0.1:3000/del?id=1
app.get("/del",(req,res)=>{
  //(1)获取参数 id  购物车id
  var id = req.query.cid;
  //(2)创建sql语句  注意:大写小写[表名/列名]
  var sql = "DELETE FROM digital_carts WHERE cid = ?";
  //(3)json
  pool1.query(sql,[id],(err,result)=>{
    if(err)throw err;
    //(4)判断条件 如果sql insert/delete/update
    //   执行成功条件:影响行数
    if(result.affectedRows>0){   
     res.send({code:1,msg:"删除成功"});
    }else{
     res.send({code:-1,msg:"删除失败"});
    }
  })
})



/*使用路由器来管理路由*/
app.use("/index",index);
app.use("/product",product);
app.use("/detail",details);
app.use("/users",user);
app.use("/psearch",psearch);

