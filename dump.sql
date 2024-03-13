CREATE TABLE autori (
    id INT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE generi (
    id INT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE libri (
    id INT PRIMARY KEY,
    titolo VARCHAR(255),
    autore_id INT,
    genere_id INT,
    numero_copie INT,
    FOREIGN KEY (autore_id) REFERENCES autori(id),
    FOREIGN KEY (genere_id) REFERENCES generi(id)
);

CREATE TABLE utenti (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    indirizzo VARCHAR(255),
    data_registrazione DATE
);

CREATE TABLE prestiti (
    id INT PRIMARY KEY,
    libro_id INT,
    utente_id INT,
    data_prestito DATE,
    data_restituzione DATE,
    FOREIGN KEY (libro_id) REFERENCES libri(id),
    FOREIGN KEY (utente_id) REFERENCES utenti(id)
);

-- Inserimento di 8 autori
INSERT INTO autori (id, nome) VALUES 
(1, 'J.K. Rowling'),
(2, 'Stephen King'),
(3, 'George Orwell'),
(4, 'Mark Twain'),
(5, 'Jane Austen'),
(6, 'Leo Tolstoy'),
(7, 'F. Scott Fitzgerald'),
(8, 'John Steinbeck'),
(9, 'John Doe');

-- Inserimento di almeno 4 generi
INSERT INTO generi (id, nome) VALUES 
(1, 'Fantasy'),
(2, 'Horror'),
(3, 'Sci-Fi'),
(4, 'Drama');

-- Inserimento di 20 libri
INSERT INTO libri (id, titolo, autore_id, genere_id, numero_copie) VALUES 
(1, 'Harry Potter and the Philosopher''s Stone', 1, 1, 10),
(2, 'Harry Potter and the Chamber of Secrets', 1, 1, 5),
(3, 'Harry Potter and the Prisoner of Azkaban', 1, 1, 8),
(4, 'Harry Potter and the Goblet of Fire', 1, 1, 12),
(5, 'Harry Potter and the Order of Phoenix', 1, 1, 15),
(6, 'Harry Potter and the Half-Blood Prince', 1, 1, 10),
(7, 'Harry Potter and the Deathly Hallows', 1, 1, 20),
(8, 'The Shining', 2, 2, 5),
(9, 'Carrie', 2, 2, 8),
(10, '1984', 3, 3, 15),
(11, 'Animal Farm', 3, 3, 12),
(12, 'The Adventures of Tom Sawyer', 4, 4, 5),
(13, 'The Adventures of Huckleberry Finn', 4, 4, 10),
(14, 'Pride and Prejudice', 5, 4, 20),
(15, 'Sense and Sensibility', 5, 4, 15),
(16, 'War and Peace', 6, 4, 20),
(17, 'Anna Karenina', 6, 4, 10),
(18, 'The Great Gatsby', 7, 4, 8),
(19, 'Of Mice and Men', 8, 4, 12),
(20, 'The Grapes of Wrath', 8, 4, 15);

-- Inserimento di almeno 3 utenti
INSERT INTO utenti (id, nome, indirizzo, data_registrazione) VALUES 
(1, 'John Doe', '1234 Main St', '2021-01-01'),
(2, 'Jane Smith', '5678 Park Ave', '2021-02-01'),
(3, 'Bob Johnson', '9101 Elm St', '2021-03-01');

-- Inserimento di almeno 10 prestiti
INSERT INTO prestiti (id, libro_id, utente_id, data_prestito, data_restituzione) VALUES 
(1, 1, 1, '2021-04-01', '2021-05-15'),
(2, 2, 1, '2021-04-16', '2021-06-25'),
(3, 3, 2, '2021-05-01', '2021-05-15'),
(4, 1, 2, '2021-05-10', '2021-05-31'),
(5, 1, 3, '2021-06-01', '2021-06-15'),
(6, 3, 3, '2021-06-16', '2021-07-25'),
(7, 3, 1, '2021-07-01', '2021-07-15'),
(8, 3, 1, '2021-07-16', '2021-07-31'),
(9, 4, 2, '2021-08-01', '2021-08-15'),
(10, 5, 3, '2021-06-01', '2021-06-15'),
(11, 6, 3, '2021-06-16', '2021-06-25'),
(12, 7, 1, '2022-07-01', '2022-07-15'),
(13, 8, 1, '2022-07-16', '2022-07-31'),
(14, 9, 2, '2022-08-01', '2022-08-15'),
(15, 10, 1, '2022-04-12', '2022-04-25'),
(16, 11, 2, '2022-05-01', '2022-05-15'),
(17, 12, 2, '2022-05-10', '2022-05-31'),
(18, 13, 3, '2022-06-01', '2022-06-15'),
(19, 14, 3, '2022-06-14', '2022-06-25'),
(20, 15, 1, '2022-07-01', '2022-07-15'),
(21, 16, 1, '2022-07-18', '2022-07-31'),
(22, 17, 2, '2021-08-01', '2021-08-15'),
(23, 18, 2, '2021-08-17', '2021-08-31'),
(24, 18, 3, '2022-08-16', '2022-08-31');
