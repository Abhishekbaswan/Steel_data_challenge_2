select * from teams;
select * from players;
select * from matches;

-- 1. What are the names of the players whose salary is greater than 100,000?

SELECT 
    player_name
FROM
    players
WHERE
    salary > 100000;
    
-- 2. What is the team name of the player with player_id = 3?

SELECT 
    team_name
FROM
    teams
WHERE
    team_id IN (SELECT 
            team_id
        FROM
            players
        WHERE
            player_id = 3);
            
-- 3. What is the total number of players in each team?

SELECT 
    teams.team_name, COUNT(players.player_id) as num_players
FROM
    teams
        JOIN
    players ON teams.team_id = players.team_id
GROUP BY teams.team_name;

-- 4. What is the team name and captain name of the team with team_id = 2?

SELECT 
    Teams.team_name, Players.player_name AS captain_name
FROM
    Teams
        INNER JOIN
    Players ON Teams.captain_id = Players.player_id
WHERE
    Teams.team_id = 2;

-- 5. What are the player names and their roles in the team with team_id = 1?

SELECT 
    player_name, role
FROM
    Players
WHERE
    team_id = 1;

-- 6. What are the team names and the number of matches they have won?

SELECT 
    Teams.team_name, COUNT(*) AS num_wins
FROM
    Matches
        INNER JOIN
    Teams ON Matches.winner_id = Teams.team_id
GROUP BY Teams.team_name;

-- 7. What is the average salary of players in the teams with country 'USA'?

SELECT 
    AVG(salary) AS avg_salary
FROM
    Players
        INNER JOIN
    Teams ON Players.team_id = Teams.team_id
WHERE
    Teams.country = 'USA';

-- 8. Which team won the most matches?

SELECT 
    Teams.team_name, COUNT(*) AS num_wins
FROM
    Matches
        INNER JOIN
    Teams ON Matches.winner_id = Teams.team_id
GROUP BY Teams.team_name
ORDER BY num_wins DESC
LIMIT 1;

-- 9. What are the team names and the number of players in each team whose salary is greater than 100,000?

SELECT 
    Teams.team_name, COUNT(*) AS num_players
FROM
    Players
        INNER JOIN
    Teams ON Players.team_id = Teams.team_id
WHERE
    salary > 100000
GROUP BY Teams.team_name;

-- 10. What is the date and the score of the match with match_id = 3?

SELECT 
    match_date, score_team1, score_team2
FROM
    Matches
WHERE
    match_id = 3;
