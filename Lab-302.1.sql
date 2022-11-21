DROP SCHEMA IF EXISTS blog;
CREATE SCHEMA blog;
USE blog;

CREATE TABLE author (
	id INT NOT NULL AUTO_INCREMENT,
    author VARCHAR(60),
    PRIMARY KEY (id)
);

CREATE TABLE post (
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(60) NOT NULL,
    word_count INT,
    views INT,
    author_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES author(id)
);

INSERT INTO author (author) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

INSERT INTO post (title, word_count, views, author_id) VALUES
('Best Paint Colors', 814, 14, 1),
('Small Space Decorating Tips', 1146, 221, 2),
('Hot Accessories', 986, 105, 1),
('Mixing Textures', 765, 22, 1),
('Kitchen Refresh', 1242, 307, 2),
('Homemade Art Hacks', 1002, 193, 1),
('Refinishing Wood Floors', 1571, 7542, 3);

SELECT * FROM post;