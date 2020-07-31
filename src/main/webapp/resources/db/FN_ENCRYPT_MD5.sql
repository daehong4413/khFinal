create or replace FUNCTION FN_ENCRYPT_MD5(PWD VARCHAR2)
    RETURN CHAR
IS 
    RESULT_PWD CHAR(32);
BEGIN 
    SELECT  RAWTOHEX(DBMS_CRYPTO.HASH(TO_CLOB(TO_CHAR(PWD)), 2))INTO RESULT_PWD
    FROM    DUAL;

    RETURN RESULT_PWD;
END;