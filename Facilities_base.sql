CREATE OR REPLACE VIEW vw_facilities_base AS
SELECT
    Ticket_ID,
    Property_Cluster,
    Building_Type,
    Issue_Category,
    Maintenance_Type,
    Asset_Criticality,
    Priority_Level,
    Vendor_ID,
    Vendor_Tier,
    SLA_Target_Hours,
    SLA_Breached,
    Root_Cause_Tag,
    Resolution_Time_Hours,
    Response_Time_Minutes,
    Delay_Bucket,
    Vendor_Reliability_Index,

    DATE(Created_TS) AS Created_Date,
    MONTH(Created_TS) AS Created_Month,
    WEEK(Created_TS) AS Created_Week,

    CASE
        WHEN Resolution_Time_Hours <= SLA_Target_Hours THEN 'Within SLA'
        ELSE 'Breached SLA'
    END AS SLA_Status

FROM ba_project_refined;