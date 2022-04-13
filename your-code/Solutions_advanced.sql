-- Challenge 1 - 2

SELECT ti.title_id AS 'Title_ID',
ta.au_id AS 'Author_ID',
-- ROUND(SUM(sa.qty * ti.price * ti.royalty/100 * ta.royaltyper/100),2)  AS 'Royalties',
ROUND(SUM(sa.qty * ti.price * ti.royalty/100 * ta.royaltyper/100),2) + ROUND(SUM(sa.qty * ti.advance),2) AS 'Profit'
FROM publications.titles AS ti
LEFT JOIN publications.sales AS sa
ON ti.title_id = sa.title_id
INNER JOIN publications.titleauthor AS ta
ON ti.title_id = ta.title_id
INNER JOIN publications.roysched AS roy
ON ti.title_id = roy.title_id
GROUP BY AUTHOR_ID, Title_ID
ORDER BY Profit DESC
LIMIT 3;

-- Challenge 3
CREATE TABLE publications.most_profiting_authors
SELECT 
ta.au_id AS 'Author_ID',
ROUND(SUM(sa.qty * ti.price * ti.royalty/100 * ta.royaltyper/100),2) + ROUND(SUM(sa.qty * ti.advance),2) AS 'Profit'
FROM publications.titles AS ti
LEFT JOIN publications.sales AS sa
ON ti.title_id = sa.title_id
INNER JOIN publications.titleauthor AS ta
ON ti.title_id = ta.title_id
INNER JOIN publications.roysched AS roy
ON ti.title_id = roy.title_id
GROUP BY AUTHOR_ID
ORDER BY Profit DESC;

