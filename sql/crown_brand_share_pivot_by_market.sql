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
	 AND	pl."Product Name" NOT IN ('Temporary Crown - PMMA')
	 AND	pl."Brand" IN ('Zahn', 'Straumann', 'Porcelain', 'Ivoclar', 'AmannGirrbach')
	 AND	d."Branch location" NOT IN ('Riyadh', 'Tijuana')
	 AND	pl."Product Category" IN ('Crown', 'Holywood Smile')
	 AND	m."Main Markets" IN ('US', 'German', 'GB', 'French', 'EU')
)

SELECT
	 "Main Markets",
	 ROUND(COUNTIF("Brand" = 'AmannGirrbach') * 100.0 / COUNT("Parent ID"), 1) AS "AmannGirrbach",
	 ROUND(COUNTIF("Brand" = 'Ivoclar') * 100.0 / COUNT("Parent ID"), 1) AS "Ivoclar",
	 ROUND(COUNTIF("Brand" = 'Porcelain') * 100.0 / COUNT("Parent ID"), 1) AS "Porcelain",
	 ROUND(COUNTIF("Brand" = 'Straumann') * 100.0 / COUNT("Parent ID"), 1) AS "Straumann",
	 ROUND(COUNTIF("Brand" = 'Zahn') * 100.0 / COUNT("Parent ID"), 1) AS "Zahn",
	 100.0 AS "Parent ID Count"
FROM filtered_products
GROUP BY "Main Markets"

UNION ALL

SELECT
	 'Grand Count',
	 ROUND(COUNTIF("Brand" = 'AmannGirrbach') * 100.0 / COUNT("Parent ID"), 1),
	 ROUND(COUNTIF("Brand" = 'Ivoclar') * 100.0 / COUNT("Parent ID"), 1),
	 ROUND(COUNTIF("Brand" = 'Porcelain') * 100.0 / COUNT("Parent ID"), 1),
	 ROUND(COUNTIF("Brand" = 'Straumann') * 100.0 / COUNT("Parent ID"), 1),
	 ROUND(COUNTIF("Brand" = 'Zahn') * 100.0 / COUNT("Parent ID"), 1),
	 100.0
FROM filtered_products
