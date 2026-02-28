CREATE OR REPLACE VIEW vw_maintenance_mix AS
SELECT
    Maintenance_Type,
    COUNT(*) AS Ticket_Count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS Share_Percent,
    ROUND(AVG(Resolution_Time_Hours), 2) AS Avg_Time,
    ROUND(SUM(SLA_Breached)/COUNT(*)*100, 2) AS Breach_Rate
FROM ba_project_refined
GROUP BY Maintenance_Type;