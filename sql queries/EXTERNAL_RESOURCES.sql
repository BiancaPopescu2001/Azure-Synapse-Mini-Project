----------------------
-- CREATE CREDENTIAL
----------------------

CREATE DATABASE SCOPED CREDENTIAL biancacreds
WITH 
    IDENTITY = 'Managed Identity'

------------------------------
-- CREATE EXTERNAL DATA SOURCE
------------------------------

CREATE EXTERNAL DATA SOURCE raw_ext_source_abfss
WITH
(
    LOCATION = 'abfss://raw@synapsedatalakebianca.dfs.core.windows.net',
    CREDENTIAL = biancacreds
)


------------------------------
-- CREATE PARQUET FILE FORMAT
------------------------------

CREATE EXTERNAL FILE FORMAT parquet_format
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)
