▪ Pateikite adresus su pašto kodais, miesto pavadinimu bei šalimi.

SELECT 
    address.address AS adresas, 
    address.postal_code AS pasto_kodas, 
    city.city AS miestas, 
    country.country AS salis
FROM 
    address
JOIN 
    city ON address.city_id = city.city_id
JOIN 
    country ON city.country_id = country.country_id;

    
▪ Rasti informaciją apie kiekvienos parduotuvės klientų mokėjimus, rezultatą surikiuojant pagal
apmokėjimų sumas nuo didžiausios iki mažiausios.
    
    SELECT 
    store.store_id AS parduotuves_id, 
    customer.customer_id AS kliento_id, 
    customer.first_name AS kliento_vardas, 
    customer.last_name AS kliento_pavarde, 
    SUM(payment.amount) AS suma
FROM 
    payment
JOIN 
    rental ON payment.rental_id = rental.rental_id
JOIN 
    customer ON rental.customer_id = customer.customer_id
JOIN 
    store ON customer.store_id = store.store_id
GROUP BY 
    store.store_id, customer.customer_id
ORDER BY 
    suma DESC;
    
    
▪ Kiek kiekvienas darbuotojas surinko klientų apmokėjimų (kiekis, suma)?

SELECT 
    staff.staff_id AS darbuotojo_id, 
    staff.first_name AS vardas, 
    staff.last_name AS pavarde, 
    COUNT(payment.payment_id) AS apmokejimu_kiekis, 
    SUM(payment.amount) AS apmokejimu_suma
FROM 
    payment
JOIN 
    staff ON payment.staff_id = staff.staff_id
GROUP BY 
    staff.staff_id
ORDER BY 
    apmokejimu_suma ASC;
    

▪ Parašykite SQL užklausą, kuri pateikia sąrašą su pardavėjo vardu ir pavarde, 
kliento vardu ir pavarde, ir parduotuvės ID, kuriai priklauso ir pardavėjas, ir klientas.

SELECT 
    staff.first_name AS pardavejo_vardas, 
    staff.last_name AS pardavejo_pavarde, 
    customer.first_name AS kliento_vardas, 
    customer.last_name AS kliento_pavarde, 
    staff.store_id AS parduotuves_id
FROM 
    staff
JOIN 
    customer ON staff.store_id = customer.store_id
ORDER BY 
    parduotuves_id;

    
▪ Koks vidutinis filmų ilgis pagal kategorijas?
  
    SELECT 
    category.name AS kategorija, 
    AVG(film.length) AS vidutinis_filmu_ilgis
FROM 
    film
JOIN 
    film_category ON film.film_id = film_category.film_id
JOIN 
    category ON film_category.category_id = category.category_id
GROUP BY 
    category.name
ORDER BY 
    vidutinis_filmu_ilgis DESC;
    
    
▪ Kiek klientė Amy Lopez sumokėjo už filmo Rocky War nuomą?

SELECT 
    customer.first_name AS first_name,
    customer.last_name  AS last_name,
    SUM(payment.amount) AS amount,
    film.title AS title 
FROM 
    payment
JOIN 
    rental ON payment.rental_id = rental.rental_id
JOIN 
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN 
    film ON inventory.film_id = film.film_id
JOIN 
    customer ON rental.customer_id = customer.customer_id
WHERE 
    customer.first_name = 'Amy' 
    AND customer.last_name = 'Lopez' 
    AND film.title = 'Rocky War';


▪ Kada paskutinį kartą ir kiek sumokėjo klientė BETTY WHITE?
    
    SELECT 
    customer.customer_id AS kliento_id,
    CONCAT(customer.first_name, ' ', customer.last_name) AS vardas_pavarde, 
    payment.payment_date AS paskutine_mokejimo_data, 
    payment.amount AS suma
FROM 
    payment
JOIN 
    customer ON payment.customer_id = customer.customer_id
WHERE 
    customer.first_name = 'Betty' 
    AND customer.last_name = 'White'
ORDER BY 
    payment.payment_date DESC
LIMIT 1;
