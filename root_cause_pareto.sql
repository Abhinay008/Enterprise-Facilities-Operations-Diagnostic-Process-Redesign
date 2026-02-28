CREATE OR REPLACE VIEW vw_root_cause_pareto AS
SELECT
    Root_Cause_Tag,
    COUNT(*) AS Occurrences,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS Percent_Share
FROM ba_project_refined
GROUP BY Root_Cause_Tag
ORDER BY Occurrences DESC;