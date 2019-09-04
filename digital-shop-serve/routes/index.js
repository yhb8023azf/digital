const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var sql=`SELECT * FROM digital_index_product where seq_recommended!=0 order by seq_recommended`;
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
      console.log(err);
    }else{
      res.send(result);
      console.log(result)
    }
  })
})

module.exports=router;