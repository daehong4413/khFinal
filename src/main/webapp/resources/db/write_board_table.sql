------------------------------테이블 반환 PIPELINE 함수------------------------------
 -- 1. Object Type을 생성
CREATE OR REPLACE TYPE TYPE_WRITE_BOARD AS OBJECT 
( 
    MEMBER_ID VARCHAR2(30),
    BOARD_NUM NUMBER,
    GRP_NUM NUMBER,
    CATEGORY_NUM NUMBER,
    CATEGORY_NAME VARCHAR2(30),
    TITLE VARCHAR2(200),
    CONTENT VARCHAR2(1000),
    THUMBNAIL_FILE VARCHAR2(1000),
    CLICK_CHK CHAR(1),
    CDT DATE
    /*
        GRP_NUM
        1. 구매후기
        2. 자유게시판
        3. 고객센터
    */
); 
/
-- 2. 반환 테이블 정의
CREATE OR REPLACE TYPE TABLE_WRITE_BOARD  
AS TABLE OF TYPE_WRITE_BOARD; 

-- 3. 파이프라인 테이블 함수 생성

create or replace FUNCTION FN_GET_MY_BOARD (P_MEMBER_ID NUMBER) 
    RETURN TABLE_WRITE_BOARD 
    PIPELINED 
IS 
    B_LIST TYPE_WRITE_BOARD; 
BEGIN 
    FOR rec IN ( 
        SELECT  *
        FROM    (
                -- 구매후기
                SELECT  B.MEMBER_ID, A.ORDER_NUM || A.PRODUCT_NUM AS BOARD_NUM,
                        1 AS GRP_NUM, NULL AS CATEGORY_NUM, NULL AS CATEGORY_NAME,
                        A.TITLE, A.CONTENT, C.FILE_PATH || '/' || C.FILE_NAME AS THUMBNAIL_FILE,
                        '1' AS CLICK_CHK, A.CDT
                FROM    ORDER_REVIEW A
                JOIN    ORDER_TB B ON A.ORDER_NUM = B.ORDER_NUM
                LEFT JOIN 
                    (SELECT  ORDER_NUM, PRODUCT_NUM, 
                            MIN(FILE_PATH) KEEP(DENSE_RANK FIRST ORDER BY FILE_NUM) AS FILE_PATH,
                            MIN(FILE_NAME) KEEP(DENSE_RANK FIRST ORDER BY FILE_NUM) AS FILE_NAME
                     FROM    ORDER_REVIEW_FILE
                     GROUP BY ORDER_NUM, PRODUCT_NUM) C ON A.ORDER_NUM = C.ORDER_NUM AND A.PRODUCT_NUM = C.PRODUCT_NUM;
                WHERE   B.MEMBER_ID = P_MEMBER_ID

                UNION

                --자유게시판
                SELECT  A.MEMBER_ID, A.BOARD_NO, 2 AS GRP_NUM, NULL AS CATEGORY_NUM, NULL AS CATEGORY_NAME,
                        A.TITLE, A.B_CONTENT, NULL AS THUMBNAIL_FILE, '1' AS CLICK_CHK, A.CDT
                FROM    FREE_BOARD A
                WHERE   A.MEMBER_ID = P_MEMBER_ID

                UNION

                --고객센터
                SELECT  A.MEMBER_ID, A.BOARD_NO, 3 AS GRP_NUM, A.CATEGORY_NUM, B.CATEGORY_NAME, 
                        A.TITLE, A.CONTENT, NULL AS THUMBNAIL_FILE, '1' AS CLICK_CHK, A.CDT
                FROM    CUSTOMER_BOARD A
                LEFT JOIN CUSTOMER_CATEGORY B ON A.CATEGORY_NUM = B.CATEGORY_NUM
                WHERE   A.MEMBER_ID = P_MEMBER_ID) A
        ORDER BY A.CDT DESC
    ) LOOP 
        B_LIST := TYPE_WRITE_BOARD(rec.MEMBER_ID, rec.BOARD_NUM, rec.GRP_NUM, rec.CATEGORY_NUM, rec.CATEGORY_NAME,
                                rec.TITLE, rec.CONTENT, rec.THUMBNAIL_FILE, rec.CLICK_CHK, rec.CDT);         
        PIPE ROW(B_LIST); 
    END LOOP; 

    RETURN; 
END;