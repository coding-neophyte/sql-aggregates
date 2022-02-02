-- rank of film category by times rented
-- include the name, count, and rank
SELECT
  category.name,
  COUNT(rental.rental_date),
  RANK() OVER (ORDER BY COUNT(rental.rental_date) DESC)
FROM
  category
INNER JOIN
  film_category
ON
  category.category_id = film_category.category_id
INNER JOIN
  film
ON
  film_category.film_id = film.film_id
INNER JOIN
  inventory
ON
  film.film_id = inventory.film_id
INNER JOIN
  rental
ON
  rental.inventory_id = inventory.inventory_id
GROUP BY
  category.name
ORDER BY
  RANK ASC
