WITH quoted AS (SELECT
		 d."Id" AS deal_id,
		 /* QUOTED - CROWN */ SUM(CASE
				 WHEN LOWER(l."Product Name")  IN ( 'e-max crown'  , 'porcelain crown'  , 'porcelain crown on implant (occlusal screw)'  , 'zirconium crown'  , 'zirconium crown (ivoclar vivadent)'  , 'zirconium crown - amann girrbach'  , 'zirconium crown - ivoclar'  , 'zirconium crown - straumann'  , 'zirconium crown implant - monolithic (occlusal screwed)'  , 'zirconium crown on implant (cemented)'  , 'zirconium crown on implant (cemented) - amann girrbach'  , 'zirconium crown on implant (cemented) - straumann'  , 'zirconium crown on implant (cemented)- ivoclar'  , 'zirconium crown on implant (occlusal screw)'  , 'zirconium crown on implant (occlusal screw) - amann girrbach'  , 'zirconium crown on implant (occlusal screw) - ivoclar'  , 'zirconium crown on implant (occlusal screw) - straumann'  ) THEN qi."Quantity"
				 ELSE 0
			 END) AS "Quoted_Crown",
		 /* QUOTED - IMPLANTS */ SUM(CASE
				 WHEN LOWER(l."Product Name")  IN ( 'implant - bego'  , 'implant - neodent'  , 'implant - nobel'  , 'implant - straumann'  , 'implant - swiss'  , 'implant - zygoma'  ) THEN qi."Quantity"
				 ELSE 0
			 END) AS "Quoted_Implants",
		 /* QUOTED - ROOT CANAL */ SUM(CASE
				 WHEN LOWER(l."Product Name")  LIKE '%root%' THEN qi."Quantity"
				 ELSE 0
			 END) AS "Quoted_RootCanal",
		 /* QUOTED - OTHER */ SUM(CASE
				 WHEN LOWER(l."Product Name")  NOT IN ( 'e-max crown'  , 'porcelain crown'  , 'porcelain crown on implant (occlusal screw)'  , 'zirconium crown'  , 'zirconium crown (ivoclar vivadent)'  , 'zirconium crown - amann girrbach'  , 'zirconium crown - ivoclar'  , 'zirconium crown - straumann'  , 'zirconium crown implant - monolithic (occlusal screwed)'  , 'zirconium crown on implant (cemented)'  , 'zirconium crown on implant (cemented) - amann girrbach'  , 'zirconium crown on implant (cemented) - straumann'  , 'zirconium crown on implant (cemented)- ivoclar'  , 'zirconium crown on implant (occlusal screw)'  , 'zirconium crown on implant (occlusal screw) - amann girrbach'  , 'zirconium crown on implant (occlusal screw) - ivoclar'  , 'zirconium crown on implant (occlusal screw) - straumann'  , 'implant - bego'  , 'implant - neodent'  , 'implant - nobel'  , 'implant - straumann'  , 'implant - swiss'  , 'implant - zygoma'  )
				 AND	LOWER(l."Product Name")  NOT LIKE '%root%' THEN qi."Quantity"
				 ELSE 0
			 END) AS "Quoted_Other"
FROM  "Deals" d
JOIN "Quotes" q ON q."Deal Name"  = d."Id" 
JOIN "Quoted Items" qi ON qi."Parent ID"  = q."Id" 
JOIN "Price List" l ON l."Id"  = qi."Product Name"  
GROUP BY  d."Id") ,
actual AS (SELECT
		 d."Id" AS deal_id,
		 /* ACTUAL - CROWN */ SUM(CASE
				 WHEN LOWER(l."Product Name")  IN ( 'e-max crown'  , 'porcelain crown'  , 'porcelain crown on implant (occlusal screw)'  , 'zirconium crown'  , 'zirconium crown (ivoclar vivadent)'  , 'zirconium crown - amann girrbach'  , 'zirconium crown - ivoclar'  , 'zirconium crown - straumann'  , 'zirconium crown implant - monolithic (occlusal screwed)'  , 'zirconium crown on implant (cemented)'  , 'zirconium crown on implant (cemented) - amann girrbach'  , 'zirconium crown on implant (cemented) - straumann'  , 'zirconium crown on implant (cemented)- ivoclar'  , 'zirconium crown on implant (occlusal screw)'  , 'zirconium crown on implant (occlusal screw) - amann girrbach'  , 'zirconium crown on implant (occlusal screw) - ivoclar'  , 'zirconium crown on implant (occlusal screw) - straumann'  ) THEN i."Quantity"
				 ELSE 0
			 END) AS "Actual_Crown",
		 /* ACTUAL - IMPLANTS */ SUM(CASE
				 WHEN LOWER(l."Product Name")  IN ( 'implant - bego'  , 'implant - neodent'  , 'implant - nobel'  , 'implant - straumann'  , 'implant - swiss'  , 'implant - zygoma'  ) THEN i."Quantity"
				 ELSE 0
			 END) AS "Actual_Implants",
		 /* ACTUAL - ROOT CANAL */ SUM(CASE
				 WHEN LOWER(l."Product Name")  LIKE '%root%' THEN i."Quantity"
				 ELSE 0
			 END) AS "Actual_RootCanal",
		 /* ACTUAL - OTHER */ SUM(CASE
				 WHEN LOWER(l."Product Name")  NOT IN ( 'e-max crown'  , 'porcelain crown'  , 'porcelain crown on implant (occlusal screw)'  , 'zirconium crown'  , 'zirconium crown (ivoclar vivadent)'  , 'zirconium crown - amann girrbach'  , 'zirconium crown - ivoclar'  , 'zirconium crown - straumann'  , 'zirconium crown implant - monolithic (occlusal screwed)'  , 'zirconium crown on implant (cemented)'  , 'zirconium crown on implant (cemented) - amann girrbach'  , 'zirconium crown on implant (cemented) - straumann'  , 'zirconium crown on implant (cemented)- ivoclar'  , 'zirconium crown on implant (occlusal screw)'  , 'zirconium crown on implant (occlusal screw) - amann girrbach'  , 'zirconium crown on implant (occlusal screw) - ivoclar'  , 'zirconium crown on implant (occlusal screw) - straumann'  , 'implant - bego'  , 'implant - neodent'  , 'implant - nobel'  , 'implant - straumann'  , 'implant - swiss'  , 'implant - zygoma'  )
				 AND	LOWER(l."Product Name")  NOT LIKE '%root%' THEN i."Quantity"
				 ELSE 0
			 END) AS "Actual_Other"
FROM  "Deals" d
JOIN "Product info" i ON i."Parent ID"  = d."Id" 
JOIN "Price List" l ON l."Id"  = i."Product"  
GROUP BY  d."Id")
SELECT
		 d."Lead ID" AS "Lead ID",
		 d."Deal Name" AS "Deal Name",
		 d."Closing Date" AS "Closing Date",
		 d."Visit" AS "Visit",
		 COALESCE(qt."Quoted_Crown", 0) AS "Quoted_Crown",
		 COALESCE(ac."Actual_Crown", 0) AS "Actual_Crown",
		 ROUND(CASE
				 WHEN COALESCE(qt."Quoted_Crown", 0)  = 0 THEN 0
				 ELSE (COALESCE(ac."Actual_Crown", 0) -COALESCE(qt."Quoted_Crown", 0)) * 100.0 / NULLIF(COALESCE(qt."Quoted_Crown", 0), 0)
			 END, 0) AS "Change_Crown(%)",
		 COALESCE(qt."Quoted_Implants", 0) AS "Quoted_Implants",
		 COALESCE(ac."Actual_Implants", 0) AS "Actual_Implants",
		 ROUND(CASE
				 WHEN COALESCE(qt."Quoted_Implants", 0)  = 0 THEN 0
				 ELSE (COALESCE(ac."Actual_Implants", 0) -COALESCE(qt."Quoted_Implants", 0)) * 100.0 / NULLIF(COALESCE(qt."Quoted_Implants", 0), 0)
			 END, 0) AS "Change_Implants(%)",
		 COALESCE(qt."Quoted_RootCanal", 0) AS "Quoted_RootCanal",
		 COALESCE(ac."Actual_RootCanal", 0) AS "Actual_RootCanal",
		 ROUND(CASE
				 WHEN COALESCE(qt."Quoted_RootCanal", 0)  = 0 THEN 0
				 ELSE (COALESCE(ac."Actual_RootCanal", 0) -COALESCE(qt."Quoted_RootCanal", 0)) * 100.0 / NULLIF(COALESCE(qt."Quoted_RootCanal", 0), 0)
			 END, 0) AS "Change_RootCanal(%)",
		 COALESCE(qt."Quoted_Other", 0) AS "Quoted_Other",
		 COALESCE(ac."Actual_Other", 0) AS "Actual_Other",
		 ROUND(CASE
				 WHEN COALESCE(qt."Quoted_Other", 0)  = 0 THEN 0
				 ELSE (COALESCE(ac."Actual_Other", 0) -COALESCE(qt."Quoted_Other", 0)) * 100.0 / NULLIF(COALESCE(qt."Quoted_Other", 0), 0)
			 END, 0) AS "Change_Other(%)"
FROM  "Deals" d
LEFT JOIN quoted qt ON qt.deal_id  = d."Id" 
LEFT JOIN actual ac ON ac.deal_id  = d."Id"  
 
