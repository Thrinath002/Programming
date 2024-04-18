-- Table: Logs

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column.
 

-- Find all numbers that appear at least three times consecutively.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Logs table:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
-- Output: 
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
-- Explanation: 1 is the only number that appears consecutively for at least three times.


with cte as(select num,
lead(num,1) over() num1,
lead(num,2) over() num2
from logs)
select distinct num as ConsecutiveNums from cte where num=num1 and num1=num2
-----
# Write your MySQL query statement below

SELECT distinct s1.num AS ConsecutiveNums 
FROM logs s1, logs s2, logs s3
WHERE (s1.id = s2.id - 1 AND s2.id = s3.id - 1)
and (s1.num=s2.num and s2.num=s3.num)


