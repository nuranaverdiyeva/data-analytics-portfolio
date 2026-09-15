SELECT
		 m."Main Markets",
		 YEAR(l."Created Time") AS "Year",
		 MONTH(l."Created Time") AS "Month Number",
		 MONTHNAME(l."Created Time") AS "Month Name",
		 COUNT(l."Id") AS "Leads Count",
		 COUNTIF(lsl."General Status"  = 'Interested'
		 OR	lsl."General Status"  = 'OS') AS "Qualified Lead Count",
		 ROUND((COUNTIF(lsl."General Status"  = 'Interested'
		 OR	lsl."General Status"  = 'OS') * 1.0 / COUNT(l."Id")), 4) AS "Qualification Rate %"
FROM  "Leads" l
LEFT JOIN "Lead-status-lookup" lsl ON l."Lead Status"  = lsl."Lead Status" 
LEFT JOIN "markets" m ON l."country_language"  = m."country_language"  
WHERE	 YEAR(l."Created Time")  IN ( 2025  , 2026  )
 AND	m."Main Markets"  IN ( 'GB'  , 'French'  , 'US'  , 'EU'  , 'German'  )
GROUP BY m."Main Markets",
	 YEAR(l."Created Time"),
	 MONTH(l."Created Time"),
	  MONTHNAME(l."Created Time") 
ORDER BY 1,
	 2,
	 3 
