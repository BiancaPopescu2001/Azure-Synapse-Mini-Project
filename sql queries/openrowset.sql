----------------------
-- CREATE CREDENTIAL
----------------------

CREATE DATABASE SCOPED CREDENTIAL biancacreds
WITH 
    IDENTITY = 'Managed Identity'

------------------------------
-- CREATE EXTERNAL DATA SOURCE
------------------------------

CREATE EXTERNAL DATA SOURCE raw_ext_source
WITH
(
    LOCATION = 'https://synapsedatalakebianca.dfs.core.windows.net/raw',
    CREDENTIAL = biancacreds
)

------------------------------
-- CREATE EXTERNAL FILE FORMAT
------------------------------

CREATE EXTERNAL FILE FORMAT csv_format
WITH
(
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
                        FIELD_TERMINATOR = ''
    )
)


------------------------------
-- OPENROWSET FUNCTION
------------------------------

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

------------------------------
-- CREATE PARQUET FILE FORMAT
------------------------------




CREATE EXTERNAL FILE FORMAT parquet_format
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)
