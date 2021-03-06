create table item(
    itemId          number              primary key,
	itemName        varchar2(100)       not null,
	address         varchar2(100)       not null,
	locale          varchar2(100)       not null,
	itemPrice       number              not null,
	itemImage       varchar2(200)       not null,
	distance        number              not null,
	latitude        number              not null,
	longitude       number              not null,
	filter          varchar2(300)       not null,
	info            clob,
	areaCode        number              not null
);

create table item_room(
    itemRoomId               number              primary key,
    itemId                   number              not null,
    itemRoomName             varchar2(100)       not null,
    itemRoomImage            varchar2(200)       not null,
    itemRoomPrice            number              not null,
    standardPeople           varchar2(10)       not null,
    maxPeople                varchar2(10)       not null,
    
    CONSTRAINT fk_item_room
    FOREIGN KEY(itemId)
    REFERENCES item(itemId)
);

create sequence image_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
NOCYCLE
NOCACHE;
    
create table image(
    imageId         number          default image_seq.nextval      primary key,
    itemRoomId      number          not null,
    image           varchar2(200)   not null,
    
    CONSTRAINT fk_image
    FOREIGN KEY(itemRoomId)
    REFERENCES item_room(itemRoomId)
);


select * from item A join item_room B
on A.itemId = B.itemId and A.itemId = 11;

create sequence calendar_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
NOCYCLE
NOCACHE;

create sequence cycle_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 3
CYCLE
NOCACHE;

create table calendar(
    calendarId number default calendar_seq.nextval primary key,
    itemRoomId number not null,
    month number not null,
    d1 number check(d1 in(0, 1)),
    d2 number check(d2 in(0, 1)),
    d3 number check(d3 in(0, 1)),
    d4 number check(d4 in(0, 1)),
    d5 number check(d5 in(0, 1)),
    d6 number check(d6 in(0, 1)),
    d7 number check(d7 in(0, 1)),
    d8 number check(d8 in(0, 1)),
    d9 number check(d9 in(0, 1)),
    d10 number check(d10 in(0, 1)),
    d11 number check(d11 in(0, 1)),
    d12 number check(d12 in(0, 1)),
    d13 number check(d13 in(0, 1)),
    d14 number check(d14 in(0, 1)),
    d15 number check(d15 in(0, 1)),
    d16 number check(d16 in(0, 1)),
    d17 number check(d17 in(0, 1)),
    d18 number check(d18 in(0, 1)),
    d19 number check(d19 in(0, 1)),
    d20 number check(d20 in(0, 1)),
    d21 number check(d21 in(0, 1)),
    d22 number check(d22 in(0, 1)),
    d23 number check(d23 in(0, 1)),
    d24 number check(d24 in(0, 1)),
    d25 number check(d25 in(0, 1)),
    d26 number check(d26 in(0, 1)),
    d27 number check(d27 in(0, 1)),
    d28 number check(d28 in(0, 1)),
    d29 number check(d29 in(0, 1)),
    d30 number check(d30 in(0, 1)),
    d31 number check(d31 in(0, 1)),
    
    CONSTRAINT fk_calendar
    FOREIGN KEY(itemRoomId)
    REFERENCES item_room(itemRoomId)
);

create sequence member_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
NOCYCLE
NOCACHE;

create table member(
memberId    number          default member_seq.nextval,
email       varchar2(300)   not null,
memberPW    varchar2(300)   not null,
name        varchar2(200)   not null,
phone       varchar2(300)   not null,
point       number          default 0 check(0 <= point),
status      number          default 1 check(status in(0,1)),
memberKind  varchar2(10)    check(memberKind in ('n', 'k', 'd'))
);
        
create sequence orders_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

create table orders(
    orderId number default orders_seq.nextval primary key,
    memberId number,
    itemRoomId number not null,
    orderDate date default sysdate,
    checkIn varchar2(50) not null,
    checkOut varchar2(50) not null,
    orderPrice number not null,
    tid varchar2(100) not null,
    notPhone varchar2(50),
    notName varchar2(100),
    cancel number default 1 check(cancel in(0, 1, 2)), 
    
    CONSTRAINT fk_orders_member
    FOREIGN KEY(memberId)
    REFERENCES member(memberId),
    
    CONSTRAINT fk_orders_item_room
    FOREIGN KEY(itemRoomId)
    REFERENCES item_room(itemRoomId)
);

create sequence review_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
NOCYCLE
NOCACHE;

create table review(
idx         number          default review_seq.nextval primary key,
memberId    number          not null,
title       varchar2(300)   not null,
img         varchar2(300)   default null,
starPoint   number          not null,
itemid    	number   		not null,
constraint member_review_fk foreign key(memberId) references member(memberId) on delete cascade,
constraint item_review_fk foreign key(itemid) references item(itemid) on delete cascade
);

create sequence point_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
NOCYCLE
NOCACHE;

create table point(
    pointId     number  DEFAULT point_seq.nextval PRIMARY key,
    orderId     number  ,
    title       varchar2(300) not null,
    memberId    number  not null,
    point      number  not null,
    pointDate  date    default sysdate,
    status      varchar2(10) check(status in ('r' ,'p')),
    
    constraint point_member_fk  
    foreign key(memberId)     
    references member(memberId)
    on delete cascade,           
    
    CONSTRAINT order_point_fk
    FOREIGN key(orderId)
    REFERENCES orders(orderId)
);

CREATE TABLE "C##ITBANK4"."SEE_MORE_ENFM" 
   (	"CLASS_ID" VARCHAR2(200 BYTE), 
	"IDX_NUM" NUMBER(5,0), 
	"ENFM_DATE" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS";
  
  CREATE TABLE "C##ITBANK4"."SEE_MORE" 
   (	"T_ID" VARCHAR2(12 BYTE), 
	"TOP_CLASS" VARCHAR2(4 BYTE), 
	"MID_CLASS" VARCHAR2(4 BYTE), 
	"T_NUMBER" NUMBER(4,0), 
	"TITLE" VARCHAR2(200 BYTE), 
	"ENFM_DATE_USE" CHAR(1 BYTE), 
	"ENFM_DATE" DATE, 
	"T_CONTENTS" CLOB, 
	"ETC" VARCHAR2(400 BYTE), 
	"REG_USER" VARCHAR2(20 BYTE), 
	"REG_DATE" DATE, 
	"MOD_USER" VARCHAR2(20 BYTE), 
	"MOD_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("T_CONTENTS") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

  CREATE UNIQUE INDEX "C##ITBANK4"."SYS_C008979" ON "C##ITBANK4"."SEE_MORE" ("T_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  ALTER TABLE "C##ITBANK4"."SEE_MORE" MODIFY ("TOP_CLASS" NOT NULL ENABLE);
  ALTER TABLE "C##ITBANK4"."SEE_MORE" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "C##ITBANK4"."SEE_MORE" MODIFY ("ENFM_DATE_USE" NOT NULL ENABLE);
  ALTER TABLE "C##ITBANK4"."SEE_MORE" ADD PRIMARY KEY ("T_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
