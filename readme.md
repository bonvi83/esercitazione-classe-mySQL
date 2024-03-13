## Esercitazione di classe su db

1. Selezionare tutti i libri in ordine alfabetico per titolo

```
SELECT libri.titolo
FROM `libri`
ORDER BY titolo ASC;
```

2. Selezionare tutti gli autori che hanno scritto almeno un libro

```
SELECT DISTINCT nome
FROM `autori`
INNER JOIN libri ON libri.autore_id = autori.id;
```

3. Selezionare tutti i libri scritti da un determinato autore

```
SELECT libri.titolo,
autori.nome
FROM `libri`
INNER JOIN autori ON autori.id = libri.autore_id
WHERE autore_id = 1;
```

4. Selezionare tutti i prestiti effettuati da un determinato utente

```
SELECT *
FROM `prestiti`
WHERE utente_id = 1;
```

5. Contare le copie disponibili per ogni genere

```
SELECT SUM(libri.numero_copie),
generi.nome
FROM `libri`
INNER JOIN generi ON generi.id = libri.genere_id
GROUP BY generi.id;
```

6. Selezionare tutti i prestiti restituiti entro una data specifica

```
SELECT *
FROM `prestiti`
WHERE data_restituzione <= "2021-12-31";
```

7. Selezionare i libri più popolari (quelli prestati più volte)

```
SELECT COUNT(prestiti.libro_id) AS numero_prestiti,
libri.titolo
FROM `prestiti`
INNER JOIN libri ON libri.id = prestiti.libro_id
GROUP BY prestiti.libro_id
ORDER BY numero_prestiti DESC;
```

8. Seleziona il titolo, il nome, il genere, autore e gli utenti che lo hanno preso in prestito un libro nel 2022

```
SELECT libri.titolo AS libro,
autori.nome AS autore,
generi.nome AS genere,
utenti.nome AS utente,
prestiti.data_prestito AS data
FROM `libri`
INNER JOIN autori ON autori.id = libri.autore_id
INNER JOIN generi ON generi.id = libri.genere_id
INNER JOIN prestiti ON prestiti.libro_id = libri.id
INNER JOIN utenti ON utenti.id = prestiti.utente_id
WHERE YEAR(prestiti.data_prestito) = 2022;
```

9. Seleziona il titolo del libro e nome dell utente con durata del prestito maggiore di 20 giorni

```
SELECT libri.titolo AS titolo,
utenti.nome AS utente,
DATEDIFF(prestiti.data_restituzione, prestiti.data_prestito) AS durata_prestito,
prestiti.data_prestito, prestiti.data_restituzione
FROM `libri`
INNER JOIN prestiti ON prestiti.libro_id = libri.id
INNER JOIN utenti ON utenti.id = prestiti.utente_id
HAVING durata_prestito > 20;
```

10. dal punto precedente, calcolo la durata media del prestito

```
SELECT libri.titolo AS titolo,
utenti.nome AS utente,
AVG (DATEDIFF(prestiti.data_restituzione, prestiti.data_prestito)) AS media_durata_prestito
FROM `libri`
INNER JOIN prestiti ON prestiti.libro_id = libri.id
INNER JOIN utenti ON utenti.id = prestiti.utente_id
GROUP BY libri.titolo, utenti.nome
ORDER BY media_durata_prestito DESC;
```

11. Selezionare tutti gli utenti che hanno preso in prestito almeno un libro di un determinato genere

```
SELECT utenti.nome AS utente,
libri.genere_id AS genere
FROM `utenti`
INNER JOIN prestiti ON prestiti.utente_id = utenti.id
INNER JOIN libri ON libri.id = prestiti.libro_id;
```
