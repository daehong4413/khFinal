create or replace TYPE TABLE_WRITE_BOARD  
AS TABLE OF TYPE_WRITE_BOARD; 

create or replace TYPE TYPE_WRITE_BOARD AS OBJECT 
( 
    MEMBER_ID VARCHAR2(30),
    BOARD_NUM NUMBER,
    GRP_NUM NUMBER,
    CATEGORY_NUM NUMBER,
    CATEGORY_NAME VARCHAR2(30),
    TITLE VARCHAR2(200),
    CONTENT VARCHAR2(4000),
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

create or replace FUNCTION FN_GET_MY_WRITE_BOARD (P_MEMBER_ID VARCHAR2) 
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
                        1 AS GRP_NUM, E.CATEGORY_NUM, E.CATEGORY_NAME,
                        A.TITLE, A.CONTENT, (CASE WHEN C.FILE_PATH IS NOT NULL AND C.FILE_NAME IS NOT NULL THEN C.FILE_PATH || C.FILE_NAME
                                                  ELSE NULL
                                                  END) AS THUMBNAIL_FILE,
                        '1' AS CLICK_CHK, A.CDT
                FROM    ORDER_REVIEW A
                JOIN    ORDER_TB B ON A.ORDER_NUM = B.ORDER_NUM
                LEFT JOIN 
                    (SELECT  ORDER_NUM, PRODUCT_NUM, 
                            MIN(FILE_PATH) KEEP(DENSE_RANK FIRST ORDER BY FILE_NUM) AS FILE_PATH,
                            MIN(FILE_NAME) KEEP(DENSE_RANK FIRST ORDER BY FILE_NUM) AS FILE_NAME
                     FROM    ORDER_REVIEW_FILE
                     GROUP BY ORDER_NUM, PRODUCT_NUM) C ON A.ORDER_NUM = C.ORDER_NUM AND A.PRODUCT_NUM = C.PRODUCT_NUM
                LEFT JOIN PRODUCT D ON D.PRODUCT_NUM = A.PRODUCT_NUM
                LEFT JOIN PRODUCT_CATEGORY E ON E.CATEGORY_NUM = D.CATEGORY_NUM
                WHERE   B.MEMBER_ID = P_MEMBER_ID

                UNION

                --자유게시판
                SELECT  A.MEMBER_ID, TO_CHAR(A.BOARD_NO), 2 AS GRP_NUM, NULL AS CATEGORY_NUM, NULL AS CATEGORY_NAME,
                        A.TITLE, A.B_CONTENT, NULL AS THUMBNAIL_FILE, '1' AS CLICK_CHK, A.CDT
                FROM    FREE_BOARD A
                WHERE   A.MEMBER_ID = P_MEMBER_ID

                UNION

                --고객센터
                SELECT  A.MEMBER_ID, TO_CHAR(A.BOARD_NO), 3 AS GRP_NUM, A.CATEGORY_NUM, B.CATEGORY_NAME, 
                        A.TITLE, A.CONTENT, NULL AS THUMBNAIL_FILE, '1' AS CLICK_CHK, A.CDT
                FROM    NOTICE_BOARD A
                LEFT JOIN NOTICE_CATEGORY B ON A.CATEGORY_NUM = B.CATEGORY_NUM
                WHERE   A.MEMBER_ID = P_MEMBER_ID) A
        ORDER BY A.CDT DESC
    ) LOOP 
        B_LIST := TYPE_WRITE_BOARD(rec.MEMBER_ID, rec.BOARD_NUM, rec.GRP_NUM, rec.CATEGORY_NUM, rec.CATEGORY_NAME,
                                rec.TITLE, rec.CONTENT, rec.THUMBNAIL_FILE, rec.CLICK_CHK, rec.CDT);         
        PIPE ROW(B_LIST); 
    END LOOP; 

    RETURN; 
END;