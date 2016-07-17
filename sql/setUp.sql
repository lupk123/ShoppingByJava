create database shopping;
use shopping;

create table user(
  id int primary key auto_increment , #id
  username varchar(30) , #用户名
  password varchar(50), #密码
  phone varchar(20), #电话
  addr varchar(100), #地址
  rdate datetime  #注册时间
);

create table category(
  id int primary key auto_increment , #id
  name varchar (20), #类别名称
  decsr varchar (100), #描述
  pid int #父id
);

create table product(
  id int primary key auto_increment , #id
  name varchar (20), #产品名称
  descr varchar (100), #描述
  normalprice varchar (20), #市场价格
  memberprice varchar (20), #会员价
  pdate datetime , #上柜日期
  categoryID int, #类别 外键
  foreign key (categoryID) references category (id)
);

create table salesOrder(
  id int primary key auto_increment , #id
  userid int , #用户id 外键
  addr varchar(100) , #送货地址
  odate datetime , #下单时间
  status int , #订单状态 0 未处理 1 成功 2 废单
  foreign key (userid) references user (id)
);

create table salesItem(
  id int primary key auto_increment , #id
  productID int , #产品ID 外键
  unitprice varchar (20) ,#单价
  pcount int , #数量
  orderId int , #所属订单的id 外键
  foreign key (productID) references  product (id),
  foreign key (orderId) references salesorder (id)
);