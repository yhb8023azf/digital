//引入框架
const express=require('express');
//引入连接池
const pool=require('../pool.js');
//创建路由器
const router=express.Router();

//1.商品列表
router.get('/list',function(req,res){
	var obj=req.query;
	    obj.pno=parseInt(obj.pno);
		obj.pageSize=parseInt(obj.pageSize);
	if (!obj.pno){
		obj.pno=1;
		return;
	}
	if (!obj.pageSize){
		obj.pageSize=5;
		return;
	}
	var start=(obj.pno-1)*obj.pageSize;
	pool.query('SELECT * FROM xz_laptop LIMIT ?,?',[start,obj.pageSize],function(err,result){
		if(err) throw err;
		res.send(result);
	});
});
//2.商品详情
router.get('/detail',function(req,res){
	var obj=req.query;
	if (!obj.lid){
		res.send({code:401,msg:'lid required'});
		return;
	}
	pool.query('SELECT * FROM xz_laptop WHERE lid=?',[obj.lid],function(err,result){
		if(err) throw err;
		res.send(result);
	});
});
//3.删除商品
router.get('/delete',function(req,res){
	var obj=req.query;
	if (!obj.lid){
		res.send({code:401,msg:'lid required'});
		return;
	}
	pool.query('DELETE FROM xz_laptop WHERE lid=?',[obj.lid],function(err,result){
		if (err) throw err;
		if (result.affectedRows>0){
			res.send({code:200,msg:'delete success'});
		}else{
			res.send({code:301,msg:'delete fail'});
		}
	});
});
//4.商品添加
router.get('/add',function(req,res){
	var obj=req.query;
	var i=400;
	for (var key in obj){
		i++;
		if (!obj[key]){
			res.send({code:i,msg:obj[key]+' required'});
			return;
		}
	}
	pool.query('INSERT INTO xz_laptop SET ?',[obj],function(err,result){
		if (err) throw err;
		if (result.affectedRows>0){
			res.send({code:200,msg:'add success'});
		}else{
			res.send({code:301,msg:'add fail'});
		}
	});
});

//导出路由器
module.exports=router;
