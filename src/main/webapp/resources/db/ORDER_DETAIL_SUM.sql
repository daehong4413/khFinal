create or replace TRIGGER ORDER_DETAIL_SUM
AFTER
UPDATE OR INSERT ON ORDER_TB
FOR EACH ROW
    DECLARE
        -- 변수를 선언할 때는 DECLARE문을 사용해야 한다 
        TOTAL_PRICE NUMBER;
        SUB_PRICE NUMBER;
        PRAGMA AUTONOMOUS_TRANSACTION;
        INPUT_ID VARCHAR2(50);
        INPUT_ORDER_NUM CHAR(12);
    BEGIN
        IF  :NEW.STATUS_NUM = 2 THEN
            INPUT_ID := :OLD.MEMBER_ID;
            INPUT_ORDER_NUM := :OLD.ORDER_NUM;
            
            TOTAL_PRICE := SUMMARY_AMOUNT(INPUT_ID);
            
            SELECT  NVL(SUM(A.PRODUCT_QTY * A.PRODUCT_PRICE * (100 - D.GRADE_DC_RATE)/100),0) INTO SUB_PRICE
            FROM    ORDER_DETAIL A
            JOIN    ORDER_TB B ON A.ORDER_NUM = B.ORDER_NUM
            JOIN    MEMBER C ON B.MEMBER_ID = C.MEMBER_ID
            JOIN    GRADE D ON C.GRADE_NUM = D.GRADE_NUM
            WHERE   B.ORDER_NUM = INPUT_ORDER_NUM;
            
            TOTAL_PRICE := TOTAL_PRICE + SUB_PRICE;
            
            UPDATE  MEMBER
            SET     GRADE_NUM = (SELECT MAX(GRADE_NUM) KEEP(DENSE_RANK LAST ORDER BY GRADE_STD_PRICE)
                                 FROM GRADE 
                                 WHERE GRADE_STD_PRICE <= TOTAL_PRICE)
            WHERE   MEMBER_ID = INPUT_ID;
            COMMIT;
        END IF;
    END; 