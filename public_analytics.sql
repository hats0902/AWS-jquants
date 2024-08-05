-- 1. 特定の企業の2023年に開示された財務開示情報を取得する
SELECT
    *
FROM
    financial_disclosures AS fd
JOIN
    listed_companies AS lc
    ON fd.LocalCode = lc.Code
WHERE
    fd.DisclosedDate BETWEEN '2023-01-01' AND '2023-12-31'
    AND lc.CompanyName = 'ラクス';


-- 2. 各企業の最新の財務開示情報を取得する
WITH rank_tbl AS(
	SELECT
  		*,
  		RANK() OVER(PARTITION BY LocalCode ORDER BY DisclosedDate DESC, DisclosedTime DESC) rank
  	FROM
  		financial_disclosures
		)
SELECT
	*
FROM
	rank_tbl
WHERE
	rank = 1;
