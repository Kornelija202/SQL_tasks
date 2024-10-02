▪ Suraskite filmų nuomos laikotarpius: paėmimo ir
grąžinimo datas kliento, kurio pavardė yra LEE. (rental ir
customer lentelės).

SELECT 
    customer.first_name AS vardas, 
    customer.last_name AS pavarde, 
    rental.rental_date AS paemimo_data, 
    rental.return_date AS grazinimo_data
FROM 
    rental
JOIN 
    customer ON rental.customer_id = customer.customer_id
WHERE 
    customer.last_name = 'Lee'
ORDER BY 
    rental.rental_date;
    
    
▪ Kiek mažiausiai ir kiek daugiausiai už filmo nuomą yra
sumokėjusi klientė Sarah Lewis? Naudokite lenteles
“payment”, “customer”.

SELECT 
    customer.first_name AS vardas,
    customer.last_name  AS pavardė,
    MIN(payment.amount) AS maziausias_mokejimas, 
    MAX(payment.amount) AS didziausias_mokejimas
FROM 
    payment
JOIN 
    customer ON payment.customer_id = customer.customer_id
WHERE 
    customer.first_name = 'Sarah' 
    AND customer.last_name = 'Lewis';

    
▪ Kiek nuomos užsakymų įvykdė darbuotojas Mike Hillyer
per 2005 metų liepos mėnesį?

SELECT
	staff.first_name AS vardas,
    staff.last_name AS pavardė,
    COUNT(rental.rental_id) AS uzsakymu_kiekis
FROM 
    rental
JOIN 
    staff ON rental.staff_id = staff.staff_id
WHERE 
    staff.first_name = 'Mike' 
    AND staff.last_name = 'Hillyer'
    AND rental.rental_date BETWEEN '2005-07-01' AND '2005-07-31';

    
▪ Parašyti užklausą, kuri grąžina apmokėjimo id, datą ir sumas, 
kurios yra mažesnės nei apmokėjimo sumų vidurkis.

SELECT 
    payment.payment_id AS apmokejimo_id, 
    payment.payment_date AS apmokejimo_data, 
    payment.amount AS suma
FROM 
    payment
WHERE 
    payment.amount < (SELECT AVG(amount) FROM payment);
    
    
▪ Kiek yra filmų, kurių pakeitimo kaina lygi minimaliai pakeitimo kainai?

SELECT 
    COUNT(film.film_id) AS filmu_kiekis
FROM 
    film
WHERE 
    film.replacement_cost = (SELECT MIN(replacement_cost) FROM film);
    
    
Parašykite SQL užklausą, pateikiančią klientų id, sumokamą mokestį už nuomą. 
Tuos klientus, kurie sumoka už nuomą vienu kartu virš 10, pažymėkite kaip
„Virš 10“, o išleidžiančius iki 10, pažymėkite „Iki 10“. 
Surūšiuokite pagal nuomos mokestį mažėjimo tvarka.

SELECT 
    customer.customer_id AS kliento_id, 
    payment.amount AS nuomos_mokestis, 
    CASE 
        WHEN payment.amount > 10 THEN 'Virš 10'
        ELSE 'Iki 10'
    END AS mokescio_kategorija
FROM 
    payment
JOIN 
    customer ON payment.customer_id = customer.customer_id
ORDER BY 
    payment.amount DESC;

    
1. Kurioje įmokos stulpelio pozicijoje yra taškas? Rezultatą surūšiuokite
pagal įmokas mažėjimo tvarka. Naudokite lentelę „payment“.

SELECT 
    payment.payment_id AS mokejimo_id,
    payment.amount AS imoka, 
    LOCATE('.', payment.amount) AS tasko_pozicija
FROM 
    payment
ORDER BY 
    payment.amount DESC;
    
2. Iš kiek simbolių susideda filmo „Alone Trip“ pavadinimas? 
Naudokite lentelę „film“.

SELECT 
    CHAR_LENGTH(film.title) AS simboliu_kiekis
FROM 
    film
WHERE 
    film.title = 'Alone Trip';

    
3. Kokio filmo aprašymas turi daugiausia žodžių?

SELECT 
    film.title AS filmo_pavadinimas, 
    film.description AS filmo_aprasymas,
    (LENGTH(film.description) - LENGTH(REPLACE(film.description, ' ', '')) + 1) AS zodziu_kiekis
FROM 
    film
ORDER BY 
    zodziu_kiekis DESC
LIMIT 1;


4. Kokio filmo aprašymas ilgiausias?

SELECT 
    film.title AS filmo_pavadinimas, 
    film.description AS filmo_aprasymas,
    LENGTH(film.description) AS aprasymo_ilgis
FROM 
    film
ORDER BY 
    aprasymo_ilgis DESC
LIMIT 1;


5. Pateikite filmus ir jų išleidimo metus viename stulpelyje, pavadinimu Filmai

SELECT 
    CONCAT(film.title, ' (', film.release_year, ')') AS Filmai
FROM 
    film;
