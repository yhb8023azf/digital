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

#所有商品
CREATE table digital_product(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    family_id INT,              #所属型号家族编号
    title VARCHAR(128),         #主标题
    subtitle VARCHAR(128),      #副标题
    price DECIMAL(10,2),        #价格
    category VARCHAR(32),       #所属分类
    label VARCHAR(32),          #标签
    edition VARCHAR(32),        #版本
    resolution VARCHAR(32),     #分辨率
    cpu VARCHAR(32),            #处理器
    video_card VARCHAR(32),     #显卡型号
    memory VARCHAR(32),         #内存容量
    disk VARCHAR(32),           #硬盘容量及类型
    brand VARCHAR(32),          #品牌
    shelf_time BIGINT,          #上架时间
    sold_count INT,             #已售出的数量
    is_onsale BOOLEAN,          #是否促销中
    href VARCHAR(128),
    img VARCHAR(128) 
);
#导入信息
#笔记本
INSERT INTO digital_product VALUES(NULL,1,'14英寸四核独显轻薄商务便携笔记本电脑','金属游戏本，芯八代六核I7-8750H处理器，GTX1050/4G独显，8G内存，128G固态+1T机械，IPS高清屏',5999,'笔记本','游戏笔记本','','14.0英寸','Intel i5','GTX1060 3G/6G','32G','500GB HDD','神舟',152123456789,7289,true,'laptop/detail/1','img/product/pro-lap6.jpg');

INSERT INTO digital_product VALUES(NULL,1,'15.6英寸游戏笔记本 黑色 80WW000TCD','金属游戏本，芯八代六核I7-8750H处理器，GTX1050/4G独显，8G内存，128G固态+1T机械，IPS高清屏',5999,'笔记本','游戏笔记本','','12.5英寸','AMD','GTX1070 8G','4G','500GB HDD','雷神',153123456789,3289,true,'laptop/detail/2','img/product/pro-lap1.jpg');

INSERT INTO digital_product VALUES(NULL,1,'E580 笔记本电脑 20KSA001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',10899,'笔记本','游戏笔记本','','17.3英寸','Intel i9','GTX750','4G','500GB HDD','炫龙',152123456789,1989,true,'laptop/detail/3','img/product/pro-lap5.jpg');

INSERT INTO digital_product VALUES(NULL,1,'15.6英寸游戏笔记本 黑色 81HC0007CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',5899,'笔记本','游戏笔记本','','15.6英寸','Ryzen锐龙','GTX1060 3G/6G','32G','256GB SSD','外星人',152623456789,3589,true,'laptop/detail/4','img/product/pro-lap2.jpg');

INSERT INTO digital_product VALUES(NULL,1,'13.3英寸触控笔记本 天蝎灰 81CT0001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',7599,'笔记本','游戏笔记本','','14.0英寸','Intel i9','GTX750','8G','256GB SSD','戴尔',152823456789,5689,true,'laptop/detail/5','img/product/pro-lap3.jpg');

INSERT INTO digital_product VALUES(NULL,1,'X280 笔记本电脑 20KFA002CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',6599,'笔记本','游戏笔记本, 轻薄笔记本 ','','15.6英寸','Intel奔腾 赛扬','GTX750','16G','512GB SSD','华硕',152123456789,2289,true,'laptop/detail/6','img/product/pro-lap7.jpg');

INSERT INTO digital_product VALUES(NULL,1,'拯救者 Y7000 15.6英寸游戏笔记本 黑色 81FW0009CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',7599,'笔记本','游戏笔记本','','13.3英寸','Intel i7','GTX1070 8G','4G','256GB SSD','拯救者',152123456789,1689,true,'laptop/detail/7','img/product/lap10.jpg');

INSERT INTO digital_product VALUES(NULL,1,'ThinkPad T480 笔记本电脑','i5-8250U/Windows 10 家庭版/8GB/1TB+128GB SSD/独显',8999,'笔记本','轻薄笔记本 ','','11.6英寸','Intel i5','GTX1060 3G/6G','32G','240GB SSD','ThinkPad',152123456789,1579,true,'laptop/detail/8','img/product/pro-lap9.jpg');

INSERT INTO digital_product VALUES(NULL,1,'黑武士A56游戏笔记本','吃鸡游戏台式电脑主机（i5-8400 8G B360M GTX1060 6G 1T+128G Win10）搭配购买27英寸曲面窄边框显示器。',5999,'笔记本','游戏台式机','','12.5英寸','Intel i3','GTX 9系/7系','16G','1TB HDD','雷神',152123456789,1389,true,'laptop/detail/9','img/product/pro-lap8.jpg');

#台式机
INSERT INTO digital_product VALUES(NULL,1,' 惠普（HP）暗影精灵23代 游戏台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','4999','4999','台式机/一体机',' i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX 9系/7系','16G','240GB SSD','ThinkPad',152123456789,7589,true,'desktop/detail/1','img/product/desktop2.jpg');

INSERT INTO digital_product VALUES(NULL,2,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i7-8700 16G高频 1T+256GSSD GTX1060 6G独显 三年上门）','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','5999','5999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i5','GTX1070 8G','4G','256GB SSD','惠普',152123456789,3289,true,'desktop/detail/2','img/product/desktop5.jpg');

INSERT INTO digital_product VALUES(NULL,2,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i7-8700 16G高频 1T+256GSSD GTX1060 6G独显 三年上门）','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','4099','4099','台式机/一体机','i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX1070 8G','4G','256GB SSD','惠普',152123456789,2289,true,'desktop/detail/3','img/product/desktop5.jpg');

INSERT INTO digital_product VALUES(NULL,3,'宏碁（Acer）商祺SQX4270 140N 商用办公台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','5999','5999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i9','GTX1070 8G','4G','500GB HDD','弘基',152123456789,1989,true,'desktop/detail/4','img/product/desktop3.jpg');

INSERT INTO digital_product VALUES(NULL,3,'宏碁（Acer）商祺SQX4270 140N 商用办公台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','4999','4999','台式机/一体机','i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX1070 8G','4G','500GB HDD','弘基',152123456789,1889,true,'desktop/detail/5','img/product/desktop3.jpg');

INSERT INTO digital_product VALUES(NULL,4,'联想（Lenovo）天逸510S 第八代英特尔酷睿i3 个人商务台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','2999','2999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel奔腾 赛扬','GTX750','32G','512GB SSD','联想',152123456789,1789,true,'desktop/detail/6','img/product/desktop1.jpg');

INSERT INTO digital_product VALUES(NULL,4,'联想（Lenovo）天逸510S 第八代英特尔酷睿i3 个人商务台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','5899','5899','台式机/一体机','i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel奔腾 赛扬','GTX750','32G','512GB SSD','联想',152123456789,1689,true,'desktop/detail/7','img/product/desktop1.jpg');

INSERT INTO digital_product VALUES(NULL,5,' 戴尔(DELL)灵越3670台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','5999','5999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i5','GTX1060 3G/6G','32G','500GB HDD','戴尔',152123456789,1589,true,'desktop/detail/8','img/product/desktop4.jpg');

INSERT INTO digital_product VALUES(NULL,5,' 戴尔(DELL)灵越3670台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','4099','4099','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i3-8100 4G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX1060 3G/6G','32G','500GB HDD','戴尔',152123456789,1489,true,'desktop/detail/9','img/product/desktop4.jpg');

INSERT INTO digital_product VALUES(NULL,6,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i5-8400 16G高频 1T+128GSSD GTX1060 6G独显 三年上门）','GTX1060-6G”十”力尽显，固态机械双硬盘速容兼顾，绿刃LED锋芒毕露！','5199','5199','台式机/一体机','八代i5/8G/GTX1060爆款','八代i5/8G/GTX1060爆款, 八代i5/GTX1060 6G','Intel i7','GTX 9系/7系','16G','1TB HDD','戴尔',152123456789,1299,true,'desktop/detail/10','img/product/desktop4.jpg');

INSERT INTO digital_product VALUES(NULL,6,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i5-8400 16G高频 1T+128GSSD GTX1060 6G独显 三年上门）','GTX1060-6G”十”力尽显，固态机械双硬盘速容兼顾，绿刃LED锋芒毕露！','6999','6999','台式机/一体机','八代i5/GTX1060 6G','八代i5/8G/GTX1060爆款, 八代i5/GTX1060 6G','Intel i7','GTX 9系/7系','16G','1TB HDD','戴尔',152123456789,1389,true,'desktop/detail/11','img/product/desktop4.jpg');

#外设系列
INSERT INTO digital_product VALUES(NULL,3,'索尼（SONY）WH-1000XM3 高解析度无线蓝牙降噪耳机（触控面板 智能降噪 长久续航）黑色','新款黑科技，超强降噪，佩戴更舒适，快充更方便！','2899','游戏耳机','','','','','','','','',152123456789,1389,true,'preip/detail/1','img/product/perip6.jpg');

INSERT INTO digital_product VALUES(NULL,3,'小米米家（MIJIA）智能摄像机 云台版 白色 1080P','1080P高清／ 360度云台全景视角 ／ 微光全彩 ／ 双向语音 / AI 增强移动侦测 / H.265 编码 / 倒置安装 / 红外夜视','199','摄像头','','','','','','','','',152123456789,1389,true,'preip/detail/2','img/product/perip5.jpg');

INSERT INTO digital_product VALUES(NULL,3,' Pico G2小怪兽2 VR一体机 4K高清视频 体感游戏 VR眼镜 3D头盔','【爆款直降】小怪兽2VR一体机限时直降100元，到手价仅需1899元','1899','VR设备','','','','','','','','',152123456789,1389,true,'preip/detail/3','img/product/perip1.jpg');

INSERT INTO digital_product VALUES(NULL,3,'联想大红点M120Pro有线鼠标 台式机鼠标 笔记本鼠标','经典大红点系列，按键灵敏，精选耐磨防滑滚轮。','99','鼠标','','','','','','','','',152123456789,1389,true,'preip/detail/4','img/product/perip2.jpg');

INSERT INTO digital_product VALUES(NULL,3,'M330 无线静音鼠标 舒适曲线 黑色 M275升级版','舒适曲线 黑色 M275升级版','109','鼠标','','','','','','','','',152123456789,1389,true,'preip/detail/5','img/product/perip6.jpg');

INSERT INTO digital_product VALUES(NULL,3,'全尺寸背光机械游戏键盘 机械键盘 红轴 吃鸡键盘 绝地求生','无线光学鼠标，始于简约，磨砂手感，智能芯片','99','键盘','','','','','','','','',152123456789,1389,true,'preip/detail/6','img/product/perip4.jpg');




#笔记本**********************************************************************
CREATE TABLE digital_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,  #商品编号
  family_ids INT,             #所属型号家族编号
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
  is_onsale BOOLEAN,          #是否促销中
  href VARCHAR(128),
  img VARCHAR(128)
);
#导入笔记本信息
INSERT INTO digital_laptop VALUES(NULL,1,'14英寸四核独显轻薄商务便携笔记本电脑','金属游戏本，芯八代六核I7-8750H处理器，GTX1050/4G独显，8G内存，128G固态+1T机械，IPS高清屏',5999,'笔记本','游戏笔记本','14.0英寸','Intel i5','GTX1060 3G/6G','32G','500GB HDD','神舟',152123456789,7289,true,'laptop/detail/1','img/product/pro-lap6.jpg');

INSERT INTO digital_laptop VALUES(NULL,1,'15.6英寸游戏笔记本 黑色 80WW000TCD','金属游戏本，芯八代六核I7-8750H处理器，GTX1050/4G独显，8G内存，128G固态+1T机械，IPS高清屏',5999,'笔记本','游戏笔记本','12.5英寸','AMD','GTX1070 8G','4G','500GB HDD','雷神',153123456789,3289,true,'laptop/detail/2','img/product/pro-lap1.jpg');

INSERT INTO digital_laptop VALUES(NULL,1,'E580 笔记本电脑 20KSA001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',10899,'笔记本','游戏笔记本','17.3英寸','Intel i9','GTX750','4G','500GB HDD','炫龙',152123456789,1989,true,'laptop/detail/3','img/product/pro-lap5.jpg');

INSERT INTO digital_laptop VALUES(NULL,1,'15.6英寸游戏笔记本 黑色 81HC0007CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',5899,'笔记本','游戏笔记本','15.6英寸','Ryzen锐龙','GTX1060 3G/6G','32G','256GB SSD','外星人',152623456789,3589,true,'laptop/detail/4','img/product/pro-lap2.jpg');

INSERT INTO digital_laptop VALUES(NULL,1,'13.3英寸触控笔记本 天蝎灰 81CT0001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',7599,'笔记本','游戏笔记本','14.0英寸','Intel i9','GTX750','8G','256GB SSD','戴尔',152823456789,5689,true,'laptop/detail/5','img/product/pro-lap3.jpg');

INSERT INTO digital_laptop VALUES(NULL,1,'X280 笔记本电脑 20KFA002CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',6599,'笔记本','游戏笔记本, 轻薄笔记本 ','15.6英寸','Intel奔腾 赛扬','GTX750','16G','512GB SSD','华硕',152123456789,2289,true,'laptop/detail/6','img/product/pro-lap7.jpg');

INSERT INTO digital_laptop VALUES(NULL,1,'拯救者 Y7000 15.6英寸游戏笔记本 黑色 81FW0009CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',7599,'笔记本','游戏笔记本','13.3英寸','Intel i7','GTX1070 8G','4G','256GB SSD','拯救者',152123456789,1689,true,'laptop/detail/7','img/product/lap10.jpg');

INSERT INTO digital_laptop VALUES(NULL,1,'ThinkPad T480 笔记本电脑','i5-8250U/Windows 10 家庭版/8GB/1TB+128GB SSD/独显',8999,'笔记本','轻薄笔记本 ','11.6英寸','Intel i5','GTX1060 3G/6G','32G','240GB SSD','ThinkPad',152123456789,1579,true,'laptop/detail/8','img/product/pro-lap9.jpg');

INSERT INTO digital_laptop VALUES(NULL,1,'黑武士A56游戏笔记本','吃鸡游戏台式电脑主机（i5-8400 8G B360M GTX1060 6G 1T+128G Win10）搭配购买27英寸曲面窄边框显示器。',5999,'笔记本','游戏台式机','12.5英寸','Intel i3','GTX 9系/7系','16G','1TB HDD','雷神',152123456789,1389,true,'laptop/detail/9','img/product/pro-lap8.jpg');


#台式机*******************************************************************
CREATE TABLE digital_desktop(
  did INT PRIMARY KEY AUTO_INCREMENT,  #商品编号
  family_ids INT, 			#家族编号
  family_id INT,             #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  total VARCHAR(32),          #价格范围
  price VARCHAR(32),          #价格
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
  is_onsale BOOLEAN,           #是否促销中
  href VARCHAR(128),
  img VARCHAR(128)
);


#导入台式机/一体机信息
INSERT INTO digital_desktop VALUES(NULL,2,1,' 惠普（HP）暗影精灵23代 游戏台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','4999','4999','台式机/一体机',' i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX 9系/7系','16G','240GB SSD','ThinkPad',152123456789,7589,true,'desktop/detail/1','img/product/desktop2.jpg');

INSERT INTO digital_desktop VALUES(NULL,2,2,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i7-8700 16G高频 1T+256GSSD GTX1060 6G独显 三年上门）','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','¥4099-¥5999','5999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i5','GTX1070 8G','4G','256GB SSD','惠普',152123456789,3289,true,'desktop/detail/2','img/product/desktop5.jpg');

INSERT INTO digital_desktop VALUES(NULL,2,2,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i7-8700 16G高频 1T+256GSSD GTX1060 6G独显 三年上门）','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','¥4099-¥5999','4099','台式机/一体机','i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX1070 8G','4G','256GB SSD','惠普',152123456789,2289,true,'desktop/detail/3','img/product/desktop5.jpg');

INSERT INTO digital_desktop VALUES(NULL,2,3,'宏碁（Acer）商祺SQX4270 140N 商用办公台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','¥4999-¥5999','5999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i9','GTX1070 8G','4G','500GB HDD','弘基',152123456789,1989,true,'desktop/detail/4','img/product/desktop3.jpg');

INSERT INTO digital_desktop VALUES(NULL,2,3,'宏碁（Acer）商祺SQX4270 140N 商用办公台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','¥4999-¥5999','4999','台式机/一体机','i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX1070 8G','4G','500GB HDD','弘基',152123456789,1889,true,'desktop/detail/5','img/product/desktop3.jpg');

INSERT INTO digital_desktop VALUES(NULL,2,4,'联想（Lenovo）天逸510S 第八代英特尔酷睿i3 个人商务台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','¥2999-¥5899','2999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel奔腾 赛扬','GTX750','32G','512GB SSD','联想',152123456789,1789,true,'desktop/detail/6','img/product/desktop1.jpg');

INSERT INTO digital_desktop VALUES(NULL,2,4,'联想（Lenovo）天逸510S 第八代英特尔酷睿i3 个人商务台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','¥2999-¥5899','5899','台式机/一体机','i3-8100 4G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel奔腾 赛扬','GTX750','32G','512GB SSD','联想',152123456789,1689,true,'desktop/detail/7','img/product/desktop1.jpg');

INSERT INTO digital_desktop VALUES(NULL,2,5,' 戴尔(DELL)灵越3670台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','¥4099-¥5999','5999','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i5-8400 8G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i5','GTX1060 3G/6G','32G','500GB HDD','戴尔',152123456789,1589,true,'desktop/detail/8','img/product/desktop4.jpg');

INSERT INTO digital_desktop VALUES(NULL,2,5,' 戴尔(DELL)灵越3670台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','¥4099-¥5999','4099','台式机/一体机','i5-8400 8G 双硬盘 2G独显','i3-8100 4G 双硬盘 2G独显, i3-8100 4G 双硬盘 2G独显','Intel i3','GTX1060 3G/6G','32G','500GB HDD','戴尔',152123456789,1489,true,'desktop/detail/9','img/product/desktop4.jpg');

INSERT INTO digital_desktop VALUES(NULL,2,6,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i5-8400 16G高频 1T+128GSSD GTX1060 6G独显 三年上门）','GTX1060-6G”十”力尽显，固态机械双硬盘速容兼顾，绿刃LED锋芒毕露！','¥5199-¥6999','5199','台式机/一体机','八代i5/8G/GTX1060爆款','八代i5/8G/GTX1060爆款, 八代i5/GTX1060 6G','Intel i7','GTX 9系/7系','16G','1TB HDD','戴尔',152123456789,1299,true,'desktop/detail/10','img/product/desktop4.jpg');

INSERT INTO digital_desktop VALUES(NULL,2,6,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i5-8400 16G高频 1T+128GSSD GTX1060 6G独显 三年上门）','GTX1060-6G”十”力尽显，固态机械双硬盘速容兼顾，绿刃LED锋芒毕露！','¥5199-¥6999','6999','台式机/一体机','八代i5/GTX1060 6G','八代i5/8G/GTX1060爆款, 八代i5/GTX1060 6G','Intel i7','GTX 9系/7系','16G','1TB HDD','戴尔',152123456789,1389,true,'desktop/detail/11','img/product/desktop4.jpg');

#外设系列*********************************************************************
CREATE TABLE digital_preip(
  pid INT PRIMARY KEY AUTO_INCREMENT,  #商品编号
  family_ids INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  category VARCHAR(32),       #所属分类
  
  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN,           #是否促销中
  href VARCHAR(128),
  img VARCHAR(128)
);

#导入外设设备信息
INSERT INTO digital_preip VALUES(NULL,3,'索尼（SONY）WH-1000XM3 高解析度无线蓝牙降噪耳机（触控面板 智能降噪 长久续航）黑色','新款黑科技，超强降噪，佩戴更舒适，快充更方便！','2899','游戏耳机',152123456789,1389,true,'preip/detail/1','img/product/perip6.jpg');

INSERT INTO digital_preip VALUES(NULL,3,'小米米家（MIJIA）智能摄像机 云台版 白色 1080P','1080P高清／ 360度云台全景视角 ／ 微光全彩 ／ 双向语音 / AI 增强移动侦测 / H.265 编码 / 倒置安装 / 红外夜视','199','摄像头',152123456789,1389,true,'preip/detail/2','img/product/perip5.jpg');

INSERT INTO digital_preip VALUES(NULL,3,' Pico G2小怪兽2 VR一体机 4K高清视频 体感游戏 VR眼镜 3D头盔','【爆款直降】小怪兽2VR一体机限时直降100元，到手价仅需1899元','1899','VR设备',152123456789,1389,true,'preip/detail/3','img/product/perip1.jpg');

INSERT INTO digital_preip VALUES(NULL,3,'联想大红点M120Pro有线鼠标 台式机鼠标 笔记本鼠标','经典大红点系列，按键灵敏，精选耐磨防滑滚轮。','99','鼠标',152123456789,1389,true,'preip/detail/4','img/product/perip2.jpg');

INSERT INTO digital_preip VALUES(NULL,3,'M330 无线静音鼠标 舒适曲线 黑色 M275升级版','舒适曲线 黑色 M275升级版','109','鼠标',152123456789,1389,true,'preip/detail/5','img/product/perip4.jpg');

INSERT INTO digital_preip VALUES(NULL,3,'全尺寸背光机械游戏键盘 机械键盘 红轴 吃鸡键盘 绝地求生','无线光学鼠标，始于简约，磨砂手感，智能芯片','99','键盘',152123456789,1389,true,'preip/detail/6','img/product/perip3.jpg');


#**笔记本*********************************************
CREATE TABLE digital_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,             #商品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

#导入图片信息
#笔记本
INSERT INTO digital_laptop_pic VALUES(NULL,1,'img/details_laptop/sm/laptop-sm-14.jpg','img/details_laptop/lg/laptop-lg-14.jpg','img/details_laptop/lg/laptop-lg-14.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,1,'img/details_laptop/sm/de-laptop1-sm.jpg','img/details_laptop/md/de-laptop1-md.jpg','img/details_laptop/lg/de-laptop1-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,1,'img/details_laptop/sm/de-laptop2-sm.jpg','img/details_laptop/md/de-laptop2-md.jpg','img/details_laptop/lg/de-laptop2-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,1,'img/details_laptop/sm/de-laptop3-sm.jpg','img/details_laptop/md/de-laptop3-md.jpg','img/details_laptop/lg/de-laptop3-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,1,'img/details_laptop/sm/de-laptop4-sm.jpg','img/details_laptop/md/de-laptop4-md.jpg','img/details_laptop/lg/de-laptop4-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,2,'img/details_laptop/sm/laptop-sm-15.6.jpg','img/details_laptop/lg/laptop-lg-15.6.jpg','img/details_laptop/lg/laptop-lg-15.6.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,2,'img/details_laptop/sm/de-laptop1-sm.jpg','img/details_laptop/md/de-laptop1-md.jpg','img/details_laptop/lg/de-laptop1-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,2,'img/details_laptop/sm/de-laptop2-sm.jpg','img/details_laptop/md/de-laptop2-md.jpg','img/details_laptop/lg/de-laptop2-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,2,'img/details_laptop/sm/de-laptop3-sm.jpg','img/details_laptop/md/de-laptop3-md.jpg','img/details_laptop/lg/de-laptop3-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,2,'img/details_laptop/sm/de-laptop4-sm.jpg','img/details_laptop/md/de-laptop4-md.jpg','img/details_laptop/lg/de-laptop4-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,3,'img/details_laptop/sm/laptop-sm-e5.jpg','img/details_laptop/lg/laptop-lg-e5.jpg','img/details_laptop/lg/laptop-lg-e5.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,3,'img/details_laptop/sm/de-laptop1-sm.jpg','img/details_laptop/md/de-laptop1-md.jpg','img/details_laptop/lg/de-laptop1-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,3,'img/details_laptop/sm/de-laptop2-sm.jpg','img/details_laptop/md/de-laptop2-md.jpg','img/details_laptop/lg/de-laptop2-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,3,'img/details_laptop/sm/de-laptop3-sm.jpg','img/details_laptop/md/de-laptop3-md.jpg','img/details_laptop/lg/de-laptop3-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,3,'img/details_laptop/sm/de-laptop4-sm.jpg','img/details_laptop/md/de-laptop4-md.jpg','img/details_laptop/lg/de-laptop4-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,4,'img/details_laptop/sm/laptop-sm-15h.jpg','img/details_laptop/lg/laptop-lg-15h.jpg','img/details_laptop/lg/laptop-lg-15h.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,4,'img/details_laptop/sm/de-laptop1-sm.jpg','img/details_laptop/md/de-laptop1-md.jpg','img/details_laptop/lg/de-laptop1-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,4,'img/details_laptop/sm/de-laptop2-sm.jpg','img/details_laptop/md/de-laptop2-md.jpg','img/details_laptop/lg/de-laptop2-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,4,'img/details_laptop/sm/de-laptop3-sm.jpg','img/details_laptop/md/de-laptop3-md.jpg','img/details_laptop/lg/de-laptop3-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,4,'img/details_laptop/sm/de-laptop4-sm.jpg','img/details_laptop/md/de-laptop4-md.jpg','img/details_laptop/lg/de-laptop4-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,5,'img/details_laptop/sm/laptop-sm-13.3.jpg','img/details_laptop/lg/laptop-lg-13.3.jpg','img/details_laptop/lg/laptop-lg-13.3.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,5,'img/details_laptop/sm/de-laptop1-sm.jpg','img/details_laptop/md/de-laptop1-md.jpg','img/details_laptop/lg/de-laptop1-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,5,'img/details_laptop/sm/de-laptop2-sm.jpg','img/details_laptop/md/de-laptop2-md.jpg','img/details_laptop/lg/de-laptop2-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,5,'img/details_laptop/sm/de-laptop3-sm.jpg','img/details_laptop/md/de-laptop3-md.jpg','img/details_laptop/lg/de-laptop3-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,5,'img/details_laptop/sm/de-laptop4-sm.jpg','img/details_laptop/md/de-laptop4-md.jpg','img/details_laptop/lg/de-laptop4-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,6,'img/details_laptop/sm/laptop-sm-x2.jpg','img/details_laptop/lg/laptop-lg-x2.jpg','img/details_laptop/lg/laptop-lg-x2.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,6,'img/details_laptop/sm/de-laptop1-sm.jpg','img/details_laptop/md/de-laptop1-md.jpg','img/details_laptop/lg/de-laptop1-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,6,'img/details_laptop/sm/de-laptop2-sm.jpg','img/details_laptop/md/de-laptop2-md.jpg','img/details_laptop/lg/de-laptop2-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,6,'img/details_laptop/sm/de-laptop3-sm.jpg','img/details_laptop/md/de-laptop3-md.jpg','img/details_laptop/lg/de-laptop3-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,6,'img/details_laptop/sm/de-laptop4-sm.jpg','img/details_laptop/md/de-laptop4-md.jpg','img/details_laptop/lg/de-laptop4-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,7,'img/details_laptop/sm/laptop-sm-y7.jpg','img/details_laptop/lg/laptop-lg-y7.jpg','img/details_laptop/lg/laptop-lg-y7.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,7,'img/details_laptop/sm/de-laptop1-sm.jpg','img/details_laptop/md/de-laptop1-md.jpg','img/details_laptop/lg/de-laptop1-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,7,'img/details_laptop/sm/de-laptop2-sm.jpg','img/details_laptop/md/de-laptop2-md.jpg','img/details_laptop/lg/de-laptop2-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,7,'img/details_laptop/sm/de-laptop3-sm.jpg','img/details_laptop/md/de-laptop3-md.jpg','img/details_laptop/lg/de-laptop3-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,7,'img/details_laptop/sm/de-laptop4-sm.jpg','img/details_laptop/md/de-laptop4-md.jpg','img/details_laptop/lg/de-laptop4-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,8,'img/details_laptop/sm/laptop-sm-th.jpg','img/details_laptop/lg/laptop-lg-th.jpg','img/details_laptop/lg/laptop-lg-th.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,8,'img/details_laptop/sm/de-laptop1-sm.jpg','img/details_laptop/md/de-laptop1-md.jpg','img/details_laptop/lg/de-laptop1-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,8,'img/details_laptop/sm/de-laptop2-sm.jpg','img/details_laptop/md/de-laptop2-md.jpg','img/details_laptop/lg/de-laptop2-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,8,'img/details_laptop/sm/de-laptop3-sm.jpg','img/details_laptop/md/de-laptop3-md.jpg','img/details_laptop/lg/de-laptop3-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,8,'img/details_laptop/sm/de-laptop4-sm.jpg','img/details_laptop/md/de-laptop4-md.jpg','img/details_laptop/lg/de-laptop4-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,9,'img/details_laptop/sm/laptop-sm-a5.jpg','img/details_laptop/lg/laptop-lg-a5.jpg','img/details_laptop/lg/laptop-lg-a5.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,9,'img/details_laptop/sm/de-laptop1-sm.jpg','img/details_laptop/md/de-laptop1-md.jpg','img/details_laptop/lg/de-laptop1-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,9,'img/details_laptop/sm/de-laptop2-sm.jpg','img/details_laptop/md/de-laptop2-md.jpg','img/details_laptop/lg/de-laptop2-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,9,'img/details_laptop/sm/de-laptop3-sm.jpg','img/details_laptop/md/de-laptop3-md.jpg','img/details_laptop/lg/de-laptop3-lg.jpg');
INSERT INTO digital_laptop_pic VALUES(NULL,9,'img/details_laptop/sm/de-laptop4-sm.jpg','img/details_laptop/md/de-laptop4-md.jpg','img/details_laptop/lg/de-laptop4-lg.jpg');

#**台式机*********************************************
CREATE TABLE digital_desktop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  desktop_id INT,             #商品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);
#台式机
INSERT INTO digital_desktop_pic VALUES(NULL,1,'img/details_desktop/sm/desktop-sm-h23.jpg','img/details_desktop/lg/desktop-lg-h23.jpg','img/details_desktop/lg/desktop-lg-h23.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,1,'img/details_desktop/sm/de-desktop1-sm.jpg','img/details_desktop/lg/de-desktop1-lg.jpg','img/details_desktop/lg/de-desktop1-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,1,'img/details_desktop/sm/de-desktop2-sm.jpg','img/details_desktop/lg/de-desktop2-lg.jpg','img/details_desktop/lg/de-desktop2-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,1,'img/details_desktop/sm/de-desktop3-sm.jpg','img/details_desktop/lg/de-desktop3-lg.jpg','img/details_desktop/lg/de-desktop3-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,2,'img/details_desktop/sm/desktop-sm-h3.jpg','img/details_desktop/lg/desktop-lg-h3.jpg','img/details_desktop/lg/desktop-lg-h3.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,2,'img/details_desktop/sm/de-desktop1-sm.jpg','img/details_desktop/lg/de-desktop1-lg.jpg','img/details_desktop/lg/de-desktop1-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,2,'img/details_desktop/sm/de-desktop2-sm.jpg','img/details_desktop/lg/de-desktop2-lg.jpg','img/details_desktop/lg/de-desktop2-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,2,'img/details_desktop/sm/de-desktop3-sm.jpg','img/details_desktop/lg/de-desktop3-lg.jpg','img/details_desktop/lg/de-desktop3-lg.jpg');

INSERT INTO digital_desktop_pic VALUES(NULL,3,'img/details_desktop/sm/desktop-sm-h3.jpg','img/details_desktop/lg/desktop-lg-h3.jpg','img/details_desktop/lg/desktop-lg-h3.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,3,'img/details_desktop/sm/de-desktop1-sm.jpg','img/details_desktop/lg/de-desktop1-lg.jpg','img/details_desktop/lg/de-desktop1-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,3,'img/details_desktop/sm/de-desktop2-sm.jpg','img/details_desktop/lg/de-desktop2-lg.jpg','img/details_desktop/lg/de-desktop2-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,3,'img/details_desktop/sm/de-desktop3-sm.jpg','img/details_desktop/lg/de-desktop3-lg.jpg','img/details_desktop/lg/de-desktop3-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,4,'img/details_desktop/sm/desktop-sm-ac.jpg','img/details_desktop/lg/desktop-lg-ac.jpg','img/details_desktop/lg/desktop-lg-ac.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,4,'img/details_desktop/sm/de-desktop1-sm.jpg','img/details_desktop/lg/de-desktop1-lg.jpg','img/details_desktop/lg/de-desktop1-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,4,'img/details_desktop/sm/de-desktop2-sm.jpg','img/details_desktop/lg/de-desktop2-lg.jpg','img/details_desktop/lg/de-desktop2-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,4,'img/details_desktop/sm/de-desktop3-sm.jpg','img/details_desktop/lg/de-desktop3-lg.jpg','img/details_desktop/lg/de-desktop3-lg.jpg');

INSERT INTO digital_desktop_pic VALUES(NULL,5,'img/details_desktop/sm/desktop-sm-ac.jpg','img/details_desktop/lg/desktop-lg-ac.jpg','img/details_desktop/lg/desktop-lg-ac.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,5,'img/details_desktop/sm/de-desktop1-sm.jpg','img/details_desktop/lg/de-desktop1-lg.jpg','img/details_desktop/lg/de-desktop1-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,5,'img/details_desktop/sm/de-desktop2-sm.jpg','img/details_desktop/lg/de-desktop2-lg.jpg','img/details_desktop/lg/de-desktop2-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,5,'img/details_desktop/sm/de-desktop3-sm.jpg','img/details_desktop/lg/de-desktop3-lg.jpg','img/details_desktop/lg/de-desktop3-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,6,'img/details_desktop/sm/desktop-sm-le5.jpg','img/details_desktop/lg/desktop-lg-le5.jpg','img/details_desktop/lg/desktop-lg-le5.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,6,'img/details_desktop/sm/de-desktop1-sm.jpg','img/details_desktop/lg/de-desktop1-lg.jpg','img/details_desktop/lg/de-desktop1-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,6,'img/details_desktop/sm/de-desktop2-sm.jpg','img/details_desktop/lg/de-desktop2-lg.jpg','img/details_desktop/lg/de-desktop2-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,6,'img/details_desktop/sm/de-desktop3-sm.jpg','img/details_desktop/lg/de-desktop3-lg.jpg','img/details_desktop/lg/de-desktop3-lg.jpg');

INSERT INTO digital_desktop_pic VALUES(NULL,7,'img/details_desktop/sm/desktop-sm-le5.jpg','img/details_desktop/lg/desktop-lg-le5.jpg','img/details_desktop/lg/desktop-lg-le5.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,7,'img/details_desktop/sm/de-desktop1-sm.jpg','img/details_desktop/lg/de-desktop1-lg.jpg','img/details_desktop/lg/de-desktop1-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,7,'img/details_desktop/sm/de-desktop2-sm.jpg','img/details_desktop/lg/de-desktop2-lg.jpg','img/details_desktop/lg/de-desktop2-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,7,'img/details_desktop/sm/de-desktop3-sm.jpg','img/details_desktop/lg/de-desktop3-lg.jpg','img/details_desktop/lg/de-desktop3-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,8,'img/details_desktop/sm/desktop-sm-de3.jpg','img/details_desktop/lg/desktop-lg-de3.jpg','img/details_desktop/lg/desktop-lg-de3.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,8,'img/details_desktop/sm/de-desktop1-sm.jpg','img/details_desktop/lg/de-desktop1-lg.jpg','img/details_desktop/lg/de-desktop1-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,8,'img/details_desktop/sm/de-desktop2-sm.jpg','img/details_desktop/lg/de-desktop2-lg.jpg','img/details_desktop/lg/de-desktop2-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,8,'img/details_desktop/sm/de-desktop3-sm.jpg','img/details_desktop/lg/de-desktop3-lg.jpg','img/details_desktop/lg/de-desktop3-lg.jpg');

INSERT INTO digital_desktop_pic VALUES(NULL,9,'img/details_desktop/sm/desktop-sm-de3.jpg','img/details_desktop/lg/desktop-lg-de3.jpg','img/details_desktop/lg/desktop-lg-de3.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,9,'img/details_desktop/sm/de-desktop1-sm.jpg','img/details_desktop/lg/de-desktop1-lg.jpg','img/details_desktop/lg/de-desktop1-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,9,'img/details_desktop/sm/de-desktop2-sm.jpg','img/details_desktop/lg/de-desktop2-lg.jpg','img/details_desktop/lg/de-desktop2-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,9,'img/details_desktop/sm/de-desktop3-sm.jpg','img/details_desktop/lg/de-desktop3-lg.jpg','img/details_desktop/lg/de-desktop3-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,10,'img/details_desktop/sm/desktop-sm-hp.jpg','img/details_desktop/lg/desktop-lg-hp.jpg','img/details_desktop/lg/desktop-lg-hp.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,10,'img/details_desktop/sm/de-desktop1-sm.jpg','img/details_desktop/lg/de-desktop1-lg.jpg','img/details_desktop/lg/de-desktop1-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,10,'img/details_desktop/sm/de-desktop2-sm.jpg','img/details_desktop/lg/de-desktop2-lg.jpg','img/details_desktop/lg/de-desktop2-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,10,'img/details_desktop/sm/de-desktop3-sm.jpg','img/details_desktop/lg/de-desktop3-lg.jpg','img/details_desktop/lg/de-desktop3-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,11,'img/details_desktop/sm/desktop-sm-hp.jpg','img/details_desktop/lg/desktop-lg-hp.jpg','img/details_desktop/lg/desktop-lg-hp.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,11,'img/details_desktop/sm/de-desktop1-sm.jpg','img/details_desktop/lg/de-desktop1-lg.jpg','img/details_desktop/lg/de-desktop1-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,11,'img/details_desktop/sm/de-desktop2-sm.jpg','img/details_desktop/lg/de-desktop2-lg.jpg','img/details_desktop/lg/de-desktop2-lg.jpg');
INSERT INTO digital_desktop_pic VALUES(NULL,11,'img/details_desktop/sm/de-desktop3-sm.jpg','img/details_desktop/lg/de-desktop3-lg.jpg','img/details_desktop/lg/de-desktop3-lg.jpg');

#**外设设备图片*********************************************
CREATE TABLE digital_preip_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  preip_id INT,             #商品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

#外设设备
INSERT INTO digital_preip_pic VALUES(NULL,1,'img/details_preip/sm/sony-sm.jpg','img/details_preip/md/sony-md.jpg','img/details_preip/lg/sony-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,1,'img/details_preip/sm/sony1-sm.jpg','img/details_preip/lg/sony1-lg.jpg','img/details_preip/lg/sony1-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,1,'img/details_preip/sm/sony2-sm.jpg','img/details_preip/lg/sony2-lg.jpg','img/details_preip/lg/sony2-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,1,'img/details_preip/sm/sony3-sm.jpg','img/details_preip/lg/sony3-lg.jpg','img/details_preip/lg/sony3-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,1,'img/details_preip/sm/sony4-sm.jpg','img/details_preip/lg/sony4-lg.jpg','img/details_preip/lg/sony4-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,2,'img/details_preip/sm/mijia-sm.jpg','img/details_preip/md/mijia-md.jpg','img/details_preip/lg/mijia-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,2,'img/details_preip/sm/mijia1-sm.jpg','img/details_preip/lg/mijia1-lg.jpg','img/details_preip/lg/mijia1-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,2,'img/details_preip/sm/mijia2-sm.jpg','img/details_preip/lg/mijia2-lg.jpg','img/details_preip/lg/mijia2-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,3,'img/details_preip/sm/pico-sm.jpg','img/details_preip/md/pico-md.jpg','img/details_preip/lg/pico-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,3,'img/details_preip/sm/pico1-sm.jpg','img/details_preip/lg/pico1-lg.jpg','img/details_preip/lg/pico1-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,3,'img/details_preip/sm/pico2-sm.jpg','img/details_preip/lg/pico2-lg.jpg','img/details_preip/lg/pico2-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,4,'img/details_preip/sm/m120p-sm.jpg','img/details_preip/md/m120p-md.jpg','img/details_preip/lg/m120p-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,4,'img/details_preip/sm/m120p1-sm.jpg','img/details_preip/lg/m120p1-lg.jpg','img/details_preip/lg/m120p1-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,4,'img/details_preip/sm/m120p2-sm.jpg','img/details_preip/lg/m120p2-lg.jpg','img/details_preip/lg/m120p2-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,4,'img/details_preip/sm/m120p3-sm.jpg','img/details_preip/lg/m120p3-lg.jpg','img/details_preip/lg/m120p3-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,5,'img/details_preip/sm/m330-sm.jpg','img/details_preip/md/m330-md.jpg','img/details_preip/lg/m330-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,5,'img/details_preip/sm/m120p1-sm.jpg','img/details_preip/lg/m120p1-lg.jpg','img/details_preip/lg/m120p1-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,5,'img/details_preip/sm/m120p2-sm.jpg','img/details_preip/lg/m120p2-lg.jpg','img/details_preip/lg/m120p2-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,5,'img/details_preip/sm/m120p3-sm.jpg','img/details_preip/lg/m120p3-lg.jpg','img/details_preip/lg/m120p3-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,6,'img/details_preip/sm/keyboard-sm.jpg','img/details_preip/lg/keyboard-lg.jpg','img/details_preip/lg/keyboard-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,6,'img/details_preip/sm/keyboard1-sm.jpg','img/details_preip/lg/keyboard1-lg.jpg','img/details_preip/lg/keyboard1-lg.jpg');
INSERT INTO digital_preip_pic VALUES(NULL,6,'img/details_preip/sm/keyboard2-sm.jpg','img/details_preip/lg/keyboard2-lg.jpg','img/details_preip/lg/keyboard2-lg.jpg');



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

#首页商品**************************************************************
CREATE TABLE digital_index_product(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price VARCHAR(64),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);  

#导入首页商品信息
#笔记本
INSERT INTO digital_index_product VALUES(NULL, '14英寸四核独显轻薄商务便...', '金属游戏本，芯八代六核I7-...','img/index/recommendation5.jpg','5999', 'product_details.html?lid=1', 1, 1, 1);

INSERT INTO digital_index_product VALUES(NULL, '15.6英寸游戏笔记本 黑色 8...', 'i5-8300H/Windo...','img/index/recommendation4.jpg','5899', 'product_details.html?lid=4', 2, 2, 2);

INSERT INTO digital_index_product VALUES(NULL, '15.6英寸游戏笔记本 黑色8...', '金属游戏本，芯八代六核I7-...','img/index/laptop6.jpg','5999', 'product_details.html?lid=2', 3, 3, 3);

INSERT INTO digital_index_product VALUES(NULL, '13.3英寸触控笔记本 天蝎灰...', 'i5-8300H/Window...','img/index/recommendation2.jpg','7599', 'product_details.html?lid=5', 4, 4, 4);

INSERT INTO digital_index_product VALUES(NULL, 'E580 笔记本电脑 20KSA00...','i5-8300H/Window...','img/index/laptop3.jpg','10899', 'product_details.html?lid=3', 5, 5, 5);

INSERT INTO digital_index_product VALUES(NULL, 'X280 笔记本电脑 20KFA00...', 'i5-8300H/Window...','img/index/laptop2.jpg','6599', 'product_details.html?lid=6', 6, 6, 6);
#台式机
INSERT INTO digital_index_product VALUES(NULL, '惠普（HP）暗影精灵23代...', '全新戴尔灵越酷睿8代超窄边框...','img/index/desktop5.jpg','4999', 'product_details.html?did=1', 7, 7, 7);

INSERT INTO digital_index_product VALUES(NULL, '联想（Lenovo）天逸510S...', '全新戴尔灵越酷睿8代超窄边框...','img/index/desktop6.jpg','¥2899-¥5899', 'product_details.html?did=7', 8, 8, 8);

INSERT INTO digital_index_product VALUES(NULL, '惠普（HP）暗影精灵3代 游...', '全新戴尔灵越酷睿8代超窄边框...','img/index/desktop2.jpg','¥4099-¥5999', 'product_details.html?did=3', 9, 9, 9);

INSERT INTO digital_index_product VALUES(NULL, '戴尔(DELL)灵越3670台式...', '全新戴尔灵越酷睿8代超窄边框...','img/index/desktop3.jpg','¥4099-¥5999', 'product_details.html?did=8', 10, 10, 10);

INSERT INTO digital_index_product VALUES(NULL, '宏碁（Acer）商祺SQX427...', '全新戴尔灵越酷睿8代超窄边框...','img/index/desktop4.jpg','¥4999-¥5999', 'product_details.html?did=4', 11, 11, 11);

INSERT INTO digital_index_product VALUES(NULL, '惠普（HP）暗影精灵3代 游...', 'GTX1060-6G”十”力...','img/index/desktop3.jpg','¥5199-¥6999', 'product_details.html?did=11', 12, 12, 12);

#外设设备
INSERT INTO digital_index_product VALUES(NULL, '索尼（SONY）WH-1000X...', '新款黑科技，超强降噪，佩戴更...', 'img/index/peripheral2.jpg','1699', 'product_details.html?pid=1', 13, 13, 13);

INSERT INTO digital_index_product VALUES(NULL, '联想大红点M120Pro有线...', '经典大红点系列，按键灵敏，精...', 'img/index/peripheral5.jpg','99', 'product_details.html?pid=4', 14, 14, 14);

INSERT INTO digital_index_product VALUES(NULL, '小米米家（MIJIA）智能摄...', '1080P高清／ 360度云...', 'img/index/peripheral8.jpg','199', 'product_details.html?pid=2', 15, 15, 15);

INSERT INTO digital_index_product VALUES(NULL, 'M330 无线静音鼠标 舒适...', '舒适曲线 黑色 M275升级...', 'img/index/peripheral7.jpg','109', 'product_details.html?pid=5', 16, 16, 16);

INSERT INTO digital_index_product VALUES(NULL, 'Pico G2小怪兽2 VR一体机...', '【爆款直降】小怪兽2VR一体...', 'img/index/peripheral4.jpg','1899', 'product_details.html?pid=3', 17, 17, 17);

INSERT INTO digital_index_product VALUES(NULL, '全尺寸背光机械游戏键盘 机...', '无线光学鼠标，始于简约，磨砂...', 'img/index/peripheral6.jpg','99', 'product_details.html?pid=6', 18, 18, 18);


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
INSERT INTO digital_index_selection VALUES(NULL, '拯救者 Y7000 15.6英寸游...', 'i5-8300H/Window...', 'img/index/recommendation1.jpg', 'product_details.html?lid=7',1,1,1);

INSERT INTO digital_index_selection VALUES(NULL, '14英寸四核独显轻薄商务便...', '金属游戏本，芯八代六核I7-...', 'img/index/recommendation5.jpg', 'product_details.html?lid=1', 2, 2, 2);

INSERT INTO digital_index_selection VALUES(NULL, '15.6英寸游戏笔记本 黑色 8...', 'i5-8300H/Windo...','img/index/recommendation4.jpg','product_details.html?lid=4', 3, 3, 3);

INSERT INTO digital_index_selection VALUES(NULL, '13.3英寸触控笔记本 天蝎灰...', 'i5-8300H/Window...', 'img/index/recommendation2.jpg', 'product_details.html?lid=5', 4, 4, 4);

INSERT INTO digital_index_selection VALUES(NULL, 'ThinkPad T480 笔记本电脑', 'i5-8250U/Window...', 'img/index/recommendation6.jpg', 'product_details.html?lid=8',5, 5,5);

#首页商品-热评产品********************************************************
CREATE TABLE digital_index_hot(
  hid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price VARCHAR(64),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

#导入首页商品-热评产品信息
INSERT INTO digital_index_hot VALUES(NULL, 'ThinkPad T480 笔记本电脑', 'i5-8250U/Windows 10 家庭版/8GB/1T...', 'img/index/recommendation6.jpg','5999', 'product_details.html?lid=8',1, 1,1);

INSERT INTO digital_index_hot VALUES(NULL, 'X280 笔记本电脑 20KFA00...', 'i5-8300H/Windows 10 家庭中文版/15.6...', 'img/index/laptop2.jpg','6599', 'product_details.html?lid=6', 2,2,2);

INSERT INTO digital_index_hot VALUES(NULL, 'E580 笔记本电脑 20KSA00...','i5-8300H/Windows 10 家庭中文版/15.6...', 'img/index/laptop3.jpg','10899', 'product_details.html?lid=3',3,3,3);

INSERT INTO digital_index_hot VALUES(NULL, '惠普（HP）暗影精灵23代...', '全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，...', 'img/index/desktop5.jpg','4999', 'product_details.html?did=1',4,4,4);

INSERT INTO digital_index_hot VALUES(NULL, '戴尔(DELL)灵越3670台式...', '全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，...', 'img/index/desktop3.jpg','¥4099-¥5999', 'product_details.html?did=9', 5, 5, 5);

#购物车信息
CREATE TABLE digital_carts(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    aid1 INT,
    aid2 INT,
    aid3 INT,
    uid INT,
    count INT,
    title VARCHAR(255),
    price VARCHAR(255),
    img VARCHAR(255)
);
INSERT INTO digital_carts VALUES(NULL,1,'','',1,1,'14英寸四核独显轻薄商务便携笔记本电脑','5999','img/product/pro-lap6.jpg');
INSERT INTO digital_carts VALUES(NULL,2,'','',2,2,'14英寸四核独显轻薄商务便携笔记本电脑','6999','img/product/pro-lap5.jpg');







