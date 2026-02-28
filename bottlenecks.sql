CREATE OR REPLACE VIEW vw_bottlenecks AS
SELECT
    Issue_Category,
    Maintenance_Type,
    Vendor_Tier,
    COUNT(*) AS Tickets,
    ROUND(SUM(SLA_Breached)/COUNT(*)*100,2) AS Breach_Rate,
    ROUND(AVG(Response_Time_Minutes),1) AS Avg_Response_Min
FROM ba_project_refined
GROUP BY Issue_Category, Maintenance_Type, Vendor_Tier
HAVING COUNT(*) >= 15
ORDER BY Breach_Rate DESC;