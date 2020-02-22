-- MySQL dump 10.13  Distrib 5.7.24, for Win32 (AMD64)
--
-- Host: localhost    Database: buildra
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract` (
  `code` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `work` smallint(5) unsigned NOT NULL,
  `storage_link` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`),
  KEY `idx_contract_ts` (`created_at`) USING BTREE,
  KEY `idx_contract_work` (`work`),
  CONSTRAINT `fk_contract_work` FOREIGN KEY (`work`) REFERENCES `work` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `fiscal_code` varchar(16) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `residence` varchar(32) DEFAULT NULL,
  `birth_place` varchar(64) NOT NULL,
  `birthdate` date NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`fiscal_code`),
  KEY `idx_customer_fc` (`fiscal_code`),
  KEY `idx_customer_fn` (`first_name`),
  KEY `idx_customer_ln` (`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('ADNRJI08H17R037R','Harley','Block','74971 Torphy Creek','Ryannberg','1982-12-10','bradly17@example.org'),('BGGSHQ63U08R002M','Julien','Towne','32607 Braun Flat','Jayceeburgh','1998-04-30','lourdes.zieme@example.com'),('CJZFGH97N18Q197I','Ludwig','Hammes','94586 Mosciski Divide','Kallietown','2010-12-10','vfeeney@example.com'),('DUPRUZ08Y64J056H','Arne','Adams','0262 Breitenberg Island Apt. 770','South Robertaborough','2007-09-15','pberge@example.org'),('EOPDSY10L81V760C','Santos','Bernier','412 Citlalli Walk','East Merle','2002-07-12','aiden.mosciski@example.org'),('GKKFZE80K70G005Q','Wayne','Kassulke','641 Becker Terrace Suite 880','New Imeldachester','2009-06-22','thaddeus23@example.com'),('GLUIGZ60E25J195S','Max','Kilback','785 Marcelle Fork Apt. 883','Gorczanyville','2015-01-04','tschoen@example.net'),('HZSYKC35Z38Y320L','Penelope','Nader','6829 Garland Islands','Rempelfort','2015-03-23','schroeder.lauryn@example.net'),('JOHEXR42V44F663P','Liam','Hodkiewicz','7936 Janet Glen Apt. 909','New Rettamouth','1975-02-24','abdullah.gerlach@example.com'),('KQXZOP17J28K258B','Lois','Wilkinson','6872 Predovic Squares Suite 093','Lindgrentown','1995-11-09','avery.parker@example.com'),('LLBOVK71T96J085V','Melisa','Parisian','340 Iva Trail Suite 823','Brekkeborough','1995-01-01','heaven44@example.org'),('OBOYKO44F03W146Y','Felipe','Sanford','5839 Alia Rest Suite 219','Reidfort','2011-10-05','jkiehn@example.org'),('ORQJOV96S61X360K','Tillman','Abbott','82750 Waters Springs Suite 986','Zulaufberg','2002-05-16','ykutch@example.com'),('QEXJMR25Z77C797K','Noemie','Morar','250 Liliana Ferry Apt. 800','Port Georgianaburgh','2015-12-30','acarter@example.org'),('TKFKFB77J30N007P','Reyes','Nienow','9238 Bins Club','Bartholomemouth','2005-05-05','stokes.joana@example.net'),('VAMGTB02I37H135I','Verda','Kautzer','8888 Jacinto Route Apt. 401','Lake Chesley','1977-11-18','michaela.abernathy@example.net'),('VTRBGV80V83L885B','Salma','Wyman','48878 Pfeffer Key Suite 824','McCulloughchester','2001-02-06','msmitham@example.com'),('WJODCE98K72P773X','Lillian','Corkery','9647 Mitchel River Suite 543','East Gusborough','1972-04-10','raymond85@example.net'),('WQQSGL69O57G544F','Benny','Spinka','22850 O Reilly Harbors','Hahnfurt','2013-02-20','bins.aric@example.net'),('WUYJAI06F37K404T','Rosie','Kutch','97042 Haylie Courts Apt. 049','South Jerry','1979-03-09','terrell.hills@example.com'),('XZOUJI56H63Q385I','Katlyn','Schmidt','8755 Stan Mews','Ethashire','2007-07-23','runolfsdottir.keely@example.org'),('YUIYIH09X52Z326K','Tevin','Stamm','578 Balistreri Point','Coleton','1998-07-12','rhett.sawayn@example.org'),('YWZNQB43B35K739M','Serenity','Hermiston','20183 Goldner Ramp Suite 116','Lake Bernhard','2006-11-02','dorris17@example.net'),('ZFOGCX78K87U835L','Coralie','Ferry','5393 Gerda Via Apt. 360','Port Gaetano','1972-05-17','josianne.pouros@example.net');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `fiscal_code` varchar(16) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `hourly_wage` decimal(4,2) NOT NULL,
  PRIMARY KEY (`fiscal_code`),
  KEY `idx_employee_fn` (`first_name`),
  KEY `idx_employee_ln` (`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('aumefe99t99b999y','Ben','Goodwin',4.00),('htyaxn99f99n999j','Quinton','Anderson',8.00),('ppvsou99b99w999u','Johnathon','Hyatt',6.00),('vphnch99d99u999e','Beaulah','Deckow',4.00),('xqehkm99x99n999r','Carley','Bauch',7.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `code` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `base_unit` varchar(8) NOT NULL,
  `seller` varchar(256) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `idx_item_name` (`name`),
  FULLTEXT KEY `idx_item_desc` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'repellendus','Magni possimus aut tenetur ut. Ullam asperiores sint voluptatem quam maxime delectus architecto. Qui maxime quo maiores blanditiis consectetur.',58.87,'p','Herman LLC'),(2,'incidunt','Corrupti ea repellendus voluptate porro. Quidem est iusto soluta neque velit qui cum. Et quod non numquam itaque qui porro sint omnis.',45.22,'g','Torp, White and Moen'),(3,'beatae','Excepturi similique aut recusandae. Pariatur eveniet ea exercitationem. Impedit velit doloremque placeat vero incidunt id hic illum.',53.52,'t','Hessel, Lesch and Weber'),(4,'minus','Quia dicta neque voluptatem mollitia qui. Dignissimos quia quae facere consequuntur nulla commodi rerum. Molestias vero sed pariatur voluptates nemo recusandae aut. Sint magni ut dolores et dolores voluptas dicta.',8.25,'a','Hayes-Hettinger'),(5,'nobis','Accusamus excepturi autem nam voluptatum. Fugiat vel facilis sunt. Incidunt porro mollitia praesentium aut.',89.18,'n','Greenholt Ltd'),(6,'ut','Tenetur iure qui commodi natus blanditiis maiores. Optio repudiandae delectus enim ut impedit ea rerum. Et est maiores hic eligendi et quia ut. Quidem tempore ipsa sint sed optio.',16.06,'z','Collins Inc'),(7,'officia','Totam natus quibusdam blanditiis nostrum. Impedit mollitia qui quis rerum. Qui sed et laborum omnis rerum amet ea.',19.98,'d','Klein-White'),(8,'dicta','Et corporis et ab quae. Natus corporis autem dolorem. Ex ut enim repudiandae.',34.61,'s','Eichmann-Nolan'),(9,'voluptatem','Et amet dicta ipsam excepturi quia vitae. Enim ex earum at similique placeat vel.',72.72,'s','Windler, Connelly and Langosh'),(10,'perferendis','In tempore minima quia. Eveniet ut magni et eos animi. Molestiae iure quia explicabo voluptates eveniet sit ipsa. Est in sed recusandae sed qui quidem quis.',12.66,'a','Breitenberg LLC'),(11,'ea','Ipsum repudiandae facilis et occaecati aut soluta. Dolore repudiandae quae et soluta iure aliquid. Delectus culpa possimus et recusandae dolorum tempora. Facere officia incidunt sint error id magni repudiandae voluptatem. Quia non autem ut repellendus accusantium error.',36.10,'c','Bins, McLaughlin and Ankunding'),(12,'in','Aut debitis cupiditate dignissimos. Mollitia voluptates ut quo voluptatum dolorem. Sed possimus voluptas vitae sit dolorem.',79.30,'j','Dare LLC'),(13,'est','Itaque dolorem earum aut cum ut debitis laborum. Possimus dolore sit atque consequatur. Voluptatem temporibus quos maxime eius non.',6.84,'z','Veum, Abshire and Dickinson'),(14,'et','Quod occaecati ea rerum. Eum hic perferendis facilis quisquam laboriosam tenetur quis. Dolor nobis voluptatem voluptates voluptas delectus.',51.81,'m','Kerluke, Paucek and Kuhlman'),(15,'necessitatibus','Voluptatem ex quas rerum qui est. Libero ipsa labore nobis expedita quod. Cumque nam ea aut necessitatibus id vitae. Consectetur deleniti ex eum.',7.81,'b','D Amore LLC'),(16,'porro','Consequatur neque ipsa eum eos consequatur. Iusto quos aut quibusdam eos molestias soluta quas beatae. Officia est repellendus qui provident. Praesentium dolores voluptatem quasi eaque.',47.02,'u','Altenwerth-Hudson'),(17,'sapiente','Autem repellendus omnis repellendus consequuntur ea. Dolorum nostrum quia ut veritatis delectus ullam. Minus ipsum laboriosam in. Voluptatibus quia laudantium saepe.',75.42,'v','Walter LLC'),(18,'dolorem','Quis occaecati reprehenderit sint hic nulla eveniet. Nam aut sed incidunt assumenda facere. Eveniet dicta laborum assumenda. Esse quisquam et earum aut et voluptas.',27.55,'y','Harris Inc'),(19,'odit','Voluptate molestias veritatis commodi fugiat dolor. Eos quod enim aut temporibus quia. Ipsum eos ullam praesentium atque ratione.',93.16,'c','Heidenreich, Schowalter and Ward'),(20,'enim','Sed consequatur totam iure inventore in delectus. Ratione sunt consequatur est laborum. Enim cupiditate eos vero quia non qui nam.',60.68,'j','Buckridge, Koss and Turcotte'),(21,'quia','Eos neque nesciunt recusandae nihil nemo. Aut fugiat dolore eveniet est perspiciatis cumque. Sequi ut eos eligendi et veniam.',97.52,'u','Howe-Kirlin'),(22,'magni','Sint nihil sequi omnis est. Id laboriosam quia cumque. Commodi et eos quia debitis ut et alias.',71.59,'n','Botsford PLC'),(23,'sunt','Inventore dolor repellendus sequi quia dolor quaerat. Aut architecto itaque ut deserunt. Excepturi commodi consectetur magnam nihil corporis. Omnis enim nisi quis cumque eligendi aspernatur ipsam.',23.10,'l','Schulist, Kshlerin and Kassulke'),(24,'qui','Totam dolor aut ea et aut nam debitis. Atque nulla vitae quia totam omnis voluptatem.',42.23,'a','Blick Ltd'),(25,'eum','Qui nihil eos dolor et fugit. Sequi exercitationem placeat ex est est ab est. Non dolor quisquam sed alias et. Provident ab labore dolorum doloribus quos dolore atque modi.',66.64,'s','Beier-Mayer'),(26,'sit','Qui quam est et nobis quas ut. Voluptatem vero placeat dignissimos et. Repudiandae illo deserunt quis repudiandae aliquid reprehenderit aut. Voluptate eveniet ullam pariatur totam beatae velit.',14.61,'i','Bashirian-Cole'),(27,'nostrum','Rem quos dolorem rem. Natus beatae provident quia qui. Ipsum est id quaerat dolorem occaecati quis error magnam.',80.47,'p','McKenzie-Collier'),(28,'autem','Sunt ullam illo et esse. Ipsum omnis aspernatur facere voluptas sunt minus qui. Non rem ipsam illo cupiditate. Sed earum reiciendis sint.',33.54,'v','Gorczany-Fisher'),(29,'animi','Minus nam sit id natus autem. Cumque dolores officia voluptatem enim aut sunt assumenda. Voluptate natus sed deserunt eveniet qui distinctio. Ipsa eius velit maiores inventore.',98.16,'f','Glover, McCullough and Parisian'),(30,'aut','Rerum omnis enim nesciunt nisi at aut debitis. Iusto sunt aut eligendi iste. In aliquid delectus eum sint fugit aut.',61.19,'r','Hamill, Dickens and Mayer'),(31,'veniam','Atque magni molestiae tenetur harum eaque vel possimus debitis. Praesentium neque voluptatem esse rem aut nemo veritatis. Aut maxime enim ut optio nobis saepe. Consequatur earum debitis dicta.',49.74,'d','Pfeffer PLC'),(32,'non','Blanditiis cum cupiditate magnam nam. Atque tempora odio quis et architecto nesciunt eius. Qui quasi quia voluptatem repellendus repellat praesentium atque.',48.85,'b','Douglas Inc'),(33,'ea','Autem numquam repellendus veritatis voluptas non necessitatibus sit sit. Dolore rem explicabo ea in. Sit veritatis aliquam voluptas quo. Enim enim est quia et laboriosam aliquid vel.',55.92,'x','Lindgren and Sons'),(34,'atque','Ut voluptas odit dolorem magni reiciendis aut. Deleniti debitis et est aut sit sit autem consectetur. Vitae quo sed tempora sapiente quidem dignissimos. Et id assumenda sed nesciunt quas.',67.07,'v','Langworth-Carter'),(35,'aut','Vel omnis aut eum facilis repudiandae vero. Voluptates aliquam ut labore. Nostrum accusamus suscipit sed ad.',68.86,'o','Witting, Pouros and Schuppe'),(36,'quo','Dicta aut eum autem. Nisi incidunt dicta consequatur ex porro.',30.03,'e','Lebsack LLC'),(37,'quia','Voluptatibus harum ipsa ex dolor perspiciatis. Omnis ut iste consequatur soluta aspernatur.',35.07,'q','Abbott Inc'),(38,'saepe','Ut minus qui ad. Maxime necessitatibus recusandae dolores quo inventore. Minima ex cupiditate nobis.',11.94,'a','Kuhic-Greenholt'),(39,'nihil','Adipisci reprehenderit et doloribus. Nam ut dolor pariatur laborum repellendus necessitatibus est. Autem aut sit autem commodi. Nihil eum molestiae tenetur dolores.',71.04,'k','Spinka-Hills'),(40,'reiciendis','Illum sed quia assumenda at quia saepe. Reiciendis sit ea fugit debitis modi. Aut accusamus ipsa pariatur iusto veritatis officiis facilis dolorem.',61.46,'k','Lehner, Mraz and Upton'),(41,'nulla','Totam et tempora iure odit nihil veniam omnis nihil. Ex sequi alias pariatur molestias rerum qui et dolor. Laboriosam nobis praesentium quos ut dolores ut.',26.20,'u','Rippin, Jakubowski and D Amore'),(42,'voluptatibus','Ipsam similique occaecati dolore ut ut asperiores nulla. Et enim ea tempora enim quia eos in sint. Saepe dolores laborum dolorem aliquid consequuntur quisquam itaque ab. Praesentium temporibus suscipit dolore porro ut. Explicabo non voluptas sint ad deleniti adipisci reprehenderit.',78.04,'m','Effertz Group'),(43,'non','Id consequuntur placeat totam quaerat tempora accusantium. Accusamus quia ex eaque voluptatum consectetur. Sint alias qui saepe adipisci sit.',46.22,'u','Windler, Berge and Casper'),(44,'quidem','Dolorum sed officiis asperiores error velit repellat sunt. Eos mollitia porro ipsam ad. Ut doloremque nulla quaerat et totam occaecati. Voluptatem pariatur neque enim amet.',54.12,'u','Keeling-Conn'),(45,'quod','Ratione nihil est similique illo vel. Aut sunt iste possimus eum enim voluptates qui.',93.27,'d','Kuhlman-Muller'),(46,'et','Qui eum quisquam hic reiciendis numquam. Nobis vel et dignissimos et.',39.73,'r','Berge-Wolf'),(47,'dolore','Itaque vel est sint aspernatur. Voluptatibus similique illum accusantium. Ut quaerat quos fugiat nemo inventore minima. Voluptas delectus qui delectus quo laudantium.',80.46,'m','Kuhn-Marks'),(48,'dolor','Adipisci ut nulla velit corrupti optio et ipsa. Voluptas molestiae sit modi consequatur laboriosam autem quo. Voluptatem quae sapiente harum accusantium qui dolorum voluptate. Et ut debitis recusandae unde eaque.',20.65,'n','Lueilwitz-Breitenberg'),(49,'quis','Fugit tenetur et voluptates debitis delectus. Error et iste vel ea corporis. Rem expedita quam incidunt aut repudiandae iste dolores.',41.94,'d','Boehm Ltd'),(50,'aperiam','Illum neque enim eum consequuntur. Iure repudiandae dolor officia est id rerum ea.',77.84,'c','Daniel-VonRueden'),(51,'ut','Ut sed ab numquam nulla omnis voluptatem modi aperiam. Ut molestiae rerum minima excepturi. Id rerum quia nesciunt doloribus. Voluptatem pariatur alias eum quasi.',87.57,'q','Turner-Hoppe'),(52,'sunt','Eius veritatis voluptatibus provident accusantium saepe est ut nobis. Quod ad reprehenderit ex deleniti repudiandae. Est vel ut repellat ad sed saepe vel natus.',15.16,'i','Sauer, Eichmann and Dicki'),(53,'nihil','Dolor voluptates incidunt voluptatibus ut. Error dolores et quae exercitationem eligendi. Sit voluptas corporis sunt voluptatibus.',19.90,'s','Fritsch-Funk'),(54,'enim','Sapiente saepe nemo inventore et unde sed labore delectus. Sed et non neque qui animi eaque. Dolor et voluptate tempora eaque.',36.74,'j','Crona-Boyer'),(55,'voluptates','Repudiandae fuga enim suscipit exercitationem recusandae aut doloribus autem. Quo vel ut quo aut. Ex non quam est repellat ut veniam qui. Veniam necessitatibus accusantium rem voluptatem. Quos magni omnis ducimus.',41.82,'v','Beahan-O Reilly'),(56,'vel','Perspiciatis ea occaecati cumque dolores cum a. Amet qui et aut voluptas. Voluptas quae in dolorem ut.',61.09,'b','Kovacek-Bednar'),(57,'sapiente','Ea quod molestias dignissimos et. Qui et saepe sed nihil nisi. Aut quaerat est ut officia eaque iste.',92.34,'n','Ebert-Cartwright'),(58,'veritatis','Commodi eius nisi earum qui autem. Assumenda aut aperiam corporis assumenda velit dolores laborum quo. Qui in eos voluptates enim.',6.63,'d','Bailey, Zieme and Glover'),(59,'atque','Odio non nostrum voluptas quidem recusandae. Vitae eum sequi soluta doloribus rem ratione enim.',85.54,'d','Kerluke and Sons'),(60,'et','Quam labore fugit itaque porro est corporis quos. At quibusdam qui harum iste consequatur. Eum voluptas minus dicta est minima. Incidunt iusto officia ea temporibus est.',28.82,'z','Anderson-Yundt'),(61,'laboriosam','Excepturi dolores corrupti eaque necessitatibus. Sint magni velit alias.',59.48,'w','Barrows, Luettgen and Sipes'),(62,'est','Tenetur soluta nesciunt voluptatem aut. Accusamus sed velit quidem dolores voluptatem aut voluptatum. Porro nobis quia quae eligendi. Maiores nobis nam error.',49.19,'s','Lowe Group'),(63,'quia','Ut rerum temporibus ullam quia dolore similique ducimus. Reiciendis cumque enim sapiente quia molestiae odio. Sit eaque saepe laboriosam. Consequuntur et quae qui aspernatur.',59.98,'p','Brown Inc'),(64,'nobis','Mollitia cumque et sed quod voluptatem. Ducimus aut neque sequi ipsam occaecati quis cupiditate. Culpa nemo veritatis aut dolor nisi reprehenderit consequatur nisi. Consequatur sapiente dolor necessitatibus veritatis ut consectetur.',31.25,'b','Bergnaum, Stoltenberg and Ritchie'),(65,'necessitatibus','Suscipit voluptatum dolor nam adipisci velit nam qui dolores. Aut perspiciatis nam rerum repellendus tempora.',29.98,'h','Mante, Bayer and Wintheiser'),(66,'repellendus','Non mollitia nesciunt soluta debitis. Voluptas et consequatur autem dolorum rerum eos non. Atque explicabo porro commodi in odio. A ipsam autem tenetur excepturi rerum ex quos.',9.21,'u','Schoen-Kemmer'),(67,'est','Harum eos enim qui qui. Eveniet aut ipsa recusandae maxime ea tenetur dolorum. Rerum cum voluptatem ab vero sed itaque. Et minima iusto in sit doloribus.',82.15,'k','Dare PLC'),(68,'qui','Nam voluptatibus molestiae quisquam expedita asperiores perspiciatis ut. Et et consequatur ea debitis quam qui. Sunt assumenda officiis reiciendis atque veniam.',63.85,'w','Parker-Gislason'),(69,'perspiciatis','Aspernatur eveniet consequatur doloribus. Adipisci dolor ipsam ut. Ut accusamus libero dolor soluta earum.',61.14,'g','Swift-Collins'),(70,'sequi','Ad sed eum quia amet. Omnis saepe autem debitis explicabo doloribus et.',49.00,'b','Shields PLC'),(71,'vitae','Suscipit explicabo rerum et nulla explicabo itaque. Autem voluptatem velit sapiente nemo quibusdam. Iste est ex illo odit est. Qui nisi quos voluptatem enim doloribus.',85.06,'s','Hoeger-Bednar'),(72,'voluptatem','Distinctio et nihil vel excepturi molestiae a. Ut qui rerum sint soluta est esse cum. Iure aut sint doloremque optio libero illum a.',84.71,'l','Beer PLC'),(73,'ipsum','Soluta repellat recusandae molestiae nihil veritatis. Tempora omnis autem libero. Itaque qui eius et harum quia. Sed soluta minus vitae nobis eaque sunt ut illo.',83.83,'u','Littel-Grant'),(74,'dolores','Eius a iste consequuntur pariatur officia. Animi voluptas et facilis quis laudantium quis odio. Aperiam temporibus at ea quo consequuntur quia blanditiis. Suscipit perferendis et ipsa.',27.64,'t','Casper, Johns and Smitham'),(75,'sequi','Ut et eos est qui sint autem maiores. Fugit distinctio tempore non at dolorem distinctio. Totam sint rem et nisi. Corporis dolor provident a quo in optio assumenda quis.',36.01,'y','Graham-Keebler'),(76,'sed','Impedit qui vel pariatur repudiandae porro impedit molestias odit. Quo aut nihil vero in pariatur. Unde odit aliquid et quas nobis.',20.94,'p','Moore Group'),(77,'ipsum','Rerum dolores quaerat aut adipisci quia. Ea nihil ab et. Voluptatibus ad non sequi aut iste odio delectus.',12.79,'d','Effertz Inc'),(78,'ut','Ut possimus adipisci consectetur saepe et quia ut. Sit impedit praesentium rerum dolor. Consequatur est doloribus similique ut itaque non. Rem non voluptas rerum recusandae.',16.08,'i','Rosenbaum Inc'),(79,'non','Doloribus quaerat itaque fuga maiores molestiae quasi velit. Provident illum repellat aperiam qui. Doloremque ut quaerat ab saepe eaque non tenetur. Sed ut nihil ratione doloribus.',49.10,'v','Jakubowski LLC'),(80,'pariatur','Quasi nemo placeat a tempora minus esse. Dolor nam libero id nostrum itaque. Pariatur vitae consectetur natus minima id et.',98.95,'r','Hagenes, Fisher and Rodriguez'),(81,'debitis','Explicabo architecto illum enim atque iste modi autem. Sed quos dolorum nam pariatur qui distinctio quis. Qui occaecati dolor quis vitae nisi. Porro rerum reprehenderit porro dolor fugiat facilis. Sequi voluptatem et deleniti sunt mollitia aut.',87.91,'s','Farrell and Sons'),(82,'sed','Rerum neque aliquam dolor dolor voluptatem nostrum. Nisi nisi ut eveniet molestias aut. Deserunt sed necessitatibus qui ullam illo deleniti enim. Ab temporibus doloribus et sed autem molestiae vel.',30.68,'c','Miller, Schuster and Heaney'),(83,'voluptate','Sint qui animi animi ut occaecati quia. Voluptatum tempora nesciunt quos maiores nihil. Ea deserunt reprehenderit voluptas magni neque quidem. Repellat alias voluptas qui.',25.65,'m','Cole, Roob and Prosacco'),(84,'ad','Ullam fugit totam eos maiores. Et necessitatibus velit rerum repudiandae tempore accusantium. Sed animi magnam et perferendis quibusdam quis ipsam aliquid.',27.49,'r','Hodkiewicz, Bernier and Fahey'),(85,'enim','Qui sed et placeat quod error ea sit. Nemo omnis aliquid nihil repudiandae perspiciatis placeat. Deleniti aliquam ut voluptas illum. Voluptas eum nulla mollitia odit rem nulla. Excepturi ipsum reiciendis aut cupiditate optio nihil sit.',7.03,'y','Larkin and Sons'),(86,'tenetur','Aut laborum quia laboriosam sint. Sequi qui impedit odit. Animi non nihil quo commodi sit. Voluptatem harum quia voluptate inventore tenetur nostrum dolores.',28.30,'x','Johnson, Reichel and Nader'),(87,'aut','Ut sit amet qui iste. Eos amet exercitationem ut provident quaerat possimus ad. Quo accusantium alias numquam ut dolor ipsam modi. Consequatur voluptas quibusdam ea quo officia accusantium quo. Ipsam delectus dicta laborum voluptatem quas.',78.00,'r','Jenkins-Crooks'),(88,'ut','Aut debitis minus iure qui. Rerum ratione dolorem quasi eius.',94.48,'k','Quigley, Grimes and D Amore'),(89,'qui','Quisquam rem molestiae rerum enim. Voluptatum in quaerat est debitis. Commodi sunt totam aliquid corporis et nemo cumque. Itaque et rerum quis reiciendis rerum reiciendis.',47.61,'a','Bartoletti PLC'),(90,'aut','Rerum est repudiandae sint asperiores libero quo. Explicabo voluptatum sequi eveniet et sed molestias. Doloribus dicta quos ducimus minima. Voluptates suscipit voluptatem corporis error culpa voluptatibus non ex. Est quam fugiat perferendis voluptas reiciendis cumque.',33.77,'v','Reinger, Dare and Breitenberg'),(91,'est','Omnis quam inventore aut ut laborum iusto. Et est atque laudantium quod sint. Consequatur ipsam natus perferendis iste. Animi cupiditate beatae voluptas et voluptatum.',83.49,'y','Pfeffer, Osinski and Hagenes'),(92,'numquam','Quos vel consequatur sed impedit recusandae eum et sunt. Itaque omnis nemo ex soluta perspiciatis officia perspiciatis. Nobis rerum quos et quo molestiae.',92.49,'c','Stokes-Reichel'),(93,'aliquid','Neque aut quod cum placeat. Dolore est voluptatum pariatur ut voluptas dolorem minus modi. Laboriosam iste dolorem ut veniam porro magnam omnis aut.',35.41,'h','Rath Group'),(94,'nobis','Omnis optio facere vel. Consequatur consectetur et accusamus deleniti molestiae et. Dolor tempora possimus inventore deserunt et ut. Omnis excepturi et illo et sint mollitia occaecati.',46.94,'x','Lowe-Skiles'),(95,'cupiditate','Ea non delectus nulla quam aut ut. Vitae eligendi recusandae eveniet libero et consequatur. Nisi expedita architecto qui molestias laudantium nam.',66.39,'j','Baumbach, Morar and Hodkiewicz'),(96,'autem','Minus mollitia adipisci facilis dolorum et consequuntur officiis dolorem. Iure et quia hic perferendis. Id vel in cupiditate alias quas necessitatibus. Consectetur ducimus delectus ab rem atque dolor aut.',89.55,'c','Lang Ltd'),(97,'sed','Error voluptate est debitis omnis est rerum. Et dignissimos et et provident laborum consequatur dicta. Temporibus debitis eligendi optio.',78.27,'a','Zboncak, Halvorson and Stroman'),(98,'distinctio','Ut et animi possimus. Odio id est sunt enim et et saepe. Qui corporis aut consequuntur qui dolorem.',79.36,'o','Jones-Shanahan'),(99,'repellendus','Necessitatibus culpa inventore accusamus occaecati provident tenetur. Similique quis nihil id eaque. Quam dolor adipisci reprehenderit dolor.',88.30,'m','Klein-Gleichner'),(100,'alias','Quia officiis assumenda temporibus sit vel eius. Ut est quas magni vero eum non sed delectus. Non ut mollitia soluta.',80.36,'x','Gerlach-Goyette'),(101,'recusandae','Voluptas et rerum voluptas a perferendis. Corporis adipisci repellendus consectetur totam cumque consequatur qui.',18.26,'o','Kutch LLC'),(102,'architecto','Reiciendis reiciendis dignissimos magni asperiores amet quasi enim. Aliquam aliquid et sunt explicabo amet. Est repellat illo quibusdam repellat vitae odit id.',5.09,'b','O Kon Inc'),(103,'in','Expedita accusantium ullam non voluptas recusandae. Sequi et rem debitis voluptates a. Et animi aspernatur qui sunt voluptatum assumenda repellat quae.',77.57,'i','VonRueden-Dare'),(104,'cumque','Eum rerum ea rerum quasi vitae qui iste. In repellat iste fuga necessitatibus sapiente sit perferendis nisi. Sint quia quas reprehenderit fugiat ullam alias. Ea corporis est similique possimus vitae ut.',72.67,'c','Brakus PLC'),(105,'qui','Dolorum accusamus sunt doloribus non eaque quam. Suscipit autem quo neque excepturi itaque rerum. Est laborum nihil sapiente minus temporibus. Beatae ad fugiat nihil quis voluptas.',78.65,'y','Koch, Gaylord and Pouros'),(106,'nihil','Debitis rerum eveniet qui dolorum. Similique cupiditate quae optio dolorem neque sunt velit. Suscipit vel tempora officia autem qui omnis. Veritatis ea exercitationem nostrum laboriosam dicta et cumque repudiandae.',60.70,'k','Halvorson, Wintheiser and Nicolas'),(107,'eaque','Beatae optio soluta sed et. Sit unde soluta voluptatem voluptas nostrum dolorem eum. Rerum excepturi cumque quidem reprehenderit natus dolorem.',33.39,'o','Schoen, Johns and Moore'),(108,'nostrum','Dolor iusto harum adipisci consequatur ex. Error accusamus autem amet ea cupiditate est et. Vero aspernatur quo tempora at explicabo quas.',9.01,'a','Olson-Cruickshank'),(109,'modi','Neque corrupti perferendis illo eaque beatae aut nostrum. Et maxime rerum aut voluptas. Non incidunt porro molestias aut modi.',16.38,'s','Macejkovic, Botsford and Hilpert'),(110,'eos','Aspernatur eligendi rerum ea non perspiciatis quo explicabo. Et et neque et architecto.',69.52,'z','Kertzmann-Denesik'),(111,'eos','Dolor officia sint ut id. Et voluptatem qui autem rem. Itaque animi et ea tenetur modi et.',86.51,'x','Dare, Dare and Lang'),(112,'facere','Voluptatem deleniti et culpa perspiciatis provident expedita. Sed quia repellat quae doloremque excepturi. Voluptatum nostrum ut porro ut adipisci. Ullam officiis est suscipit.',94.28,'m','Little Group'),(113,'tempora','Aliquid sit ut qui qui. Blanditiis quis quod quis possimus. Ab reiciendis ea itaque sit ab quos quo. Quis eos laborum qui rerum odio.',89.70,'a','White-Douglas'),(114,'ut','Possimus earum et veritatis nobis minima adipisci aliquid. Similique perspiciatis deleniti deserunt quas ut id quia voluptatem. Vel similique quae animi qui possimus ut.',66.78,'h','Gulgowski-Heaney'),(115,'et','Aut ratione in sint et mollitia. Aut est fugiat odit ea commodi. Repellendus sit architecto voluptas voluptas perferendis enim molestias tenetur. Vel provident tenetur et nostrum ea consequatur repudiandae. Quidem qui ipsam quae doloribus harum delectus ipsum.',41.76,'n','Quigley-Rosenbaum'),(116,'nesciunt','Blanditiis eveniet consequatur animi quis. Voluptatem maxime quae eum corporis maiores ut voluptatem. Ut eius laudantium incidunt magnam quas quis quo. Officiis fuga et totam iste. Eum id ad saepe labore.',38.83,'v','Hamill-Schimmel'),(117,'vitae','Et eum consectetur voluptatem maiores. Sequi vitae perspiciatis omnis magnam odit veritatis explicabo. Deserunt ut eum tempora sit pariatur. Est eius facilis recusandae ex.',43.92,'d','Douglas-Klein'),(118,'quasi','Dolor aut culpa nihil minima ducimus. Dolor quis est temporibus tenetur. Ut voluptates totam sit provident et. Rerum suscipit eveniet fugiat consequuntur id ea vel.',54.66,'v','Hoppe, Schaden and Davis'),(119,'non','Ducimus nisi aliquam rerum facere. Quisquam non aut deserunt in et rem et. Nihil sit hic ex cupiditate. Eveniet aut libero exercitationem debitis.',83.39,'w','Nienow Ltd'),(120,'eum','Pariatur perferendis fuga quisquam error omnis est. Debitis et pariatur dolorem aut quidem dolores exercitationem. Ea repellat in asperiores illo sed odit.',61.82,'i','Stokes Inc'),(121,'commodi','Et quia asperiores iure voluptate eos aut animi. Et quis natus provident error quisquam error. Id facere quae quia corporis.',35.96,'d','Donnelly, Koepp and Hilpert'),(122,'itaque','Aperiam delectus quia quo est maiores. Totam natus molestias magnam illo repudiandae et totam. Illo sequi laudantium doloremque quasi mollitia labore sit. Laboriosam sunt ad consequatur animi quasi vel commodi laudantium.',35.66,'l','Wisozk LLC'),(123,'earum','Vero blanditiis nam quidem voluptatem consequatur nam veniam. Laborum vero exercitationem et rerum. Omnis veniam praesentium quisquam ipsum temporibus magnam quisquam.',95.17,'o','Kuphal-Grady'),(124,'repellat','Aperiam neque culpa at veniam numquam molestiae incidunt. Et quae sint et excepturi qui. Excepturi consequatur rerum in tempore reprehenderit est. Dolor sapiente necessitatibus veniam est architecto aut voluptas.',15.30,'x','Orn, Murphy and Kutch'),(125,'aut','Et error voluptatem et qui officiis rerum quo. Sint porro dolorem quisquam aperiam aut deserunt tempore. Fugit reiciendis fugit consectetur est. Deserunt explicabo consequatur quod explicabo quis in cumque.',76.15,'p','Schultz Ltd'),(126,'consequatur','Assumenda voluptatibus esse debitis dolor expedita sint. Consequatur architecto excepturi quo fugiat. Iusto quasi eius nobis dolor est facilis esse rerum.',97.46,'j','Haley, Shanahan and Zemlak'),(127,'beatae','Fuga pariatur quaerat qui delectus eum repellendus laborum. Omnis voluptatem pariatur vero placeat quo porro. Quia iure voluptatem commodi expedita est facere.',75.47,'f','Weber Inc'),(128,'dolor','Et temporibus quia architecto. Vero aut deserunt architecto sed soluta. Esse quia voluptatem in eligendi. Exercitationem voluptas eos minima ullam eos saepe sunt vero.',15.81,'e','Heaney-Erdman'),(129,'voluptatem','Molestiae ut deserunt ab dolorem ipsam atque. Dolor dolor tempora quod rerum at possimus. Voluptates illum ex quod debitis. Vitae consectetur aliquid eaque beatae.',93.06,'u','Klein and Sons'),(130,'nisi','Nihil asperiores voluptas ab aut. Tempore neque velit et aut omnis rerum.',20.12,'s','Ondricka, Effertz and Skiles'),(131,'beatae','Blanditiis sit consequatur corrupti voluptatem laudantium. Consequuntur aliquid quasi minima voluptas eveniet quod. Rem qui quis voluptas similique eum iusto consequuntur. Dolores ut deleniti dignissimos totam dignissimos.',64.41,'e','Lynch-Kautzer'),(132,'ut','Debitis nihil asperiores autem amet ut nobis deserunt. Consequuntur perspiciatis exercitationem minus dignissimos repellendus. Nam nostrum voluptas ut voluptate voluptas dolorem eum nostrum. Nihil aut rerum cumque dolorum qui.',21.50,'c','Morar, Witting and Prosacco'),(133,'est','Doloremque maiores sunt sit sit repudiandae. Ipsa odit aut et commodi nam laboriosam repellendus dignissimos. Perferendis sunt aut illo rerum ut voluptate. Impedit ipsa itaque autem repudiandae temporibus veritatis natus sapiente.',25.28,'z','Abshire-Deckow'),(134,'incidunt','Iure molestias voluptatem praesentium eum. Omnis accusantium non et ipsum. In nihil praesentium sapiente ut consectetur quasi laudantium fugit. Est blanditiis suscipit in id aut et animi recusandae.',71.31,'i','Aufderhar-Robel'),(135,'ut','Reiciendis quisquam voluptatem voluptatem distinctio quod placeat. Deserunt et consequatur non aut. Labore alias doloribus laudantium ratione perspiciatis non. Quia molestiae optio consectetur temporibus tenetur veniam.',13.55,'x','Klocko LLC'),(136,'iusto','Occaecati asperiores aut fugiat quo quisquam ipsa. Dignissimos excepturi error quia ratione et et facilis et. Quaerat ea ut sequi.',8.34,'l','Koch-Bogan'),(137,'est','Dolor dolores id consequatur laudantium quia sit. Expedita fuga optio totam. Distinctio magnam quis fuga omnis autem. Sed nihil velit porro consequatur quia.',24.58,'r','Price, Nitzsche and Lockman'),(138,'vel','Tempore exercitationem eum rem commodi facilis nemo quasi. Delectus quasi possimus doloribus iusto quam. Dicta pariatur eaque ut. Esse ipsam autem perferendis nulla aut autem.',74.09,'k','Trantow LLC'),(139,'dolor','Sed sed veritatis porro et at omnis. Ut aut eaque ipsa eveniet id odit atque. Dolor nulla quos quam cum quis unde voluptas.',40.00,'o','Borer Group'),(140,'est','Velit et culpa harum quos et aut. Et et at esse et blanditiis praesentium molestiae ducimus. Quis error a excepturi vitae perspiciatis.',53.32,'j','Wiegand-Effertz'),(141,'in','Officiis sit sit est dicta. Ex et aut sunt reiciendis. Quos doloribus cumque eius nostrum sed. Qui praesentium labore distinctio et voluptas laudantium et. Sit aut sequi in commodi fuga inventore nulla.',78.19,'z','Crist LLC'),(142,'adipisci','Itaque consequatur dicta ea voluptatem excepturi. Et animi et veritatis ipsa magni. Fugiat voluptatum eaque est mollitia. Natus minima totam sit voluptatum est error commodi.',31.08,'b','Schimmel, Bahringer and Pollich'),(143,'eveniet','Rem cum quia iure quidem. Sint ut facilis nulla voluptatem est dicta. Sint ipsam aliquam rerum corrupti fugiat amet numquam. Ut sed molestias tenetur.',35.00,'e','Cummerata, Runolfsdottir and Harber'),(144,'qui','Sed labore at consequatur tempora vero. Aliquid sed expedita sed quos et. Laboriosam corporis sunt quia doloremque corporis laborum ut.',21.99,'h','Stark PLC'),(145,'ex','Labore provident accusamus ut quae error aut optio. Quos sit ut in corrupti autem. Et laborum tempora ipsum eligendi voluptas doloremque qui.',79.25,'w','Vandervort, Roberts and Welch'),(146,'delectus','Molestiae quae mollitia modi voluptatem laborum suscipit. Voluptatibus non est rerum dicta maxime. Facere quidem et quis. Exercitationem asperiores rerum assumenda atque dolore delectus.',41.62,'t','Thompson-Oberbrunner'),(147,'sit','Officia quasi necessitatibus alias atque. Et iste recusandae et maxime qui perspiciatis reprehenderit. Recusandae est dolores aspernatur dicta totam voluptatem. Sed tenetur in provident nemo.',80.60,'r','Streich PLC'),(148,'ut','Est autem doloremque exercitationem. Fugit molestias aliquid et quidem. Deleniti enim enim hic architecto tempora.',65.04,'y','Kovacek-Schoen'),(149,'fuga','Velit et ut inventore cupiditate doloremque. Necessitatibus officia voluptas ut sed recusandae qui rerum. Sit omnis deserunt iste. Doloribus placeat animi quia et voluptatum aperiam voluptatem. Excepturi ratione excepturi sed perferendis.',92.42,'g','Klein Group'),(150,'doloribus','Sed assumenda quas unde qui reiciendis. Modi officia dolor quo accusantium. Incidunt sit ducimus eos reprehenderit qui. Molestiae molestiae vel alias vitae. Natus aliquid aliquam quibusdam quibusdam consectetur optio.',75.56,'d','Deckow LLC'),(151,'numquam','Fuga eos amet quia aut. At rerum et voluptates amet recusandae sit vel omnis. Expedita non cumque eum a. Nisi esse quidem aliquam temporibus minima ipsa maxime aut.',5.52,'c','Heller-Wiegand'),(152,'deserunt','Aut id velit ipsum deleniti eum. Reiciendis accusantium veniam expedita ut voluptatem aliquid. Nihil provident sequi voluptatem mollitia cumque.',16.21,'s','Grimes Inc'),(153,'voluptatibus','Deleniti debitis nobis illum distinctio et. Dolorum natus quibusdam ipsa consequuntur. Assumenda impedit sequi est veniam est optio. Reiciendis dolor minima blanditiis maxime eos in.',66.69,'s','Wiegand, Anderson and Grant'),(154,'ipsam','Magni reiciendis fugiat aut excepturi eos alias. Rerum quia velit repellendus sed autem praesentium non. Facere qui fugiat saepe fugiat necessitatibus sunt.',73.85,'p','Zulauf PLC'),(155,'cum','Quo iusto consectetur dolor reiciendis ratione. Qui nisi est autem vitae labore. Inventore deserunt vitae dolor velit repudiandae non ut. Non accusamus ut qui est doloremque quaerat incidunt.',88.71,'q','Sawayn Group'),(156,'dicta','Eligendi ipsa laboriosam ducimus ut autem omnis. Nihil pariatur tempore dignissimos sunt ea rerum repellendus. Quia rem voluptatibus dignissimos enim. Ut assumenda sapiente ipsam odit.',58.71,'u','Haag, Dibbert and Padberg'),(157,'et','Saepe sunt rem veritatis cumque id nisi dolore. Laboriosam sequi in enim omnis vitae. Nihil deserunt culpa qui sequi ut. Blanditiis rerum id est consequatur sit.',13.84,'r','Parker and Sons'),(158,'aliquam','Similique id ad aut ratione est quo. Totam repellat maxime fugit enim. Necessitatibus amet natus voluptatibus nostrum et facilis.',79.55,'n','Leffler, Bernhard and Koss'),(159,'enim','Possimus vel adipisci ab laudantium sint blanditiis. Dignissimos blanditiis non et sequi. Sit qui accusamus est animi delectus atque.',42.14,'x','Bechtelar, Hermiston and Murray'),(160,'voluptas','Reiciendis dolorem odio et doloremque. Qui repellat quae vero quam laudantium. Quibusdam nesciunt voluptatum est autem corporis. Debitis debitis velit et odio aut voluptas.',85.78,'n','Cruickshank Inc'),(161,'est','Sit aut vero optio exercitationem non ea quia. Quas esse facere aut aut ea quisquam soluta.',90.78,'d','Wisoky, Runolfsdottir and Mohr'),(162,'quia','Officiis rerum porro quo soluta voluptatem ut. Omnis hic rerum assumenda. A delectus aut aut eos fugiat suscipit sapiente. Sed minima dolores unde porro.',89.20,'m','Sporer-Stiedemann'),(163,'et','Aut molestiae error et error perferendis. Enim voluptatum voluptatem tenetur deserunt est.',96.47,'h','Connelly-Ortiz'),(164,'nesciunt','Ea eveniet reprehenderit et asperiores. Nulla repellendus repellendus et non. Accusantium nam ut commodi debitis consequatur. Enim natus delectus aut id exercitationem temporibus laboriosam. Vel eaque adipisci occaecati sit beatae.',56.14,'s','Spinka-Fisher'),(165,'voluptatem','Temporibus sapiente sequi ut iusto. Ut consequatur voluptates ea inventore magnam molestias hic illo. Officia vel autem minus atque laborum. Voluptates ipsum aut facilis dolores facere placeat.',94.87,'i','Kozey-Nikolaus'),(166,'odio','Eum consequatur aperiam sit. Corporis et id non sit. Totam consequatur qui voluptatem sit tenetur facere.',70.82,'m','Weissnat-Schmidt'),(167,'dignissimos','Ab rerum aliquid dicta quod et. Rem quis in placeat saepe dignissimos. Aut eligendi occaecati numquam vero est impedit voluptatibus.',84.21,'o','Pouros, Moore and Upton'),(168,'ipsam','Corporis et est minus sed repellat temporibus. In enim aut delectus aut vel error animi in. Eum dolorem voluptatem incidunt harum.',34.26,'a','Conn-White'),(169,'consequatur','Excepturi quia excepturi blanditiis non fugiat cumque non sed. Numquam voluptatem iusto dolorem deserunt libero. In veniam et porro ea sunt repellat. Distinctio deleniti iusto debitis eaque magnam harum beatae.',25.75,'x','Dibbert, Thompson and Mills'),(170,'exercitationem','Quisquam praesentium ex sunt similique eum. Veritatis et nobis hic dolores. Quisquam culpa dolore necessitatibus consequatur repellendus soluta numquam.',86.76,'z','Ferry, Hahn and Langworth'),(171,'eaque','Et blanditiis rerum reiciendis. Qui perferendis enim autem non. Esse aliquid excepturi nobis iusto omnis sit.',11.43,'w','Rohan-Schaden'),(172,'est','Perspiciatis odio a et beatae voluptate voluptas qui. Quia qui dolorem iusto earum omnis fuga voluptates. Debitis delectus fugiat cupiditate quod. In esse nihil omnis suscipit ut.',52.67,'x','Schroeder-Macejkovic'),(173,'vel','Velit id labore repellendus qui voluptates ut nostrum hic. Fugiat eum iure dolorem voluptatem aut iste. Vel at rem doloremque qui ut modi.',77.96,'m','Abernathy, Kovacek and Spencer'),(174,'adipisci','Est voluptatem est nemo numquam aut ut occaecati. Laudantium minima excepturi ad officia itaque tempora porro. Beatae tempora id ab et et.',66.43,'h','Trantow PLC'),(175,'deleniti','Vero rem ut non nihil. Et est odit ratione doloribus enim. Ut sunt at consequuntur odit est. Tempora occaecati quae aperiam ipsa et suscipit et. Repellendus eos error est est quis.',92.55,'u','Lowe PLC'),(176,'dolorem','Sint natus nostrum qui. Deserunt error quaerat architecto rem et illo. Dolor ea sed excepturi adipisci nulla magni culpa repudiandae.',80.22,'m','Bartell-Stark'),(177,'enim','Voluptatem ratione et voluptatem eligendi. Officiis voluptate quas quis. Officiis itaque quos ullam accusamus excepturi architecto doloribus aut. Libero voluptas sit et rerum culpa.',89.04,'t','Kessler, Klocko and McClure'),(178,'asperiores','Aut ex eveniet molestiae aliquid non. Voluptas iure enim mollitia voluptas. Enim dolores non eos omnis suscipit dignissimos aut ducimus.',12.73,'q','Kuhic, Konopelski and Barrows'),(179,'omnis','Quibusdam molestiae asperiores laborum saepe ipsa. Natus eaque commodi ut dolores voluptatum qui laboriosam consequuntur. Debitis in ea et debitis. Quidem sit aliquid voluptatibus minus.',48.67,'c','Brown-Christiansen'),(180,'sint','Ex impedit ducimus vitae natus voluptatum facere et. Repellat quia distinctio rerum facere fugit illo eum voluptas. Voluptas sed facere cumque.',5.84,'p','Blanda, Shields and Kunze'),(181,'harum','Sunt delectus vero numquam voluptatem aut ipsa dolorum. Ducimus quia dignissimos dolorem et. Excepturi quasi corporis facilis voluptatibus doloremque est natus. Autem cum perferendis dicta natus porro dicta.',77.38,'q','Pacocha, Koch and Powlowski'),(182,'quas','Dolores eum magnam aut ab sapiente ex ex. Cum odio reiciendis fugit cupiditate qui. Et eveniet eos nihil quia dicta. Tempora quae voluptate illo sed possimus.',97.15,'r','Kihn-Zemlak'),(183,'animi','Alias quia aliquam non voluptas. Tenetur eaque maiores aut enim consequuntur quas natus. Quis et sit quo distinctio sit autem et. Accusamus eaque quia enim et.',14.05,'n','Thompson-Hoeger'),(184,'sit','Quibusdam nostrum delectus voluptatem. Eligendi et voluptatum quis ut molestias doloremque accusamus. Dolore quis ipsum quod doloremque. Eos nulla laboriosam veritatis dolore minima sint.',78.06,'c','Bechtelar Inc'),(185,'id','Blanditiis officiis est est aspernatur voluptates. Consequatur natus dolorum sit. Et non accusantium sunt quia.',92.61,'h','Gusikowski, Lynch and Tromp'),(186,'expedita','Qui maiores dolores repellendus dolor ut sunt sequi. Est minus eaque consequatur minus et repudiandae hic. Rerum asperiores rerum quisquam natus debitis explicabo. Et est ex cum molestiae nobis harum.',84.15,'t','Schulist, Murray and Homenick'),(187,'tempora','Maxime assumenda cupiditate occaecati. Temporibus nobis non aut qui iusto. Omnis eaque soluta facere sint voluptas. Qui dolorum eius a modi sed quo voluptas.',85.71,'g','Marvin-Fahey'),(188,'numquam','Ad corporis quae sint hic. Voluptate assumenda voluptatem corporis voluptates. Omnis dolorem id ut dicta rerum architecto.',99.75,'z','Hyatt, Hermann and Barton'),(189,'voluptatem','Reprehenderit id et et nihil rem odit. Eius et velit provident vero vel. Nihil rem quia ipsam excepturi ipsa adipisci. Aut consequuntur placeat temporibus qui atque dicta ut. Expedita in veniam et quaerat ex et voluptates sed.',74.58,'q','Goldner-Kuhn'),(190,'iure','Ducimus quasi quae aut sint. Hic eligendi itaque ut est culpa et excepturi cupiditate. Odio optio fuga ut consequatur.',36.44,'g','Witting, Sporer and Ortiz'),(191,'nemo','Eveniet nam rerum aut non quam ullam. Et est laboriosam illo at aut autem ullam qui. Perspiciatis consequatur eum voluptates laboriosam. Voluptas et corrupti aut officiis.',51.73,'b','Waters-Schultz'),(192,'aut','Quaerat voluptas architecto expedita sed dolores eum quisquam rerum. Nesciunt assumenda quia vitae numquam et maiores. Ducimus voluptatibus rerum iure eos velit sunt ratione.',52.25,'b','Rowe Group'),(193,'et','Earum assumenda molestiae neque possimus et est et. Nemo aliquam omnis dolorem dolor quasi sint. Fugiat architecto officia deserunt voluptate molestias. Maiores sequi molestiae officiis pariatur.',20.93,'g','Baumbach-Beatty'),(194,'dolorum','Iusto neque et velit sunt ut. Totam enim suscipit optio perspiciatis enim. Aut rerum sunt in alias. Laboriosam earum facilis expedita deserunt et deserunt officia.',82.73,'e','Leffler-Hamill'),(195,'molestiae','Doloremque sequi quam est quia et pariatur quia minus. Eum ipsam natus aliquid sunt praesentium. Ab porro molestiae ut veniam repellendus labore. Hic consequatur odio itaque reprehenderit omnis et ut.',33.16,'y','Deckow, Kuphal and Hodkiewicz'),(196,'aliquam','Necessitatibus aut excepturi maxime quisquam. Impedit ullam nemo amet amet repellat. Sunt ut nihil reprehenderit et suscipit eveniet ut.',86.27,'g','Streich, Miller and Lind'),(197,'modi','Id distinctio molestiae iste blanditiis consequuntur quos. Voluptatem occaecati delectus inventore possimus hic rerum incidunt quis. Ea deserunt veniam necessitatibus quis voluptatibus dolorem aut repellat. Voluptates placeat eligendi commodi reiciendis neque nulla rem. Ratione minima atque dolore optio omnis qui.',37.72,'o','Anderson PLC'),(198,'cumque','Deleniti iure non reprehenderit sequi sed laborum est qui. Et quaerat doloribus minus aspernatur qui dolore. Reiciendis dolorem consequatur nobis et ut iste. Et veritatis quam iusto ipsa.',67.61,'t','Homenick-Marquardt'),(199,'aut','Quaerat qui ipsam omnis natus quis. Aliquam omnis optio incidunt deleniti et. Et hic ut sit corrupti nobis. Et voluptates sit corrupti.',85.08,'y','Ankunding-Wisozk'),(200,'facere','Eos voluptas eum cum amet. Voluptatem nobis aut omnis aut quas voluptas. Voluptatem aut a possimus quaerat exercitationem. Officia ut autem iure fugit.',45.97,'w','Kihn-O Connell');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offered_service`
--

DROP TABLE IF EXISTS `offered_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offered_service` (
  `work` smallint(5) unsigned NOT NULL,
  `service` smallint(5) unsigned NOT NULL,
  `instance_description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `PCP` float NOT NULL,
  `association_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`work`,`service`),
  KEY `idx_offered_service_work` (`work`),
  KEY `fk_offered_service_service` (`service`),
  FULLTEXT KEY `idx_offered_service_desc` (`instance_description`),
  CONSTRAINT `fk_offered_service_service` FOREIGN KEY (`service`) REFERENCES `service` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `fk_offered_service_work` FOREIGN KEY (`work`) REFERENCES `work` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offered_service`
--

LOCK TABLES `offered_service` WRITE;
/*!40000 ALTER TABLE `offered_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `offered_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paycheck`
--

DROP TABLE IF EXISTS `paycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paycheck` (
  `code` smallint(5) unsigned NOT NULL,
  `employee` varchar(16) NOT NULL,
  `pay` decimal(8,2) NOT NULL,
  `deductions` decimal(8,2) NOT NULL,
  `bonus` decimal(8,2) NOT NULL,
  `pay_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`),
  KEY `idx_paycheck_date` (`pay_date`) USING BTREE,
  KEY `idx_paycheck_employee` (`employee`),
  CONSTRAINT `fk_paycheck_employee` FOREIGN KEY (`employee`) REFERENCES `employee` (`fiscal_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paycheck`
--

LOCK TABLES `paycheck` WRITE;
/*!40000 ALTER TABLE `paycheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `paycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presence`
--

DROP TABLE IF EXISTS `presence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presence` (
  `work` smallint(5) unsigned NOT NULL,
  `employee` varchar(16) NOT NULL,
  `working_date` date NOT NULL,
  `working_hours` float NOT NULL,
  PRIMARY KEY (`work`,`employee`,`working_date`),
  KEY `idx_presence_date` (`working_date`) USING BTREE,
  KEY `idx_presence_work` (`work`),
  KEY `fk_presence_employee` (`employee`),
  CONSTRAINT `fk_presence_employee` FOREIGN KEY (`employee`) REFERENCES `employee` (`fiscal_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_presence_work` FOREIGN KEY (`work`) REFERENCES `work` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presence`
--

LOCK TABLES `presence` WRITE;
/*!40000 ALTER TABLE `presence` DISABLE KEYS */;
/*!40000 ALTER TABLE `presence` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`charlemagne`@`localhost`*/ /*!50003 TRIGGER tgr_limit_working_hours
    BEFORE INSERT 
    ON presence FOR EACH ROW
BEGIN 

    DECLARE total_working_hours FLOAT; 

    SELECT  SUM(working_hours) 
    INTO    total_working_hours
    FROM    presence P
    WHERE   P.employee = NEW.employee
    AND     P.working_date = NEW.working_date; 

    IF total_working_hours + NEW.working_hours > 8 THEN 
        SET NEW.working_hours = 8 - total_working_hours; 
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `price_quotation`
--

DROP TABLE IF EXISTS `price_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_quotation` (
  `code` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `work` smallint(5) unsigned NOT NULL,
  `storage_link` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`),
  KEY `idx_price_quotation_ts` (`created_at`) USING BTREE,
  KEY `idx_price_quotation_work` (`work`),
  CONSTRAINT `fk_price_quotation_work` FOREIGN KEY (`work`) REFERENCES `work` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_quotation`
--

LOCK TABLES `price_quotation` WRITE;
/*!40000 ALTER TABLE `price_quotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `code` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `item` smallint(5) unsigned NOT NULL,
  `work` smallint(5) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `creditor` set('CUSTOMER','COMPANY') NOT NULL,
  `discount` float DEFAULT NULL,
  `purchase_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`),
  KEY `fk_purchase_item` (`item`),
  KEY `fk_purchase_work` (`work`),
  CONSTRAINT `fk_purchase_item` FOREIGN KEY (`item`) REFERENCES `item` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `fk_purchase_work` FOREIGN KEY (`work`) REFERENCES `work` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `code` smallint(5) unsigned NOT NULL,
  `pricelist_code` varchar(16) NOT NULL,
  `short_description` text NOT NULL,
  `full_description` text NOT NULL,
  `base_unit` varchar(8) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `labor_incidence` float NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `pricelist_code` (`pricelist_code`),
  FULLTEXT KEY `idx_service_sd` (`short_description`),
  FULLTEXT KEY `idx_service_fd` (`full_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work` (
  `code` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(256) NOT NULL,
  `building` varchar(64) DEFAULT NULL,
  `floor` varchar(32) DEFAULT NULL,
  `commission_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completation_date` datetime DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT '0.00',
  `discount` float DEFAULT NULL,
  `customer` varchar(16) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `idx_work_id` (`code`),
  KEY `fk_work_customer` (`customer`),
  CONSTRAINT `fk_work_customer` FOREIGN KEY (`customer`) REFERENCES `customer` (`fiscal_code`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (1,'8514 Quigley Unions Apt. 989\nGreenview, NV 78787-0478','788','6','2019-01-01 21:18:14','2019-01-24 10:23:43',15203201.35,342,'adnrji08h17r037r'),(2,'20329 Leanne Plains Suite 750\nPfefferbury, MD 71083-0747','10521','8','2019-01-16 16:19:07','2019-01-27 08:30:28',0.00,193,'bggshq63u08r002m'),(3,'276 Barton Springs\nEast Marlen, RI 56891','94953','','2019-02-02 16:35:37','2019-02-20 00:17:10',10.13,211,'cjzfgh97n18q197i'),(4,'3365 Hills Mountain Apt. 041\nNew Clementineside, CO 66099-4666','45855','9','2019-02-02 01:28:58','2019-02-26 16:03:53',125.08,189,'dupruz08y64j056h'),(5,'5024 Rodriguez Islands Suite 465\nNew Myrtleville, ND 19473','166','7','2019-03-18 11:43:41','2019-03-29 13:11:14',318943.85,295,'eopdsy10l81v760c'),(6,'1632 Coy Island Apt. 479\nLake Carolanneport, ND 83662-1599','008','3','2019-03-20 18:32:06','2019-03-26 09:47:56',34687156.51,195,'gkkfze80k70g005q'),(7,'457 Haag Crossing\nNorth Rafaelmouth, DC 89160','032','9','2019-04-08 09:49:14','2019-04-30 01:18:42',6961500.52,468,'gluigz60e25j195s'),(8,'8320 Hintz Club\nLake Goldaside, TX 18874','855','7','2019-04-09 11:42:20','2019-04-28 08:45:14',48850.02,86,'hzsykc35z38y320l'),(9,'014 Blick Mills\nWest Krystel, TX 39835','45540','1','2019-05-02 20:34:49','2019-05-30 17:52:12',4260.13,281,'johexr42v44f663p'),(10,'66883 Carlos Overpass\nNew Daniellastad, AR 99683-1104','069','','2019-05-03 03:26:32','2019-05-24 17:13:15',2.11,147,'kqxzop17j28k258b'),(11,'79186 Leatha Forges Suite 623\nSouth Vickyside, NE 80597','4534','2','2019-06-01 13:00:01','2019-06-07 03:32:30',756.83,326,'llbovk71t96j085v'),(12,'92447 Maybelle Lakes\nSchimmelview, AL 65608-5225','982','8','2019-06-05 03:13:36','2019-06-30 21:19:30',9982053.10,458,'oboyko44f03w146y'),(13,'5443 Elvera Brook Suite 543\nNorth Hettieberg, AK 93392','8605','2','2019-07-05 11:22:31','2019-07-30 01:46:34',4022.92,116,'orqjov96s61x360k'),(14,'94158 Moen Street Suite 841\nWest Libbyshire, SC 66898','461','9','2019-07-12 14:05:42','2019-07-30 09:21:23',72193.00,139,'qexjmr25z77c797k'),(15,'7464 Arjun Squares\nWest Reanna, WA 38063','8440','8','2019-08-01 13:06:58','2019-08-11 15:33:06',40534.00,377,'tkfkfb77j30n007p'),(16,'316 Renner Union Apt. 371\nCarmellastad, AR 67927','1883','5','2019-08-20 02:05:19','2019-08-30 15:54:39',268542.70,152,'vamgtb02i37h135i'),(17,'430 Rigoberto Lights\nFeliciaburgh, WY 45963-6042','01258','1','2019-09-01 19:23:50','2019-09-26 12:44:58',643.10,148,'vtrbgv80v83l885b'),(18,'041 Nolan Fort Apt. 658\nSouth Kearaland, HI 75102-8124','9980','3','2019-09-02 22:49:22','2019-09-27 20:08:56',1403800.50,297,'wjodce98k72p773x'),(19,'0484 Jakubowski Valley\nNew Ilenechester, TN 18311','367','2','2019-10-01 21:04:44','2019-10-30 02:28:06',203.60,175,'wqqsgl69o57g544f'),(20,'139 Dillon Walk Apt. 615\nNew Markustown, MD 40998-1820','56342','2','2019-10-08 17:29:39','2019-10-30 03:39:11',430.93,98,'wuyjai06f37k404t'),(21,'2133 Dannie Club\nVicentestad, NJ 68617','7320','9','2019-11-02 01:28:14','2019-11-20 17:34:51',0.00,218,'xzouji56h63q385i'),(22,'53753 Ethelyn Crest Suite 214\nHaneberg, NV 81996-9508','00310','6','2019-11-17 12:05:00','2019-11-27 03:46:23',4216.63,223,'yuiyih09x52z326k'),(23,'69794 Jerome Causeway Suite 917\nLake Billymouth, DC 19770','55202','8','2019-12-01 18:02:26','2019-12-10 15:31:24',1.36,19,'ywznqb43b35k739m'),(24,'1906 Melissa Street Suite 468\nPort Kaleland, IL 80352-3752','33691','2','2019-12-14 15:58:21','2019-12-23 05:46:20',51735598.50,107,'zfogcx78k87u835l');
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-22 12:05:11
