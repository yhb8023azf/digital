const express=require("express")
const router=express.Router();
const pool=require("../pool")

//笔记本详情页**********************************************
router.get("/laptop",(req,res)=>{
  var lid=req.query.lid;
  var output1={
    product:{},
    pics:[]
  }
  if(lid!==undefined){
    var sql1=`select * from digital_laptop where lid=?`;
    pool.query(sql1,[lid],(err,result)=>{
      if(err) console.log(err);
      output1.product=result[0];
    var sql3=`select * from digital_laptop_pic where laptop_id=?`
    pool.query(sql3,[lid],(err,result)=>{
          if(err) console.log(err);
          output1.pics=result;
          res.send(output1);
        })
      })
    }else{
        res.send(output1);
    }
})
// 验证：http://127.0.0.1:3000/detail/laptop?lid=1
// 台式机详情页************************
router.get("/desktop",(req,res)=>{
  var did=req.query.did;
  var output2={
    product:{},
    specs:[],
    pics:[]
  }
  if(did!==undefined){
    var sql1=`select * from digital_desktop where did=?`;
    pool.query(sql1,[did],(err,result)=>{
      if(err) console.log(err);
      output2.product=result[0];
      var family_id=output2.product["family_id"];
      var sql2=`select spec,did from digital_desktop where family_id=?`;
      pool.query(sql2,[family_id],(err,result)=>{
        if(err) console.log(err);
        output2.specs=result;
        var sql3=`select * from digital_desktop_pic where desktop_id=?`
        pool.query(sql3,[did],(err,result)=>{
          if(err) console.log(err);
          output2.pics=result;
          res.send(output2);
        })
      })
    })
    }else{
    res.send(output2);
    }
})
// 验证：http://127.0.0.1:3000/detail/desktop?did=1
// 外设系列详情页**********************************
router.get("/preip",(req,res)=>{
  var pid=req.query.pid;
  var output3={
    product:{},
    pics:[]
  }
  if(pid!==undefined){
        var sql1=`select * from digital_preip where pid=?`;
        pool.query(sql1,[pid],(err,result)=>{
            if(err) console.log(err);
            output3.product=result[0];
            var sql3=`select * from digital_preip_pic where preip_id=?`
            pool.query(sql3,[pid],(err,result)=>{
            if(err) console.log(err);
            output3.pics=result;
            res.send(output3);
            })
      })
  }else{
    res.send(output3);
  }
})

// 验证：http://127.0.0.1:3000/detail/preip?pid=1
module.exports=router;