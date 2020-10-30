-- CREATE DATABASE
DROP DATABASE IF EXISTS ADLISTER;
CREATE DATABSE IF NOT EXISTS ADLISTER;

-- CREATE TABLES
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    role ENUM('guest','member','admin')NOT NULL DEFAULT 'guest'
    first_name VARCHAR(50) NOT NULL DEFAULT 'UNKNOWN',
    last_name  VARCHAR(100) NOT NULL DEFAULT 'UNKNOWN',
    email VARCHAR(255) NOT NULL,
    password VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE (email)
);

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS ads;
CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS ad_categories;
CREATE TABLE ad_categories (
    ad_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads(id),
    FOREIGN KEY (category_id)REFERENCES categories(id)
);


--  SEED DATABASE
INSERT INTO users (role,first_name,last_name,email,password)
VALUES (1,'robert','delarosa','rdelarosa3@live.com','12345'),
(2,'fabian','delarosa','rdelarosa39@live.com','123456'),
(3,'juan','delarosa','rdelarosa7@live.com','1234567');

INSERT INTO categories (category_name)
VALUES ('For Sale'),('Free'),('Jobs'),('Dating');

INSERT INTO ads (title,description,user_id)
VALUES ('title1','lorem ipsum somthing',1),
('title2','lorem ipsum somthing',2),
('title3','lorem ipsum somthing',3),
('title4','lorem ipsum somthing',1),
('title5','lorem ipsum somthing',2),
('title6','lorem ipsum somthing',3);
INSERT INTO ad_categories (ad_id,category_id)
VALUES (1,4),(2,3),(3,2),(4,1),(5,2),(6,3);

-- QUERY DATABASE

-- For a given ad, what is the email address of the user that created it?
select title, email
from users as u
join ads as a
on a.user_id = u.id
where a.id = 1;

-- For a given ad, what category, or categories, does it belong to?
select title, category_name
from ads as a
join ad_categories as ac
on ac.ad_id = a.id
join categories as c
on ac.category_id = c.id
where a.id = 2;

-- For a given category, show all the ads that are in that category.
select category_name, title
from ads as a
join ad_categories as ac
on ac.ad_id = a.id
join categories as c
on ac.category_id = c.id
where c.category_name = 'Dating';

-- For a given user, show all the ads they have posted.
select first_name, title
from users as u
join ads as a
on a.user_id = u.id
where u.email = 'rdelarosa3@live.com';

select first_name, title, category_name
from users as u
join ads as a
on a.user_id = u.id
join ad_categories as ac
on ac.ad_id = a.id
join categories as c
on ac.category_id = c.id
where u.id = 2