SELECT
	 m."Main Markets" AS "Market",
	 ROUND(((COUNT(d."Id") - COUNTIF(d."Stage Category" = 'Won')) * 1.0 / COUNT(d."Id")) * 100, 2) AS "Cancellation %",
	 ROUND(SUM(CASE WHEN d."Full Treatment" = 'Yes' THEN d."Amount" ELSE 0 END)
		 / NULLIF(COUNTIF(d."Full Treatment" = 'Yes'), 0), 2) AS "Avg Deal Size"
FROM  "Deals" d
LEFT JOIN "Users" u ON d."Deal Owner" = u."Id"
LEFT JOIN "markets" m ON d."country_language" = m."country_language"
WHERE	 d."Closing Date" >= '2026-07-01'
 AND	d."Closing Date" < '2026-08-01'
 AND	m."Main Markets" IN ('EU', 'GB', 'US', 'French', 'German')
 AND	u."Role Name" NOT IN ('Partner Team')
 AND	d."Branch location" NOT IN ('Riyadh', 'Tijuana')
GROUP BY m."Main Markets"
