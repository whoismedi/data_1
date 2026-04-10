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