const express=require("express")
const router=express.Router();
const pool=require("../pool")

//功能三:将指定商品加入购物车
//#此功能先行条件先登录
//1:GET /addcart
router.get("/addcart",(req,res)=>{
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
 var aid = req.query.aid;
 var price = req.query.price;
 var title = req.query.title;
 var img=req.query.img
 //3:查询指定用户是否购买过此商品
 var sql = "SELECT cid FROM digital_carts";
 sql+=" WHERE uid = ? AND aid = ?";
 pool.query(sql,[uid,aid],(err,result)=>{
  if(err)throw err;
  var sql = "";
  if(result.length==0){
    //4:没有购买过此商品添加
    sql=`INSERT INTO digital_carts VALUES(null,${aid},${uid},1,'${title}',${price},'${img}')`;
  }else{
    sql=`UPDATE digital_carts SET count=count+1 WHERE uid=${uid} AND aid=${aid}`;
  }
  //5:购买过此商品更新
  pool.query(sql,(err,result)=>{
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

router.get("/list",(req,res)=>{
  //2:获取uid 并且判断如果没有请求登录
  var uid = req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请登录"});
    return;
  }
  //3:创建sql查询用户购物车内容  
  var sql = " SELECT cid,aid,title";
  sql+=" ,price,count,c_img";
  sql+=" FROM digital_carts";
  sql+=" WHERE uid = ?"
  //4:获取返回结果并且发送客户端
  pool.query(sql,[uid],(err,result)=>{
     if(err)throw err;
     res.send({code:1,msg:"查询成功",data:result});  
  })  
})

//功能五:删除购物车中指定一个商品
//http://127.0.0.1:3000/del?id=1
router.get("/del",(req,res)=>{
  //(1)获取参数 id  购物车id
  var id = req.query.cid;
  //(2)创建sql语句  注意:大写小写[表名/列名]
  var sql = "DELETE FROM digital_carts WHERE cid = ?";
  //(3)json
  pool.query(sql,[id],(err,result)=>{
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


module.exports=router;