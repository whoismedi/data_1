1) convert.rb converts ruby hash type file into proper json. output.json is the converted file
2) injest.py injests data from the json file into database in postgresql
3) in order to run the code set .env file and install requirements
4) psql query:
CREATE TABLE books_summary AS
SELECT
    year AS publication_year,
    COUNT(*) AS book_count,
    ROUND(
        AVG(
            CASE
                WHEN price LIKE '€%' THEN REPLACE(price, '€', '')::NUMERIC * 1.2
                WHEN price LIKE '$%' THEN REPLACE(price, '$', '')::NUMERIC
            END
        ),
    2) AS average_price_usd
FROM books_raw
GROUP BY year
ORDER BY year;
