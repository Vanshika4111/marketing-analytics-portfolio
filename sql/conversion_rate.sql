SELECT
  device.category AS device_category,
  COUNTIF(event_name = 'session_start') AS sessions,
  COUNTIF(event_name = 'purchase') AS purchases,
  COUNTIF(event_name = 'purchase') / COUNTIF(event_name = 'session_start') AS conversion_rate
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY device_category
ORDER BY conversion_rate DESC;