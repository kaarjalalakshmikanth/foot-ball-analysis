use football_games_db;

-- 1.Find the total number of goals scored by each club in a given season.

SELECT home_club_name, SUM(home_club_goals) AS total_goals
FROM football_data_kl
WHERE season 
GROUP BY home_club_name
ORDER BY total_goals DESC
LIMIT 10;

-- 2.Get the top goal-scorers in a specific competition.

SELECT player_name, SUM(goals) AS total_goals
FROM football_data_kl
GROUP BY player_name
ORDER BY total_goals DESC
LIMIT 5;

-- 3. Find the matches with the highest attendance. 

SELECT game_id, home_club_name, away_club_name, attendance
FROM football_data_kl
ORDER BY attendance DESC
LIMIT 10;
-- 4. Retrieve information about matches refereed by a specific referee. 

SELECT game_id, home_club_name, away_club_name, referee
FROM football_data_kl
WHERE referee = 'Lee Mason'
LIMIT 10;

-- 5.Get the average number of goals per match in each season. 

SELECT season, AVG(home_club_goals + away_club_goals) AS avg_goals_per_match
FROM football_data_kl
GROUP BY season
ORDER BY avg_goals_per_match DESC
LIMIT 10;

-- 6. Find the clubs with the most yellow cards in a specific season.

SELECT home_club_name, SUM(yellow_cards) AS total_yellow_cards
FROM football_data_kl
WHERE season = '2013'
GROUP BY home_club_name
ORDER BY total_yellow_cards DESC
LIMIT 10;

-- 7. Retrieve the matches where a specific player scored goals. 

SELECT game_id, home_club_name, away_club_name, goals
FROM football_data_kl
WHERE player_name = 'Clarence Goodson'
ORDER BY goals DESC
LIMIT 10;

-- 8. Find the clubs with the highest average home attendance.

SELECT home_club_name, AVG(attendance) AS avg_home_attendance
FROM football_data_kl
GROUP BY home_club_name
ORDER BY avg_home_attendance DESC
LIMIT 10;

-- 9. Get the matches where both teams scored the most goals.

SELECT game_id, home_club_name, away_club_name, home_club_goals, away_club_goals
FROM football_data_kl
ORDER BY (home_club_goals + away_club_goals) DESC
LIMIT 10;

-- 10.Retrieve the matches with the highest number of red cards.
SELECT game_id, home_club_name, away_club_name, red_cards
FROM football_data_kl
ORDER BY red_cards DESC
LIMIT 10;

-- 11. Which clubs had the highest total number of yellow cards in the last two seasons.

SELECT home_club_name, SUM(yellow_cards) AS total_yellow_cards
FROM football_data_kl
WHERE season IN (SELECT MAX(2013) FROM football_data_kl UNION SELECT MAX(2014) - 1 FROM football_data_kl)
GROUP BY home_club_name
ORDER BY total_yellow_cards DESC
LIMIT 5;

-- 12. What is the average number of goals per match for each competition type.

SELECT competition_type, AVG(home_club_goals + away_club_goals) AS avg_goals_per_match
FROM football_data_kl
GROUP BY competition_type
ORDER BY avg_goals_per_match DESC
LIMIT 5;

-- 13. Which referee officiated the most matches and how many.

SELECT referee, COUNT(game_id) AS total_matches_officiated
FROM football_data_kl
GROUP BY referee
ORDER BY total_matches_officiated DESC
LIMIT 5;

-- 14. Who are the top goal-scorers across all seasons.
SELECT player_name, SUM(goals) AS total_goals
FROM football_data_kl
GROUP BY player_name
ORDER BY total_goals DESC
LIMIT 5;

-- 15. Which club had the highest average home attendance in the last season.
SELECT home_club_name, AVG(attendance) AS avg_home_attendance
FROM football_data_kl
WHERE season = (SELECT MAX(season) FROM football_data_kl)
GROUP BY home_club_name
ORDER BY avg_home_attendance DESC
LIMIT 5;


                                                  /* ___END___ */ 








