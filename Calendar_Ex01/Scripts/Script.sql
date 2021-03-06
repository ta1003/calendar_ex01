CREATE TABLE CALEX(
	CALID    CHAR(1),
	ID       VARCHAR(20),
	TITLE    VARCHAR(50),
	CONTENT  VARCHAR(200),
	ISALLDAY CHAR(1),
	STARTDAY DATE,
	ENDDAY   DATE,
	COLOR    VARCHAR2(10),
	BGCOLOR	 VARCHAR2(10)
);

/*1. 전체 선택*/
SELECT CALID,ID,TITLE,CONTENT,ISALLDAY,STARTDAY,
	ENDDAY,COLOR,BGCOLOR FROM CALEX;