CREATE OR REPLACE VIEW vw_sla_diagnostics AS
SELECT
    Issue_Category,
    Maintenance_Type,
    COUNT(*) AS Total_Tickets,
    SUM(SLA_Breached) AS Breaches,
    ROUND(SUM(SLA_Breached) / COUNT(*) * 100, 2) AS Breach_Rate,
    ROUND(AVG(Resolution_Time_Hours), 2) AS Avg_Resolution_Time
FROM ba_project_refined
GROUP BY Issue_Category, Maintenance_Type;