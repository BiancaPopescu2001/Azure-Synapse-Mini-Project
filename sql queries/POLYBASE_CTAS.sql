CREATE EXTERNAL TABLE parquet_table 
(
    Dealer_ID VARCHAR(4000),
    Model_ID VARCHAR(4000),
    Branch_ID VARCHAR(4000),
    Date_ID VARCHAR(4000),
    Units_Sold BIGINT,
    Revenue BIGINT
)
WITH
(
    LOCATION = 'ctas_revenue',
    DATA_SOURCE = raw_ext_source_abfss,
    FILE_FORMAT= parquet_format
)

--CTAS (POLYBASE)

CREATE TABLE poly_table
WITH 
(
    DISTRIBUTION = ROUND_ROBIN
)
AS
SELECT * FROM parquet_table

SELECT * FROM poly_table;