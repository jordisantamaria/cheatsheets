# Subquerys

- Tiene que estar agrupada de ()
- Tiene que devolver 1 solo valor en where


```
SELECT city_destination, transportation, ticket_price, travel_time
FROM one_way_ticket
WHERE city_destination = (
    SELECT closest_city
    FROM best_10_places
    WHERE activity_type = 'snorkeling'
      AND ranking_position = 1
  )
  AND city_origin = 'Paris'
```
