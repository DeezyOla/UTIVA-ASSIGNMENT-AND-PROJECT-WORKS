-- AKINOLA TAIWO OLAIDE- DATA ANALYTICS POSTGRESQL ASSIGNMENT 2
-- Q1, HOW MANY COUNTRY HAVE PLAYED IN THE WORLD CUP?
WITH
            total_world_cup AS (														     
        SELECT 
            'wc 2002' AS worldcupyear,
            team,
            points
            FROM 
            fifa_2002
            UNION ALL
        SELECT 
            'wc 2006' AS worldcupyear,
            team,
            points
            FROM 
            fifa_2006
            UNION ALL
        SELECT 
            'wc 201O' AS worldcupyear,
            team,
            points
            FROM 
            fifa_2010
            UNION ALL
        SELECT
        'wc 2014' AS worldcupyear,
            team,
            points
            FROM 
            fifa_2014
            UNION ALL
        SELECT 
            'wc 2018' AS worldcupyear,
            team,
            points
            FROM 
            fifa_2018
            
            )
        SELECT 
            COUNT(DISTINCT team)
            FROM total_world_cup
            

--Q2, TOTAL GAMES PLAYED, WIN, LOSS, GOALS FOR AND GOALS AGAINST?
        WITH
            total_world_cup AS (														       
                SELECT 
            'wc 2002' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against
            FROM 
            fifa_2002
            UNION ALL
        SELECT 
            'wc 2006' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against
            FROM 
            fifa_2006
            UNION ALL
        SELECT 
            'wc 201O' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against
            FROM 
            fifa_2010
            UNION ALL
        SELECT
        'wc 2014' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against
            FROM 
            fifa_2014
            UNION ALL
        SELECT 
            'wc 2018' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against
            FROM 
            fifa_2018
            
            )
        SELECT 
            SUM(games_played) AS total_games_played,
            SUM(win) AS total_wins,
            SUM(loss) AS total_loss,
            SUM(goals_for) AS total_goals_for,
            SUM(goals_against) AS total_goals_against
            FROM total_world_cup

            --Q3, Country with highest and lowest appearance in the last five years?

            
            WITH
            total_world_cup AS ( 
        SELECT 
            'wc 2002' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2002
            UNION ALL
        SELECT 
            'wc 2006' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2006
            UNION ALL
        SELECT 
            'wc 201O' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2010
            UNION ALL
        SELECT
        'wc 2014' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,	
            goals_difference
            FROM 
            fifa_2014
            UNION ALL
        SELECT 
            'wc 2018' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
                                
            FROM 
            fifa_2018 )
            
            
        
SELECT 
	team,
	total_appearance
	FROM ( SELECT 
	           team,
		   COUNT(team) AS total_appearance
		   FROM total_world_cup
                   GROUP BY team
                ) AS t
	WHERE 
		total_appearance = (SELECT MAX(ta)
                        FROM ( SELECT COUNT(team) AS ta
					FROM total_world_cup
					GROUP BY team ) AS t
                                 )
				   OR total_appearance = ( 
                                    SELECT MIN (ta)
                                     FROM ( SELECT COUNT(team) AS ta
					FROM total_world_cup
					GROUP BY team ) AS t
                                       )
             ORDER BY total_appearance DESC;
        

        --Q4 Country with highest and lowest games played?

            WITH
            total_world_cup AS ( 
        SELECT 
            'wc 2002' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2002
            UNION ALL
        SELECT 
            'wc 2006' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2006
            UNION ALL
        SELECT 
            'wc 201O' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2010
            UNION ALL
        SELECT
        'wc 2014' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,	
            goals_difference
            FROM 
            fifa_2014
            UNION ALL
        SELECT 
            'wc 2018' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
                                
            FROM 
            fifa_2018 )
            
            
        SELECT 
	team,
	total_games_played
	FROM ( SELECT 
	           team,
		   SUM(games_played) AS total_games_played
		   FROM total_world_cup
                   GROUP BY team
                ) AS t
	WHERE 
		total_games_played = (SELECT MAX(tgp)
                        FROM ( SELECT SUM(games_played) AS tgp
					FROM total_world_cup
					GROUP BY team ) AS t
                                 )
				   OR total_games_played = ( 
                                    SELECT MIN (tgp)
                                     FROM ( SELECT SUM(games_played) AS tgp
					FROM total_world_cup
					GROUP BY team ) AS t
                                       )
             ORDER BY total_games_played DESC;
        
        --Q5, Country with highest and lowest games won?
        
        WITH
            total_world_cup AS ( 
        SELECT 
            'wc 2002' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2002
            UNION ALL
        SELECT 
            'wc 2006' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2006
            UNION ALL
        SELECT 
            'wc 201O' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2010
            UNION ALL
        SELECT
        'wc 2014' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,	
            goals_difference
            FROM 
            fifa_2014
            UNION ALL
        SELECT 
            'wc 2018' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
                                
            FROM 
            fifa_2018 )
            
            
        SELECT 
	team,
	total_win
	FROM ( SELECT 
	           team,
		   SUM(win) AS total_win
		   FROM total_world_cup
                   GROUP BY team
                ) AS t
	WHERE 
		total_win = (SELECT MAX(tw)
                        FROM ( SELECT SUM(win) AS tw
					FROM total_world_cup
					GROUP BY team ) AS t
                                 )
				   OR total_win = ( 
                                    SELECT MIN ( tw)
                                     FROM ( SELECT SUM(win) AS tw
					FROM total_world_cup
					GROUP BY team ) AS t
                                       )
             ORDER BY total_win DESC;
            
            ---Q6 Country with highest and lowest games lost?
            WITH
            total_world_cup AS ( 
        SELECT 
            'wc 2002' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2002
            UNION ALL
        SELECT 
            'wc 2006' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2006
            UNION ALL
        SELECT 
            'wc 201O' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2010
            UNION ALL
        SELECT
        'wc 2014' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,	
            goals_difference
            FROM 
            fifa_2014
            UNION ALL
        SELECT 
            'wc 2018' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
                                
            FROM 
            fifa_2018 )
            
            

        SELECT 
	team,
	total_loss
	FROM ( SELECT 
	           team,
		   SUM(loss) AS total_loss
		   FROM total_world_cup
                   GROUP BY team
                ) AS t
	WHERE 
		total_loss = (SELECT MAX(tl)
                        FROM ( SELECT SUM(loss) AS tl
					FROM total_world_cup
					GROUP BY team ) AS t
                                 )
				   OR total_loss = ( 
                                    SELECT MIN ( tl)
                                     FROM ( SELECT SUM(loss) AS tl
					FROM total_world_cup
					GROUP BY team ) AS t
                                       )
             ORDER BY total_loss ASC;

        --Q7 Country with highest and lowest goals for?
        WITH
            total_world_cup AS ( 
        SELECT 
            'wc 2002' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2002
            UNION ALL
        SELECT 
            'wc 2006' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2006
            UNION ALL
        SELECT 
            'wc 201O' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2010
            UNION ALL
        SELECT
        'wc 2014' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,	
            goals_difference
            FROM 
            fifa_2014
            UNION ALL
        SELECT 
            'wc 2018' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
                                
            FROM 
            fifa_2018 )
            
            

       
    SELECT 
	team,
	total_goals_for
	FROM ( SELECT 
	           team,
		   SUM(goals_for) AS total_goals_for
		   FROM total_world_cup
                   GROUP BY team
                ) AS t
	WHERE 
		total_goals_for = (SELECT MAX(tgf)
                        FROM ( SELECT SUM(goals_for) AS tgf
					FROM total_world_cup
					GROUP BY team ) AS t
                                 )
				   OR total_goals_for = ( 
                                    SELECT MIN ( tgf)
                                     FROM ( SELECT SUM(goals_for) AS tgf
					FROM total_world_cup
					GROUP BY team ) AS t
                                       )
             ORDER BY total_goals_for DESC;

        --Q8, Country with highest and lowest goals against?
        WITH
            total_world_cup AS ( 
        SELECT 
            'wc 2002' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2002
            UNION ALL
        SELECT 
            'wc 2006' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2006
            UNION ALL
        SELECT 
            'wc 201O' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2010
            UNION ALL
        SELECT
        'wc 2014' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,	
            goals_difference
            FROM 
            fifa_2014
            UNION ALL
        SELECT 
            'wc 2018' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
                                
            FROM 
            fifa_2018 )
            
            

        SELECT 
            team,
            SUM(goals_against) AS highest_lowestgamelost
            FROM total_world_cup
            GROUP BY
                team
            ORDER BY
            SUM(goals_against)
            DESC;

        



        --Q9, Country with highest and lowest goals difference

        WITH
            total_world_cup AS ( 
        SELECT 
            'wc 2002' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2002
            UNION ALL
        SELECT 
            'wc 2006' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2006
            UNION ALL
        SELECT 
            'wc 201O' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2010
            UNION ALL
        SELECT
        'wc 2014' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,	
            goals_difference
            FROM 
            fifa_2014
            UNION ALL
        SELECT 
            'wc 2018' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
                                
            FROM 
            fifa_2018 )
            
            

        SELECT 
    team,
    total_goal_difference
FROM (
    SELECT 
        team,
        SUM(goals_difference) AS total_goal_difference
    FROM total_world_cup
    GROUP BY team
) AS t
WHERE 
    total_goal_difference = (
        SELECT MAX(tgd)
        FROM (
            SELECT SUM(goals_difference) AS tgd
            FROM total_world_cup
            GROUP BY team
        ) AS t
    )
    OR total_goal_difference = (
        SELECT MIN(tgd)
        FROM (
            SELECT SUM(goals_difference) AS tgd
            FROM total_world_cup
            GROUP BY team
        ) AS t
    )
ORDER BY total_goal_difference DESC;

            --Q10 Country with highest and lowest points?

        WITH
            total_world_cup AS ( 
        SELECT 
            'wc 2002' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2002
            UNION ALL
        SELECT 
            'wc 2006' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2006
            UNION ALL
        SELECT 
            'wc 201O' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
            FROM 
            fifa_2010
            UNION ALL
        SELECT
        'wc 2014' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,	
            goals_difference
            FROM 
            fifa_2014
            UNION ALL
        SELECT 
            'wc 2018' AS worldcupyear,
            team,
            points,
            games_played,
            win,
            loss,
            goals_for,
            goals_against,
            goals_difference
                                
            FROM 
            fifa_2018 )
            
            

        SELECT 
	team,
	total_points

	FROM ( SELECT 
	           team,
		   SUM(points) AS total_points
		   FROM total_world_cup
                   GROUP BY team
                ) AS t
	WHERE 
		total_points = (SELECT MAX(pts)
                        FROM ( SELECT SUM(points) AS pts
					FROM total_world_cup
					GROUP BY team ) AS t
                                 )
				   OR total_points = ( 
                                    SELECT MIN(pts)
                                     FROM ( SELECT SUM(points) AS pts
					FROM total_world_cup
					GROUP BY team ) AS t
                                       )
             ORDER BY total_points DESC;
 


 

 
