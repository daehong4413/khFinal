--���̺�
-------------------------------------------------------------------------------

DROP TABLE MEMBER;

CREATE TABLE MEMBER (
	MEMBER_ID	VARCHAR2(30)		NOT NULL,
	MEMBER_PWD	VARCHAR2(50)		NOT NULL,
	MEMBER_NAME	VARCHAR2(50)		NOT NULL,
	MEMBER_NICKNAME	VARCHAR2(50)		NOT NULL,
	MEMBER_GENDER	CHAR(1)		NOT NULL,
	MEMBER_EMAIL	VARCHAR2(50)		NULL,
	MEMBER_BIRTHDAY	CHAR(8)		NOT NULL,
	MEMBER_PHONE	VARCHAR2(14)		NOT NULL,
	MEMBER_POST	CHAR(5)		NULL,
	MEMBER_ADDRESS	VARCHAR2(50)		NULL,
	MEMBER_ADDRESS_DETAIL	VARCHAR2(100)		NULL,
	STATUS	CHAR(1)	DEFAULT '1'	NOT NULL,
	GRADE_NUM	NUMBER	DEFAULT 1	NOT NULL,
	CDT	DATE		NOT NULL,
	MDT	DATE		NOT NULL
);

--COMMENT ON COLUMN MEMBER.STATUS IS ''0' : Ż��
--'1' : �Ϲ�
--'2' : ����';

DROP TABLE GRADE;

CREATE TABLE GRADE (
	GRADE_NUM	NUMBER		NOT NULL,
	GRADE_NAME	VARCHAR2(20)		NULL,
	GRADE_DC_RATE	NUMBER		NULL,
	GRADE_STD_PRICE	NUMBER		NULL
);

DROP TABLE PWD_HISTORY;

CREATE TABLE PWD_HISTORY (
	HISTORY_NUM	NUMBER		NOT NULL,
	MEMBER_ID	VARCHAR2(30)		NOT NULL,
	MEMBER_PWD	VARCHAR2(50)		NULL,
	MDT	DATE		NULL
);

DROP TABLE PRODUCT;

CREATE TABLE PRODUCT (
	PRODUCT_NUM	NUMBER		NOT NULL,
	CATEGORY_NUM	NUMBER		NOT NULL,
	PRODUCT_MAIN_NAME	VARCHAR2(200)		NULL,
	PRODUCT_MAIN_PATH	VARCHAR2(200)		NULL,
	PRODUCT_NAME	VARCHAR2(50)		NOT NULL,
	PRODUCT_STOCK	NUMBER		NULL,
	PRODUCT_PRICE	NUMBER		NULL,
	PRODUCT_INFO	VARCHAR2(1000)		NULL,
	PRODUCT_SIZE	VARCHAR2(20)		NULL,
	PRODUCT_COLOR	VARCHAR2(20)		NULL,
	PRODUCT_SHOW_CNT	NUMBER	DEFAULT 0	NOT NULL,
	PRODUCT_STATUS	CHAR(1)	DEFAULT 'Y'	NOT NULL,
	CDT	DATE		NOT NULL,
	MDT	DATE		NOT NULL
);

--COMMENT ON COLUMN PRODUCT.PRODUCT_SHOW_CNT IS '��ȸ��';

DROP TABLE PRODUCT_CATEGORY;

CREATE TABLE PRODUCT_CATEGORY (
	CATEGORY_NUM	NUMBER		NOT NULL,
	CATEGORY_NAME	VARCHAR2(30)		NULL
);

DROP TABLE ORDER_TB;

CREATE TABLE ORDER_TB (
	ORDER_NUM	CHAR(12)		NOT NULL,
	MEMBER_ID	VARCHAR2(30)		NOT NULL,
	ORDER_NAME	VARCHAR2(50)		NOT NULL,
	ORDER_PHONE	VARCHAR2(14)		NOT NULL,
	ORDER_POST	CHAR(5)		NOT NULL,
	ORDER_ADDRESS	VARCHAR2(50)		NOT NULL,
	ORDER_ADDRESS_DETAIL	VARCHAR2(100)		NOT NULL,
	STATUS_NUM	NUMBER		NOT NULL,
	PURCHASE_TYPE	CHAR(1)		NOT NULL,
	PURCHASE_NUM	VARCHAR2(100)		NOT NULL,
	CDT	DATE		NULL,
    DC_RATE NUMBER NULL
);

DROP TABLE ORDER_DETAIL;

CREATE TABLE ORDER_DETAIL (
	PRODUCT_NUM	NUMBER		NOT NULL,
	ORDER_NUM	CHAR(12)		NOT NULL,
	PRODUCT_QTY	NUMBER		NOT NULL,
	PRODUCT_PRICE	NUMBER		NULL
);

DROP TABLE ORDER_TEMPLETE;

CREATE TABLE ORDER_TEMPLETE (
	TEMPLETE_NUM	NUMBER		NOT NULL,
	MEMBER_ID	VARCHAR2(30)		NOT NULL,
	NAME	VARCHAR2(50)		NULL,
	PHONE	VARCHAR2(14)		NULL,
	POST	CHAR(5)		NULL,
	ADDRESS	VARCHAR2(50)		NULL,
	ADDRESS_DETAIL	VARCHAR2(100)		NULL
);

DROP TABLE NOTICE_BOARD;

CREATE TABLE NOTICE_BOARD (
	BOARD_NO	NUMBER		NOT NULL,
	MEMBER_ID	VARCHAR2(30)		NOT NULL,
	CATEGORY_NUM	NUMBER		NOT NULL,
	TITLE	VARCHAR2(200)		NULL,
	CONTENT	VARCHAR2(1000)		NULL,
	CDT	DATE		NULL,
	MDT	DATE		NULL,
    PRGRESS NUMBER NULL
);

DROP TABLE PRODUCT_FILE;

CREATE TABLE PRODUCT_FILE (
	FILE_NUM	NUMBER		NOT NULL,
	FILE_NAME	VARCHAR2(200)		NOT NULL,
	FILE_PATH	VARCHAR2(200)		NOT NULL,
	PRODUCT_NUM	NUMBER		NOT NULL
);

DROP TABLE ORDER_REVIEW;

CREATE TABLE ORDER_REVIEW (
	PRODUCT_NUM	NUMBER		NOT NULL,
	ORDER_NUM	CHAR(12)		NOT NULL,
	TITLE	VARCHAR2(200)		NULL,
	CONTENT	VARCHAR2(1000)		NULL,
	CDT	DATE		NULL,
	MDT	DATE		NULL
);

DROP TABLE ORDER_REVIEW_FILE;

CREATE TABLE ORDER_REVIEW_FILE (
	FILE_NUM	NUMBER		NOT NULL,
	FILE_NAME	VARCHAR2(200)		NULL,
	FILE_PATH	VARCHAR2(200)		NULL,
	PRODUCT_NUM	NUMBER		NOT NULL,
	ORDER_NUM	CHAR(12)		NOT NULL
);

DROP TABLE FREE_BOARD;

CREATE TABLE FREE_BOARD (
	BOARD_NO	NUMBER		NOT NULL,
	MEMBER_ID	VARCHAR2(30)		NOT NULL,
	TITLE	VARCHAR2(200)		NULL,
	B_CONTENT	VARCHAR2(4000)		NULL,
	CDT	DATE		NULL,
	MDT	DATE		NULL,
	BOARD_STATUS	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL
);

DROP TABLE FREE_COMMENT;

CREATE TABLE FREE_COMMENT (
	COMMENT_NUM	NUMBER		NOT NULL,
	BOARD_NO	NUMBER		NOT NULL,
	MEMBER_ID	VARCHAR2(30)		NOT NULL,
	C_CONTENT	VARCHAR2(200)		NULL,
	CDT	DATE		NULL,
	MDT	DATE		NULL,
	COMMENT_STATUS	VARCHAR2(1) DEFAULT 'Y'	NOT NULL,
	C_PARENT	NUMBER		NULL,
	C_DEPTH	NUMBER		NULL,
	C_ORDER	NUMBER		NULL
);

DROP TABLE NOTICE_CATEGORY;

CREATE TABLE NOTICE_CATEGORY (
	CATEGORY_NUM	NUMBER		NOT NULL,
	CATEGORY_NAME	VARCHAR2(20)		NULL
);

DROP TABLE FAVORITE;

CREATE TABLE FAVORITE (
	MEMBER_ID	VARCHAR2(30)		NOT NULL,
	PRODUCT_NUM	NUMBER		NOT NULL
);

DROP TABLE STATUS_TB;

CREATE TABLE STATUS_TB (
	STATUS_NUM	NUMBER		NOT NULL,
	STATUS_NMAE	VARCHAR(20)		NULL
);


--��������
-------------------------------------------------------------------------------
ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	MEMBER_ID
);

ALTER TABLE GRADE ADD CONSTRAINT PK_GRADE PRIMARY KEY (
	GRADE_NUM
);

ALTER TABLE PWD_HISTORY ADD CONSTRAINT PK_PWD_HISTORY PRIMARY KEY (
	HISTORY_NUM,
	MEMBER_ID
);

ALTER TABLE PRODUCT ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	PRODUCT_NUM
);

ALTER TABLE PRODUCT_CATEGORY ADD CONSTRAINT PK_PRODUCT_CATEGORY PRIMARY KEY (
	CATEGORY_NUM
);

ALTER TABLE ORDER_TB ADD CONSTRAINT PK_ORDER_TB PRIMARY KEY (
	ORDER_NUM
);

ALTER TABLE ORDER_DETAIL ADD CONSTRAINT PK_ORDER_DETAIL PRIMARY KEY (
	PRODUCT_NUM,
	ORDER_NUM
);

ALTER TABLE ORDER_TEMPLETE ADD CONSTRAINT PK_ORDER_TEMPLETE PRIMARY KEY (
	TEMPLETE_NUM,
	MEMBER_ID
);

ALTER TABLE NOTICE_BOARD ADD CONSTRAINT PK_NOTICE_BOARD PRIMARY KEY (
	BOARD_NO
);

ALTER TABLE PRODUCT_FILE ADD CONSTRAINT PK_PRODUCT_FILE PRIMARY KEY (
	FILE_NUM
);

ALTER TABLE ORDER_REVIEW ADD CONSTRAINT PK_ORDER_REVIEW PRIMARY KEY (
	PRODUCT_NUM,
	ORDER_NUM
);

ALTER TABLE ORDER_REVIEW_FILE ADD CONSTRAINT PK_ORDER_REVIEW_FILE PRIMARY KEY (
	FILE_NUM
);

ALTER TABLE FREE_BOARD ADD CONSTRAINT PK_FREE_BOARD PRIMARY KEY (
	BOARD_NO
);

ALTER TABLE FREE_COMMENT ADD CONSTRAINT PK_FREE_COMMENT PRIMARY KEY (
	COMMENT_NUM
);

ALTER TABLE NOTICE_CATEGORY ADD CONSTRAINT PK_NOTICE_CATEGORY PRIMARY KEY (
	CATEGORY_NUM
);

ALTER TABLE FAVORITE ADD CONSTRAINT PK_FAVORITE PRIMARY KEY (
	MEMBER_ID,
	PRODUCT_NUM
);

ALTER TABLE STATUS_TB ADD CONSTRAINT PK_STATUS_TB PRIMARY KEY (
	STATUS_NUM
);

ALTER TABLE PWD_HISTORY ADD CONSTRAINT FK_MEMBER_TO_PWD_HISTORY_1 FOREIGN KEY (
	MEMBER_ID
)
REFERENCES MEMBER (
	MEMBER_ID
);
    
ALTER TABLE ORDER_DETAIL ADD CONSTRAINT FK_PRODUCT_TO_ORDER_DETAIL_1 FOREIGN KEY (
	PRODUCT_NUM
)
REFERENCES PRODUCT (
	PRODUCT_NUM
);

ALTER TABLE ORDER_DETAIL ADD CONSTRAINT FK_ORDER_TB_TO_ORDER_DETAIL_1 FOREIGN KEY (
	ORDER_NUM
)
REFERENCES ORDER_TB (
	ORDER_NUM
);

ALTER TABLE ORDER_TEMPLETE ADD CONSTRAINT FK_MEMBER_TO_ORDER_TEMPLETE_1 FOREIGN KEY (
	MEMBER_ID
)
REFERENCES MEMBER (
	MEMBER_ID
);

ALTER TABLE ORDER_REVIEW ADD CONSTRAINT FK_ORDER_DETAIL_TO_REVIEW FOREIGN KEY (
	PRODUCT_NUM, ORDER_NUM
)
REFERENCES ORDER_DETAIL (
	PRODUCT_NUM, ORDER_NUM
);

ALTER TABLE FAVORITE ADD CONSTRAINT FK_MEMBER_TO_FAVORITE_1 FOREIGN KEY (
	MEMBER_ID
)
REFERENCES MEMBER (
	MEMBER_ID
);

ALTER TABLE FAVORITE ADD CONSTRAINT FK_PRODUCT_TO_FAVORITE_1 FOREIGN KEY (
	PRODUCT_NUM
)
REFERENCES PRODUCT (
	PRODUCT_NUM
);

ALTER TABLE "NOTICE_BOARD" ADD CONSTRAINT "FK_MEMBER_TO_NBOARD_1" FOREIGN KEY (
	"MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
);

ALTER TABLE "NOTICE_BOARD" ADD CONSTRAINT "FK_NCATEGORY_TO_NBOARD_1" FOREIGN KEY (
	"CATEGORY_NUM"
)
REFERENCES "NOTICE_CATEGORY" (
	"CATEGORY_NUM"
);

--������
-------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_NOTICE_BOARD
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE SEQ_FREE_BOARD
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE SEQ_FREE_COMMENT
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE PRODUCT_NUM
INCREMENT BY 1
START WITH 1;
   
CREATE SEQUENCE  SEQ_REVIEW_FILE  
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 41 
CACHE 20 NOORDER  
NOCYCLE ;

------------------�ʱⵥ����

INSERT INTO MEMBER
VALUES('admin', FN_ENCRYPT_MD5('123'), '������', '������', 'F', NULL, '92/12/14', '010-2597-2432', NULL, NULL, NULL, DEFAULT, DEFAULT, SYSDATE, SYSDATE);

INSERT INTO PRODUCT_CATEGORY
VALUES(0, '���ô�');

INSERT INTO PRODUCT_CATEGORY
VALUES(1, '��');

INSERT INTO PRODUCT_CATEGORY
VALUES(2, '����');

INSERT INTO PRODUCT_CATEGORY
VALUES(3, 'ä��');

INSERT INTO PRODUCT_CATEGORY
VALUES(4, '����');


INSERT INTO STATUS_TB
VALUES(1, '��ۿϷ�');

INSERT INTO STATUS_TB
VALUES(2, '����Ȯ��');

INSERT INTO STATUS_TB
VALUES(3, '������� ��û');

INSERT INTO STATUS_TB
VALUES(4, '������� �Ϸ�');

INSERT INTO GRADE
VALUES(1, '�ؾ�', 0, 0);

INSERT INTO GRADE
VALUES(2, '����', 5, 100000);

INSERT INTO GRADE
VALUES(3, '���', 7, 500000);

INSERT INTO GRADE
VALUES(4, '����', 10, 1000000);

INSERT INTO NOTICE_CATEGORY
VALUES(1, '�Ű�');

INSERT INTO NOTICE_CATEGORY
VALUES(2, '����');

COMMIT;

--SELECT  FN_GET_ORDER_NO
--FROM    DUAL;