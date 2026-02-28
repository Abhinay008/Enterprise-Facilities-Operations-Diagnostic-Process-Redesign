CREATE OR REPLACE VIEW vw_vendor_performance AS
SELECT
    Vendor_ID,
    Vendor_Tier,
    COUNT(*) AS Tickets_Handled,
    ROUND(AVG(Resolution_Time_Hours), 2) AS Avg_Resolution_Time,
    ROUND(SUM(SLA_Breached)/COUNT(*)*100, 2) AS SLA_Breach_Rate,
    ROUND(AVG(Vendor_Reliability_Index), 2) AS Avg_Reliability
FROM ba_project_refined
GROUP BY Vendor_ID, Vendor_Tier
HAVING COUNT(*) >= 10;