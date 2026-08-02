SELECT
		 TRIM(m."Main Markets") AS "Main Markets",
		 YEAR(d."Closing Date") AS "Year",
		 MONTH(d."Closing Date") AS "Month Number",
		 MONTHNAME(d."Closing Date") AS "Month Name",
		 COUNT(pi."Parent ID") AS "Implant Count",
		 ROUND(COUNT(pi."Parent ID") * 100.0 / SUM(COUNT(pi."Parent ID")) OVER(PARTITION BY TRIM(m."Main Markets") , YEAR(d."Closing Date") , MONTH(d."Closing Date")  ), 2) AS "Brand Share %",
		 SUM(pi."Quantity") AS "Total Quantity",
		 TRIM(pl."Brand") AS "Brand"
FROM  "Product info" pi
JOIN "Price List" pl ON pi."Product"  = pl."Id" 
JOIN Deals d ON pi."Parent ID"  = d."Id" 
JOIN markets m ON d."country_language"  = m."country_language"  
WHERE	 TRIM(pl."Brand")  IN ( 'Bego'  , 'Neodent'  , 'Nobel'  , 'Straumann'  , 'Swiss'  )
 AND	TRIM(pl."Product Category")  = 'Implants'
 AND	TRIM(pl."Product Name")  <> 'Temporary Crown - PMMA'
 AND	TRIM(d."Branch location")  NOT IN ( 'Riyadh'  , 'Tijuana'  )
 AND	TRIM(m."Main Markets")  IN ( 'GB'  , 'French'  , 'EU'  , 'US'  , 'German'  )
 AND	d."Closing Date"  >= '2026-01-01'
 AND	d."Closing Date"  < '2026-07-01'
GROUP BY TRIM(m."Main Markets"),
	 YEAR(d."Closing Date"),
	 MONTH(d."Closing Date"),
	 MONTHNAME(d."Closing Date"),
	  TRIM(pl."Brand") 
ORDER BY 1,
	 2,
	 3,
	 7 
