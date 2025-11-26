------------------------------
-- CTAS
------------------------------

CREATE EXTERNAL TABLE revenue_ctas
WITH 
(
    LOCATION = 'ctas_revenue',
    DATA_SOURCE = raw_ext_source,
    FILE_FORMAT = parquet_format
)
AS
SELECT 
    * 
FROM 
    OPENROWSET (
        BULK 'revenue',
        DATA_SOURCE = 'raw_ext_source',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS AA
