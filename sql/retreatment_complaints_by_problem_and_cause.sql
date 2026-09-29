SELECT
    s."Year" AS "Year",
    s."Month" AS "Month",
    s."Clinic Branch" AS "Clinic Branch",
    s."Cause" AS "Cause",
    s."Dental Problem" AS "Dental Problem",
    COUNT(DISTINCT s."Complaint") AS "Complaints"
FROM (
    SELECT
        p."Year" AS "Year",
        p."Month" AS "Month",
        p."Clinic Branch" AS "Clinic Branch",
        p."Complaint" AS "Complaint",
        p."Dental Problem" AS "Dental Problem",
        CASE
            WHEN p."Dental Problem" IN (
                'Gum issues', 'Bone protrusions in the gum', 'Abscess', 'Exposed implant',
                'Implant Failure', 'Sinus Lift issues', 'Bone graft issues', 'Allergy issue',
                'Mobility', 'Numbness', 'Pain', 'Pain in implant site', 'Sensitivity',
                'Bad smell', 'Swelling', 'Headache'
            ) THEN 'Natural'
            WHEN p."Dental Problem" IN (
                'Broken Crowns', 'Chipped Crowns', 'Broken Veneers', 'Stains on the crowns',
                'Stitches issues', 'Temporary Dentures issues', 'Pmma issue',
                'Nightguard issue', 'Retainer issue'
            ) THEN 'Patient-caused'
            WHEN p."Dental Problem" IN (
                'Roughness in Crowns', 'Crown fell off', 'Crown fell off with the abutment',
                'Veneers fell off', 'Aesthetic issue', 'Fake gum issue', 'Implant issues',
                'Implant screw issue', 'Implant screw fell off', 'Occlusion issues',
                'Pronunciation issue/Lisp', 'Gingival cap issue', 'Abutment issue',
                'Composite filling issue', 'Treatment plan issue', 'Gaps',
                'Extra cementation', 'Untreated Dental Caries'
            ) THEN 'Procedure error'
            ELSE 'Unclassified'
        END AS "Cause"
    FROM (
        /* Split the multi-select field into one row per problem */
        SELECT
            YEAR(r."Arrival Date/Time") AS "Year",
            MONTH(r."Arrival Date/Time") AS "Month",
            r."Clinic Branch" AS "Clinic Branch",
            r."Complaint" AS "Complaint",
            TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(r."Dental Problem.", ';', n."n"), ';', -1)) AS "Dental Problem"
        FROM "Retreatments" r
        CROSS JOIN (
            SELECT DISTINCT 1 AS "n" FROM "Retreatments"
            UNION ALL SELECT DISTINCT 2 FROM "Retreatments"
            UNION ALL SELECT DISTINCT 3 FROM "Retreatments"
            UNION ALL SELECT DISTINCT 4 FROM "Retreatments"
            UNION ALL SELECT DISTINCT 5 FROM "Retreatments"
            UNION ALL SELECT DISTINCT 6 FROM "Retreatments"
            UNION ALL SELECT DISTINCT 7 FROM "Retreatments"
            UNION ALL SELECT DISTINCT 8 FROM "Retreatments"
        ) n
        WHERE r."Dental Problem." IS NOT NULL
          AND n."n" <= LENGTH(r."Dental Problem.") - LENGTH(REPLACE(r."Dental Problem.", ';', '')) + 1
          AND r."Arrival Date/Time" >= '2026-03-01'
          AND r."Arrival Date/Time" <  '2026-09-01'
    ) p
    WHERE p."Dental Problem" NOT IN ('RPT Continuation', 'Check-up')
) s
GROUP BY
    s."Year",
    s."Month",
    s."Clinic Branch",
    s."Cause",
    s."Dental Problem"
