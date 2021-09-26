-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.18 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.6037
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for diplwmatiki
DROP DATABASE IF EXISTS `diplwmatiki`;
CREATE DATABASE IF NOT EXISTS `diplwmatiki` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `diplwmatiki`;

-- Dumping structure for table diplwmatiki.actors
DROP TABLE IF EXISTS `actors`;
CREATE TABLE IF NOT EXISTS `actors` (
  `idactor` int(12) NOT NULL,
  `name` varchar(22) COLLATE utf8_bin NOT NULL,
  `surname` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `isPlayed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idactor`),
  KEY `idactor` (`idactor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.actors: ~8 rows (approximately)
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
REPLACE INTO `actors` (`idactor`, `name`, `surname`, `birthDate`, `isPlayed`) VALUES
	(1, 'Name1', 'Surname1', '2000-02-02 00:00:00', 1),
	(2, 'Name2', 'Surname2', '1999-03-03 00:00:00', 0),
	(3, 'Name3', 'Surname3', '1999-02-02 00:00:00', 1),
	(4, 'Name4', 'Surname4', NULL, 0),
	(5, 'Name5', 'Surname5', '2010-02-02 00:00:00', 1),
	(6, 'Name6', 'Surname6', '1994-02-02 00:00:00', NULL),
	(7, 'Name7', 'Surname7', '1956-02-02 00:00:00', 0),
	(8, 'Name8', 'Surname8', '1999-02-02 00:00:00', 0),
	(9, 'Name9', 'Surname9', NULL, 0),
	(10, 'Name10', 'Surname10', '2000-02-02 00:00:00', 1);
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.excersice_tables
DROP TABLE IF EXISTS `excersice_tables`;
CREATE TABLE IF NOT EXISTS `excersice_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.excersice_tables: ~4 rows (approximately)
/*!40000 ALTER TABLE `excersice_tables` DISABLE KEYS */;
REPLACE INTO `excersice_tables` (`id`, `table_name`) VALUES
	(249, 'actors'),
	(250, 'movies'),
	(277, 'users'),
	(278, 'notes');
/*!40000 ALTER TABLE `excersice_tables` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.fill_fields_questions
DROP TABLE IF EXISTS `fill_fields_questions`;
CREATE TABLE IF NOT EXISTS `fill_fields_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fill_field_question` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `hideWord` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.fill_fields_questions: ~31 rows (approximately)
/*!40000 ALTER TABLE `fill_fields_questions` DISABLE KEYS */;
REPLACE INTO `fill_fields_questions` (`id`, `question`, `fill_field_question`, `hideWord`) VALUES
	(1, 'Εισάγετε τη δήλωση που λείπει για να λάβετε όλες τις στήλες από τον πίνακα Customers.', 'SELECT * FROM Customers', 'SELECT,*'),
	(2, 'Γράψτε μια δήλωση που θα επιλέξει τη στήλη City από τον πίνακα Customers.', 'SELECT City FROM Customers', 'SELECT,City,FROM'),
	(15, 'Επιλέξτε όλες τις διαφορετικές τιμές από τη στήλη Country στον πίνακα Customers.', 'SELECT DISTINCT Country FROM Customers;', 'SELECT,DISTINCT'),
	(16, 'Επιλέξτε όλες τις εγγραφές όπου η στήλη City έχει την τιμή \'Berlin\'.', 'SELECT * FROM Customers WHERE City = \'Berlin\'', 'WHERE,City,\'Berlin\''),
	(17, 'Χρησιμοποιήστε τη λέξη-κλειδί NOT για να επιλέξετε όλες τις εγγραφές όπου η στήλη City ΔΕΝ είναι \'Berlin\'.', 'SELECT * FROM Customers WHERE NOT City =  \'Berlin\'', 'WHERE,NOT,City,\'Berlin\''),
	(18, 'Επιλέξτε όλες τις εγγραφές όπου η στήλη CustomerID έχει την τιμή 32.', 'SELECT * FROM Customers WHERE CustomerID = 32', 'WHERE,=,32'),
	(19, 'Επιλέξτε όλες τις εγγραφές από τον πίνακα Customers, ταξινομήστε το αποτέλεσμα που αντιστρέφεται αλφαβητικά από τη στήλη City.', 'SELECT * FROM Customers ORDER BY City DESC', 'ORDER,BY,City,DESC'),
	(20, 'Εισάγετε μια νέα εγγραφή στον πίνακα Customers.', 'INSERT INTO Customers (CustomerName ) VALUES (\'Hekkan Burger\')', 'INSERT,INTO,(,),VALUES,(,)'),
	(21, 'Επιλέξτε όλες τις εγγραφές από τους Customers όπου η στήλη PostalCode ΔΕΝ είναι κενή', 'SELECT * FROM Customers WHERE PostalCode IS NOT NULL', 'PostalCode,IS,NOT,NULL'),
	(22, 'Ορίστε την τιμή των στηλών City σε \'Oslo\', αλλά μόνο εκείνες όπου η στήλη Country έχει την τιμή "Norway".', 'UPDATE Customers SET City = \'Oslo\' WHERE Country=\'Norway\';', 'UPDATE,SET,WHERE'),
	(23, 'Διαγράψτε όλες τις εγγραφές από τον πίνακα Customers.', 'DELETE FROM Customers', 'DELETE,FROM'),
	(24, 'Χρησιμοποιήστε μια συνάρτηση SQL για να επιλέξετε την εγγραφή με την υψηλότερη Price της στήλης Products.', 'SELECT MAX(Price) FROM Products;', 'MAX,(Price)'),
	(25, 'Χρησιμοποιήστε τη συνάρτηση MIN για να επιλέξετε την εγγραφή με τη μικρότερη Price στη στήλη Products.', 'SELECT MIN(Price) FROM Products;', 'MIN,(Price)'),
	(26, 'Χρησιμοποιήστε μια συνάρτηση SQL για να υπολογίσετε το άθροισμα όλων των τιμών της στήλης Price στον πίνακα Products.', 'SELECT SUM(Price) FROM Products;', 'SUM,(Price)'),
	(27, 'Επιλέξτε όλες τις εγγραφές όπου η τιμή της στήλης City τελειώνει με το γράμμα "a".', 'SELECT * FROM Customers WHERE City LIKE \'%a\'', 'WHERE,City,LIKE,\'%a\''),
	(28, 'Επιλέξτε όλες τις εγγραφές όπου η τιμή της στήλης City ξεκινά με το γράμμα "a" και τελειώνει με το γράμμα "b".', 'SELECT * FROM Customers WHERE City LIKE \'a%b\'', 'WHERE,City,LIKE ,\'a%b\''),
	(29, 'Επιλέξτε όλες τις εγγραφές όπου το πρώτο γράμμα της πόλης είναι "a" ή "c" ή "s".', 'SELECT * FROM Customers WHERE City LIKE \'[acs]%\'', '[acs]'),
	(30, 'Επιλέξτε όλες τις εγγραφές όπου το πρώτο γράμμα της στήλης City ξεκινά με οτιδήποτε από "a" έως "f".', 'SELECT * FROM Customers WHERE City LIKE \'[a-f]%\'', '[a-f]'),
	(31, 'Χρησιμοποιήστε τον τελεστή IN για να επιλέξετε όλες τις εγγραφές όπου η στήλη Country ΔΕΝ είναι "Norway" και ΔΕΝ "France".', 'SELECT * FROM Customers WHERE Country NOT IN (\'Norway\', \'France\');', 'WHERE,Country,NOT,IN'),
	(32, 'Χρησιμοποιήστε τον τελεστή IN για να επιλέξετε όλες τις εγγραφές όπου η στήλη Country είναι είτε "Norway" είτε "France".', 'SELECT * FROM Customers WHERE Country IN (\'Norway\', \'France\' )', 'WHERE,Country,IN'),
	(33, 'Χρησιμοποιήστε τον τελεστή BETWEEN για να επιλέξετε όλες τις εγγραφές όπου η τιμή της στήλης Price είναι μεταξύ 10 και 20.', 'SELECT * FROM Products WHERE Price BETWEEN 10 AND 20', 'BETWEEN,10,AND,20'),
	(34, 'Χρησιμοποιήστε τον χειριστή BETWEEN για να επιλέξετε όλες τις εγγραφές όπου η τιμή της στήλης Price ΔΕΝ είναι μεταξύ 10 και 20.', 'SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20', 'NOT,BETWEEN'),
	(35, 'Κατά την εμφάνιση του πίνακα Customers, δημιουργήστε ένα ALIAS της στήλης PostalCode, η στήλη θα πρέπει να ονομάζεται Pno.', 'SELECT CustomerName,Address,PostalCode AS Pno FROM Customers;', 'AS,Pno'),
	(36, 'Εισάγετε τα μέρη που λείπουν στον όρο JOIN για να ενώσετε τους δύο πίνακες Orders και Customers, χρησιμοποιώντας το πεδίο CustomerID και στους δύο πίνακες ως σχέση μεταξύ των δύο πινάκων.', 'SELECT * FROM Orders LEFT JOIN Customers ON Orders.CustomerID=Customers.CustomerID', 'ON,Orders.CustomerID,Customers.CustomerID'),
	(37, 'Επιλέξτε τη σωστή ρήτρα JOIN για να επιλέξετε όλες τις εγγραφές από τους δύο πίνακες όπου υπάρχει αντιστοιχία και στους δύο πίνακες.', 'SELECT * FROM Orders INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;', 'INNER,JOIN,Customers'),
	(38, 'Επιλέξτε τη σωστή ρήτρα JOIN για να επιλέξετε όλες τις εγγραφές από τον πίνακα Customers συν όλους τους αγώνες στον πίνακα Orders.', 'SELECT * FROM Orders RIGHT JOIN Customers ON Orders.CustomerID=Customers.CustomerID;', 'RIGHT,JOIN,Customers'),
	(39, 'Αναφέρετε τον αριθμό των Customers σε κάθε Country.', 'SELECT COUNT (CustomerID),Country FROM Customers GROUP BY Country', 'COUNT,GROUP,BY,Country'),
	(40, 'Αναφέρετε πρώτα τον αριθμό των Customers σε κάθε Country, εμφανίζοντας πάνω-πάνω τους περισσότερους Customers.', 'SELECT COUNT (CustomerID),Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC', 'COUNT,GROUP BY,ORDER BY,DESC'),
	(43, 'Εμφάνισε όλα τα δεδομένα του πίνακα Scores', 'SELECT * FROM Scores', 'SELECT,*'),
	(44, 'Διαγράψτε από τον πίνακα users όσες εγγραφές έχουν id μεγαλύτερο του 5', 'DELETE FROM users WHERE id>5', 'DELETE,FROM,>'),
	(57, 'Εισαγωγή στον πίνακα TABLE1 στην στήλη column1 την τιμή \'motsios\'', 'INSERT INTO TABLE1 (column1) VALUES (\'motsios\')	', 'INSERT,TABLE1');
/*!40000 ALTER TABLE `fill_fields_questions` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.movies
DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `idmovie` int(12) NOT NULL,
  `title` varchar(22) COLLATE utf8_bin NOT NULL,
  `releasedDate` datetime DEFAULT NULL,
  `idActor` int(12) DEFAULT NULL,
  PRIMARY KEY (`idmovie`),
  KEY `idActor` (`idActor`),
  CONSTRAINT `idActor` FOREIGN KEY (`idActor`) REFERENCES `actors` (`idactor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.movies: ~6 rows (approximately)
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
REPLACE INTO `movies` (`idmovie`, `title`, `releasedDate`, `idActor`) VALUES
	(1, 'Title1', '1999-02-02 00:00:00', 3),
	(2, 'Title2', '1999-02-01 00:00:00', 5),
	(3, 'Title3', '1999-02-02 00:00:00', NULL),
	(4, 'Title4', '1999-02-01 00:00:00', 5),
	(5, 'Title5', NULL, 7),
	(6, 'Title6', '2000-01-02 00:00:00', 6),
	(7, 'Title7', '1999-02-02 00:00:00', 2),
	(8, 'Title8', NULL, 5);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.notes
DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `idnote` int(12) NOT NULL,
  `title` varchar(22) COLLATE utf8_bin NOT NULL,
  `description` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  `useriId` int(12) DEFAULT NULL,
  PRIMARY KEY (`idnote`),
  KEY `useriId` (`useriId`),
  CONSTRAINT `useriId` FOREIGN KEY (`useriId`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.notes: ~4 rows (approximately)
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
REPLACE INTO `notes` (`idnote`, `title`, `description`, `useriId`) VALUES
	(1, 'title1', 'desc1', 1),
	(2, 'title2', 'desc2', 2),
	(3, 'title3', 'desc3', 1),
	(4, 'title4', 'desc4', 1);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.score_table
DROP TABLE IF EXISTS `score_table`;
CREATE TABLE IF NOT EXISTS `score_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `time` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `category` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `difficulty` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id_idx` (`student_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.score_table: ~20 rows (approximately)
/*!40000 ALTER TABLE `score_table` DISABLE KEYS */;
REPLACE INTO `score_table` (`id`, `student_id`, `score`, `time`, `category`, `difficulty`, `created_at`, `updated_at`) VALUES
	(21, 16, 40, '00:02:22', '25 Questions', 'hard', '2020-12-08 17:25:03', '2020-12-08 17:25:03'),
	(22, 16, 80, '00:02:22', '15 Questions', 'hard', '2020-12-08 20:31:59', '2020-12-08 20:31:59'),
	(31, 5, 90, '00:01:32', '25 Questions', 'easy', '2020-12-14 19:28:35', '2020-12-14 19:28:35'),
	(73, 22, 72, '00:00:20', '15 Questions', 'hard', '2021-01-12 19:07:19', '2021-01-12 19:07:19'),
	(74, 22, 88, '00:00:30', '25 Questions', 'hard', '2021-01-12 19:08:13', '2021-01-12 19:08:13'),
	(75, 23, 82, '00:00:18', '15 Questions', 'hard', '2021-01-12 19:09:48', '2021-01-12 19:09:48'),
	(203, 26, 72, '00:00:35', '25 Questions', 'easy', '2021-03-20 01:13:14', '2021-03-20 01:13:14'),
	(204, 5, 5, '00:00:17', '15 Questions', 'easy', '2021-04-10 19:00:15', '2021-04-10 19:00:15'),
	(205, 5, 65, '00:00:31', '15 Questions', 'hard', '2021-04-11 18:35:27', '2021-04-11 18:35:27'),
	(214, 22, 30, '00:00:37', '15 Questions', 'easy', '2021-05-10 14:34:52', '2021-05-10 14:34:52'),
	(215, 22, 45, '00:00:59', '25 Questions', 'easy', '2021-05-10 14:48:45', '2021-05-10 14:48:45'),
	(216, 5, 51, '00:00:33', '15 Questions', 'hard', '2021-05-15 18:01:22', '2021-05-15 18:01:22'),
	(217, 28, 15, '00:00:19', '15 Questions', 'easy', '2021-05-19 18:12:12', '2021-05-19 18:12:12'),
	(219, 5, 121, '00:01:02', '15 Questions', 'hard', '2021-05-31 15:16:56', '2021-05-31 15:16:56'),
	(221, 5, 59, '00:00:25', '25 Questions', 'hard', '2021-06-26 15:17:13', '2021-06-26 15:17:13'),
	(222, 5, 44, '00:00:21', '15 Questions', 'hard', '2021-07-09 19:20:19', '2021-07-09 19:20:19'),
	(223, 5, 21, '00:00:08', '15 Questions', 'easy', '2021-07-17 16:50:34', '2021-07-17 16:50:34'),
	(224, 5, 62, '00:00:25', '25 Questions', 'hard', '2021-07-22 12:13:10', '2021-07-22 12:13:10'),
	(226, 5, 58, '00:37:33', '25 Questions', 'hard', '2021-07-27 19:05:06', '2021-07-27 19:05:06'),
	(230, 16, 47, '00:00:26', '15 Questions', 'easy', '2021-07-29 21:39:09', '2021-07-29 21:39:09');
/*!40000 ALTER TABLE `score_table` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.sql_questions
DROP TABLE IF EXISTS `sql_questions`;
CREATE TABLE IF NOT EXISTS `sql_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `a` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `b` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `d` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `correct_answer` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `score` int(11) NOT NULL,
  `difficulty` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.sql_questions: ~50 rows (approximately)
/*!40000 ALTER TABLE `sql_questions` DISABLE KEYS */;
REPLACE INTO `sql_questions` (`id`, `question`, `a`, `b`, `c`, `d`, `correct_answer`, `score`, `difficulty`) VALUES
	(4, 'Ποια δήλωση SQL χρησιμοποιείται για τη διαγραφή δεδομένων από μια βάση δεδομένων;', 'DELETE', 'COLAPSE', 'REMOVE', 'ERASE', 'a', 6, 'easy'),
	(8, 'Ποια δήλωση SQL χρησιμοποιείται για την ενημέρωση δεδομένων σε μια βάση δεδομένων;', 'SAVE AS  ', 'SAVE', 'UPDATE', 'MODIFY', 'c', 6, 'easy'),
	(12, 'Ποια δήλωση SQL χρησιμοποιείται για την εξαγωγή δεδομένων από μια βάση δεδομένων;', 'GET', 'OPEN', 'SELECT    ', 'EXTRACT  ', 'c', 5, 'easy'),
	(21, 'Ποια δήλωση SQL χρησιμοποιείται για την εισαγωγή νέων δεδομένων σε μια βάση δεδομένων;', 'INSERT INTO  ', 'ADD RECORD', 'ADD NEW', 'INSERT NEW', 'a', 5, 'easy'),
	(22, 'Με την SQL, πώς επιλέγετε μια στήλη με το όνομα "FirstName" από έναν πίνακα με το όνομα "Persons";', 'SELECT FirstName FROM Persons  ', 'SELECT Persons.FirstName', 'EXTRACT FirstName FROM Persons', 'SELECT *.Persons', 'a', 5, 'easy'),
	(23, 'Με την SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα Persons όπου η τιμή της στήλης "FirstName" είναι "Peter";', 'SELECT [all] FROM Persons WHERE FirstName LIKE \'Peter\'  ', 'SELECT * FROM Persons WHERE FirstName=\'Peter\'  ', 'SELECT [all] FROM Persons WHERE FirstName=\'Peter\'', 'SELECT * FROM Persons WHERE FirstName<>\'Peter\'', 'b', 5, 'easy'),
	(24, 'Με την SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα Persons όπου η τιμή της στήλης "FirstName" ξεκινά με "a";', 'SELECT * FROM Persons WHERE FirstName LIKE \'%a\'  ', 'SELECT * FROM Persons WHERE FirstName=\'%a%\'', 'SELECT * FROM Persons WHERE FirstName=\'a\'', 'SELECT * FROM Persons WHERE FirstName LIKE \'a%\'  ', 'd', 5, 'easy'),
	(26, 'Με την SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα "Persons" όπου το "FirstName" είναι "Peter" και το "LastName" είναι "Jackson";', 'SELECT * FROM Persons WHERE FirstName=\'Peter\' AND LastName=\'Jackson\'  ', 'SELECT * FROM Persons WHERE FirstName<>\'Peter\' AND LastName<>\'Jackson\'', 'SELECT FirstName=\'Peter\', LastName=\'Jackson\' FROM Persons', 'SELECT * FROM Persons WHERE LastName>\'Hansen\' AND LastName<\'Pettersen\'  ', 'a', 5, 'easy'),
	(27, 'Με την SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα "Persons" όπου το "LastName" βρίσκεται αλφαβητικά μεταξύ (και περιλαμβάνει) "Hansen" και "Pettersen";', 'SELECT * FROM Persons WHERE LastName>\'Hansen\' AND LastName<\'Pettersen\'  ', 'SELECT * FROM Persons WHERE LastName BETWEEN \'Hansen\' AND \'Pettersen\'  ', 'SELECT LastName>\'Hansen\' AND LastName<\'Pettersen\' FROM Persons', 'SELECT FirstName=\'Peter\', LastName=\'Jackson\' FROM Persons', 'b', 5, 'easy'),
	(28, 'Ποια δήλωση SQL χρησιμοποιείται για την επιστροφή μόνο διαφορετικών τιμών;', 'SELECT DIFFERENT  ', 'SELECT UNIQUE', 'SELECT DISTINCT  ', 'SELECT ONLY', 'c', 5, 'easy'),
	(29, 'Ποια λέξη-κλειδί SQL χρησιμοποιείται για την ταξινόμηση του συνόλου αποτελεσμάτων;', 'SORT  ', 'ORDER BY  ', 'ORDER', 'SORT BY', 'b', 5, 'easy'),
	(30, 'Με την SQL, πώς μπορείτε να επιστρέψετε όλες τις εγγραφές από έναν πίνακα με το όνομα Persons ταξινομημένο κατά φθίνουσα κατά "FirstName";', 'SELECT * FROM Persons SORT \'FirstName\' DESC  ', 'SELECT * FROM Persons SORT BY \'FirstName\' DESC', 'SELECT * FROM Persons ORDER BY FirstName DESC  ', 'SELECT * FROM Persons ORDER FirstName DESC', 'c', 5, 'easy'),
	(31, 'Με την SQL, πώς μπορείτε να εισάγετε μια νέα εγγραφή στον πίνακα Persons;', 'INSERT VALUES (\'Jimmy\', \'Jackson\') INTO Persons', 'INSERT (\'Jimmy\', \'Jackson\') INTO Persons', 'INSERT INTO Persons VALUES (\'Jimmy\', \'Jackson\')  ', 'INSERT (\'Olsen\') INTO Persons (LastName)', 'c', 5, 'easy'),
	(32, 'Με την SQL, πώς μπορείτε να εισάγετε το "Olsen" ως "LastName" στον πίνακα "Persons";', 'INSERT INTO Persons (LastName) VALUES (\'Olsen\')  ', 'INSERT (\'Olsen\') INTO Persons (LastName)', 'INSERT INTO Persons (\'Olsen\') INTO LastName', 'INSERT (\'Jimmy\', \'Jackson\') INTO Persons', 'a', 5, 'easy'),
	(33, 'Πώς μπορείτε να αλλάξετε το "Hansen" σε "Nilsen" στη στήλη "LastName" στον πίνακα Persons;', 'MODIFY Persons SET LastName=\'Nilsen\' WHERE LastName=\'Hansen\'  ', 'UPDATE Persons SET LastName=\'Nilsen\' WHERE LastName=\'Hansen\'  ', 'MODIFY Persons SET LastName=\'Hansen\' INTO LastName=\'Nilsen\'', 'UPDATE Persons SET LastName=\'Hansen\' INTO LastName=\'Nilsen\'', 'b', 10, 'hard'),
	(34, 'Με την SQL, πώς μπορείτε να διαγράψετε τις εγγραφές όπου το "FirstName" είναι "Peter" στον πίνακα Persons;', 'DELETE ROW FirstName=\'Peter\' FROM Persons', 'DELETE FirstName=\'Peter\' FROM Persons', 'DELETE FROM Persons WHERE FirstName = \'Peter\'  ', 'DELETE BY Persons WHERE FirstName = \'Peter\' ', 'c', 10, 'hard'),
	(35, 'Με την SQL, πώς μπορείτε να επιστρέψετε τον αριθμό των εγγραφών στον πίνακα Persons;', 'SELECT NO(*) FROM Persons', 'SELECT COUNT(*) FROM Persons  ', 'SELECT LEN(*) FROM Persons', 'SELECT COLUMNS(*) FROM Persons', 'b', 10, 'hard'),
	(36, 'Ποιος είναι ο πιο κοινός τύπος συμμετοχής;', 'JOINED', 'INSIDE JOIN', 'INNER JOIN  ', 'JOINED TABLE', 'c', 10, 'hard'),
	(37, 'Ποιος χειριστής χρησιμοποιείται για την επιλογή τιμών εντός ενός εύρους;', 'WITHIN', 'BETWEEN    ', 'RANGE', 'JOINED', 'b', 11, 'hard'),
	(39, 'Ο περιορισμός NOT NULL επιβάλλει μια στήλη για να μην δέχεται τιμές NULL.', 'Αληθής', 'Ψευδής', '.', '.', 'a', 11, 'easy'),
	(40, 'Ποιος χειριστής χρησιμοποιείται για την αναζήτηση ενός συγκεκριμένου μοτίβου σε μια στήλη;', 'FROM    ', 'GET', 'LIKE    ', 'RANGE', 'c', 11, 'hard'),
	(42, 'Πώς μπορείτε να προσθέσετε μια σειρά χρησιμοποιώντας SQL σε μια βάση δεδομένων;', 'ADD', 'CREATE', 'INSERT', 'MAKE', 'c', 5, 'easy'),
	(43, 'Η εντολή για την κατάργηση σειρών από τον πίνακα "CUSTOMER" είναι:', 'REMOVE FROM CUSTOMER ...', 'DROP FROM CUSTOMER ...', 'DELETE FROM CUSTOMER WHERE ...', 'UPDATE FROM CUSTOMER ...', 'c', 5, 'easy'),
	(44, 'Η ρήτρα SQL WHERE:', 'περιορίζει τα δεδομένα της στήλης που επιστρέφονται.', 'περιορίζει τα δεδομένα γραμμής που επιστρέφονται..', 'Α και Β σωστά', 'Ούτε το Α ούτε το Β σωστά', 'b', 10, 'hard'),
	(45, 'Ποιο από τα παρακάτω είναι ο αρχικός σκοπός της SQL;', 'Για να καθορίσετε τη σύνταξη και τη σημασιολογία της γλώσσας ορισμού δεδομένων SQL', 'Για να καθορίσετε τη σύνταξη και τη σημασιολογία της γλώσσας χειρισμού SQL', 'Για να ορίσετε τις δομές δεδομένων', 'Ολα τα παραπανω.', 'd', 10, 'hard'),
	(48, 'Η εντολή για την εξάλειψη ενός πίνακα από μια βάση δεδομένων είναι:', 'REMOVE TABLE CUSTOMER;', 'DROP TABLE CUSTOMER;', 'DELETE TABLE CUSTOMER;', 'UPDATE TABLE CUSTOMER;', 'b', 5, 'easy'),
	(53, 'Ποιο από τα παρακάτω είναι η σωστή σειρά λέξεων-κλειδιών για δηλώσεις SQL SELECT;', 'SELECT, FROM, WHERE', 'FROM, WHERE, SELECT', 'WHERE, FROM,SELECT', 'SELECT,WHERE,FROM', 'a', 7, 'hard'),
	(54, 'Το αποτέλεσμα μιας δήλωσης SQL SELECT είναι ένας-μία ________.', 'αναφορά', 'φόρμα', 'αρχείο', 'πίνακας', 'd', 5, 'easy'),
	(55, 'Η λέξη-κλειδί SQL  BETWEEN  χρησιμοποιείται:', 'για διαστήματα', 'για να περιορίσετε τις εμφανιζόμενες στήλες.', 'ως μοτίβο.', 'Κανένα από τα παραπάνω δεν είναι σωστό.', 'a', 7, 'hard'),
	(57, 'Ποιο από τα παρακάτω πρέπει να λάβετε υπόψη όταν δημιουργείτε έναν πίνακα σε SQL;', 'Τύποι δεδομένων', 'πρωτεύοντα κλειδιά', 'Default τιμές', 'Όλα τα παραπάνω', 'd', 7, 'hard'),
	(58, 'Ποια από τις παρακάτω ταξινομεί στην SQL;', 'SORT BY', 'ALIGN BY', 'ORDER BY', 'GROUP BY', 'c', 7, 'hard'),
	(59, 'Για να ορίσετε ποιες στήλες πρέπει να εμφανίζονται σε μια δήλωση SQL SELECT:', 'Χρησιμοποιήστε το FROM για να ονομάσετε τους πίνακες  προέλευσης και να απαριθμήσετε τις στήλες που θα εμφανίζονται μετά την επιλογή.', 'χρησιμοποιήστε το USING για να ονομάσετε τους πίνακες προέλευσης και να αναφέρετε τις στήλες που θα εμφανίζονται μετά την επιλογή.', 'Χρησιμοποιήστε το SELECT για να ονομάσετε τους πίνακες προέλευσης και να αναφέρετε τις στήλες που θα εμφανίζονται μετά τη χρήση.', 'Χρησιμοποιήστε το USING για να ονομάσετε τους πίνακες (ες) προέλευσης και να αναφέρετε τις στήλες που θα εμφανίζονται μετά το WHERE.', 'a', 10, 'hard'),
	(60, 'Το SQL μπορεί να χρησιμοποιηθεί για:', 'δημιουργία μόνο δομές βάσεων δεδομένων.', 'μόνο δεδομένα βάσης δεδομένων ερωτήματος.', 'τροποποίηση δεδομένων βάσης δεδομένων μόνο.', 'Όλα τα παραπάνω μπορούν να γίνουν με SQL.', 'd', 9, 'hard'),
	(61, 'Ποιο από τα παρακάτω είναι μια νομική έκφραση στην SQL;', 'SELECT NULL FROM SALES;', 'SELECT NAME FROM SALES;', 'SELECT * FROM SALES WHEN PRICE = NULL;', 'SELECT # FROM SALES;', 'b', 10, 'hard'),
	(63, 'Η συνάρτηση COUNT στην SQL επιστρέφει τον αριθμό ______________', 'των τιμών', 'των μεμονωμένων τιμών', 'των ομαδοποιημένων τιμών', 'των στηλών', 'a', 10, 'hard'),
	(64, 'Ποιος τύπος δεδομένων μπορεί να αποθηκεύσει μη δομημένα δεδομένα σε μια στήλη;', 'RAW', 'CHAR', 'NUMERIC', 'VARCHAR', 'a', 10, 'hard'),
	(65, 'Ποια συνάρτηση χρησιμοποιείται για να διαιρέσει μια αριθμητική έκφραση  και να πάρει το υπόλοιπο;', 'POWER', 'MOD', 'ROUND', 'REMAINDER', 'b', 9, 'hard'),
	(66, 'Ποια είναι η πλήρης μορφή του DDL;', 'Dynamic Data Language', 'Detailed Data Language', 'Data Definition Language', 'Data Derivation Language', 'c', 8, 'hard'),
	(68, 'Ποια δήλωση στην SQL μας επιτρέπει να αλλάξουμε τον ορισμό ενός πίνακα;', 'ALTER', 'UPDATE', 'CREATE', 'SELECT', 'a', 8, 'hard'),
	(70, 'Η εντολή που χρησιμοποιείται για τη διαγραφή μιας συγκεκριμένης στήλης σε μια σχέση είναι ____________', 'UPDATE TABLE', 'TRUNCATE COLUMN', 'ALTER TABLE', 'DELETE COLUMN', 'c', 7, 'hard'),
	(72, 'Ποιο από τα παρακάτω είναι χειριστής σύγκρισης στην SQL;', '==', 'LIKE', 'BETWEEN', '=', 'a', 7, 'easy'),
	(73, 'Ποιος χειριστής χρησιμοποιείται για να συγκρίνει μια τιμή με μια καθορισμένη λίστα τιμών;', 'BETWEEN', 'ANY', 'IN', 'ALL', 'c', 6, 'easy'),
	(84, 'STUDENTS (student_code, first_name, last_name, email, phone_no, date_of_birth, honours_subject, percentage_of_marks); Ποιο από τα ακόλουθα ερωτήματα θα εμφανίσει όλους τους μαθητές των οποίων το όνομα ξεκινά με τον χαρακτήρα «Α»;', 'select first_name from students where first_name like ‘A%’;', 'select first_name from students where first_name like ‘%A’;', 'select first_name from students where first_name like ‘%A%’;', 'select first_name from students where first_name like ‘A’;', 'a', 10, 'hard'),
	(86, 'Ποιο από τα παρακάτω δεν αποτελεί εντολή στην SQL;', 'SUM', 'AVG', 'COUNT', 'FIND', 'd', 5, 'easy'),
	(87, 'Ποια λέξη-κλειδί μας επιτρέπει να βρούμε τις μοναδικές τιμές στη βάση δεδομένων;', 'DISTINCT', 'UNIQUE', 'FIND', 'DIFF', 'a', 6, 'easy'),
	(88, 'Ποιο από τα ακόλουθα ερωτήματα θα περιορίσει την έξοδο σε 5 σειρές;', ' SELECT * FROM DataFlair 5;', ' SELECT * FROM DataFlair LIMIT 5;', ' SELECT * FROM DataFlair 5 LIMIT;', ' SELECT LIMIT(5) * FROM DataFlair ;', 'b', 9, 'hard'),
	(89, 'Πόσα πρωτεύοντα κλειδιά μπορούν να δημιουργηθούν σε έναν πίνακα;', 'Άπειρα', '2', '1', '24', 'c', 5, 'easy'),
	(90, 'Ποιος τύπος δεδομένων SQL χρησιμοποιείται για την αποθήκευση ενός αντικειμένου JSON;', 'NVarchar', 'BLOB', 'Char', 'Int', 'a', 8, 'hard'),
	(91, 'Ποιο από τα παρακάτω δείχνει σχόλιο στην SQL;', ' /* This is a comment. */', ' # This is a comment.', ' % This is a comment. %', '//This is a comment.', 'a', 6, 'hard'),
	(92, 'Ποια από τις ακόλουθες συνδέσεις εξάγει δεδομένα αντίστοιχων σειρών και από τους δύο πίνακες;', ' Full Outer Join', ' Left Join', ' Right Join', 'Κανένα από τα παραπάνω', 'a', 10, 'easy');
/*!40000 ALTER TABLE `sql_questions` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.sql_random_queries
DROP TABLE IF EXISTS `sql_random_queries`;
CREATE TABLE IF NOT EXISTS `sql_random_queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql_query` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `hideWord` varchar(500) COLLATE utf8_bin NOT NULL,
  `table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `table_id_idx` (`table_id`),
  CONSTRAINT `table_id` FOREIGN KEY (`table_id`) REFERENCES `excersice_tables` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2397 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.sql_random_queries: ~60 rows (approximately)
/*!40000 ALTER TABLE `sql_random_queries` DISABLE KEYS */;
REPLACE INTO `sql_random_queries` (`id`, `sql_query`, `hideWord`, `table_id`) VALUES
	(1852, 'SELECT * FROM actors', '*,actors', 249),
	(1853, 'SELECT idactor, name FROM actors', 'idactor,name', 249),
	(1854, 'SELECT DISTINCT isPlayed FROM actors', 'DISTINCT', 249),
	(1855, 'SELECT COUNT(name) FROM actors', 'COUNT,FROM', 249),
	(1856, 'SELECT COUNT(DISTINCT birthDate) FROM actors', 'DISTINCT', 249),
	(1857, 'SELECT * FROM actors WHERE idactor=6', 'WHERE,idactor', 249),
	(1858, 'SELECT * FROM actors WHERE idactor IN ("1","4")', 'IN', 249),
	(1859, 'SELECT * FROM actors WHERE idactor BETWEEN 3 AND 9', 'BETWEEN,AND', 249),
	(1860, 'SELECT * FROM actors ORDER BY birthDate', 'ORDER,BY', 249),
	(1861, 'SELECT * FROM actors ORDER BY birthDate DESC', 'ORDER,BY,DESC', 249),
	(1862, 'SELECT * FROM actors ORDER BY isPlayed ASC, idactor DESC', 'ORDER,BY,ASC,DESC', 249),
	(1863, 'SELECT * FROM actors LIMIT 8', 'LIMIT', 249),
	(1864, 'SELECT MIN(idactor) FROM actors', 'MIN', 249),
	(1865, 'SELECT MAX(idactor) FROM actors', 'MAX', 249),
	(1866, 'SELECT COUNT(surname), birthDate FROM actors GROUP BY birthDate', 'COUNT,GROUP,BY', 249),
	(1867, 'SELECT COUNT(isPlayed), idactor FROM actors GROUP BY idactor ORDER BY COUNT(isPlayed) DESC', 'ORDER,BY,DESC', 249),
	(1868, 'SELECT COUNT(surname) FROM actors GROUP BY isPlayed HAVING COUNT(surname) >3', 'GROUP,BY,HAVING,COUNT', 249),
	(1869, 'SELECT SUM(idactor) FROM actors', 'SUM', 249),
	(1870, 'SELECT AVG(idactor) FROM actors', 'AVG', 249),
	(1871, 'SELECT * FROM actors WHERE isPlayed IS NULL', 'IS,NULL', 249),
	(1872, 'SELECT movies.idmovie, actors.idactor, movies.releasedDate FROM actors, movies WHERE actors.idactor=movies.idActor', 'actors,idactor,=', 250),
	(1873, 'SELECT movies.idActor, actors.idactor, movies.idmovie FROM actors INNER JOIN movies ON actors.idactor=movies.idActor', 'INNER,JOIN', 250),
	(1874, 'SELECT actors.idactor, movies.idmovie FROM actors LEFT JOIN movies ON actors.idactor=movies.idActor ORDER BY actors.idactor', 'LEFT,ORDER,BY', 250),
	(1875, 'SELECT actors.idactor, movies.idmovie, movies.releasedDate FROM actors RIGHT JOIN movies ON actors.idactor=movies.idActor ORDER BY actors.idactor DESC', 'RIGHT,DESC', 250),
	(1876, 'SELECT movies.idActor, actors.idactor, movies.idmovie FROM actors INNER JOIN movies ON actors.idactor=movies.idActor WHERE actors.idactor>1', 'WHERE,>', 250),
	(1877, 'SELECT * FROM movies CROSS JOIN actors', 'CROSS', 250),
	(1878, 'SELECT isPlayed FROM actors UNION SELECT title FROM movies', 'UNION', 250),
	(1879, 'SELECT surname FROM actors WHERE idactor = ANY ( SELECT idActor FROM movies WHERE idActor>4 )', 'ANY', 250),
	(1880, 'SELECT surname FROM actors WHERE idactor = ALL ( SELECT idActor FROM movies WHERE idActor=0 )', 'ALL', 250),
	(1881, 'SELECT birthDate FROM actors WHERE idactor IN ( SELECT idActor FROM movies WHERE idActor>5)', 'IN', 250),
	(2184, 'SELECT * FROM users', '*,users', 277),
	(2185, 'SELECT idUser, name FROM users', 'idUser,name', 277),
	(2186, 'SELECT DISTINCT surname FROM users', 'DISTINCT', 277),
	(2187, 'SELECT COUNT(isAlive) FROM users', 'COUNT,FROM', 277),
	(2188, 'SELECT COUNT(DISTINCT name) FROM users', 'DISTINCT', 277),
	(2189, 'SELECT * FROM users WHERE idUser=2', 'WHERE,idUser', 277),
	(2190, 'SELECT * FROM users WHERE idUser IN ("1","4")', 'IN', 277),
	(2191, 'SELECT * FROM users WHERE idUser BETWEEN 1 AND 10', 'BETWEEN,AND', 277),
	(2192, 'SELECT * FROM users ORDER BY name', 'ORDER,BY', 277),
	(2193, 'SELECT * FROM users ORDER BY gender DESC', 'ORDER,BY,DESC', 277),
	(2194, 'SELECT * FROM users ORDER BY gender ASC, birthDate DESC', 'ORDER,BY,ASC,DESC', 277),
	(2195, 'SELECT * FROM users LIMIT 1', 'LIMIT', 277),
	(2196, 'SELECT MIN(idUser) FROM users', 'MIN', 277),
	(2197, 'SELECT MAX(idUser) FROM users', 'MAX', 277),
	(2198, 'SELECT COUNT(birthDate), isAlive FROM users GROUP BY isAlive', 'COUNT,GROUP,BY', 277),
	(2199, 'SELECT COUNT(gender), birthDate FROM users GROUP BY birthDate ORDER BY COUNT(gender) DESC', 'GROUP,BY,DESC', 277),
	(2200, 'SELECT COUNT(surname) FROM users GROUP BY isAlive HAVING COUNT(surname) >0', 'GROUP,BY,HAVING,COUNT', 277),
	(2201, 'SELECT SUM(idUser) FROM users', 'SUM', 277),
	(2202, 'SELECT AVG(idUser) FROM users', 'AVG', 277),
	(2203, 'SELECT * FROM users WHERE gender IS NULL', 'IS,NULL', 277),
	(2204, 'SELECT notes.useriId, users.gender, notes.idnote, notes.title FROM users, notes WHERE users.idUser=notes.useriId', 'users,idUser,=', 278),
	(2205, 'SELECT users.idUser, users.gender, notes.idnote FROM users INNER JOIN notes ON users.idUser=notes.useriId', 'INNER,JOIN', 278),
	(2206, 'SELECT users.gender, notes.useriId FROM users LEFT JOIN notes ON users.idUser=notes.useriId ORDER BY users.gender', 'LEFT,ORDER,BY', 278),
	(2207, 'SELECT users.idUser, notes.idnote, notes.title FROM users RIGHT JOIN notes ON users.idUser=notes.useriId ORDER BY users.idUser DESC', 'RIGHT,DESC', 278),
	(2208, 'SELECT users.idUser, users.gender, notes.idnote FROM users INNER JOIN notes ON users.idUser=notes.useriId WHERE users.idUser>1', 'WHERE,>', 278),
	(2209, 'SELECT * FROM notes CROSS JOIN users', 'CROSS', 278),
	(2210, 'SELECT gender FROM users UNION SELECT title FROM notes', 'UNION', 278),
	(2211, 'SELECT surname FROM users WHERE idUser = ANY ( SELECT useriId FROM notes WHERE useriId>1 )', 'ANY', 278),
	(2212, 'SELECT birthDate FROM users WHERE idUser = ALL ( SELECT useriId FROM notes WHERE useriId=0 )', 'ALL', 278),
	(2213, 'SELECT idUser FROM users WHERE idUser IN ( SELECT useriId FROM notes WHERE useriId>1)', 'IN', 278);
/*!40000 ALTER TABLE `sql_random_queries` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.sql_random_queries_true_or_false
DROP TABLE IF EXISTS `sql_random_queries_true_or_false`;
CREATE TABLE IF NOT EXISTS `sql_random_queries_true_or_false` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql_query_true_or_false` varchar(2000) COLLATE utf8_bin NOT NULL,
  `exersice_table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exersice_table_id_idx` (`exersice_table_id`),
  CONSTRAINT `exersice_table_id` FOREIGN KEY (`exersice_table_id`) REFERENCES `excersice_tables` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1277 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.sql_random_queries_true_or_false: ~60 rows (approximately)
/*!40000 ALTER TABLE `sql_random_queries_true_or_false` DISABLE KEYS */;
REPLACE INTO `sql_random_queries_true_or_false` (`id`, `sql_query_true_or_false`, `exersice_table_id`) VALUES
	(734, 'SELECT * FROM actors', 249),
	(735, 'SELECT * FROM actors WHERE idactor>1', 249),
	(736, 'SELECT DISTINCT idactor FROM actors', 249),
	(737, 'SELECT idactor FROM actors WHERE idactor=3', 249),
	(738, 'SELECT MIN(idactor) FROM actors', 249),
	(739, 'SELECT COUNT(idactor) FROM actors', 249),
	(740, 'SELECT AVG(idactor) FROM actors WHERE idactor>0', 249),
	(741, 'SELECT SUM(idactor) FROM actors WHERE idactor>5', 249),
	(742, 'SELECT idactor FROM actors WHERE NOT idactor>1', 249),
	(743, 'SELECT COUNT(name) FROM actors WHERE idactor BETWEEN 3 AND 7', 249),
	(744, 'SELECT COUNT(DISTINCT name)  FROM actors', 249),
	(745, 'SELECT * FROM actors WHERE idactor=3 OR idactor=9', 249),
	(746, 'SELECT * FROM actors ORDER BY idactor ASC', 249),
	(747, 'SELECT * FROM actors ORDER BY surname DESC', 249),
	(748, 'SELECT * FROM actors ORDER BY surname ASC, birthDate DESC', 249),
	(749, 'SELECT * FROM actors GROUP BY surname', 249),
	(750, 'SELECT name AS test FROM actors WHERE surname LIKE \'S%\'', 249),
	(751, 'SELECT MAX(idactor) AS test FROM actors WHERE idactor<2', 249),
	(752, 'SELECT isPlayed AS test FROM actors', 249),
	(753, 'SELECT * FROM actors WHERE name LIKE \'%3%\'', 249),
	(754, 'SELECT actors.idactor, movies.idmovie, movies.releasedDate FROM actors INNER JOIN movies ON actors.idactor=movies.idActor ORDER BY actors.idactor DESC', 250),
	(755, 'SELECT actors.idactor, movies.idmovie, movies.releasedDate FROM actors INNER JOIN movies ON actors.idactor=movies.idActor ORDER BY actors.idactor ASC, actors.name DESC', 250),
	(756, 'SELECT actors.idactor, movies.idmovie, movies.releasedDate FROM actors RIGHT JOIN movies ON actors.idactor=movies.idActor WHERE actors.idactor>2', 250),
	(757, 'SELECT actors.idactor, movies.idmovie, movies.releasedDate FROM actors RIGHT JOIN movies ON actors.idactor=movies.idActor WHERE actors.idactor<3', 250),
	(758, 'SELECT actors.idactor, movies.idmovie, movies.releasedDate FROM actors LEFT JOIN movies ON actors.idactor=movies.idActor WHERE movies.title LIKE \'%4%\'', 250),
	(759, 'SELECT actors.idactor, movies.idmovie, movies.releasedDate FROM actors LEFT JOIN movies ON actors.idactor=movies.idActor', 250),
	(760, 'SELECT * FROM movies CROSS JOIN actors WHERE movies.idActor>5 AND movies.idActor<13', 250),
	(761, 'SELECT isPlayed, name FROM actors WHERE idactor IN ( SELECT idActor FROM movies WHERE idActor<7 )', 250),
	(762, 'SELECT isPlayed, name FROM actors UNION SELECT releasedDate, title FROM movies', 250),
	(763, 'SELECT actors.isPlayed, actors.name FROM actors RIGHT JOIN movies ON actors.idactor=movies.idActor WHERE NOT movies.idActor=4', 250),
	(1065, 'SELECT * FROM users', 277),
	(1066, 'SELECT * FROM users WHERE idUser>1', 277),
	(1067, 'SELECT DISTINCT idUser FROM users', 277),
	(1068, 'SELECT idUser FROM users WHERE idUser=2', 277),
	(1069, 'SELECT MIN(idUser) FROM users', 277),
	(1070, 'SELECT COUNT(idUser) FROM users', 277),
	(1071, 'SELECT AVG(idUser) FROM users WHERE idUser>1', 277),
	(1072, 'SELECT SUM(idUser) FROM users WHERE idUser>1', 277),
	(1073, 'SELECT idUser FROM users WHERE NOT idUser>1', 277),
	(1074, 'SELECT COUNT(name) FROM users WHERE idUser BETWEEN 4 AND 8', 277),
	(1075, 'SELECT COUNT(DISTINCT name)  FROM users', 277),
	(1076, 'SELECT * FROM users WHERE idUser=1 OR idUser=10', 277),
	(1077, 'SELECT * FROM users ORDER BY surname ASC', 277),
	(1078, 'SELECT * FROM users ORDER BY name DESC', 277),
	(1079, 'SELECT * FROM users ORDER BY birthDate ASC, isAlive DESC', 277),
	(1080, 'SELECT * FROM users GROUP BY birthDate', 277),
	(1081, 'SELECT name AS test FROM users WHERE surname LIKE \'s%\'', 277),
	(1082, 'SELECT MAX(idUser) AS test FROM users WHERE idUser<6', 277),
	(1083, 'SELECT gender AS test FROM users', 277),
	(1084, 'SELECT * FROM users WHERE name LIKE \'%m%\'', 277),
	(1085, 'SELECT users.gender, notes.idnote, notes.title FROM users INNER JOIN notes ON users.idUser=notes.useriId ORDER BY users.idUser DESC', 278),
	(1086, 'SELECT users.gender, notes.idnote, notes.title FROM users INNER JOIN notes ON users.idUser=notes.useriId ORDER BY users.idUser ASC, users.isAlive DESC', 278),
	(1087, 'SELECT users.gender, notes.idnote, notes.title FROM users RIGHT JOIN notes ON users.idUser=notes.useriId WHERE users.idUser>1', 278),
	(1088, 'SELECT users.gender, notes.idnote, notes.title FROM users RIGHT JOIN notes ON users.idUser=notes.useriId WHERE users.idUser<6', 278),
	(1089, 'SELECT users.gender, notes.idnote, notes.title FROM users LEFT JOIN notes ON users.idUser=notes.useriId WHERE notes.description LIKE \'%e%\'', 278),
	(1090, 'SELECT users.gender, notes.idnote, notes.title FROM users LEFT JOIN notes ON users.idUser=notes.useriId', 278),
	(1091, 'SELECT * FROM notes CROSS JOIN users WHERE notes.useriId>0 AND notes.useriId<5', 278),
	(1092, 'SELECT idUser, isAlive FROM users WHERE idUser IN ( SELECT useriId FROM notes WHERE useriId<9 )', 278),
	(1093, 'SELECT idUser, isAlive FROM users UNION SELECT title, useriId FROM notes', 278),
	(1094, 'SELECT users.idUser, users.isAlive FROM users RIGHT JOIN notes ON users.idUser=notes.useriId WHERE NOT notes.useriId=6', 278);
/*!40000 ALTER TABLE `sql_random_queries_true_or_false` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.success_rate
DROP TABLE IF EXISTS `success_rate`;
CREATE TABLE IF NOT EXISTS `success_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_student` int(11) NOT NULL,
  `rate` varchar(300) COLLATE utf8_bin NOT NULL,
  `time` varchar(100) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(300) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type_excersice` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_student_idx` (`id_student`),
  CONSTRAINT `id_student` FOREIGN KEY (`id_student`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.success_rate: ~40 rows (approximately)
/*!40000 ALTER TABLE `success_rate` DISABLE KEYS */;
REPLACE INTO `success_rate` (`id`, `id_student`, `rate`, `time`, `table_name`, `created_at`, `updated_at`, `type_excersice`) VALUES
	(79, 16, 'Σωστές 19 στις 20', '00:02:28', 'actors', '2021-05-03 13:06:51', '2021-05-03 13:06:51', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(80, 16, 'Σωστές 10 στις 10', '00:00:56', 'movies', '2021-05-03 13:08:51', '2021-05-03 13:08:51', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(81, 16, 'Σωστές 20 στις 20', '00:01:15', 'actors', '2021-05-03 13:13:37', '2021-05-03 13:13:37', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(82, 16, 'Σωστές 10 στις 10', '00:00:38', 'movies', '2021-05-03 13:14:36', '2021-05-03 13:14:36', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(83, 16, 'Σωστές 18 στις 20', '00:00:43', 'actors', '2021-05-03 13:16:59', '2021-05-03 13:16:59', 'Σωστό-λάθος σε 1 πίνακα'),
	(84, 16, 'Σωστές 10 στις 10', '00:00:23', 'gamers', '2021-05-03 13:17:37', '2021-05-03 13:17:37', 'Σωστό-λάθος σε 2 πίνακες'),
	(85, 16, 'Σωστές 19 στις 20', '00:01:08', 'owners', '2021-05-03 14:07:22', '2021-05-03 14:07:22', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(86, 16, 'Σωστές 10 στις 10', '00:00:40', 'shops', '2021-05-03 14:08:12', '2021-05-03 14:08:12', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(87, 16, 'Σωστές 9 στις 10', '00:00:58', 'shops', '2021-05-03 14:09:17', '2021-05-03 14:09:17', 'Σωστό-λάθος σε 2 πίνακες'),
	(88, 16, 'Σωστές 19 στις 20', '00:01:55', 'owners', '2021-05-03 14:11:18', '2021-05-03 14:11:18', 'Σωστό-λάθος σε 1 πίνακα'),
	(93, 22, 'Σωστές 14 στις 20', '00:01:40', 'coffee', '2021-05-10 14:28:00', '2021-05-10 14:28:00', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(94, 22, 'Σωστές 16 στις 20', '00:01:03', 'coffee', '2021-05-10 14:29:23', '2021-05-10 14:29:23', 'Σωστό-λάθος σε 1 πίνακα'),
	(95, 22, 'Σωστές 8 στις 10', '00:01:11', 'cafe', '2021-05-10 14:31:04', '2021-05-10 14:31:04', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(96, 22, 'Σωστές 7 στις 10', '00:00:29', 'cafe', '2021-05-10 14:31:51', '2021-05-10 14:31:51', 'Σωστό-λάθος σε 2 πίνακες'),
	(97, 22, 'Σωστές 10 στις 10', '00:00:35', 'cafe', '2021-05-10 14:32:52', '2021-05-10 14:32:52', 'Σωστό-λάθος σε 2 πίνακες'),
	(98, 22, 'Σωστές 20 στις 20', '00:00:53', 'coffee', '2021-05-10 14:33:56', '2021-05-10 14:33:56', 'Σωστό-λάθος σε 1 πίνακα'),
	(99, 5, 'Σωστές 20 στις 20', '00:01:36', 'coffee', '2021-05-12 20:50:27', '2021-05-12 20:50:27', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(100, 5, 'Σωστές 18 στις 20', '00:00:46', 'coffee', '2021-05-12 20:51:24', '2021-05-12 20:51:24', 'Σωστό-λάθος σε 1 πίνακα'),
	(101, 5, 'Σωστές 10 στις 10', '00:00:49', 'cafe', '2021-05-12 20:52:20', '2021-05-12 20:52:20', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(102, 5, 'Σωστές 9 στις 10', '00:00:23', 'cafe', '2021-05-12 20:52:53', '2021-05-12 20:52:53', 'Σωστό-λάθος σε 2 πίνακες'),
	(103, 28, 'Σωστές 18 στις 20', '00:01:40', 'writters', '2021-05-19 18:14:08', '2021-05-19 18:14:08', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(104, 28, 'Σωστές 9 στις 10', '00:00:40', 'books', '2021-05-19 18:15:22', '2021-05-19 18:15:22', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(105, 28, 'Σωστές 10 στις 10', '00:00:26', 'books', '2021-05-19 18:15:59', '2021-05-19 18:15:59', 'Σωστό-λάθος σε 2 πίνακες'),
	(106, 28, 'Σωστές 17 στις 20', '00:00:43', 'writters', '2021-05-19 18:16:49', '2021-05-19 18:16:49', 'Σωστό-λάθος σε 1 πίνακα'),
	(107, 5, 'Σωστές 5 στις 10', '00:01:47', 'movies', '2021-05-24 22:02:29', '2021-05-24 22:02:29', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(120, 5, 'Σωστές 17 στις 20', '00:02:17', 'actors', '2021-05-31 15:21:44', '2021-05-31 15:21:44', 'Σωστό-λάθος σε 1 πίνακα'),
	(121, 5, 'Σωστές 0 στις 20', '00:01:41', 'players', '2021-06-17 17:45:11', '2021-06-17 17:45:11', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(122, 5, 'Σωστές 6 στις 10', '00:02:36', 'teams', '2021-06-17 17:48:32', '2021-06-17 17:48:32', 'Σωστό-λάθος σε 2 πίνακες'),
	(123, 5, 'Σωστές 2 στις 20', '00:01:49', 'players', '2021-06-26 01:25:22', '2021-06-26 01:25:22', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(124, 5, 'Σωστές 4 στις 10', '00:00:56', 'teams', '2021-06-26 01:26:40', '2021-06-26 01:26:40', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(125, 5, 'Σωστές 16 στις 20', '00:02:19', 'players', '2021-06-26 01:29:09', '2021-06-26 01:29:09', 'Σωστό-λάθος σε 1 πίνακα'),
	(126, 5, 'Σωστές 5 στις 10', '00:00:18', 'teams', '2021-06-26 01:29:41', '2021-06-26 01:29:41', 'Σωστό-λάθος σε 2 πίνακες'),
	(127, 5, 'Σωστές 9 στις 10', '00:03:46', 'notes', '2021-06-26 15:43:05', '2021-06-26 15:43:05', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(128, 5, 'Σωστές 8 στις 10', '00:00:56', 'notes', '2021-06-26 15:45:38', '2021-06-26 15:45:38', 'Σωστό-λάθος σε 2 πίνακες'),
	(129, 5, 'Σωστές 16 στις 20', '00:01:54', 'users', '2021-06-26 15:47:41', '2021-06-26 15:47:41', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(130, 5, 'Σωστές 16 στις 20', '00:01:22', 'users', '2021-06-26 15:49:14', '2021-06-26 15:49:14', 'Σωστό-λάθος σε 1 πίνακα'),
	(131, 5, 'Σωστές 3 στις 20', '00:00:42', 'actors', '2021-07-17 17:38:56', '2021-07-17 17:38:56', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(132, 5, 'Σωστές 0 στις 10', '00:00:11', 'movies', '2021-07-17 17:39:21', '2021-07-17 17:39:21', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(133, 5, 'Σωστές 13 στις 20', '00:00:33', 'actors', '2021-07-17 17:40:02', '2021-07-17 17:40:02', 'Σωστό-λάθος σε 1 πίνακα'),
	(134, 5, 'Σωστές 4 στις 10', '00:00:20', 'movies', '2021-07-17 17:40:30', '2021-07-17 17:40:30', 'Σωστό-λάθος σε 2 πίνακες');
/*!40000 ALTER TABLE `success_rate` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `idUser` int(12) NOT NULL,
  `name` varchar(22) COLLATE utf8_bin NOT NULL,
  `surname` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  `gender` int(22) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `isAlive` tinyint(4) NOT NULL,
  PRIMARY KEY (`idUser`),
  KEY `idUser` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`idUser`, `name`, `surname`, `gender`, `birthDate`, `isAlive`) VALUES
	(1, 'name1', 'surname1', 1, '2000-02-02 00:00:00', 1),
	(2, 'name2', 'surname2', NULL, '1999-02-02 00:00:00', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.user_table
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE IF NOT EXISTS `user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sex` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `verification_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.user_table: ~11 rows (approximately)
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
REPLACE INTO `user_table` (`id`, `first_name`, `last_name`, `sex`, `phone`, `email`, `username`, `password`, `role`, `verification_code`) VALUES
	(3, 'Dimitris', 'Motsios', 'male', '6933363651', 'www.motsios@hotmail.com', 'motsios', '$2a$10$XEZwm1qPkitzosaVx94tverDrYosZARazx.pVtiGsG7wOHJjI7CiC', 'teacher', ''),
	(4, 'giorgos', 'pappas', 'male', '6935146987', 'giorgos@gmail.com', 'giorgos', '$2a$10$1X8vht1REou23F.xMl51reymvMVky653wd7ElT5q/JEHGRpuZOFxy', 'teacher', NULL),
	(5, 'Kostas', 'kakkos', 'male', '6935123697', 'kostas@gmail.com', 'kostas', '$2a$10$mezTsIwg.Md7Guklprtk6uLrxmIQy4iUfsu5LxD15DutxhIM9yldq', 'student', NULL),
	(16, 'dionisis', 'papakwstas', 'male', '6936547892', 'dionisis@gmail.com', 'dioni', '$2a$10$AJQJhxAZVVTDbJwU75qGm.BW9LDld1qvaGy/n7dkU9Jw2j9jDSMbq', 'student', NULL),
	(22, 'aleksis', 'koumasis', 'male', '6932156941', 'aleksis@gmail.com', 'aleksis', '$2a$10$4kT52oOxyPwuXXU6LCSMY.OkC8uZOKrZXX2NXIdb7/6/N5GQuO9u.', 'student', NULL),
	(23, 'georgia', 'kali', 'female', '6932569515', 'georgia@gmail.com', 'georgia', '$2a$10$jGKcviqvwK3RqFy/kmUvfe3ofLmHU2HiYQw1G0uWjh.8ItYqZB7G.', 'student', NULL),
	(24, 'Iliana', 'papanikou', 'female', '6945611212', 'iliana@gmail.com', 'iliana', '$2a$10$kaBhe10ytWP.RhUxuYwgbe3x1cSG6/R0TUe.MsoMZf77BPAHwJyyi', 'student', NULL),
	(26, 'George', 'Andreou', 'male', '6354567891', 'giorgos@yahoo.gr', 'giorgos93', '$2a$10$m9YdINIylv4V6Rs0NSim3uJJhgGlPb89rRfbMd9SsRXFZU9T14xKa', 'student', NULL),
	(27, 'Γιώργος', 'Κοτσάμπασης', 'male', '6956212345', 'giorgos@hotmail.com', 'giorgakis', '$2a$10$6UjAGNlAT0l7yyFvMUe5m.cNFjkuiyOySqOX3BYHlR2f8oeGWGiju', 'teacher', NULL),
	(28, 'Ηλιάνα', 'Παππά', 'female', '6354123456', 'iliana94@gmail.com', 'iliana94', '$2a$10$/Bwak6vP6USgEEpWeOMO6OIkcYnL5Za1omurjzU7c.Gmj6/87QPAO', 'student', NULL),
	(40, 'Dimitris', 'Motsios', 'male', '69365214', 'www.motsios@hotmail.com', 'motsios94', '$2a$10$M6UE/gVvrjSX04OIZ.ZfGOdzS6Z0hNXEcRP1tSolFweL0taWKmwOe', 'teacher', NULL);
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
