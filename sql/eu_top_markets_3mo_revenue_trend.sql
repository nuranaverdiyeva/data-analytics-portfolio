SELECT
		 m."country_language" AS "Country Language",
		 MONTH(d."Closing Date") AS "Month Number",
		 MONTHNAME(d."Closing Date") AS "Month Name",
		 SUM(d."Amount") AS "Total Amount",
		 COUNT(d."Id") AS "Deals Count"
FROM  "Deals" d
LEFT JOIN "Users" u ON d."Deal Owner"  = u."Id" 
LEFT JOIN "markets" m ON d."country_language"  = m."country_language"  
WHERE	 d."Closing Date"  >= DATEADD(DAY, 1 -DAY(DATEADD(MONTH, -3, CURDATE())), DATEADD(MONTH, -3, CURDATE()))
 AND	d."Closing Date"  < DATEADD(DAY, 1 -DAY(CURDATE()), CURDATE())
 AND	u."Role Name"  NOT IN ( 'Partner Team'  )
 AND	d."Stage Category"  = 'Won'
 AND	d."Type"  NOT IN ( 'Unknown'  )
 AND	d."Branch location"  NOT IN ( 'Riyadh'  , 'Tijuana'  )
 AND	(d."PlatForm"  != 'Partner'
 OR	d."PlatForm"  IS NULL)
 AND	m."Main Markets"  = 'EU'
 AND	m."country_language"  IN
	(
 	SELECT top11."country_language"
	FROM (		SELECT
				 m2."country_language" AS "country_language",
				 SUM(d2."Amount") AS "Total Amount 3mo"
		FROM  "Deals" d2
LEFT JOIN "Users" u2 ON d2."Deal Owner"  = u2."Id" 
LEFT JOIN "markets" m2 ON d2."country_language"  = m2."country_language"  
		WHERE	 d2."Closing Date"  >= DATEADD(DAY, 1 -DAY(DATEADD(MONTH, -3, CURDATE())), DATEADD(MONTH, -3, CURDATE()))
		 AND	d2."Closing Date"  < DATEADD(DAY, 1 -DAY(CURDATE()), CURDATE())
		 AND	u2."Role Name"  NOT IN ( 'Partner Team'  )
		 AND	d2."Stage Category"  = 'Won'
		 AND	d2."Type"  NOT IN ( 'Unknown'  )
		 AND	d2."Branch location"  NOT IN ( 'Riyadh'  , 'Tijuana'  )
		 AND	(d2."PlatForm"  != 'Partner'
		 OR	d2."PlatForm"  IS NULL)
		 AND	m2."Main Markets"  = 'EU'
		GROUP BY  m2."country_language" 
ORDER BY 2 DESC 
LIMIT 11 
) top11 
	)
GROUP BY m."country_language",
	 MONTH(d."Closing Date"),
	  MONTHNAME(d."Closing Date") 
ORDER BY 4 DESC,
	 5 DESC 
