CREATE OR REPLACE VIEW vw_sla_risk_drivers AS
SELECT
    Maintenance_Type,
    Vendor_Tier,
    Asset_Criticality,
    COUNT(*) AS Total,
    SUM(SLA_Breached) AS Breaches,
    ROUND(SUM(SLA_Breached)/COUNT(*)*100,2) AS Breach_Rate
FROM ba_project_refined
GROUP BY Maintenance_Type, Vendor_Tier, Asset_Criticality
HAVING COUNT(*) >= 20
ORDER BY Breach_Rate DESC;