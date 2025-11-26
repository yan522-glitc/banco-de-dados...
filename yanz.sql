CREATE TABLE hospede (
	nome VARCHAR (25) NOT NULL,
	genero VARCHAR (1),
	biotipo VARCHAR (1),
	altura NUMERIC (5,2), 
	PRIMARY KEY (nome)
)
CREATE TABLE quarto (
	nome VARCHAR (25) NOT NULL,
	quarto INT NOT NULL,
	chegada DATE NOT NULL,
	saida DATE NOT NULL,
	desconto NUMERIC (5,2),
	PRIMARY KEY (nome, quarto)
)

SELECT * FROM hospede;

INSERT INTO hospede (nome, genero, biotipo, altura)
VALUES 
('MIGUEL', 'M', 'M', 1.67),
('JOSIEL', 'M', 'M', 1.72),
('RAQUEL', 'F', 'G', 1.65),
('LUCIANA', 'F', 'G', 1.80),
('JOANA', 'F', 'M', 1.65),
('EMANUEL', 'M', 'M', 1.78);

INSERT INTO quarto (nome, quarto, chegada, saida, desconto)
VALUES
('MIGUEL', '4', '01-01-2010', '08-01-2010', 0.20),
('JOSIEL', '2', '01-01-2010', '15-01-2010', 0.10),
('RAQUEL', '1', '01-01-2010', '15-01-2010', 0.00),
('LUCIANA', '3', '01-01-2010', '08-01-2010', 0.10),
('JOANA', '5', '01-01-2010', '15-01-2010', 0.00),
('EMANUEL', '6', '01-01-2010', '15-01-2010', 0.12),
('MIGUEL', '3', '09-01-2010', '15-01-2010', 0.00),
('LUCIANA', '4', '09-01-2010', '15-01-2010', 0.00);

TRUNCATE TABLE hospede;
SELECT * FROM quarto;
SELECT * FROM hospede;
DROP TABLE quarto;

ALTER TABLE quarto ADD CONSTRAINT Quarto FOREIGN KEY (nome) 
REFERENCES hospede (nome)
ON UPDATE CASCADE 
ON DELETE CASCADE

UPDATE hospede SET biotipo = 2 WHERE nome = 'MIGUEL'

DELETE FROM hospede = WHERE 'MIGUEL'

SELECT * FROM hospede 
SELECT DISTINCT nome FROM hospede 

SELECT nome, genero FROM hospede ORDER BY nome ASC;
SELECT nome, genero FROM hospede ORDER BY nome DESC;

SELECT nome, desconto + 0.05 novo_desconto  FROM quarto WHERE desconto IS NOT NULL

SELECT nome, saida - chegada tempo FROM quarto

SELECT AVG(desconto), MAX(desconto), MIN(desconto) FROM quarto
SELECT MIN(desconto) * AVG(desconto) FROM quarto
SELECT MIN(desconto), MAX(desconto) FROM quarto

SELECT SUM(desconto) FROM quarto WHERE nome = 'MIGUEL'

SELECT AVG(desconto) FROM quarto
SELECT COUNT(*) FROM quarto WHERE desconto > 0.10

SELECT  FROM quarto GROUP BY quarto
SELECT SUM(quarto) FROM quarto WHERE chegada > '2010-01-01' GROUP BY quarto

CREATE TABLE peso ( 
 nome VARCHAR(25) NOT NULL,
 quando DATE,
 peso DECIMAL(4,1),
 PRIMARY KEY (nome,quando))

INSERT INTO peso (nome, quando, peso)
VALUES 
('MIGUEL','01-01-2010',66.4),
('MIGUEL', '02-01-2010',66.2),
('RAQUEL', '01-01-2010',86.5),
('RAQUEL', '02-01-2010',86.1),
('RAQUEL', '03-01-2010',85.8),
('JOANA', '01-01-2010',66.7),
('JOANA', '02-01-2010',66.5),
('LUCIANA', '01-01-2010',67.5);

SELECT * FROM peso;

SELECT nome, MAX(peso) - MIN(peso) diferenca FROM peso
GROUP BY nome
HAVING MAX(peso) - MIN(peso) > 0.0

SELECT nome, COUNT (nome) FROM peso GROUP BY nome HAVING COUNT (nome) > 2

SELECT DISTINCT nome FROM quarto ORDER BY nome DESC

SELECT nome FROM hospede WHERE biotipo = 'M' AND genero = 'M'

SELECT nome FROM hospede WHERE biotipo = 'M' OR geNero = 'M'

SELECT nome FROM hospede WHERE NOT (genero = 'M')

SELECT h.nome, q.quarto FROM hospede h 
      INNER JOIN quarto q ON h.nome = q.nome
SELECT h.nome, q.quarto FROM hospede h 
      LEFT JOIN quarto q ON h.nome = q.nome
SELECT h.nome, q.quarto FROM hospede h 
      RIGHT JOIN quarto q ON h.nome = q.nome

SELECT * FROM quarto WHERE desconto = 0.10
SELECT nome, quarto FROM quarto WHERE desconto BETWEEN 2.10 AND 0.20
SELECT nome, quarto  FROM quarto WHERE desconto IS NULL