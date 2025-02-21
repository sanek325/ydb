--
-- SELECT_HAVING
--
-- load test data
CREATE TABLE test_having (a int, b int, c char(8), d char);
INSERT INTO test_having VALUES (0, 1, 'XXXX', 'A');
INSERT INTO test_having VALUES (1, 2, 'AAAA', 'b');
INSERT INTO test_having VALUES (2, 2, 'AAAA', 'c');
INSERT INTO test_having VALUES (3, 3, 'BBBB', 'D');
INSERT INTO test_having VALUES (4, 3, 'BBBB', 'e');
INSERT INTO test_having VALUES (5, 3, 'bbbb', 'F');
INSERT INTO test_having VALUES (6, 4, 'cccc', 'g');
INSERT INTO test_having VALUES (7, 4, 'cccc', 'h');
INSERT INTO test_having VALUES (8, 4, 'CCCC', 'I');
INSERT INTO test_having VALUES (9, 4, 'CCCC', 'j');
-- test degenerate cases involving HAVING without GROUP BY
-- Per SQL spec, these should generate 0 or 1 row, even without aggregates
SELECT min(a), max(a) FROM test_having HAVING min(a) = max(a);
-- the really degenerate case: need not scan table at all
SELECT 1 AS one FROM test_having HAVING 1 > 2;
SELECT 1 AS one FROM test_having HAVING 1 < 2;
-- and just to prove that we aren't scanning the table:
SELECT 1 AS one FROM test_having WHERE 1/a = 1 HAVING 1 < 2;
DROP TABLE test_having;
