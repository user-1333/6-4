-- Active: 1763136769886@@127.0.0.1@3306@worldcup
USE worldcup;

-- 32
SELECT MIN(ranking) AS '32-AグループのFIFAランク最上位' FROM countries
    WHERE group_name = "A"
    GROUP BY group_name;

-- 33
SELECT SUM(ranking) AS '33-AグループのFIFCランク合計値' FROM countries
    WHERE group_name = "C"
    GROUP BY group_name;
-- 34
SELECT countries.name,players.name,players.uniform_num FROM players 
    JOIN countries ON players.country_id = countries.id;
-- 35
SELECT countries.name, players.name, goals.goal_time FROM countries
    JOIN players ON countries.id = players.country_id
    JOIN goals   ON players.country_id   = goals.id
    WHERE player_id IS NOT NULL;
-- 36
SELECT g.goal_time,p.uniform_num, p.position, p.name FROM goals g
    LEFT JOIN players p ON p.id = g.player_id;
-- 37
SELECT g.goal_time, p.uniform_num, p.position, p.name FROM goals g
    RIGHT JOIN players p ON g.player_id = p.id
    WHERE g.player_id IS NOT NULL;
-- 38
SELECT c.name, g.goal_time, p.position, p.name FROM countries c
    LEFT JOIN players p ON p.country_id = c.id
    LEFT JOIN goals g ON c.id = g.player_id;
-- 39
SELECT p.kickoff, m.name AS my_country, e.name AS enemy_country FROM pairings p
    LEFT JOIN countries e ON e.id = p.enemy_country_id
    LEFT JOIN countries m ON m.id = p.my_country_id;

