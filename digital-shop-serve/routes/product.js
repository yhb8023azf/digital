//引入框架
const express=require('express');
//引入连接池
const pool=require('../pool.js');
//创建路由器
const router=express.Router();

// 笔记本电脑
//2.商品详情
router.get('/laptop',function(req,res){
	var obj=req.query;
	if (!obj.family_ids){
		res.send({code:401,msg:'family_ids required'});
		return;
	}
	pool.query('SELECT * FROM digital_laptop WHERE family_ids=?',[obj.family_ids],function(err,result){
		if(err) throw err;
		res.send(result);
	});
});

// 台式机/一体机
router.get('/desktop',function(req,res){
	var obj=req.query;
	if (!obj.family_ids){
		res.send({code:401,msg:'family_ids required'});
		return;
	}
	pool.query('SELECT * FROM digital_desktop WHERE family_ids=?',[obj.did],function(err,result){
		if(err) throw err;
		res.send(result);
	});
});

// 外设系列
router.get('/preip',function(req,res){
	var obj=req.query;
	if (!obj.family_ids){
		res.send({code:401,msg:'family_ids required'});
		return;
	}
	pool.query('SELECT * FROM digital_preip WHERE family_ids=?',[obj.pid],function(err,result){
		if(err) throw err;
		res.send(result);
	});
});


//导出路由器
module.exports=router;
