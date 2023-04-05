-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

  CREATE TABLE planos 
(
  id_plano INT PRIMARY KEY AUTO_INCREMENT,
  plano	VARCHAR(50) NOT NULL,
  valor_plano	DECIMAL(3,2) NOT NULL
);

INSERT INTO planos (plano, valor_plano) VALUES
	('gratuito', 0),
	('familiar', 7.99),
	('universitário', 5.99),
	('pessoal', 6.99);
    
CREATE TABLE artist 
(
  artista_id	INT PRIMARY KEY AUTO_INCREMENT,
  artista	VARCHAR(50) NOT NULL
);

INSERT INTO artist (artista) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE users
(
	  usuario_id	INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario	VARCHAR(50) NOT NULL,
    id_plano INT,
    idade INT NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES planos (id_plano)
);

INSERT INTO users (nomeUsuario, id_plano, idade) VALUES
	('Barbara Liskov', 1, 82),
	('Robert Cecil Martin', 1, 58),
	('Ada Lovelace', 2, 37),
	('Martin Fowler', 2, 46),
	('Sandi Metz', 2, 58),
	('Paulo Freire', 3, 19),
	('Bell Hooks', 3, 26),
	('Christopher Alexander', 4, 85),
	('Judith Butler', 4, 45),
	('Jorge Amado', 4, 58)
;


CREATE TABLE albums
(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    ano_lancamento YEAR NOT NULL,
	  artista_id INT,
    FOREIGN KEY (artista_id) REFERENCES artist (artista_id)
);

INSERT INTO albums (album, ano_lancamento, artista_id) VALUES
('Renaissance', 2022, 1),
('Jazz', 1978, 2),
('Hot Space', 1982, 2),
('Falso Brilhante', 1998, 3),
('Vento de Maio', 2001, 3),
('QVVJFA?', 2003, 4),
('Somewhere Far Beyond', 2007, 5),
('I Put A Spell On You', 2012, 6)
;


CREATE TABLE followers
(
    artista_id INT,
    usuario_id INT,
    
    CONSTRAINT PRIMARY KEY(artista_id, usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artist (artista_id),
    FOREIGN KEY (usuario_id) REFERENCES users (usuario_id)
);

INSERT INTO followers(artista_id, usuario_id) VALUES
(1, 1),
(1, 2),
(1, 6),
(2, 1),
(2, 3),
(2, 10),
(3, 1),
(3, 2),
(3, 9),
(4, 4),
(5, 5),
(6, 5),
(6, 6),
(6, 7);

CREATE TABLE songs
(
  cancoes VARCHAR(70) NOT NULL,
  duracao INT NOT NULL,
  id_cancao INT PRIMARY KEY AUTO_INCREMENT,
  album_id INT,
  
  FOREIGN KEY (album_id) REFERENCES albums (album_id)
);


INSERT INTO songs(cancoes, duracao, album_id) VALUES
("BREAK MY SOUL", 279, 1),
("VIRGO'S GROOVE", 369, 1),
("ALIEN SUPERSTAR", 116, 1),
("Don't Stop Me Now", 203, 2),
("Under Pressure", 152, 3),
("Como Nossos Pais", 105, 4),
("O Medo de Amar é o Medo de Ser Livre", 207, 5),
("Samba em Paris", 267, 6),
("The Bard's Song", 244, 7),
("Feeling Good", 100, 8)
;

CREATE TABLE reproductions
(
    usuario_id INT,
    id_cancao INT,
    data_reproducao DATETIME NOT NULL,
    PRIMARY KEY (usuario_id, id_cancao),
    
    FOREIGN KEY (usuario_id) REFERENCES users (usuario_id),
    FOREIGN KEY (id_cancao) REFERENCES songs (id_cancao)
);

INSERT INTO reproductions(usuario_id, id_cancao, data_reproducao) VALUES
(1, 8, "2022-02-28 10:45:55"),
(1, 2, "2020-05-02 05:30:35"),
(1, 10, "2020-03-06 11:22:33"),
(2, 10, "2022-08-05 08:05:17"),
(2, 7, "2020-01-02 07:40:33"),
(3, 10, "2020-11-13 16:55:13"),
(3, 2, "2020-12-05 18:38:30"),
(4, 8, "2021-08-15 17:10:10"),
(5, 8, "2022-01-09 01:44:33"),
(5, 5, "2020-08-06 15:23:43"),
(6, 7, "2017-01-24 00:31:17"),
(6, 1, "2017-10-12 12:35:20"),
(7, 4, "2011-12-15 22:30:49"),
(8, 4, "2012-03-17 14:56:41"),
(9, 9, "2022-02-24 21:14:22"),
(10, 3, "2015-12-13 08:30:22")
;

