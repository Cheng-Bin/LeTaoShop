--
-- 管理员表
--
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  userId int primary key identity(1,1),
  userName varchar(50) NOT NULL,
  realName varchar(32) NOT NULL,
  password varchar(50) NOT NULL
);



INSERT INTO admins VALUES('程斌','admin','admin');
--
-- 会员表
--
DROP TABLE customers;
CREATE TABLE customers (
  cId int primary key identity(1, 1),
  cName nvarchar(50) not null,
  cPassword nvarchar(50) not null,
  cRealName nvarchar(20) default '',
  cSex char(2) default '0',
  cBirthday date default 'now()',
  cAddress nvarchar(200) default '',
  post nvarchar(6) default '',
  cEmail nvarchar(50) default '',
  cMobile nvarchar(11) default ''
);

INSERT INTO customers VALUES ('admin','admin','程斌',1,'1992-12-26','四川省广元市xxx区xxx号xxx小区xxx门','637426','997155658@qq.com','182xxxx8888');


--文章类别
CREATE TABLE articleCategory
(
	categoryId int primary key identity(1,1),  --ID
	categoryName nvarchar(32) not null,	   --类型名称
	categoryIntro nvarchar(256) default ''     --简介
);

--文章表
create table article
(
	articleId int primary key identity(1,1), --ID
	articleTitle nvarchar(64) not null,		 --标题
	articleLabel nvarchar(12) default '',	 --标签
	articleAddress nvarchar(64) default '',	 --转载地址
	articleStatement nvarchar(128) default '', --描述
	articleUrl nvarchar(128) default '',     --图片URL
	articleContent text not null,			 --内容 
	articleParentId int not null,			 --所属类别
	addAuthor nvarchar(32) not null,		 --添加人
	addTime datetime default 'now()',		 --添加时间
	constraint article_id_rf foreign key(articleParentId) references articleCategory(categoryId)
);


--
-- 产品种类表
--
DROP TABLE IF EXISTS productCategory;
CREATE TABLE productCategory (
  categoryId int primary key identity(1,1),
  categoryName varchar(50) NOT NULL,
  categoryLevel int DEFAULT NULL,
  pid int DEFAULT NULL,
  constraint category_pid_fk FOREIGN KEY(pid) REFERENCES productCategory(categoryId)
);

INSERT INTO productCategory VALUES ('服装',1,NULL);


--
-- 产品信息表
--
DROP TABLE IF EXISTS product;
CREATE TABLE product (
  pId int primary key identity(1,1), 
  pNo nvarchar(10) DEFAULT NULL unique,
  pName nvarchar(100) NOT NULL,				--商品名称
  pTag  nvarchar(64),						--标签
  [description] text,							--描述
  basePrice float DEFAULT NULL,				--基本价格
  marketPrice float DEFAULT NULL,			--市场价
  sellPrice float DEFAULT NULL,				--销售价
  sexRequest nvarchar(5) DEFAULT NULL,		--适合性别
  commend bit DEFAULT NULL,				--推荐
  sale bit DEFAULT NULL,					--特价
  promotion bit DEFAULT NULL,			--促销
  limit bit DEFAULT NULL,				--限量
  clickCount int DEFAULT NULL,			--点击次数
  sellCount int DEFAULT NULL,			--销售数量
  pCount int DEFAULT NULL,				--库存
  categoryId int DEFAULT NULL,			--类别ID
  uploadFile int DEFAULT NULL unique,			--图片ID
  addTime datetime DEFAULT NULL,			--上架时间
  addAuthor nvarchar(32) DEFAULT NULL,		--添加人
  CONSTRAINT product_uploadFile_fk FOREIGN KEY(uploadFile) REFERENCES uploadFile(id),
  CONSTRAINT product_categoryId_fk FOREIGN KEY(categoryId) REFERENCES productCategory(categoryId)
);



--
-- 产品图片
--
DROP TABLE IF EXISTS uploadFile;
CREATE TABLE uploadFile (
  id int primary key identity(1,1),
  [path] nvarchar(255) NOT NULL
);

INSERT INTO uploadfile VALUES (1,'201004201340260341.jpg'),(2,'201004201342270110.jpg'),(3,'201004201359330922.jpg'),(4,'201004201400560420.jpg'),(5,'201004201401400092.jpg');


create table comment(
  commentId int primary key identity(1, 1),
  commentContent text,
  customerId int default '',
  productId int  default '',
  CONSTRAINT comment_customerId_fk FOREIGN KEY (customerId) REFERENCES customers(cId),
  CONSTRAINT comment_productId_fk FOREIGN KEY (productId) REFERENCES product(pId),
);

--收藏
create table favorite
(
	id int primary key identity(1,1),
	productId int not null,
	customerId int not null,
	addTime datetime not null,
	CONSTRAINT favorite_customer_fk FOREIGN KEY(customerId) REFERENCES customers(cId)
);


--
-- 订单表
--
drop table orders;

CREATE TABLE orders (
  id int identity(1,1) primary key,
  orderId nvarchar(30) not null unique,		--订单ID
  name nvarchar(50) not null,		--收货人姓名
  address nvarchar(200) not null,	--地址
  post nvarchar(6) default '',
  mobile nvarchar(11) not null,		--电话
  totalPrice float not null,		--总价
  createTime datetime default null,	--生成订单时间
  paymentWay nvarchar(15) default null,--支付方式
  orderState nvarchar(10) default null,--支付状态
  customerId int default null,		--用户id
  remarks nvarchar(256) default '',
  CONSTRAINT order_customerId_fk FOREIGN KEY (customerId) REFERENCES customers(cId)
);



CREATE TABLE orderItem (
  orderItemId int primary key identity(1, 1),
  productId int not null,				--商品ID
  productName nvarchar(200) not null,	--商品名称
  productPrice float not null,			--单价
  amount int default null,				--数量	
  orderId int default null,		--所属订单
  CONSTRAINT orders_orderItem_fk FOREIGN KEY(orderId) REFERENCES orders(id)
);

