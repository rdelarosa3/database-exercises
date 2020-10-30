-- CREATE DB
CREATE database quizes;

-- CREATE TABLE FOR USERS
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    role ENUM('student','admin')NOT NULL DEFAULT 'student' ,
    first_name VARCHAR(50) NOT NULL DEFAULT 'UNKNOWN',
    last_name  VARCHAR(100) NOT NULL DEFAULT 'UNKNOWN',
    email VARCHAR(255) NOT NULL,
    password VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE (email)
);
-- CREATE TABLE FOR QUIZES
DROP TABLE IF EXISTS quizes;
CREATE TABLE quizes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
-- CREATE TABLE FOR QUESTIONS
DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    number INT UNSIGNED NOT NULL,
    quiz_id INT UNSIGNED NOT NULL,
    content VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (quiz_id) REFERENCES quizes(id) ON DELETE CASCADE
);
-- CREATE TABLE FOR ANSWERS
DROP TABLE IF EXISTS answers;
CREATE TABLE answers (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    question_id INT UNSIGNED NOT NULL,
    isCorrect BOOLEAN NOT NULL DEFAULT FALSE,
    content VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);

-- SEED USERS
INSERT INTO users (role,first_name,last_name,email,password)
VALUES (1,'robert','delarosa','rdelarosa3@live.com','12345'),
(1,'fabian','delarosa','rdelarosa39@live.com','123456'),
(2,'juan','delarosa','rdelarosa7@live.com','1234567');

-- SEED QUIZES
INSERT INTO quizes (title)
VALUES ('QuizOne'),('SecondQuiz'),('NumberThree');

-- SEED QUESTIONS
INSERT INTO questions (quiz_id,number,content)
VALUES (1,1,'ASFSF?'),(1,2,'AFJDSFKS?'),(1,3,'ANDHEIOC'),
(2,1,'ASFSF?'),(2,2,'AFJDSFKS?'),(2,3,'ANDHEIOC'),
(3,1,'ASFSF?'),(3,2,'AFJDSFKS?'),(3,3,'ANDHEIOC');


-- SEED ANSWERS FOR EACH QUIZ BASED ON QUESTION NUMBER
INSERT INTO answers (question_id, isCorrect, content)
VALUES
((SELECT id FROM questions WHERE number = 1 and quiz_id = 1),true, 'q1a'),
((SELECT id FROM questions WHERE number = 1 and quiz_id = 1),false,'q1b'),
((SELECT id FROM questions WHERE number = 1 and quiz_id = 1),false,'q1c'),
((SELECT id FROM questions WHERE number = 1 and quiz_id = 1),false,'q1d'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 1),false,'q2a'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 1),false,'q2b'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 1),false,'q2c'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 1),true,'q2d'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 1),false,'q3a'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 1),false,'q3b'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 1),true,'q3c'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 1),false,'q3d'),
((SELECT id FROM questions WHERE number = 1 and quiz_id = 2),true, 'q1a'),
((SELECT id FROM questions WHERE number = 1 and quiz_id = 2),false,'q1b'),
((SELECT id FROM questions WHERE number = 1 and quiz_id = 2),false,'q1c'),
((SELECT id FROM questions WHERE number = 1 and quiz_id = 2),false,'q1d'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 2),false,'q2a'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 2),false,'q2b'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 2),false,'q2c'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 2),true,'q2d'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 2),false,'q3a'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 2),false,'q3b'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 2),true,'q3c'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 2),false,'q3d'),
((SELECT id FROM questions WHERE number = 1 and quiz_id = 3),true, 'q1a'),
((SELECT id FROM questions WHERE number = 1 and quiz_id = 3),false,'q1b'),
((SELECT id FROM questions WHERE number = 1 and quiz_id = 3),false,'q1c'),
((SELECT id FROM questions WHERE number = 1 and quiz_id = 3),false,'q1d'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 3),false,'q2a'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 3),false,'q2b'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 3),false,'q2c'),
((SELECT id FROM questions WHERE number = 2 and quiz_id = 3),true,'q2d'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 3),false,'q3a'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 3),false,'q3b'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 3),true,'q3c'),
((SELECT id FROM questions WHERE number = 3 and quiz_id = 3),false,'q3d');