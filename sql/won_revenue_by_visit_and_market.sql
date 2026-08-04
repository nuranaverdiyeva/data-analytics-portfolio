SELECT
		 m."Main Markets",
		 YEAR(d."Closing Date") AS "Year",
		 MONTH(d."Closing Date") AS "Month Number",
		 MONTHNAME(d."Closing Date") AS "Month Name",
		 SUM(CASE
				 WHEN d."Visit"  = '1st' THEN d."Amount"
				 ELSE 0
			 END) AS "1st Total Amount",
		 SUM(CASE
				 WHEN d."Visit"  = '2nd' THEN d."Amount"
				 ELSE 0
			 END) AS "2nd Total Amount",
		 SUM(d."Amount") AS "Summary Total Amount",
		 COUNTIF(d."Visit"  = '1st') AS "1st # Deals",
		 COUNTIF(d."Visit"  = '2nd') AS "2nd # Deals",
		 COUNT(d."Id") AS "Summary # Deals"
FROM  "Deals" d
LEFT JOIN "Users" u ON d."Deal Owner"  = u."Id" 
LEFT JOIN "markets" m ON d."country_language"  = m."country_language"  
WHERE	 YEAR(d."Closing Date")  IN ( 2025  , 2026  )
 AND	u."Role Name"  NOT IN ( 'Partner Team'  )
 AND	d."Stage Category"  = 'Won'
 AND	d."Type"  NOT IN ( 'Unknown'  )
 AND	d."Branch location"  NOT IN ( 'Riyadh'  , 'Tijuana'  )
 AND	(d."PlatForm"  != 'Partner'
 OR	d."PlatForm"  IS NULL)
GROUP BY m."Main Markets",
	 YEAR(d."Closing Date"),
	 MONTH(d."Closing Date"),
	  MONTHNAME(d."Closing Date") 
ORDER BY 1,
	 2,
	 3 
