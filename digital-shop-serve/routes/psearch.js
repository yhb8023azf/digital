const express=require("express");
var router=express.Router();
var query=require("./query");

router.get("/",(req,res)=>{
  var output={
    count:0,
    pageSize:9,
    pageCount:0,
    pno:req.query.pno||0,
    data:[]
  };
  var kw=req.query.kw;
  if(kw){
    var kws=kw.split(" ");
    kws.forEach((elem,i,arr)=>{
      arr[i]=`title like '%${elem}%'`;
    })
    var where=kws.join(" and ");
    // 笔记本
    var sql1=`select * from digital_product where ${where}`;
    query(sql1,[])
    .then(result=>{
      output.count=result.length;
      output.pageCount=
        Math.ceil(output.count/output.pageSize);
      sql1+=` limit ?,?`;
      return query(sql1,[output.pageSize*output.pno,output.pageSize]);
    })
    .then(result=>{
      output.data=result;
      res.send(output);
    })
  }else{
    res.send(output);
  }
})


module.exports=router;