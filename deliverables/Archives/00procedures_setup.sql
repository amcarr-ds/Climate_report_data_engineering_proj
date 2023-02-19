USE 507_final_proj;

DROP PROCEDURE IF EXISTS drop_foreign_key_if_exists;
DROP PROCEDURE IF EXISTS drop_index_if_exists;


/*Stored procedure for checking existence of FOREIGN KEY citation:
OpenAI. (2021). ChatGPT [Computer software]. https://openai.com/*/
DELIMITER //
CREATE PROCEDURE drop_foreign_key_if_exists(
  IN table_name VARCHAR(255),
  IN foreign_key_name VARCHAR(255)
)
BEGIN
  DECLARE foreign_key_count INT;
  SELECT COUNT(*)
  INTO foreign_key_count
  FROM information_schema.TABLE_CONSTRAINTS
  WHERE CONSTRAINT_TYPE='FOREIGN KEY'
  AND CONSTRAINT_SCHEMA=DATABASE()
  AND TABLE_NAME=table_name
  AND CONSTRAINT_NAME=foreign_key_name;
  
  IF foreign_key_count > 0 THEN
    SET @sql = CONCAT('ALTER TABLE ', table_name, ' DROP FOREIGN KEY ', foreign_key_name);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
  END IF;
END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE drop_index_if_exists(
    IN table_name VARCHAR(64),
    IN index_name VARCHAR(64)
)
BEGIN
    DECLARE index_count INT;
    
    SELECT COUNT(*)
    INTO index_count
    FROM information_schema.statistics
    WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = table_name
    AND INDEX_NAME = index_name;
    
    IF index_count = 1 THEN
        SET @sql = CONCAT('DROP INDEX ', index_name, ' ON ', table_name);
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END$$
DELIMITER ;

/*end ChatCPT code output*/