const express=require("express");
const router=express.Router();
const pool=require("../pool");

// 查询首页笔记本、台式机、外设系列信息
router.get("/",(req,res)=>{
  var sql=`SELECT * FROM digital_index_product where seq_recommended!=0 order by seq_recommended`;
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
    }else{
      res.send(result);
    }
  })
})
// 查询精选单品推荐信息
router.get("/selection",(req,res)=>{
  var sql=`SELECT * FROM digital_index_selection where seq_recommended!=0 order by seq_recommended`;
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
    }else{
      res.send(result);
    }
  })
})
// 查询热评产品信息
router.get("/hot",(req,res)=>{
  var sql=`SELECT * FROM digital_index_hot where seq_recommended!=0 order by seq_recommended`;
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
    }else{
      res.send(result);
    }
  })
})
module.exports=router;