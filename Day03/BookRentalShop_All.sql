CREATE DATABASE BookRentalShop;
USE BookRentalShop;

DROP TABLE IF EXISTS `divtbl`;
DROP TABLE IF EXISTS `bookstbl`;
DROP TABLE IF EXISTS `membertbl`;
DROP TABLE IF EXISTS `rentaltbl`;

CREATE TABLE `divtbl` (
  `Division` char(4) NOT NULL,
  `Names` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Division`)
);


CREATE TABLE `bookstbl` (
  `bookIdx` int NOT NULL AUTO_INCREMENT,
  `Author` varchar(45) DEFAULT NULL,
  `Division` char(4) NOT NULL,
  `Names` varchar(100) DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `ISBN` varchar(200) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`bookIdx`),
  KEY `fk_bookstbl_divtbl_idx` (`Division`),
  CONSTRAINT `fk_bookstbl_divtbl` FOREIGN KEY (`Division`) REFERENCES `divtbl` (`Division`)
);

CREATE TABLE `membertbl` (
  `memberIdx` int NOT NULL AUTO_INCREMENT,
  `Names` varchar(45) NOT NULL,
  `Levels` char(1) DEFAULT NULL,
  `Addr` varchar(100) DEFAULT NULL,
  `Mobile` varchar(13) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`memberIdx`)
);

CREATE TABLE `rentaltbl` (
  `rentalIdx` int NOT NULL AUTO_INCREMENT,
  `memberIdx` int DEFAULT NULL,
  `bookIdx` int DEFAULT NULL,
  `rentalDate` date DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  PRIMARY KEY (`rentalIdx`),
  KEY `fk_rentaltbl_membertbl1_idx` (`memberIdx`),
  KEY `fk_rentaltbl_bookstbl1_idx` (`bookIdx`),
  CONSTRAINT `fk_rentaltbl_bookstbl1` FOREIGN KEY (`bookIdx`) REFERENCES `bookstbl` (`bookIdx`),
  CONSTRAINT `fk_rentaltbl_membertbl1` FOREIGN KEY (`memberIdx`) REFERENCES `membertbl` (`memberIdx`)
);

-- 데이터 입력
LOCK TABLES `divtbl` WRITE;
/*!40000 ALTER TABLE `divtbl` DISABLE KEYS */;
INSERT INTO `divtbl` VALUES ('B001','공포/스릴러'),('B002','로맨스'),('B003','무협'),('B004','전쟁/역사'),('B005','추리'),('B006','SF/판타지'),('I001','프로그래밍');
/*!40000 ALTER TABLE `divtbl` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `bookstbl` WRITE;
/*!40000 ALTER TABLE `bookstbl` DISABLE KEYS */;
INSERT INTO `bookstbl` VALUES (1,'넬레 노이하우스','B001','잔혹한 어머니의 날 1','2019-10-07','9791158791179',11520),(2,'넬레 노이하우스','B001','잔혹한 어머니의 날 2','2019-10-07','9791158791186',11520),(3,'매뉴 라인하트','B006','월드 오브 워크래프트 팝업북','2019-10-21','9788959527779',52200),(4,'묵향동후','B003','마도조사 2','2019-09-03','9791127852122',12600),(5,'오코제키 다이','B005','루팡의 딸','2019-09-25','9788998274412',13500),(6,'조엘 디케르','B001','스테파니 메일러 실종사건','2019-08-12','9788984373761',16200),(7,'이지환','B002','닥터 퀸 1-2세트','2019-09-20','9791164664122',27000),(8,'김수지','B002','희란국 연가','2019-11-01','9791131594100',14000),(9,'알파타르트','B002','재혼 황후 1','2019-10-18','9791164790289',14000),(10,'안나 토드','B002','애프터 7','2019-08-30','9791188253166',14000),(11,'안타 토드','B002','애프터 8','2019-08-30','9791188253173',14000),(12,'남혜인','B002','아도니스 11','2019-08-26','9791163022237',11800),(13,'안드레아스 빙겔만','B001','쉐어하우스','2019-09-27','9791186809792',13320),(14,'비프케 로렌츠','B001','너도 곧 쉬게 될 거야','2019-09-18','9791162834930',12600),(15,'전건우','B001','어위크','2019-09-02','9791188660353',12600),(16,'토머스 해리스','B005','카리 모라','2019-09-11','9791158511470',15000),(17,'토머스 해리스','B005','한니발','2019-09-11','9791158511500',15000),(18,'정준','B003','화산전생 17','2019-08-23','9791128394683',8000),(19,'묵향동후','B003','마도조사 1','2019-07-30','9791127851446',14000),(20,'용대운','B003','군림천사 35','2019-07-26','9788926706763',9000),(21,'정준','B003','화산전생 15','2019-04-30','9791128394669',8000),(22,'김석진','B003','삼류무사 2부16','2019-04-02','9791135413698',8000),(23,'히가시노 게이고','B006','기도의 막이 내릴 때','2019-08-06','9788990982780',16800),(24,'히가시노 게이고','B006','악의','2019-07-25','9788972750031',14000),(25,'서철원','B004','최후의 만찬','2019-09-25','9791130625843',15000),(26,'마이 셰발, 페르 발뢰','B004','어느 끔찍한 남자','2019-09-20','9788954657648',12800),(27,'마이 셰발, 페르 발뢰','B004','폴리스, 폴리스, 포타티스모스!','2019-09-20','9788954656535',13800),(28,'김진명','B004','살수 1','2019-09-16','9788925567716',14800),(29,'김진명','B004','살수 2','2019-09-16','9788925567723',14800),(30,'손정미','B004','도공 서란','2019-09-16','9788965708575',14000),(31,'요안나','B002','순수하지 않은 감각','2019-10-02','9791135445705',12500),(32,'노승아','B002','오늘부터 천생연분 1','2019-09-18','9791130039480',12800),(33,'노승아','B002','오늘부터 선생연분 2','2019-09-18','9791130039497',12800),(34,'김이랑','B002','조선혼담공작소 꽃파당','2019-09-06','9791159099724',138000),(35,'전민석','B004','감치','2019-08-15','9788947545075',15000),(36,'나관중','B004','삼국지 세크','2019-07-25','9788936479497',60000),(37,'에리크 뷔야르','B004','그날의 비밀','2019-07-20','9788932919751',12800),(38,'요 네스뵈','B004','폴리스','2019-07-08','9788934996699',16000),(39,'T. M. 로건','B005','29초','2019-09-18','9788950983208',15000),(40,'토머스 해리스','B005','양들의 침묵','2019-09-11','9791158511494',15000),(41,'송시우','B005','대나무가 우는 섬','2019-09-06','9788952739087',14000),(42,'A. J. 핀','B005','우먼 인 윈도','2019-09-03','9788934998952',15800),(43,'이정명','B005','밤의 양들 1','2019-08-30','9791189982461',11500),(44,'이정명','B005','밤의 양들 2','2019-08-30','9791189982478',11500),(45,'정해연','B005','내가 죽였다','2019-08-21','9791160748604',14000),(46,'정준','B003','화산전생 16','2019-07-19','9791128394676',8000),(47,'무공진','B003','화중매 상하 세트','2019-07-15','9791162764428',32000),(48,'촌부','B003','천애협로 10','2019-06-03','9791104920066',8000),(49,'손선영','B003','소암, 바람의 노래','2019-05-17','9791187440475',13800),(50,'전민희','B006','룬의 아이들 블러디드 2','2019-09-25','9788954657556',14500),(51,'요나스 요나손','B006','핵을 들고 도망친 101세 노인','2019-09-25','9788932919874',14800),(52,'닐 셔스터먼, 재러드 셔스터먼','B006','드라이','2019-09-20','9788936477783',15800),(53,'스테파니 버지스','B006','초콜릿 하트 드래곤','2019-09-04','9791135443947',14800),(54,'브누아 필리퐁','B001','루거 총을 든 할머니','2019-07-30','9791190182591',13500),(55,'캐서린 스테드먼','B001','썸씽 인 더 워터','2019-07-24','9788950982164',13500),(56,'에이미 몰로이','B001','퍼펙트 마더','2019-07-22','9791130623177',14220),(57,'지건, 콕콕','B001','잔혹동화','2019-07-20','9791161950938',12420),(58,'류츠신','B006','삼체 3','2019-09-25','9788954439923',17500),(59,'히가시노 게이고','B006','방과 후','2019-07-10','9791163898078',14800);
/*!40000 ALTER TABLE `bookstbl` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `membertbl` WRITE;
/*!40000 ALTER TABLE `membertbl` DISABLE KEYS */;
INSERT INTO `membertbl` VALUES (1,'성명건','A','부산시 해운대구','010-6683-7732','smg@naver.com'),(2,'곽지은','A','부산시 사하구','010-2967-1016','gjw@naver.com'),(3,'구자인','B','부산시 남구','010-9291-4419','gji@daum.com'),(4,'김예서','B','부산시 북구','010-8956-7423','kys@gmail.com'),(5,'김지현','D','부산시 영도구','010-8736-2919','jjh@hotmail.com'),(6,'박성현','A','부산시 강서구','010-9295-6600','psh@yahoo.co.kr'),(7,'박영훈','C','부산시 동래구','010-5341-0128','pyh@naver.com'),(8,'박주현','A','부산시 중구','010-2244-0675','pjh@empal.com'),(9,'박효창','D','부산시 수영구','010-6318-2590','phc@hotmail.com'),(10,'손민성','A','부산시 강서구','010-5615-1344','sms@nate.com'),(11,'안정재','C','김해시 삼안동','010-9291-0882','ajj@dreamwiz.com'),(12,'오슬예나','D','부산시 남구','010-8956-6008','osyn@korea.com'),(13,'오유리나','A','부산시 금정구','010-2923-2919','oyln@hotmail.com'),(14,'오윤범','B','부산시 부산진구','010-9295-5718','oyb@gmail.com'),(15,'이가연','D','부산시 동구','010-9341-0128','lgy@naver.com'),(16,'이동훈','A','부산시 사상구','010-5436-0675','ldh@hotmail.com'),(17,'이수진','C','부산시 남구','010-6318-4654','lsj@freechal.com'),(18,'이용환','A','부산시 남구','010-5615-7437','lyh@nate.com'),(19,'이재욱','B','부산시 수영구','010-6566-4419','ljw@daum.com'),(20,'이주현','C','부산시 사상구','010-8956-1508','ljh@gmail.com'),(21,'이태윤','B','부산시 연제구','010-5667-2919','lty@hotmail.com'),(22,'임수진','A','부산시 해운대구','010-9295-0341','lsj@yahoo.com'),(23,'임채연','A','부산시 사하구','010-5341-4736','lcy@naver.com'),(24,'장시현','A','부산시 금정구','010-2244-5121','jsh@empal.com'),(25,'정수민','B','부산시 수영구','010-6318-3734','jsm@hotmail.com'),(26,'정재영','C','부산시 영도구','010-9090-7866','jjy@gmail.com'),(27,'조원준','A','부산시 남구','010-6790-2355','jwj@naver.com'),(28,'최수정','B','부산시 중구','010-9433-2988','csj@naver.com'),(29,'홍동현','A','부산시 북구','010-5656-7676','gdh@yahoo.com'),(30,'한승민','B','부산시 수영구','010-4980-7643','hsm@gmail.com'),(31,'황소영','C','부산시 서구','010-4388-9078','hsy@nate.com');
/*!40000 ALTER TABLE `membertbl` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `rentaltbl` WRITE;
/*!40000 ALTER TABLE `rentaltbl` DISABLE KEYS */;
INSERT INTO `rentaltbl` VALUES (1,22,30,'2023-01-03','2023-01-15'),(2,10,10,'2023-02-01',NULL),(3,1,12,'2023-02-01','2023-02-03'),(4,25,34,'2023-02-02',NULL),(5,23,22,'2023-02-11','2023-02-17'),(6,7,30,'2023-02-14',NULL),(7,9,31,'2023-02-14','2023-02-17'),(8,21,15,'2023-02-18','2023-02-18'),(9,22,17,'2023-02-20','2023-02-25'),(10,14,7,'2023-02-26','2023-02-28'),(11,15,9,'2023-03-01','2023-03-05'),(12,19,44,'2023-03-02',NULL),(13,20,59,'2023-03-03','2023-03-08'),(14,24,24,'2023-03-08','2023-03-09');
/*!40000 ALTER TABLE `rentaltbl` ENABLE KEYS */;
UNLOCK TABLES;