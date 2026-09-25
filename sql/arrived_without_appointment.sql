SELECT
		 YEAR(d."Arrival Date/Time") AS "Year",
		 MONTH(d."Arrival Date/Time") AS "Month",
		 d."Branch location" AS "Branch location",
		 COUNT(DISTINCT d."Id") AS "Total Arrivals",
		 COUNT(DISTINCT CASE
				 WHEN d."Slot Status"  = 'Not Confirmed' THEN d."Id"
			 END) AS "Arrivals Without Appointment",
		 ROUND(COUNT(DISTINCT CASE
				 WHEN d."Slot Status"  = 'Not Confirmed' THEN d."Id"
			 END) * 100.0 / COUNT(DISTINCT d."Id"), 1) AS "Without Appointment %"
FROM  "Deals" d 
WHERE	 d."Slot Status"  IN ( 'Confirmed'  , 'Not Confirmed'  )
 AND	d."Branch location"  IN ( 'Antalya'  , 'Nish'  , 'Şişli'  , 'Seaside'  )
 AND	d."Arrival Date/Time"  >= '2026-03-01'
 AND	d."Arrival Date/Time"  < '2026-09-01'
GROUP BY YEAR(d."Arrival Date/Time"),
	 MONTH(d."Arrival Date/Time"),
	  d."Branch location" 

