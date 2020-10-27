USE codeup_test_db;
SELECT 'The Name of albums by Pink Floyd' AS '';
SELECT * FROM albums WHERE artist = 'Pink Floyd';
SELECT 'Albums Released before 1989' AS '';
SELECT * FROM albums WHERE release_date <= 1980;
SELECT 'Albums with less than 20 Million' AS '';
SELECT * FROM albums WHERE sales <= 10000000;
SELECT 'Albums with Gengre is Rock' AS '';
SELECT * FROM albums WHERE genre = 'rock';
