SELECT
		 YEAR(d."Appointment Date") AS "Year",
		 MONTH(d."Appointment Date") AS "Month",
		 d."Branch location" AS "Branch location",
		 COUNT(DISTINCT d."Id") AS "Total Booked",
		 /* Mon_Tue: DAYOFWEEK 2 = Monday, 3 = Tuesday */ ROUND(COUNT(DISTINCT CASE
				 WHEN DAYOFWEEK(d."Appointment Date")  IN ( 2  , 3  ) THEN d."Id"
			 END) * 100.0 / MAX(CASE
				 WHEN d."Branch location"  = 'Seaside' THEN NULL
				 WHEN MONTH(d."Appointment Date")  = 4 THEN 320
				 WHEN MONTH(d."Appointment Date")  = 5 THEN 320
				 WHEN MONTH(d."Appointment Date")  = 6 THEN 400
				 WHEN MONTH(d."Appointment Date")  = 7 THEN 320
				 WHEN MONTH(d."Appointment Date")  = 8 THEN 360
			 END), 1) AS "Mon_Tue",
		 /* Wed: DAYOFWEEK 4 = Wednesday */ ROUND(COUNT(DISTINCT CASE
				 WHEN DAYOFWEEK(d."Appointment Date")  = 4 THEN d."Id"
			 END) * 100.0 / MAX(CASE
				 WHEN d."Branch location"  = 'Seaside' THEN NULL
				 WHEN MONTH(d."Appointment Date")  = 4 THEN 100
				 WHEN MONTH(d."Appointment Date")  = 5 THEN 80
				 WHEN MONTH(d."Appointment Date")  = 6 THEN 80
				 WHEN MONTH(d."Appointment Date")  = 7 THEN 100
				 WHEN MONTH(d."Appointment Date")  = 8 THEN 80
			 END), 1) AS "Wed",
		 /* Thu_Fri_Sat: DAYOFWEEK 5 = Thursday, 6 = Friday, 7 = Saturday */ ROUND(COUNT(DISTINCT CASE
				 WHEN DAYOFWEEK(d."Appointment Date")  IN ( 5  , 6  , 7  ) THEN d."Id"
			 END) * 100.0 / MAX(CASE
				 WHEN d."Branch location"  = 'Seaside' THEN NULL
				 WHEN MONTH(d."Appointment Date")  = 4 THEN 130
				 WHEN MONTH(d."Appointment Date")  = 5 THEN 140
				 WHEN MONTH(d."Appointment Date")  = 6 THEN 120
				 WHEN MONTH(d."Appointment Date")  = 7 THEN 140
				 WHEN MONTH(d."Appointment Date")  = 8 THEN 130
			 END), 1) AS "Thu_Fri_Sat",
		 /* Seaside Only: 5 slots every working day */ ROUND(COUNT(DISTINCT d."Id") * 100.0 / MAX(CASE
				 WHEN d."Branch location"  <> 'Seaside' THEN NULL
				 WHEN MONTH(d."Appointment Date")  = 7 THEN 135
				 ELSE 130
			 END), 1) AS "Seaside Only"
FROM  "Deals" d 
WHERE	 d."Slot Status"  = 'Confirmed'
 AND	d."Branch location"  IN ( 'Antalya'  , 'Nish'  , 'Şişli'  , 'Seaside'  )
 AND	d."Appointment Date"  >= '2026-04-01'
 AND	d."Appointment Date"  < '2026-09-01'
GROUP BY YEAR(d."Appointment Date"),
	 MONTH(d."Appointment Date"),
	  d."Branch location" 

