SELECT * FROM actor;

SELECT `sakila`.`actor`.`actor_id`,
     `actor`.`first_name`,
     `actor`.`last_name`,
     `actor`.`last_update`
 FROM `sakila`.`actor`;
 
 select `actor_id`, `first_name` from `actor`;
 
select * from actor where first_name = "adam" and last_name = 'hopper';

select * from actor where first_name = "jonas" or last_name = 'hopper';

select distinct last_name from actor;

select first_name as "Vardas" , last_name as "Pavardė" from actor;

select * from actor order by first_name asc;

select first_name, group_concat(last_name) as concatenated_last_names, count(*) as how_many
from actor
group by first_name
order by how_many desc;

select count(*) from actor;

select first_name, last_name, count(*)
from actor
group by first_name, last_name
having  count(*) > 1;

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
SELECT title AS ‘filmo pavadinimas’, description AS ‘filmo aprasymas’ FROM film;
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

