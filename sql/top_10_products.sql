SELECT
  item.item_name AS product_name,
  SUM(item.quantity) AS total_units,
  SUM(item.quantity * item.price_in_usd) AS revenue_usd
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
UNNEST(items) AS item
WHERE event_name = 'purchase'
GROUP BY product_name
ORDER BY revenue_usd DESC
LIMIT 10;
