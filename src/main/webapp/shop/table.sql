
CREATE TABLE tblProduct (
	no                  int(5)                      auto_increment  ,
	name            varchar(20)           NULL      ,
	price             int                           NULL      ,
	detail            text                          NULL      ,
	date              varchar(20)           NULL      ,
	stock            int                            NULL      ,
	image           varchar(20)           NULL      ,
	PRIMARY KEY ( no )
)COLLATE='euckr_korean_ci';

CREATE TABLE tblOrder (
	no                    int                          auto_increment  ,
	productNo      int                            NULL  ,
	quantity          int                           NULL      ,
	date                varchar(20)           NULL      ,
	state               varchar(10)           NULL      ,
	id                     varchar(10)           NULL      ,
	PRIMARY KEY ( no )
)COLLATE='euckr_korean_ci';

CREATE TABLE tblAdmin (
	admin_id                 varchar(20)          NOT NULL  ,
	admin_pwd     varchar(20)          NOT NULL      ,
	PRIMARY KEY       ( admin_id )
)COLLATE='euckr_korean_ci';

CREATE TABLE tblMember (
  id char(20) NOT NULL,
  pwd char(20) NOT NULL,
  name char(20) NOT NULL,
  gender char(1) NOT NULL,
  birthday char(6) NOT NULL,
  email char(30) NOT NULL,
  zipcode char(5) NOT NULL,
  address char(50) NOT NULL,
  hobby char(5) NOT NULL,
  job char(20) NOT NULL,
  PRIMARY KEY (id)
)COLLATE='euckr_korean_ci';

CREATE TABLE tblZipcode (
 zipcode             char(7)              NOT NULL  ,
 area1               char(10)             NULL      ,
 area2               char(20)             NULL      ,
 area3               char(40)             NULL      ,
 area4               char(20)             NULL      
)COLLATE='euckr_korean_ci';

insert tblProduct(name,price,detail,date,stock,image)
values ('������ �ø�3',1200000,'������ �ø�3 �󼼼���',
now(), 100, 'data1.jpg');

insert tblProduct(name,price,detail,date,stock,image)
values ('������ Z ����3',1500000,'������ Z ����3 �󼼼���',
now(), 100, 'data2.jpg');

insert tblProduct(name,price,detail,date,stock,image)
values ('iPhone 13',1300000,'iPhone 13 �󼼼���',
now(), 100, 'data3.jpg');