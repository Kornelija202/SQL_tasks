21 Skaidrės užduotys    
• Išrinkti visus vardus aktorių lentelėje
SELECT first_name
FROM actor;
Rezultatas (200 eilučių)
     
• Kokios yra galimos filmų kategorijos?
SELECT name FROM category;
Rezultatas (16 eilučių)
     
• Kokie filmai yra mūsų duomenų bazėje?
SELECT title FROM film
Rezultatas (1000 eilučių)
     
22 skaidrės užduotys    
• Surūšiuoti visus vardus aktorių lentelėje nuo A iki Ž
SELECT first_name FROM actor
ORDER BY first_name ASC;
Rezultatas (200 eilučių)
     
• Surūšiuoti filmus nuo brangiausio iki pigiausio
SELECT title, rental_rate FROM film
ORDER BY rental_rate DESC;

23 Skaidrės užduotys  
▪ Išrinkti skirtingos trukmės filmus
SELECT DISTINCT length FROM film;

▪ Išrinkti visus nepasikartojančius vardus aktorių lentoje
SELECT DISTINCT first_name FROM actor;

▪ Išrinkti nepasikartojančias nuomos kainas
SELECT DISTINCT rental_rate FROM film;

24 skaidrės užduotys     
▪ Pažymėti filmo title ir description stulpelius ir juos pavadinti filmo pavadinimas, filmo aprašymas
SELECT title AS ‘filmo pavadinimas’, 
description AS ‘filmo aprasymas’ FROM film;

25 skaidrės užduotys
▪ Suskaičiuoti kiek aktorių turime aktorių lentelėje
SELECT COUNT(actor_id) FROM actor;

▪ Suskaičiuoti kiek turime unikalių aktorių vardų ir stulpelį pavadinti Unikalių vardų skaičius
SELECT COUNT(DISTINCT(first_name)) AS `Unikaliu vardu skaicius‘ FROM actor;

26 skaidrės užduotys
▪ Kiek yra kokių vardų aktorių lentoje?
SELECT count(actor_id), first_name
FROM actor
GROUP BY first_name;

1. Išrinkite visus aktorių vardus ir pavardes.
SELECT first_name, last_name FROM actor;

2. Parašykite SQL užklausą, kuri ištrauktų visus stulpelius iš lentelės „actor“ , 
surūšiuotus pagal stulpelį „first_name“ mažėjimo tvarka
SELECT * FROM actor
order by first_name desc;

3. Viename stulpelyje pateikite aktorių vardus ir pavardes
SELECT concat(first_name, " ", last_name) as "actors"
FROM actor;

4. Viename stulpelyje pateikite aktorių vardus ir pavardes mažosiomis raidėmis
ir pavadinkite stulpelį „Aktorių vardai“
SELECT lower(concat(first_name, " ", last_name)) as "Aktorių vardai"
FROM actor;

5. Kurie aktorių vardai pasikartoja dažniausiai ir kiek kartų?
SELECT count(actor_id) as how_many, first_name
FROM actor
GROUP BY first_name
ORDER BY how_many desc;

6. Kiek ilgiausiai trunka filmas, saugomas lentoje film?
SELECT length FROM film
order by length desc;


