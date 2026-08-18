WITH filtered_products AS (
	SELECT
		 m."Main Markets" AS "Main Markets",
		 pl."Brand" AS "Brand",
		 pi."Parent ID" AS "Parent ID"
	FROM  "Deals" d
	LEFT JOIN "Users" u ON d."Deal Owner" = u."Id"
	LEFT JOIN "markets" m ON d."country_language" = m."country_language"
	LEFT JOIN "Product info" pi ON pi."Parent ID" = d."Id"
	LEFT JOIN "Price List" pl ON pl."Id" = pi."Product"
	WHERE	 d."Closing Date" >= '2026-07-01'
	 AND	d."Closing Date" < '2026-08-01'
	 AND	pl."Brand" IN ('Straumann', 'Nobel', 'Neodent', 'Bego', 'Swiss')
	 AND	d."Branch location" NOT IN ('Riyadh', 'Tijuana')
	 AND	pl."Product Category" = 'Implants'
	 AND	m."Main Markets" IN ('US', 'German', 'GB', 'French', 'EU')
)

SELECT
	 "Main Markets",
	 ROUND(COUNTIF("Brand" = 'Straumann') * 100.0 / COUNT("Parent ID"), 1) AS "Straumann",
	 ROUND(COUNTIF("Brand" = 'Nobel') * 100.0 / COUNT("Parent ID"), 1) AS "Nobel",
	 ROUND(COUNTIF("Brand" = 'Neodent') * 100.0 / COUNT("Parent ID"), 1) AS "Neodent",
	 ROUND(COUNTIF("Brand" = 'Bego') * 100.0 / COUNT("Parent ID"), 1) AS "Bego",
	 ROUND(COUNTIF("Brand" = 'Swiss') * 100.0 / COUNT("Parent ID"), 1) AS "Swiss",
	 100.0 AS "Parent ID Count"
FROM filtered_products
GROUP BY "Main Markets"

UNION ALL

SELECT
	 'Grand Count',
	 ROUND(COUNTIF("Brand" = 'Straumann') * 100.0 / COUNT("Parent ID"), 1),
	 ROUND(COUNTIF("Brand" = 'Nobel') * 100.0 / COUNT("Parent ID"), 1),
	 ROUND(COUNTIF("Brand" = 'Neodent') * 100.0 / COUNT("Parent ID"), 1),
	 ROUND(COUNTIF("Brand" = 'Bego') * 100.0 / COUNT("Parent ID"), 1),
	 ROUND(COUNTIF("Brand" = 'Swiss') * 100.0 / COUNT("Parent ID"), 1),
	 100.0
FROM filtered_products
