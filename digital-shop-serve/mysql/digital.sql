#设置客户端连接服务器
SET NAMES UTF8;
#丢弃原有数据库
DROP DATABASE IF EXISTS digital;
#创建数据库
CREATE DATABASE digital CHARSET=UTF8;
#进入数据库
USE digital;

#创建用户表*******************************************************************
CREATE TABLE digital_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32),      #用户昵称
	upwd VARCHAR(32),       #用户密码
	real_name VARCHAR(64),  #真实姓名，如王小明
	email VARCHAR(32),      #邮箱
	phone VARCHAR(32),      #电话
	gender INT              #性别  0-女  1-男
);
#导入用户信息数据
INSERT INTO digital_user VALUES(NULL,'yangyang','123456','杨洋','yangyang@163.com','17718412654','1');
INSERT INTO digital_user VALUES(NULL,'yangxiaosong','123456','杨晓松','yxs@qq.com','17718412659','0');
INSERT INTO digital_user VALUES(NULL,'yanghongbin','123456','杨红彬','1121341028@163.com','17711241654','1');
INSERT INTO digital_user VALUES(NULL,'zhangfan','123456','张帆','1607651901@qq.com','17710140545','0');
INSERT INTO digital_user VALUES(NULL,'lijunfeng','123456','李俊峰','ljf@163.com','17852222654','1');


#所属型号家族*****************************************************************
CREATE table digital_family(
	fid INT PRIMARY KEY AUTO_INCREMENT,
	fname VARCHAR(32)
);
#导入所属型号家族数据
INSERT INTO digital_family VALUES(null,'笔记本');
INSERT INTO digital_family VALUES(null,'台式机');
INSERT INTO digital_family VALUES(null,'外设系列');

#笔记本**********************************************************************
CREATE TABLE digital_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,  #商品编号
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  category VARCHAR(32),       #所属分类
  label VARCHAR(32),          #标签

  resolution VARCHAR(32),     #分辨率
  cpu VARCHAR(32),            #处理器
  video_card VARCHAR(32),     #显卡型号
  memory VARCHAR(32),         #内存容量
  disk VARCHAR(32),           #硬盘容量及类型
  brand VARCHAR(32),           #品牌

  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);
#导入笔记本信息
INSERT INTO digital_laptop VALUES(NULL,1,'14英寸四核独显轻薄商务便携笔记本电脑','金属游戏本，芯八代六核I7-8750H处理器，GTX1050/4G独显，8G内存，128G固态+1T机械，IPS高清屏',5999,'笔记本','游戏笔记本','14.0英寸','Intel i5','GTX1060 3G/6G','32G','500GB HDD','神舟',152123456789,7289,true);

INSERT INTO digital_laptop VALUES(NULL,1,'15.6英寸游戏笔记本 黑色 80WW000TCD','金属游戏本，芯八代六核I7-8750H处理器，GTX1050/4G独显，8G内存，128G固态+1T机械，IPS高清屏',5999,'笔记本','游戏笔记本','12.5英寸','AMD','GTX1070 8G','4G','500GB HDD','雷神',153123456789,3289,true);

INSERT INTO digital_laptop VALUES(NULL,1,'E580 笔记本电脑 20KSA001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',10899,'笔记本','游戏笔记本','17.3英寸','Intel i9','GTX750','4G','500GB HDD','炫龙',152123456789,1989,true);

INSERT INTO digital_laptop VALUES(NULL,1,'15.6英寸游戏笔记本 黑色 81HC0007CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',5899,'笔记本','游戏笔记本','15.6英寸','Ryzen锐龙','GTX1060 3G/6G','32G','256GB SSD','外星人',152623456789,3589,true);

INSERT INTO digital_laptop VALUES(NULL,1,'13.3英寸触控笔记本 天蝎灰 81CT0001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',7599,'笔记本','游戏笔记本','14.0英寸','Intel i9','GTX750','8G','256GB SSD','戴尔',152823456789,5689,true);

INSERT INTO digital_laptop VALUES(NULL,1,'X280 笔记本电脑 20KFA002CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',6599,'笔记本','游戏笔记本, 轻薄笔记本 ','15.6英寸','Intel奔腾 赛扬','GTX750','16G','512GB SSD','华硕',152123456789,2289,true);

INSERT INTO digital_laptop VALUES(NULL,1,'拯救者 Y7000 15.6英寸游戏笔记本 黑色 81FW0009CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',7599,'笔记本','游戏笔记本','13.3英寸','Intel i7','GTX1070 8G','4G','256GB SSD','拯救者',152123456789,1689,true);

INSERT INTO digital_laptop VALUES(NULL,1,'ThinkPad T480 笔记本电脑','i5-8250U/Windows 10 家庭版/8GB/1TB+128GB SSD/独显',8999,'笔记本','轻薄笔记本 ','11.6英寸','Intel i5','GTX1060 3G/6G','32G','240GB SSD','ThinkPad',152123456789,1579,true);

INSERT INTO digital_laptop VALUES(NULL,1,'1黑武士A56游戏笔记本','吃鸡游戏台式电脑主机（i5-8400 8G B360M GTX1060 6G 1T+128G Win10）搭配购买27英寸曲面窄边框显示器。',5999,'笔记本','游戏台式机','12.5英寸','Intel i3','GTX 9系/7系','16G','1TB HDD','雷神',152123456789,1389,true);


#台式机*******************************************************************
CREATE TABLE digital_desktop(
  did INT PRIMARY KEY AUTO_INCREMENT,  #商品编号
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  category VARCHAR(32),       #所属分类
  spec VARCHAR(64),           #规格

  edition VARCHAR(32),        #版本
  cpu VARCHAR(32),            #处理器
  video_card VARCHAR(32),     #显卡型号
  memory VARCHAR(32),         #内存容量
  disk VARCHAR(32),           #硬盘容量及类型
  brand VARCHAR(32),          #品牌

  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);


#导入台式机/一体机信息
INSERT INTO digital_desktop VALUES(NULL,2,' 惠普（HP）暗影精灵23代 游戏台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','4999','台式机/一体机',' i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX 9系/7系','16G','240GB SSD','ThinkPad',152123456789,7589,true);

INSERT INTO digital_desktop VALUES(NULL,2,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i7-8700 16G高频 1T+256GSSD GTX1060 6G独显 三年上门）','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','5999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i5','GTX1070 8G','4G','256GB SSD','惠普',152123456789,3289,true);

INSERT INTO digital_desktop VALUES(NULL,2,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i7-8700 16G高频 1T+256GSSD GTX1060 6G独显 三年上门）','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','4099','台式机/一体机','i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX1070 8G','4G','256GB SSD','惠普',152123456789,2289,true);

INSERT INTO digital_desktop VALUES(NULL,2,'宏碁（Acer）商祺SQX4270 140N 商用办公台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','5999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i9','GTX1070 8G','4G','500GB HDD','弘基',152123456789,1989,true);

INSERT INTO digital_desktop VALUES(NULL,2,'宏碁（Acer）商祺SQX4270 140N 商用办公台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','4999','台式机/一体机','i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX1070 8G','4G','500GB HDD','弘基',152123456789,1889,true);

INSERT INTO digital_desktop VALUES(NULL,2,'联想（Lenovo）天逸510S 第八代英特尔酷睿i3 个人商务台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','2999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel奔腾 赛扬','GTX750','32G','512GB SSD','联想',152123456789,1789,true);

INSERT INTO digital_desktop VALUES(NULL,2,'联想（Lenovo）天逸510S 第八代英特尔酷睿i3 个人商务台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','5899','台式机/一体机','i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel奔腾 赛扬','GTX750','32G','512GB SSD','联想',152123456789,1689,true);

INSERT INTO digital_desktop VALUES(NULL,2,' 戴尔(DELL)灵越3670台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','5999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i5','GTX1060 3G/6G','32G','500GB HDD','戴尔',152123456789,1589,true);

INSERT INTO digital_desktop VALUES(NULL,2,' 戴尔(DELL)灵越3670台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','4099','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i3-8100 4G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX1060 3G/6G','32G','500GB HDD','戴尔',152123456789,1489,true);

INSERT INTO digital_desktop VALUES(NULL,2,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i5-8400 16G高频 1T+128GSSD GTX1060 6G独显 三年上门）','GTX1060-6G”十”力尽显，固态机械双硬盘速容兼顾，绿刃LED锋芒毕露！','5199','台式机/一体机','八代i5/8G/GTX1060爆款','八代i5/8G/GTX1060爆款, 八代i5/GTX1060 6G','Intel i7','GTX 9系/7系','16G','1TB HDD','戴尔',152123456789,1299,true);

INSERT INTO digital_desktop VALUES(NULL,2,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i5-8400 16G高频 1T+128GSSD GTX1060 6G独显 三年上门）','GTX1060-6G”十”力尽显，固态机械双硬盘速容兼顾，绿刃LED锋芒毕露！','6999','台式机/一体机','八代i5/GTX1060 6G','八代i5/8G/GTX1060爆款, 八代i5/GTX1060 6G','Intel i7','GTX 9系/7系','16G','1TB HDD','戴尔',152123456789,1389,true);

#外设系列*********************************************************************
CREATE TABLE digital_preip(
  pid INT PRIMARY KEY AUTO_INCREMENT,  #商品编号
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  category VARCHAR(32),       #所属分类
  
  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

#导入外设设备信息
INSERT INTO digital_preip VALUES(NULL,3,'索尼（SONY）WH-1000XM3 高解析度无线蓝牙降噪耳机（触控面板 智能降噪 长久续航）黑色','新款黑科技，超强降噪，佩戴更舒适，快充更方便！','2899','游戏耳机',152123456789,1389,true);

INSERT INTO digital_preip VALUES(NULL,3,'小米米家（MIJIA）智能摄像机 云台版 白色 1080P','1080P高清／ 360度云台全景视角 ／ 微光全彩 ／ 双向语音 / AI 增强移动侦测 / H.265 编码 / 倒置安装 / 红外夜视','199','摄像头',152123456789,1389,true);

INSERT INTO digital_preip VALUES(NULL,3,' Pico G2小怪兽2 VR一体机 4K高清视频 体感游戏 VR眼镜 3D头盔','【爆款直降】小怪兽2VR一体机限时直降100元，到手价仅需1899元','1899','VR设备',152123456789,1389,true);

INSERT INTO digital_preip VALUES(NULL,3,'联想大红点M120Pro有线鼠标 台式机鼠标 笔记本鼠标','经典大红点系列，按键灵敏，精选耐磨防滑滚轮。','99','鼠标',152123456789,1389,true);

INSERT INTO digital_preip VALUES(NULL,3,'M330 无线静音鼠标 舒适曲线 黑色 M275升级版','舒适曲线 黑色 M275升级版','109','鼠标',152123456789,1389,true);

INSERT INTO digital_preip VALUES(NULL,3,'全尺寸背光机械游戏键盘 机械键盘 红轴 吃鸡键盘 绝地求生','无线光学鼠标，始于简约，磨砂手感，智能芯片','99','键盘',152123456789,1389,true);


#**笔记本、台式机、外设设备图片*********************************************
CREATE TABLE digital_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

#导入图片信息
#笔记本
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/laptop-sm-13.3','../assets/img/product_details/laptop-md-13.3','../assets/img/product_details/laptop-lg-13.3');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/laptop-sm-14','../assets/img/product_details/laptop-md-14','../assets/img/product_details/laptop-lg-14');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/laptop-sm-15.6','../assets/img/product_details/laptop-md-15.6','../assets/img/product_details/laptop-lg-15.6');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/laptop-sm-15h','../assets/img/product_details/laptop-md-15h','../assets/img/product_details/laptop-lg-15h');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/laptop-sm-a5','../assets/img/product_details/laptop-md-a5','../assets/img/product_details/laptop-lg-a5');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/laptop-sm-e5','../assets/img/product_details/laptop-md-e5','../assets/img/product_details/laptop-lg-e5');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/laptop-sm-th','../assets/img/product_details/laptop-md-th','../assets/img/product_details/laptop-lg-th');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/laptop-sm-x2','../assets/img/product_details/laptop-md-x2','../assets/img/product_details/laptop-lg-x2');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/laptop-sm-y7','../assets/img/product_details/laptop-md-y7','../assets/img/product_details/laptop-lg-y7');
#台式机
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/desktop-sm-ac','../assets/img/product_details/corre-desktop2','../assets/img/product_details/desktop-lg-ac');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/desktop-sm-de3','../assets/img/product_details/corre-desktop3','../assets/img/product_details/desktop-lg-de3');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/desktop-sm-h3','../assets/img/product_details/corre-desktop5','../assets/img/product_details/desktop-lg-h3');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/desktop-sm-h23','../assets/img/product_details/corre-desktop4','../assets/img/product_details/desktop-lg-h23');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/desktop-sm-le5','../assets/img/product_details/corre-desktop1','../assets/img/product_details/desktop-lg-le5');
#外设设备
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/m120p-sm','../assets/img/product_details/m120p-md','../assets/img/product_details/m120p-lg');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/mijia-sm','../assets/img/product_details/mijia-md','../assets/img/product_details/mijia-lg');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/pico-sm','../assets/img/product_details/pico-sm','../assets/img/product_details/pico-lg');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/sony-sm','../assets/img/product_details/sony-md','../assets/img/product_details/sony-lg');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/m330-sm','../assets/img/product_details/m330-md','../assets/img/product_details/m330-lg');
INSERT INTO digital_pic VALUES(NULL,'../assets/img/product_details/keyboard-sm','../assets/img/product_details/keyboard-sm','../assets/img/product_details/keyboard-lg');



/**收货地址信息*************************************************************/
CREATE TABLE digital_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

#轮播图**********************************************************************
CREATE TABLE digital_carousel(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	url VARCHAR(64),     #路径
	title VARCHAR(32),   #标题
	img VARCHAR(32)      
);
#导入轮播图
/****首页轮播广告商品****/
INSERT INTO digital_carousel VALUES(NULL, '../assets/img/index/bg2.jpg','轮播广告商品1','index.html');
INSERT INTO digital_carousel VALUES(NULL, '../assets/img/index/bg1.jpg','轮播广告商品2','index.html');

#首页商品**************************************************************
CREATE TABLE digital_index_product(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

#导入首页商品信息
#笔记本
INSERT INTO digital_index_product VALUES(NULL, '14英寸四核独显轻薄商务便...', '金属游戏本，芯八代六核I7-...', '../assets/img/index/recommendation5.jpg','5999', 'product_details.html?lid=1', 1, 1, 1);

INSERT INTO digital_index_product VALUES(NULL, '15.6英寸游戏笔记本 黑色 8...', 'i5-8300H/Windo...', '../assets/img/index/recommendation4.jpg','5899', 'product_details.html?lid=4', 4, 4, 4);

INSERT INTO digital_index_product VALUES(NULL, '15.6英寸游戏笔记本 黑色8...', '金属游戏本，芯八代六核I7-...', '../assets/img/index/laptop6.jpg','5999', 'product_details.html?lid=2', 2, 2, 2);

INSERT INTO digital_index_product VALUES(NULL, '13.3英寸触控笔记本 天蝎灰...', 'i5-8300H/Window...', '../assets/img/index/recommendation2.jpg','7599', 'product_details.html?lid=5', 5, 5, 5);

INSERT INTO digital_index_product VALUES(NULL, 'E580 笔记本电脑 20KSA00...','i5-8300H/Window...', '../assets/img/index/laptop3.jpg','10899', 'product_details.html?lid=3', 3, 3, 3);

INSERT INTO digital_index_product VALUES(NULL, 'X280 笔记本电脑 20KFA00...', 'i5-8300H/Window...', '../assets/img/index/laptop2.jpg','6599', 'product_details.html?lid=6', 6, 6, 6);
#台式机
INSERT INTO digital_index_product VALUES(NULL, '惠普（HP）暗影精灵23代...', '全新戴尔灵越酷睿8代超窄边框...', '../assets/img/index/desktop5.jpg','4999', 'product_details.html?did=1', 1, 1, 1);

INSERT INTO digital_index_product VALUES(NULL, '联想（Lenovo）天逸510S...', '全新戴尔灵越酷睿8代超窄边框...', '../assets/img/index/desktop6.jpg','5899', 'product_details.html?did=7', 7, 7, 7);

INSERT INTO digital_index_product VALUES(NULL, '惠普（HP）暗影精灵3代 游...', '全新戴尔灵越酷睿8代超窄边框...', '../assets/img/index/desktop2.jpg',4099, 'product_details.html?did=3', 3, 3, 3);

INSERT INTO digital_index_product VALUES(NULL, '戴尔(DELL)灵越3670台式...', '全新戴尔灵越酷睿8代超窄边框...', '../assets/img/index/desktop3.jpg',5999, 'product_details.html?did=8', 8, 8, 8);

INSERT INTO digital_index_product VALUES(NULL, '宏碁（Acer）商祺SQX427...', '全新戴尔灵越酷睿8代超窄边框...', '../assets/img/index/desktop4.jpg',5999, 'product_details.html?did=4', 4, 4, 4);

INSERT INTO digital_index_product VALUES(NULL, '惠普（HP）暗影精灵3代 游...', 'GTX1060-6G”十”力...', '../assets/img/index/desktop3.jpg',6999, 'product_details.html?did=11', 11, 11, 11);

#外设设备
INSERT INTO digital_index_product VALUES(NULL, '索尼（SONY）WH-1000X...', '新款黑科技，超强降噪，佩戴更...', '../assets/img/index/peripheral2.jpg',1699, 'product_details.html?pid=1', 1, 1, 1);

INSERT INTO digital_index_product VALUES(NULL, '联想大红点M120Pro有线...', '经典大红点系列，按键灵敏，精...', '../assets/img/index/peripheral5.jpg',99, 'product_details.html?pid=4', 4, 4, 4);

INSERT INTO digital_index_product VALUES(NULL, '小米米家（MIJIA）智能摄...', '1080P高清／ 360度云...', '../assets/img/index/peripheral8.jpg',199, 'product_details.html?pid=2', 2, 2, 2);

INSERT INTO digital_index_product VALUES(NULL, 'M330 无线静音鼠标 舒适...', '舒适曲线 黑色 M275升级...', '../assets/img/index/peripheral7.jpg',109, 'product_details.html?pid=5', 5, 5, 5);

INSERT INTO digital_index_product VALUES(NULL, 'Pico G2小怪兽2 VR一体机...', '【爆款直降】小怪兽2VR一体...', '../assets/img/index/peripheral4.jpg',1899, 'product_details.html?pid=3', 3, 3, 3);

INSERT INTO digital_index_product VALUES(NULL, '全尺寸背光机械游戏键盘 机...', '无线光学鼠标，始于简约，磨砂...', '../assets/img/index/peripheral6.jpg',99, 'product_details.html?pid=6', 6, 6, 6);


#首页商品-精选单品推荐********************************************************
CREATE TABLE digital_index_selection(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);
#导入首页商品-精选单品推荐信息
INSERT INTO digital_index_selection VALUES(NULL, '拯救者 Y7000 15.6英寸游...', 'i5-8300H/Window...', '../assets/img/index/recommendation1.jpg', 'product_details.html?lid=7',7,7,7);

INSERT INTO digital_index_selection VALUES(NULL, '14英寸四核独显轻薄商务便...', '金属游戏本，芯八代六核I7-...', '../assets/img/index/recommendation5.jpg', 'product_details.html?lid=1', 1, 1, 1);

INSERT INTO digital_index_selection VALUES(NULL, '15.6英寸游戏笔记本 黑色 8...', 'i5-8300H/Windo...','../assets/img/index/recommendation4.jpg','product_details.html?lid=4', 4, 4, 4);

INSERT INTO digital_index_selection VALUES(NULL, '13.3英寸触控笔记本 天蝎灰...', 'i5-8300H/Window...', '../assets/img/index/recommendation2.jpg', 'product_details.html?lid=5', 5, 5, 5);

INSERT INTO digital_index_selection VALUES(NULL, 'ThinkPad T480 笔记本电脑', 'i5-8250U/Window...', '../assets/img/index/recommendation6.jpg', 'product_details.html?lid=8',8, 8,8);

#首页商品-热评产品********************************************************
CREATE TABLE digital_index_hot(
  hid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

#导入首页商品-热评产品信息
INSERT INTO digital_index_hot VALUES(NULL, 'ThinkPad T480 笔记本电脑', 'i5-8250U/Windows 10 家庭版/8GB/1T...', '../assets/img/index/recommendation6.jpg',5999, 'product_details.html?lid=8',8, 8,8);

INSERT INTO digital_index_hot VALUES(NULL, 'X280 笔记本电脑 20KFA00...', 'i5-8300H/Windows 10 家庭中文版/15.6...', '../assets/img/index/laptop2.jpg',6599, 'product_details.html?lid=6', 6,6,6);

INSERT INTO digital_index_hot VALUES(NULL, 'E580 笔记本电脑 20KSA00...','i5-8300H/Windows 10 家庭中文版/15.6...', '../assets/img/index/laptop3.jpg',10899, 'product_details.html?lid=3',3,3,3);

INSERT INTO digital_index_hot VALUES(NULL, '惠普（HP）暗影精灵23代...', '全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，...', '../assets/img/index/desktop5.jpg',4999, 'product_details.html?did=1',1,1,1);

INSERT INTO digital_index_hot VALUES(NULL, '戴尔(DELL)灵越3670台式...', '全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，...', '../assets/img/index/desktop3.jpg',4099, 'product_details.html?did=9', 9, 9, 9);













