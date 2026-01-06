-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tifosi
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achete`
--

DROP TABLE IF EXISTS `achete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achete` (
  `id_client` int NOT NULL,
  `id_menu` int NOT NULL,
  `date_achat` date NOT NULL,
  PRIMARY KEY (`id_client`,`id_menu`,`date_achat`),
  KEY `id_menu` (`id_menu`),
  CONSTRAINT `achete_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE,
  CONSTRAINT `achete_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achete`
--

LOCK TABLES `achete` WRITE;
/*!40000 ALTER TABLE `achete` DISABLE KEYS */;
INSERT INTO `achete` VALUES (1,1,'2026-01-06');
/*!40000 ALTER TABLE `achete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boisson`
--

DROP TABLE IF EXISTS `boisson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boisson` (
  `id_boisson` int NOT NULL AUTO_INCREMENT,
  `nom_boisson` varchar(100) NOT NULL,
  `id_marque` int DEFAULT NULL,
  PRIMARY KEY (`id_boisson`),
  KEY `boisson_marque_FK` (`id_marque`),
  CONSTRAINT `boisson_marque_FK` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boisson`
--

LOCK TABLES `boisson` WRITE;
/*!40000 ALTER TABLE `boisson` DISABLE KEYS */;
INSERT INTO `boisson` VALUES (1,'Coca-cola zéro',1),(2,'Coca-cola original',1),(3,'Fanta citron',1),(4,'Fanta',1),(5,'Capri-sun',1),(6,'Pepsi',4),(7,'Pepsi Max Zéro',4),(8,'Lipton zéro citron',4),(9,'Lipton Peach',4),(10,'Monster energy ultra gold',3),(11,'Monster energy ultra blue',3),(12,'Eau de source ',2);
/*!40000 ALTER TABLE `boisson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `code_postal` int DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Test','test@test.com',0);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contient`
--

DROP TABLE IF EXISTS `contient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contient` (
  `id_menu` int NOT NULL,
  `id_boisson` int NOT NULL,
  PRIMARY KEY (`id_menu`,`id_boisson`),
  KEY `id_boisson` (`id_boisson`),
  CONSTRAINT `contient_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE,
  CONSTRAINT `contient_ibfk_2` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contient`
--

LOCK TABLES `contient` WRITE;
/*!40000 ALTER TABLE `contient` DISABLE KEYS */;
INSERT INTO `contient` VALUES (1,12);
/*!40000 ALTER TABLE `contient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `est_constitue`
--

DROP TABLE IF EXISTS `est_constitue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `est_constitue` (
  `id_menu` int NOT NULL,
  `id_focaccia` int NOT NULL,
  PRIMARY KEY (`id_menu`,`id_focaccia`),
  KEY `id_focaccia` (`id_focaccia`),
  CONSTRAINT `est_constitue_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE,
  CONSTRAINT `est_constitue_ibfk_2` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `est_constitue`
--

LOCK TABLES `est_constitue` WRITE;
/*!40000 ALTER TABLE `est_constitue` DISABLE KEYS */;
INSERT INTO `est_constitue` VALUES (1,1);
/*!40000 ALTER TABLE `est_constitue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focaccia`
--

DROP TABLE IF EXISTS `focaccia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `focaccia` (
  `id_focaccia` int NOT NULL AUTO_INCREMENT,
  `nom_focaccia` varchar(100) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`id_focaccia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focaccia`
--

LOCK TABLES `focaccia` WRITE;
/*!40000 ALTER TABLE `focaccia` DISABLE KEYS */;
INSERT INTO `focaccia` VALUES (1,'Mozaccia',9.8),(2,'Gorgonzollaccia',10.8),(3,'Raclaccia',8.9),(4,'Emmentalaccia',9.8),(5,'Tradizione',8.9),(6,'Hawaienne',11.2),(7,'Américaine',10.8),(8,'Paysanne',12.8);
/*!40000 ALTER TABLE `focaccia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Inventaire des ingrédients';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Ail'),(2,'Ananas'),(3,'Artichaut'),(4,'Bacon'),(5,'Base Tomate'),(6,'Base crème'),(7,'Champignon'),(8,'Chevre'),(9,'Cresson'),(10,'Emmental'),(11,'Gorgonzola'),(12,'Jambon cuit'),(13,'Jambon fumé'),(14,'Oeuf'),(15,'Oignon'),(16,'Olive noire'),(17,'Olive verte'),(18,'Parmesan'),(19,'Piment'),(20,'Poivre'),(21,'Pomme de terre'),(22,'Raclette'),(23,'Salami'),(24,'Tomate cerise'),(25,'Mozarella');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marque`
--

DROP TABLE IF EXISTS `marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marque` (
  `id_marque` int NOT NULL AUTO_INCREMENT,
  `nom_marque` varchar(100) NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marque`
--

LOCK TABLES `marque` WRITE;
/*!40000 ALTER TABLE `marque` DISABLE KEYS */;
INSERT INTO `marque` VALUES (1,'Coca-cola'),(2,'Cristalline'),(3,'Monster'),(4,'Pepsico');
/*!40000 ALTER TABLE `marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nom_menu` varchar(50) NOT NULL,
  `prix` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Menu Classique',10.80);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `menu_complet`
--

DROP TABLE IF EXISTS `menu_complet`;
/*!50001 DROP VIEW IF EXISTS `menu_complet`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `menu_complet` AS SELECT 
 1 AS `nom_menu`,
 1 AS `prix`,
 1 AS `nom_focaccia`,
 1 AS `nom_boisson`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `quantite`
--

DROP TABLE IF EXISTS `quantite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantite` (
  `id_ingredient` int DEFAULT NULL,
  `quantite_defaut` int DEFAULT '0',
  KEY `quantite_ingredient_FK` (`id_ingredient`),
  CONSTRAINT `quantite_ingredient_FK` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantite`
--

LOCK TABLES `quantite` WRITE;
/*!40000 ALTER TABLE `quantite` DISABLE KEYS */;
INSERT INTO `quantite` VALUES (1,2),(2,40),(3,20),(4,80),(5,200),(6,200),(7,40),(8,50),(9,20),(10,50),(11,50),(12,80),(13,80),(14,50),(15,20),(16,20),(17,20),(18,50),(19,2),(20,1),(21,80),(22,50),(23,80),(24,40),(25,50);
/*!40000 ALTER TABLE `quantite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recette`
--

DROP TABLE IF EXISTS `recette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recette` (
  `id_focaccia` int DEFAULT NULL,
  `id_ingredient` int DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  KEY `recette_focaccia_FK` (`id_focaccia`),
  KEY `recette_ingredient_FK` (`id_ingredient`),
  CONSTRAINT `recette_focaccia_FK` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  CONSTRAINT `recette_ingredient_FK` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recette`
--

LOCK TABLES `recette` WRITE;
/*!40000 ALTER TABLE `recette` DISABLE KEYS */;
INSERT INTO `recette` VALUES (1,5,NULL),(1,25,NULL),(1,9,NULL),(1,13,NULL),(1,1,NULL),(1,3,NULL),(1,7,NULL),(1,18,NULL),(1,20,NULL),(1,16,NULL),(2,5,NULL),(2,11,NULL),(2,1,NULL),(2,7,NULL),(2,18,NULL),(2,20,NULL),(2,16,NULL),(3,5,NULL),(3,22,NULL),(3,9,NULL),(3,1,NULL),(3,7,NULL),(3,18,NULL),(3,20,NULL),(4,6,NULL),(4,10,NULL),(4,9,NULL),(4,7,NULL),(4,18,NULL),(4,20,NULL),(4,15,NULL),(5,5,NULL),(5,25,NULL),(5,9,NULL),(5,12,NULL),(5,7,80),(5,18,NULL),(5,20,NULL),(5,16,10),(5,17,10),(6,5,NULL),(6,25,NULL),(6,9,NULL),(6,4,NULL),(6,2,NULL),(6,19,NULL),(6,18,NULL),(6,20,NULL),(6,16,NULL),(7,5,NULL),(7,25,NULL),(7,9,NULL),(7,4,NULL),(7,21,40),(7,18,NULL),(7,20,NULL),(7,16,NULL),(8,6,NULL),(8,8,NULL),(8,9,NULL),(8,21,NULL),(8,13,NULL),(8,1,NULL),(8,3,NULL),(8,7,NULL),(8,18,NULL),(8,20,NULL),(8,16,NULL),(8,14,NULL);
/*!40000 ALTER TABLE `recette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `recette_complete`
--

DROP TABLE IF EXISTS `recette_complete`;
/*!50001 DROP VIEW IF EXISTS `recette_complete`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recette_complete` AS SELECT 
 1 AS `id_focaccia`,
 1 AS `id_ingredient`,
 1 AS `quantite_utilisee`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_boisson_marque`
--

DROP TABLE IF EXISTS `v_boisson_marque`;
/*!50001 DROP VIEW IF EXISTS `v_boisson_marque`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_boisson_marque` AS SELECT 
 1 AS `nom_boisson`,
 1 AS `nom_marque`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_focaccia_avec_ail`
--

DROP TABLE IF EXISTS `v_focaccia_avec_ail`;
/*!50001 DROP VIEW IF EXISTS `v_focaccia_avec_ail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_focaccia_avec_ail` AS SELECT 
 1 AS `nom_focaccia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_focaccia_nb_ingredients`
--

DROP TABLE IF EXISTS `v_focaccia_nb_ingredients`;
/*!50001 DROP VIEW IF EXISTS `v_focaccia_nb_ingredients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_focaccia_nb_ingredients` AS SELECT 
 1 AS `nom_focaccia`,
 1 AS `nb_ingredients`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_focaccia_ordre_alpha`
--

DROP TABLE IF EXISTS `v_focaccia_ordre_alpha`;
/*!50001 DROP VIEW IF EXISTS `v_focaccia_ordre_alpha`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_focaccia_ordre_alpha` AS SELECT 
 1 AS `nom_focaccia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_focaccia_plus_ingredients`
--

DROP TABLE IF EXISTS `v_focaccia_plus_ingredients`;
/*!50001 DROP VIEW IF EXISTS `v_focaccia_plus_ingredients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_focaccia_plus_ingredients` AS SELECT 
 1 AS `nom_focaccia`,
 1 AS `nb_ingredients`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_focaccia_sans_champignons`
--

DROP TABLE IF EXISTS `v_focaccia_sans_champignons`;
/*!50001 DROP VIEW IF EXISTS `v_focaccia_sans_champignons`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_focaccia_sans_champignons` AS SELECT 
 1 AS `nom_focaccia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ingredients_inutilises`
--

DROP TABLE IF EXISTS `v_ingredients_inutilises`;
/*!50001 DROP VIEW IF EXISTS `v_ingredients_inutilises`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_ingredients_inutilises` AS SELECT 
 1 AS `nom_ingredient`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ingredients_raclaccia`
--

DROP TABLE IF EXISTS `v_ingredients_raclaccia`;
/*!50001 DROP VIEW IF EXISTS `v_ingredients_raclaccia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_ingredients_raclaccia` AS SELECT 
 1 AS `nom_ingredient`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_nombre_ingredients`
--

DROP TABLE IF EXISTS `v_nombre_ingredients`;
/*!50001 DROP VIEW IF EXISTS `v_nombre_ingredients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_nombre_ingredients` AS SELECT 
 1 AS `total_ingredients`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_prix_moyen_focaccia`
--

DROP TABLE IF EXISTS `v_prix_moyen_focaccia`;
/*!50001 DROP VIEW IF EXISTS `v_prix_moyen_focaccia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_prix_moyen_focaccia` AS SELECT 
 1 AS `prix_moyen`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'tifosi'
--

--
-- Final view structure for view `menu_complet`
--

/*!50001 DROP VIEW IF EXISTS `menu_complet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `menu_complet` AS select `m`.`nom_menu` AS `nom_menu`,`m`.`prix` AS `prix`,`f`.`nom_focaccia` AS `nom_focaccia`,`b`.`nom_boisson` AS `nom_boisson` from ((((`menu` `m` left join `est_constitue` `ec` on((`ec`.`id_menu` = `m`.`id_menu`))) left join `focaccia` `f` on((`f`.`id_focaccia` = `ec`.`id_focaccia`))) left join `contient` `c` on((`c`.`id_menu` = `m`.`id_menu`))) left join `boisson` `b` on((`b`.`id_boisson` = `c`.`id_boisson`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recette_complete`
--

/*!50001 DROP VIEW IF EXISTS `recette_complete`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recette_complete` AS select `r`.`id_focaccia` AS `id_focaccia`,`r`.`id_ingredient` AS `id_ingredient`,coalesce(`r`.`quantite`,`q`.`quantite_defaut`) AS `quantite_utilisee` from (`recette` `r` join `quantite` `q` on((`q`.`id_ingredient` = `r`.`id_ingredient`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_boisson_marque`
--

/*!50001 DROP VIEW IF EXISTS `v_boisson_marque`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_boisson_marque` AS select `b`.`nom_boisson` AS `nom_boisson`,`m`.`nom_marque` AS `nom_marque` from (`boisson` `b` join `marque` `m` on((`b`.`id_marque` = `m`.`id_marque`))) order by `b`.`nom_boisson` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_focaccia_avec_ail`
--

/*!50001 DROP VIEW IF EXISTS `v_focaccia_avec_ail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_focaccia_avec_ail` AS select distinct `f`.`nom_focaccia` AS `nom_focaccia` from ((`focaccia` `f` join `recette` `r` on((`r`.`id_focaccia` = `f`.`id_focaccia`))) join `ingredient` `i` on((`i`.`id_ingredient` = `r`.`id_ingredient`))) where (lower(`i`.`nom_ingredient`) = 'ail') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_focaccia_nb_ingredients`
--

/*!50001 DROP VIEW IF EXISTS `v_focaccia_nb_ingredients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_focaccia_nb_ingredients` AS select `f`.`nom_focaccia` AS `nom_focaccia`,count(`r`.`id_ingredient`) AS `nb_ingredients` from (`focaccia` `f` left join `recette` `r` on((`r`.`id_focaccia` = `f`.`id_focaccia`))) group by `f`.`id_focaccia`,`f`.`nom_focaccia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_focaccia_ordre_alpha`
--

/*!50001 DROP VIEW IF EXISTS `v_focaccia_ordre_alpha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_focaccia_ordre_alpha` AS select `focaccia`.`nom_focaccia` AS `nom_focaccia` from `focaccia` order by `focaccia`.`nom_focaccia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_focaccia_plus_ingredients`
--

/*!50001 DROP VIEW IF EXISTS `v_focaccia_plus_ingredients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_focaccia_plus_ingredients` AS select `f`.`nom_focaccia` AS `nom_focaccia`,count(`r`.`id_ingredient`) AS `nb_ingredients` from (`focaccia` `f` join `recette` `r` on((`r`.`id_focaccia` = `f`.`id_focaccia`))) group by `f`.`id_focaccia`,`f`.`nom_focaccia` order by `nb_ingredients` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_focaccia_sans_champignons`
--

/*!50001 DROP VIEW IF EXISTS `v_focaccia_sans_champignons`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_focaccia_sans_champignons` AS select `f`.`nom_focaccia` AS `nom_focaccia` from `focaccia` `f` where `f`.`id_focaccia` in (select `r`.`id_focaccia` from (`recette` `r` join `ingredient` `i` on((`i`.`id_ingredient` = `r`.`id_ingredient`))) where (lower(`i`.`nom_ingredient`) = 'champignons')) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ingredients_inutilises`
--

/*!50001 DROP VIEW IF EXISTS `v_ingredients_inutilises`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ingredients_inutilises` AS select `i`.`nom_ingredient` AS `nom_ingredient` from (`ingredient` `i` left join `recette` `r` on((`r`.`id_ingredient` = `i`.`id_ingredient`))) where (`r`.`id_ingredient` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ingredients_raclaccia`
--

/*!50001 DROP VIEW IF EXISTS `v_ingredients_raclaccia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ingredients_raclaccia` AS select `i`.`nom_ingredient` AS `nom_ingredient` from ((`focaccia` `f` join `recette` `r` on((`r`.`id_focaccia` = `f`.`id_focaccia`))) join `ingredient` `i` on((`i`.`id_ingredient` = `r`.`id_ingredient`))) where (`f`.`nom_focaccia` = 'Raclaccia') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_nombre_ingredients`
--

/*!50001 DROP VIEW IF EXISTS `v_nombre_ingredients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_nombre_ingredients` AS select count(0) AS `total_ingredients` from `ingredient` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_prix_moyen_focaccia`
--

/*!50001 DROP VIEW IF EXISTS `v_prix_moyen_focaccia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_prix_moyen_focaccia` AS select avg(`focaccia`.`prix`) AS `prix_moyen` from `focaccia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-06 10:59:51
