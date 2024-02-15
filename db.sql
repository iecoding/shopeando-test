-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pruebashopeando
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'El título de una publicación','Aquí el contenido','2024-02-14 23:53:17'),(2,'Publicación 2','Aquí el contenido de la pub 2','2024-02-14 23:57:40'),(3,'Publicación 3','Aquí el contenido de la pub 3','2024-02-14 23:57:57'),(4,'Publicación 4','Aquí el contenido de la pub 4','2024-02-15 00:00:48'),(5,'Publicación 5','Aquí el contenido de la pub 5','2024-02-15 04:03:43'),(6,'La publicación más reciente','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet lectus euismod, blandit turpis ac, sagittis nibh. Mauris vel aliquet metus, et aliquet tortor. Morbi vel euismod mi, ac rutrum enim. Nunc condimentum ut lectus ut mollis. Integer blandit eleifend vehicula. Duis feugiat lorem ac facilisis efficitur. Aenean suscipit gravida lobortis. Vivamus vitae sodales mi. Morbi id magna mi. In vel urna et augue consequat consequat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas pharetra pharetra auctor. Nulla ut felis dictum, sodales dolor accumsan, feugiat sem. Suspendisse a orci pretium, condimentum diam quis, eleifend massa. Nullam non pharetra purus.','2024-02-15 05:45:39'),(7,'La publicación más reciente','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet lectus euismod, blandit turpis ac, sagittis nibh. Mauris vel aliquet metus, et aliquet tortor. Morbi vel euismod mi, ac rutrum enim. Nunc condimentum ut lectus ut mollis. Integer blandit eleifend vehicula. Duis feugiat lorem ac facilisis efficitur. Aenean suscipit gravida lobortis. Vivamus vitae sodales mi. Morbi id magna mi. In vel urna et augue consequat consequat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas pharetra pharetra auctor. Nulla ut felis dictum, sodales dolor accumsan, feugiat sem. Suspendisse a orci pretium, condimentum diam quis, eleifend massa. Nullam non pharetra purus.','2024-02-16 00:24:50'),(8,'Not null','never null','2024-02-16 00:25:30'),(9,'Nuevo post 06','zxcadsfdasfsdfsdfdssdfds','2024-02-16 00:46:56'),(10,'Nuevo post','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nibh sapien, aliquam nec dui ut, venenatis iaculis quam. Mauris elementum lorem a dui ullamcorper, quis vestibulum lorem ultricies. Nullam tincidunt sapien at erat molestie, vel imperdiet dui eleifend. Praesent eu nisi nec neque cursus iaculis. Phasellus mauris elit, fermentum quis justo vitae, imperdiet sollicitudin diam. Curabitur ut luctus erat, nec facilisis nulla. Proin mollis, justo eget eleifend mattis, erat purus vulputate metus, cursus molestie nisl erat quis metus. Nulla facilisi.\n\nAliquam erat volutpat. Fusce hendrerit, ipsum eu mattis interdum, tellus erat ultrices diam, quis lacinia lorem justo ac dolor. Curabitur ut quam in nisi ultrices sagittis. Fusce elementum placerat quam, vitae sagittis augue pellentesque ut. Integer tempus felis ut aliquam interdum. Aenean id orci vitae sapien pulvinar dictum vitae sit amet odio. Donec ipsum enim, elementum in accumsan in, placerat sit amet risus. Ut pellentesque dolor nisl, et euismod justo tristique sit amet. Aliquam vulputate, lectus vel semper semper, orci magna vestibulum urna, nec posuere nunc odio nec risus. Nullam vitae pharetra metus, eget lobortis risus. Quisque sem ligula, scelerisque ac porta ultricies, egestas at neque. Etiam efficitur bibendum nibh, vitae blandit nibh laoreet sed. Fusce mattis sollicitudin ultricies. Aliquam suscipit ex arcu, pellentesque sollicitudin magna malesuada eget.','2024-02-16 00:47:45'),(11,'La publicación más reciente 3','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet lectus euismod, blandit turpis ac, sagittis nibh. Mauris vel aliquet metus, et aliquet tortor. Morbi vel euismod mi, ac rutrum enim. Nunc condimentum ut lectus ut mollis. Integer blandit eleifend vehicula. Duis feugiat lorem ac facilisis efficitur. Aenean suscipit gravida lobortis. Vivamus vitae sodales mi. Morbi id magna mi. In vel urna et augue consequat consequat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas pharetra pharetra auctor. Nulla ut felis dictum, sodales dolor accumsan, feugiat sem. Suspendisse a orci pretium, condimentum diam quis, eleifend massa. Nullam non pharetra purus.','2024-02-16 01:08:51');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-15 14:18:03
