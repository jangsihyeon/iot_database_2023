-- UPDATE & TRANSACTION
START TRANSACTION;

-- 경고 !  UPDATE 구문에는 WHERE절 빼면 안됌 !
UPDATE usertbl_bak
   SET mobile1 = '010'
     , mobile2 = '66667788'
     , addr = '부산'
 WHERE userID = 'JSH';
 
COMMIT;
ROLLBACK;

-- DELETE
-- WHERE 절이 빠지면 
DELETE FROM usertbl
   WHERE userID = 'JSH';
   
