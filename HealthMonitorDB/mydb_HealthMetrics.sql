CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `HealthMetrics`
--

DROP TABLE IF EXISTS `HealthMetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HealthMetrics` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `min_value_male` decimal(10,0) DEFAULT NULL,
  `max_value_male` decimal(10,0) DEFAULT NULL,
  `min_value_female` decimal(10,0) DEFAULT NULL,
  `max_value_female` decimal(10,0) DEFAULT NULL,
  `units` varchar(45) DEFAULT NULL,
  `description` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_HealthMetrics_HealthMetricsCategories_idx` (`category_id`),
  CONSTRAINT `fk_HealthMetrics_HealthMetricsCategories` FOREIGN KEY (`category_id`) REFERENCES `HealthMetricsCategories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HealthMetrics`
--

LOCK TABLES `HealthMetrics` WRITE;
/*!40000 ALTER TABLE `HealthMetrics` DISABLE KEYS */;
INSERT INTO `HealthMetrics` VALUES (1,1,'Haemoglobin - HGB',130,170,NULL,NULL,'g/L','Haemoglobin is a protein in red blood cells which carries oxygen around the body and gives the blood its red colour. This test measures the amount of haemoglobin in the blood and is a good measure of the blood\'s ability to carry oxygen around the body.'),(2,1,'Haematocrit - HCT',0,1,NULL,NULL,'L/L','HCT (haematocrit) measures the amount of space (volume) within the blood that is taken up by red blood cells.'),(3,1,'Red Cell Count - RBC',4,6,NULL,NULL,'x10^12/L','Red Blood Cell (RBC) Count analyses the number of red blood cells in the blood. Red blood cells carry oxygen from the lungs to the rest of the body, where it can be used to fuel energy processes such as movement and respiration. They also carry carbon dioxide produced from cells back to the lungs so that it can be exhaled.'),(4,1,'MCV',81,98,NULL,NULL,'fl','MCV (mean corpuscular volume) reflects the average size of your red blood cells. This is important to measure, as it can indicate how much oxygen your cells are likely to be transporting around the body.'),(5,1,'MCH',27,33,NULL,NULL,'pg','MCH (mean corpuscular haemoglobin) measures the average amount of haemoglobin contained in one of your red blood cells.'),(6,1,'MCHC',300,350,NULL,NULL,'g/L','MCHC (mean corpuscular haemoglobin concentration) is the average concentration of haemoglobin in your red blood cells. Haemoglobin is a molecule which allows red blood cells to transport oxygen around the body.'),(7,1,'RDW',12,14,NULL,NULL,'%','Red blood cell distribution width (RDW) indicates whether your red blood cells are all the same size, or different sizes or shapes. Normally cells are fairly uniform both in size and in shape, but some blood disorders may cause your red blood cells to form in abnormal sizes. This test measures the difference between the largest and the smallest red blood cell.'),(8,2,'White Cell Count - WBC',3,10,NULL,NULL,'x10^9/L','White Blood Cell (WBC) Count measures the number of white blood cells in the blood. White blood cells are key to your body\'s immune system. They fight infections and protect your body from foreign invaders such as harmful germs and bacteria. Additionally, they produce many antibodies and memory cells to protect you from further infections with the same germ.'),(9,2,'Neutrophils - NEUT',2,8,NULL,NULL,'x10^9/L','Neutrophils are the most abundant type of white blood cell in the body and are responsible for helping your body fight infection. When a germ is initially detected by the body, neutrophils are the defence system which go out and attack the germ before any of your other white blood cells. When neutrophils are low you can be more vulnerable to illness and infection.'),(10,2,'Lymphocytes - LYMPH',1,4,NULL,NULL,'x10^9/L','Lymphocytes are a type of white blood cell which fight bacterial and viral infections. They are the subset of white blood cells involved in the more specific response to infections, which can identify and differentiate between different foreign organisms that enter the body. As well as fighting infection, they produce antibodies and memory cells to help to prevent future infections from the same germ. Lymphocytes include T cells, B cells and natural killer cells.'),(11,2,'Monocytes - MONO',0,1,NULL,NULL,'x10^9/L','Monocytes are a type of white blood cell that surround and destroy germs and dead or damaged cells from the blood. The heat and swelling that you feel when a body part is inflamed, for example after a cut on your finger, is caused by the activities of these cells.'),(12,2,'Eosinophils - EO',0,0,NULL,NULL,'x10^9/L','Eosinophils are a type of white blood cell that are responsible for removing parasitic infections and regulating inflammation to mark an infected site. They also play a role in allergy and in asthma.'),(13,2,'Basophils - BASO',0,0,NULL,NULL,'x10^9/L','Basophils are a type of white blood cell that protect your body from bacteria and parasites such as ticks. They also play a role in allergic reactions.'),(14,3,'Platelet Count - PLT',150,400,NULL,NULL,'x10^9/L','Platelets or clotting cells are the smallest type of blood cell. They are formed in the bone marrow and are important in blood clotting. When bleeding occurs, the platelets swell, clump together and form a sticky plug (a clot) which helps stop the bleeding.'),(15,3,'MPV',7,13,NULL,NULL,'fl','MPV, or Mean Platelet Volume, is a measurement of the average size of your platelets. Platelets are fragmented cells within the blood that aid the process of clot formation. MPV provides an indication of platelet production in your bone marrow.\n'),(16,4,'Urea',3,8,NULL,NULL,'mmol/L','Urea is a waste product produced by the body when it breaks down proteins in the liver. Once the urea is made, it is transported to the kidneys, which filter it out of the blood and remove it from the body in the form of urine. Measuring the levels of urea in the blood can therefore reflect how well both the liver and the kidneys, are functioning. It is important to note that even if one kidney is severely damaged but the other is functioning perfectly, results may still return as normal.'),(17,4,'Creatinine',59,104,NULL,NULL,'umol/L','Creatinine is a chemical waste molecule that is generated from normal muscle metabolism. Measurement of this is an indicator of the levels of other waste products in the body. Creatinine is also an accurate marker of kidney function, and may help in diagnosing kidney disease.'),(18,4,'EGFR',60,NULL,NULL,NULL,'ml/min/1.73m2','The estimated glomerular filtration rate (eGFR) assesses how well the kidneys are working by estimating the amount of blood filtered through the kidneys. The glomeruli are tiny filters in the kidneys responsible for removing waste products. If these filters do not do their job properly, kidney function can be impaired. The eGFR calculation is an estimate of actual glomerular filtration rate, calculated using your age, gender, ethnicity, and serum creatinine levels.'),(19,5,'Bilirubin',NULL,21,NULL,NULL,'umol/L','Bilirubin is a product of the breakdown of haemoglobin from red blood cells. It is removed from the body via the liver, stored and concentrated in the gallbladder and secreted into the bowel. It is removed from your body through urine and faeces. Bilirubin causes the yellowish colour you sometimes see in bruises, due to red blood cells breaking down underneath the skin.'),(20,5,'Alkaline Phosphatase - ALP',NULL,130,NULL,NULL,'IU/L','Alkaline phosphatase (ALP) is an enzyme found mainly in the liver and bones. Measuring it can indicate ongoing liver, gallbladder or bone disease.'),(21,5,'Alanine transferase - ALT',NULL,50,NULL,NULL,'IU/L','Alanine transferase (ALT) is an enzyme which is mostly found in the liver, but is also found in smaller amounts in the heart, muscles and the kidneys. If the liver is damaged, ALT is leaked into to bloodstream. As ALT is predominantly found in the liver, it is usually an accurate marker for liver inflammation and can indicate liver damage caused by alcohol, fatty liver, drugs or viruses (hepatitis).'),(22,5,'GGT',10,71,NULL,NULL,'IU/L','Gamma GT, also known as Gamma Glutamyltransferase, is a liver enzyme which is raised in liver and bile duct diseases. It is used in conjunction with ALP to distinguish between bone or liver disease. Gamma GT is also used to diagnose alcohol abuse as it is raised in 75% of long term drinkers.'),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `HealthMetrics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-08 21:54:49
