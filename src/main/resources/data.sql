CREATE SEQUENCE MEMBER_SEQ
    START WITH 1
    INCREMENT BY 1;

CREATE SEQUENCE BOARD_SEQ
    START WITH 1
    INCREMENT BY 1;

SELECT *
FROM MEMBER_TBL;

SELECT *
FROM BOARD_TBL;

INSERT INTO MEMBER_TBL
VALUES (MEMBER_SEQ.NEXTVAL, 'user1', 'user1', '유저1');
select * from MEMBER_TBL;
INSERT INTO BOARD_TBL (B_NO, TITLE, CONTENT, WRITER, TYPE)
VALUES (BOARD_SEQ.NEXTVAL, '제목101', '내용101', 21, 1);

BEGIN
    FOR i IN 3..100
        LOOP
            INSERT INTO BOARD_TBL (B_NO, TITLE, CONTENT, WRITER, TYPE)
            VALUES (BOARD_SEQ.nextval, CONCAT('제목', i), CONCAT('내용', i), 1, 1);
        end loop;
end;

SELECT B.b_no,
       B.title,
       B.content,
       M.name as writer,
       B.regdate,
       B.viewcnt,
       B.type,
       B.del
FROM (SELECT b_no,
             title,
             content,
             writer,
             regdate,
             viewcnt,
             type,
             del
      FROM BOARD_TBL
      WHERE del = 'N'
        AND type = '1'
      ORDER BY b_no DESC) B
         INNER JOIN MEMBER_TBL M ON WRITER = M_NO
where M.NAME like '%관리%';

SELECT 1 FROM BOARD_TBL WHERE TYPE = '1' AND DEL = 'N';

SELECT SUM(1) FROM BOARD_TBL WHERE EXISTS(
    SELECT * FROM BOARD_TBL WHERE TYPE = '1' AND DEL = 'N'
);

SELECT
    count(*)
FROM (SELECT
          b_no,
          title,
          content,
          writer,
          regdate,
          viewcnt,
          type,
          del
      FROM BOARD_TBL
      WHERE del = 'N'
        AND type = '1'
      ORDER BY b_no DESC) B
         INNER JOIN MEMBER_TBL M ON WRITER = M_NO

CREATE TABLE REPLY_TBL
(
    R_NO INTEGER PRIMARY KEY,
    B_NO INTEGER NOT NULL,
    ROOT_NO INTEGER DEFAULT 0,
    PARENT_NO INTEGER DEFAULT 0,
    DEPTH INTEGER DEFAULT 1,
    CONTENT VARCHAR2(200) NOT NULL,
    WRITER INTEGER NOT NULL,
    REGDATE DATE DEFAULT SYSDATE,
    DEL CHAR(1) DEFAULT 'N',
    FOREIGN KEY (B_NO) REFERENCES BOARD_TBL(B_NO),
    FOREIGN KEY (WRITER) REFERENCES MEMBER_TBL(M_NO)
);

SELECT * FROM BOARD_TBL ORDER BY B_NO DESC;

INSERT INTO REPLY_TBL(R_NO, B_NO, ROOT_NO, PARENT_NO, CONTENT, WRITER) VALUES (REPLY_SEQ.NEXTVAL, 103, 1, 0, '내용1', 1);
INSERT INTO REPLY_TBL(R_NO, B_NO, ROOT_NO, PARENT_NO, CONTENT, WRITER) VALUES (REPLY_SEQ.NEXTVAL, 103, 2, 0, '내용2', 1);
INSERT INTO REPLY_TBL(R_NO, B_NO, ROOT_NO, PARENT_NO, CONTENT, WRITER) VALUES (REPLY_SEQ.NEXTVAL, 103, 3, 0, '내용3', 1);
INSERT INTO REPLY_TBL(R_NO, B_NO, ROOT_NO, PARENT_NO, CONTENT, WRITER) VALUES (REPLY_SEQ.NEXTVAL, 103, 4, 0, '내용4', 1);
INSERT INTO REPLY_TBL(R_NO, B_NO, ROOT_NO, PARENT_NO, CONTENT, WRITER) VALUES (REPLY_SEQ.NEXTVAL, 103, 1, 1, '내용5', 1);
INSERT INTO REPLY_TBL(R_NO, B_NO, ROOT_NO, PARENT_NO, CONTENT, WRITER) VALUES (REPLY_SEQ.NEXTVAL, 103, 2, 2, '내용6', 1);
INSERT INTO REPLY_TBL(R_NO, B_NO, ROOT_NO, PARENT_NO, CONTENT, WRITER) VALUES (REPLY_SEQ.NEXTVAL, 103, 2, 6, '내용7', 1);
INSERT INTO REPLY_TBL(R_NO, B_NO, ROOT_NO, PARENT_NO, CONTENT, WRITER) VALUES (REPLY_SEQ.NEXTVAL, 103, 3, 3, '내용8', 1);

SELECT ROWNUM AS RN,
       B_NO,
       R_NO,
       PARENT_NO,
       LEVEL,
       CONTENT,
       WRITER,
       M.NAME,
       REGDATE,
       DEL
FROM REPLY_TBL R
         INNER JOIN MEMBER_TBL M on M.M_NO = R.WRITER
WHERE DEL = 'N'
  AND B_NO = ${b_no}
START WITH PARENT_NO = 0
CONNECT BY PRIOR R_NO = PARENT_NO
ORDER SIBLINGS BY R_NO
commit;