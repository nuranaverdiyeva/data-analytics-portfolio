WITH filtered_products AS (
	SELECT
		 m."Main Markets" AS "Main Markets",
		 pl."Brand" AS "Brand",
		 pi."Quantity" AS "Quantity"
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
	 SUM(CASE WHEN "Brand" = 'Zahn' THEN "Quantity" ELSE 0 END) AS "Zahn",
	 SUM(CASE WHEN "Brand" = 'Straumann' THEN "Quantity" ELSE 0 END) AS "Straumann",
	 SUM(CASE WHEN "Brand" = 'Porcelain' THEN "Quantity" ELSE 0 END) AS "Porcelain",
	 SUM(CASE WHEN "Brand" = 'Ivoclar' THEN "Quantity" ELSE 0 END) AS "Ivoclar",
	 SUM(CASE WHEN "Brand" = 'AmannGirrbach' THEN "Quantity" ELSE 0 END) AS "AmannGirrbach",
	 SUM("Quantity") AS "Total Quantity"
FROM filtered_products
GROUP BY "Main Markets"
ORDER BY 7 DESC
