SELECT
    YEAR(h."Check In Date") AS "Year",
    MONTH(h."Check In Date") AS "Month",
    h."Hotel Name" AS "Hotel Name",
    SUM(DATEDIFF(h."Check Out Date", h."Check In Date")) AS "Booked Nights",
    SUM(CASE WHEN h."Cancellation Type" = 'No Show'
             THEN DATEDIFF(h."Check Out Date", h."Check In Date") ELSE 0 END) AS "No-Show Nights",
    ROUND(
        SUM(CASE WHEN h."Cancellation Type" = 'No Show'
                 THEN DATEDIFF(h."Check Out Date", h."Check In Date") ELSE 0 END) * 100.0
        / NULLIF(SUM(DATEDIFF(h."Check Out Date", h."Check In Date")), 0), 2) AS "No-Show Rate %"
FROM "Hotel Bookings" h
WHERE COALESCE(h."Cancellation Type", '') IN ('', 'No Show')
  AND h."Check In Date" >= '2026-03-01'
  AND h."Check In Date" <  '2026-09-01'
GROUP BY
    YEAR(h."Check In Date"),
    MONTH(h."Check In Date"),
    h."Hotel Name"
