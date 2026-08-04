SELECT
		 m."Main Markets" AS "Market",
		 d."Visit" AS "Visit Type",
		 ROUND(SUM(CASE
				 WHEN MONTH(d."Closing Date")  = 7 THEN d."Amount"
				 ELSE 0
			 END) / NULLIF(COUNTIF(MONTH(d."Closing Date")  = 7), 0), 2) AS "Avg Deal Size July",
		 ROUND((SUM(CASE
				 WHEN MONTH(d."Closing Date")  = 7 THEN d."Amount"
				 ELSE 0
			 END) / NULLIF(COUNTIF(MONTH(d."Closing Date")  = 7), 0) -SUM(CASE
				 WHEN MONTH(d."Closing Date")  = 6 THEN d."Amount"
				 ELSE 0
			 END) / NULLIF(COUNTIF(MONTH(d."Closing Date")  = 6), 0)) / NULLIF(SUM(CASE
				 WHEN MONTH(d."Closing Date")  = 6 THEN d."Amount"
				 ELSE 0
			 END) / NULLIF(COUNTIF(MONTH(d."Closing Date")  = 6), 0), 0) * 100, 1) AS "vs June 2026 (Avg Deal Size %)",
		 COUNTIF(MONTH(d."Closing Date")  = 7) AS "Patients June",
		 ROUND((COUNTIF(MONTH(d."Closing Date")  = 7) -COUNTIF(MONTH(d."Closing Date")  = 6)) / NULLIF(COUNTIF(MONTH(d."Closing Date")  = 6) * 1.0, 0) * 100, 1) AS "vs June 2026 (Patients %)"
FROM  "Deals" d
LEFT JOIN "Users" u ON d."Deal Owner"  = u."Id" 
LEFT JOIN "markets" m ON d."country_language"  = m."country_language"  
WHERE	 YEAR(d."Closing Date")  = 2026
 AND	MONTH(d."Closing Date")  IN ( 6  , 7  )
 AND	u."Role Name"  NOT IN ( 'Partner Team'  )
 AND	d."Stage Category"  = 'Won'
 AND	d."Type"  NOT IN ( 'Unknown'  )
 AND	d."Branch location"  NOT IN ( 'Riyadh'  , 'Tijuana'  )
 AND	(d."PlatForm"  != 'Partner'
 OR	d."PlatForm"  IS NULL)
 AND	m."Main Markets"  IN ( 'GB'  , 'French'  , 'US'  , 'EU'  , 'German'  )
GROUP BY m."Main Markets",
	  d."Visit" 
UNION ALL
 SELECT
		 m."Main Markets" AS "Market",
		 'Total' AS "Visit Type",
		 ROUND(SUM(CASE
				 WHEN MONTH(d."Closing Date")  = 7 THEN d."Amount"
				 ELSE 0
			 END) / NULLIF(COUNTIF(MONTH(d."Closing Date")  = 7), 0), 2),
		 ROUND((SUM(CASE
				 WHEN MONTH(d."Closing Date")  = 7 THEN d."Amount"
				 ELSE 0
			 END) / NULLIF(COUNTIF(MONTH(d."Closing Date")  = 7), 0) -SUM(CASE
				 WHEN MONTH(d."Closing Date")  = 6 THEN d."Amount"
				 ELSE 0
			 END) / NULLIF(COUNTIF(MONTH(d."Closing Date")  = 6), 0)) / NULLIF(SUM(CASE
				 WHEN MONTH(d."Closing Date")  = 6 THEN d."Amount"
				 ELSE 0
			 END) / NULLIF(COUNTIF(MONTH(d."Closing Date")  = 6), 0), 0) * 100, 1),
		 COUNTIF(MONTH(d."Closing Date")  = 7),
		 ROUND((COUNTIF(MONTH(d."Closing Date")  = 7) -COUNTIF(MONTH(d."Closing Date")  = 6)) / NULLIF(COUNTIF(MONTH(d."Closing Date")  = 6) * 1.0, 0) * 100, 1)
FROM  "Deals" d
LEFT JOIN "Users" u ON d."Deal Owner"  = u."Id" 
LEFT JOIN "markets" m ON d."country_language"  = m."country_language"  
WHERE	 YEAR(d."Closing Date")  = 2026
 AND	MONTH(d."Closing Date")  IN ( 6  , 7  )
 AND	u."Role Name"  NOT IN ( 'Partner Team'  )
 AND	d."Stage Category"  = 'Won'
 AND	d."Type"  NOT IN ( 'Unknown'  )
 AND	d."Branch location"  NOT IN ( 'Riyadh'  , 'Tijuana'  )
 AND	(d."PlatForm"  != 'Partner'
 OR	d."PlatForm"  IS NULL)
 AND	m."Main Markets"  IN ( 'GB'  , 'French'  , 'US'  , 'EU'  , 'German'  )
GROUP BY  m."Main Markets" 
 
ORDER BY 1,
	 2 
