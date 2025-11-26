------------------------------
-- VIEWS
------------------------------

CREATE VIEW revenue_view
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

SELECT * FROM revenue_view;

SELECT * FROM revenue_ctas;