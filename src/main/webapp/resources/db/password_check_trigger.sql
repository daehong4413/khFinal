create or replace TRIGGER password_check_trigger
BEFORE
UPDATE OR INSERT ON MEMBER
FOR EACH ROW
    WHEN (OLD.MEMBER_PWD <> NEW.MEMBER_PWD)
    DECLARE
        FLAG NUMBER := 0;
    BEGIN
        SELECT  1 INTO FLAG
        FROM    DUAL
        WHERE   EXISTS( SELECT 0
                        FROM PWD_HISTORY 
                        WHERE MEMBER_ID = :NEW.MEMBER_ID
                        AND MEMBER_PWD = :NEW.MEMBER_PWD
                        AND MDT BETWEEN (SYSDATE -90) AND SYSDATE);
        IF FLAG <> 0 THEN
            RAISE_APPLICATION_ERROR(-20000, '최근 90일 이내에 사용된 암호입니다.');
        ELSE
            INSERT INTO PWD_HISTORY
            VALUES((SELECT  NVL(MAX(HISTORY_NUM),0)
                    FROM    PWD_HISTORY
                    WHERE   MEMBER_ID = :NEW.MEMBER_ID) + 1, :NEW.MEMBER_ID, :NEW.MEMBER_PWD, SYSDATE);
        END IF;
        EXCEPTION
              WHEN no_data_found THEN
                INSERT INTO PWD_HISTORY
                VALUES((SELECT  NVL(MAX(HISTORY_NUM),0)
                FROM    PWD_HISTORY
                WHERE   MEMBER_ID = :NEW.MEMBER_ID) + 1, :NEW.MEMBER_ID, :NEW.MEMBER_PWD, SYSDATE);
    END;