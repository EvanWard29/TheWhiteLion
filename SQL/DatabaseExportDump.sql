-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: proj-mysql.uopnet.plymouth.ac.uk    Database: isad251_eward
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cw_adminusers`
--

DROP TABLE IF EXISTS `cw_adminusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cw_adminusers` (
  `adminID` int(11) NOT NULL,
  `adminUsername` varchar(20) NOT NULL,
  `adminPassword` varchar(50) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cw_adminusers`
--

LOCK TABLES `cw_adminusers` WRITE;
/*!40000 ALTER TABLE `cw_adminusers` DISABLE KEYS */;
INSERT INTO `cw_adminusers` VALUES (1,'Evan','d88541892aa1ff5fa0ba93cd56170223'),(2,'admin','21232f297a57a5a743894a0e4a801fc3');
/*!40000 ALTER TABLE `cw_adminusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cw_customers`
--

DROP TABLE IF EXISTS `cw_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cw_customers` (
  `customerID` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cw_customers`
--

LOCK TABLES `cw_customers` WRITE;
/*!40000 ALTER TABLE `cw_customers` DISABLE KEYS */;
INSERT INTO `cw_customers` VALUES (1,'Evan Ward','2000-02-29'),(2,'Callum Booton','1999-12-08'),(3,'Shaun Glennie','1999-10-08'),(4,'Jack Howells','2000-05-14'),(5,'Jack Webb','1999-11-05'),(7,'Emilie Ward','2001-08-18'),(8,'Jayson Walsh','2000-08-31'),(9,'Caleb Morris','2000-03-02'),(10,'Evan','2000-02-29');
/*!40000 ALTER TABLE `cw_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cw_orderitem`
--

DROP TABLE IF EXISTS `cw_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cw_orderitem` (
  `orderID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`orderID`,`itemID`),
  KEY `fk_CW_OrderItem_Products` (`productID`),
  CONSTRAINT `fk_CW_OrderItem` FOREIGN KEY (`orderID`) REFERENCES `cw_orders` (`orderID`),
  CONSTRAINT `fk_CW_OrderItem_Products` FOREIGN KEY (`productID`) REFERENCES `cw_products` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cw_orderitem`
--

LOCK TABLES `cw_orderitem` WRITE;
/*!40000 ALTER TABLE `cw_orderitem` DISABLE KEYS */;
INSERT INTO `cw_orderitem` VALUES (1,1,23,1),(1,2,45,2),(1,3,94,3),(1,4,46,1),(2,1,1,4),(2,2,18,1),(2,3,31,1),(2,4,102,2),(2,5,92,3),(3,1,1,4),(3,2,18,1),(3,3,31,1),(3,4,102,2),(3,5,92,3),(4,1,74,7),(4,2,83,2),(4,3,105,4),(5,1,8,2),(5,2,50,1),(5,3,96,3),(6,1,56,1),(6,2,83,1),(6,3,60,1),(6,4,90,1),(6,5,99,1),(6,6,100,1),(7,1,56,1),(7,2,83,1),(7,3,60,1),(7,4,90,1),(7,5,100,1),(8,1,56,1),(8,2,83,1),(8,3,60,1),(8,4,100,1),(9,1,56,1),(9,2,83,1),(9,3,60,1),(9,4,100,1),(10,1,56,1),(10,2,83,1),(10,3,60,1),(10,4,100,1),(11,1,7,2),(11,2,92,1),(11,3,101,1);
/*!40000 ALTER TABLE `cw_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cw_orders`
--

DROP TABLE IF EXISTS `cw_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cw_orders` (
  `orderID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `orderDate` datetime NOT NULL,
  `tableNo` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `fk_CW_Orders` (`customerID`),
  CONSTRAINT `fk_CW_Orders` FOREIGN KEY (`customerID`) REFERENCES `cw_customers` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cw_orders`
--

LOCK TABLES `cw_orders` WRITE;
/*!40000 ALTER TABLE `cw_orders` DISABLE KEYS */;
INSERT INTO `cw_orders` VALUES (1,1,'2019-12-17 17:26:00',3),(2,2,'2019-12-17 17:29:23',8),(3,8,'2019-12-17 17:30:32',2),(4,9,'2019-12-17 17:33:59',4),(5,1,'2019-12-17 17:39:23',4),(6,4,'2019-12-17 18:25:18',7),(7,5,'2019-12-17 18:27:22',2),(8,9,'2019-12-17 18:28:46',3),(9,9,'2019-12-17 18:31:21',3),(10,9,'2019-12-17 18:32:15',3),(11,1,'2019-12-22 19:34:45',3);
/*!40000 ALTER TABLE `cw_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cw_products`
--

DROP TABLE IF EXISTS `cw_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cw_products` (
  `productID` int(11) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `productDescription` varchar(200) DEFAULT NULL,
  `productType` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `Reorder` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cw_products`
--

LOCK TABLES `cw_products` WRITE;
/*!40000 ALTER TABLE `cw_products` DISABLE KEYS */;
INSERT INTO `cw_products` VALUES (1,'Kopparberg Strawberry & Lime on Draught','The blend of ripe strawberry flavour energised by zingy lime delivers a fruity and refreshing cider.','cider',3.23,_binary '\0'),(2,'Strongbow Dark Fruits','Cider with Blackcurrant and Blackberry Juices and Flavours.','cider',2.79,_binary '\0'),(3,'Magners','Premium Irish Cider crafted with the finest blend of 17 Apple Varieties, picked from our orchards in Clonmel, Tipperary.','cider',1.99,_binary '\0'),(4,'Strongbow','A blend of the bittersweet cider apples, grown and pressed in Herefordshire.','cider',2.59,_binary '\0'),(5,'Thatchers Gold','A medium dry golden cider, with a smooth and refreshing taste. Crafted from a blend of our favourite apples including Dabinett, Porters Perfection and Harry Masters Jersey.','cider',2.65,_binary '\0'),(6,'Kopparberg Mixed Fruit','Apple cider infused with raspberry and blackcurrant delivers a truly unique, fruity taste rich in colour and refreshing down to the last drop.','cider',2.45,_binary '\0'),(7,'Kopparberg Strawberry & Lime','The blend of ripe strawberry flavour energised by zingy lime delivers a fruity and refreshing cider.','cider',2.79,_binary '\0'),(8,'Bulmers No 17','Crushed Red Berries & lime is a full flavoured mixed red berry cider, cut through with a sharp shot of lime to deliver an explosive fruit taste.','cider',3.35,_binary '\0'),(9,'Sadler\'s 1861 White Beer','A white beer brewed purely with English Hops, Barley and Wheat. A soft spiced malt leads to a floral fruit finish.','beer',2.99,_binary '\0'),(10,'Thornbridge Versa Weisse Beer','This fresh, fruity Weisse beer pours a hazy, burnt orange and true to its style, it has well balanced flavours of clove spiciness, banana and bubble gum.','beer',1.99,_binary '\0'),(11,'Blue Moon Belgian White','A wheat beer brewed with orange peel for a subtle sweetness and bright, citrus aroma.','beer',1.99,_binary '\0'),(12,'Birra Moretti','The best raw materials are used to make Birra Moretti, as well as a special blend of high quality hops that gives it a unique taste and fragrance, enhancing its perfectly balanced bitter taste.','beer',3.10,_binary '\0'),(13,'Tsingtao','Crafted using malted barley, hops, yeast & pure mountain water for a crisp refreshing beer','beer',3.10,_binary '\0'),(14,'Budweiser','Light bodied lager with clean, crisp, dry finish','beer',3.19,_binary '\0'),(15,'Peroni','Peroni Nastro Azzurro is a crisp and refreshing beer crafted with passion and flair to offer a delicate balance of bitterness and subtle citrus aromatic notes.','beer',3.25,_binary '\0'),(16,'Newcastle Brown Ale','A premium brown ale, full-bodied, with a distinctive caramel, fruity character and a pleasantly sweet after-taste.','beer',2.95,_binary '\0'),(17,'Corona','Golden lager with honey and refreshing citrus notes.','beer',3.25,_binary '\0'),(18,'Beefeater London Blood Orange','The fresh citrus flavours of blood orange tune perfectly with the classic notes of juniper and citrus of Beefeater Gin.','gin',3.00,_binary '\0'),(19,'Gordon\'s Pink Gin','Refreshing taste of Gordon\'s with the natural sweetness of raspberries and strawberries, with the tang of redcurrant served up in a unique blushing tone.','gin',3.00,_binary '\0'),(20,'Bombay Sapphire','A London dry gin infused with 10 botanicals. Fresh citrus and juniper flavours with a light, spicy finish.','gin',3.00,_binary '\0'),(21,'Tanqueray','A perfect balance of four botanicals - juniper, coriander, angelica and liquorice.','gin',3.00,_binary '\0'),(22,'Hendrick\'s Gin','In addition to the traditional juniper infusion, Hendrick\'s uses Bulgarian rose and cucumber to add flavour.','gin',3.00,_binary '\0'),(23,'GinTing','Fresh, fruity Gin using the finest botanicals & natural flavours: Passionfruit, Mango and Elderflower.','gin',3.00,_binary '\0'),(24,'Didsbury Gin Raspberry & Elderflower','A blend of fresh and dried lemon, lime, orange and grapefruit peels perfectly balance with classic gin botanicals.','gin',3.00,_binary '\0'),(25,'Gin Fizz','Gin, juice, sugar, syrup, and egg white.','gin',3.00,_binary '\0'),(26,'Gin and Ginger','Edinburgh Gin Rhubarb & Ginger Liqueur and ginger ale, with lemon','gin',3.40,_binary '\0'),(27,'Smirnoff','Triple distilled and filtered 10 times for purity.','vodka',3.30,_binary '\0'),(28,'Stolichnaya','Premium Russian Vodka with flavours of sweet vanilla, butterscotch and orange rind.','vodka',3.30,_binary '\0'),(29,'Skyy','Made with 100% pure filtered Californian water and American Midwest grains.','vodka',3.30,_binary '\0'),(30,'Absolut','Rich, full bodied and complex, yet smooth and mellow, this shows a distinct character of grain, followed by a hint of dried fruit.','vodka',3.30,_binary '\0'),(31,'Grey Goose','Distilled from French wheat, with spring water from Gensac and filteredthrough Champagne limestone.','vodka',4.30,_binary '\0'),(32,'Captain Morgan Original Spiced Gold','A smooth blend of warm spices and vanilla notes.','rum',1.99,_binary '\0'),(33,'Captain Morgan White','Blended from the finest selection of caribbean rums.','rum',1.99,_binary '\0'),(34,'Bacardi Carta Blanca','A light. floral and fruity white rum.','rum',3.45,_binary '\0'),(35,'The Kraken Black Spiced','Chocolate sweetness, vanilla, cinnamon, clove, ginger and orange all come through in perfect harmony.','rum',3.50,_binary '\0'),(36,'Havana Club 7-year-old','A rich, sweet, dark rum with hints of spice and vanilla.','rum',3.50,_binary '\0'),(37,'Red Leg Spiced','Premium Caribbean rum infused with Jamaican vanilla, ginger and spices left to rest in old oak barrels and emerges as a smooth tasting rum with a hint of sweet spice. ','rum',3.50,_binary '\0'),(38,'Ron Zacapa','Made from pure sugar cane honey and aged high up in the Guatemalan mountains.','rum',4.50,_binary '\0'),(39,'Haig Club Clubman','Notes of vanilla and dried fruits result in a light, sweet and vibrant taste with a smooth, clean finish.','whisky',2.00,_binary '\0'),(40,'Bell\'s','A select blend of grain and fine malt whiskies, all matured in selected oak casks for a richer flavour.','whisky',3.00,_binary '\0'),(41,'The Famous Grouse','Well-balanced oak, fruitiness with a hint of citrus.','whisky',3.00,_binary '\0'),(42,'Jameson','Spicy, nutty and vanilla notes.','whisky',3.00,_binary '\0'),(43,'Jack Daniel\'s','Charcoal mellowed, a balance of sweet and oaky flavours.','whisky',4.00,_binary '\0'),(44,'Chardonnay','Juicy and smooth.','wine',2.65,_binary '\0'),(45,'Pinot Grigio','Crisp and fresh.','wine',2.65,_binary '\0'),(46,'Merlot','Fruity, warm and velvety, with a touch of spice.','wine',2.65,_binary '\0'),(47,'Shiraz','Soft and medium bodied, with plump, juicy fruit flavours.','wine',2.85,_binary '\0'),(48,'White Zinfandel Rosé','Light, fresh and fruity.','wine',2.65,_binary '\0'),(49,'Villa Maria Sauvignon Blanc','Intense, ripe gooseberry aromas, with lime and passion fruit flavours.','wine',14.29,_binary '\0'),(50,'Hardys Chardonnay','Tropical and juicy, with characters of peach, melon and pineapple.','wine',9.69,_binary '\0'),(51,'Hardys Pinot Grigio','Fresh and fruity, with delicate pear and citrus flavours.','wine',9.69,_binary '\0'),(52,'Wolf Blass Sparkling Brut','A delicately flavoured Pinot Noir Chardonnay Sparkling sourced from premium Australian vineyards. A delicious lemon curd and brioche nose along with a seductive hint of honeysuckle.','champagne',10.00,_binary '\0'),(53,'Teresa Rizzi Prosecco DOC','Lighter in texture, softer on the palate with larger bubbles, and usually lower in alcohol than MCC.','champagne',3.89,_binary '\0'),(54,'Teresa Rizzi Sparkling Rosé','A sparkling wine from Prosecco Veneto with a blend based on glera grapes and presents an alcohol content of 11.5%.','champagne',4.45,_binary '\0'),(55,'Denbies Whitedowns Brut','The Denbies Vineyard Select range of wines are limited in release, produced only in the best of seasons using the finest of grapes.','champagne',19.00,_binary '\0'),(56,'Pepsi Max Cherry','Pepsi Max Cherry is the genius combination of full-on cherry cola taste, but with none of the sugar.','fizzy',1.80,_binary '\0'),(57,'Pepsi Max','Maximum Taste, No sugar - The long lasting hit of caramel and vanilla and the intense taste of a regular Pepsi all with no sugar.','fizzy',1.80,_binary '\0'),(58,'Diet Pepsi','With its light, crisp taste, Diet Pepsi gives you all the refreshment you need - with zero sugar and zero calories','fizzy',1.80,_binary '\0'),(59,'R White\'s Lemonade','Made with real lemon juice, clear and refreshing.','fizzy',1.80,_binary '\0'),(60,'Pepsi','The darkest cola of the Pepsi collection, you can taste the caramel, sweet citrus and spiced flavours','fizzy',1.90,_binary '\0'),(61,'Dalston\'s Fizzy Rhubarb','Made with real British rhubarb','fizzy',0.95,_binary '\0'),(62,'Gunna Muscovite Lemonade & Mint','Sparkling Reduced Sugar Lemon and Mint Flavour Drink with Sugar and Sweetener.','fizzy',0.95,_binary '\0'),(63,'Monster Ultra','Carbonated Energy Drink with Taurine, Caffeine, L-Carnitine and B Vitamins with Sweeteners','fizzy',1.15,_binary '\0'),(64,'R White\'s Raspberry Lemonade','Carbonated Lemon and Raspberry Soft Drink with Sugar and Sweeteners.','fizzy',0.95,_binary '\0'),(65,'Old Jamaica Ginger Beer','Carbonated Ginger Beer Flavour Soft Drink with Sugar and Sweetener.','fizzy',1.15,_binary '\0'),(66,'Old Jamaica Diet Ginger Beer','Carbonated Low Calorie Ginger Beer Flavour Soft Drink with Sweetener.','fizzy',1.15,_binary '\0'),(67,'Sanpellegrino Limonata','Sparkling lemon beverage made with lemon juice from concentrate, water, sugar, carbon dioxide, natural flavors and l-ascorbic acid.','fizzy',1.15,_binary '\0'),(68,'Sanpellegrino Rossa','Sparkling Lemon Beverage with 16% Lemon Juice, with Sugar and Sweetener.','fizzy',1.15,_binary '\0'),(69,'Monster Mango Loco','Carbonated Fruit Energy Drink with Taurine, Caffeine, L-Carnitine, Inositol and B Vitamins with Sugars and Sweetener','fizzy',1.25,_binary '\0'),(70,'Monster Energy','Carbonated Energy Drink with Taurine, L-Carnitine, Caffeine, Ginseng and B Vitamins with Sugars and Sweetener.','fizzy',1.25,_binary '\0'),(71,'Innocent Super Smootie Energise','This innocent super smoothie is a blend of crushed fruit, vegetables, pure juices, seeds, botanicals and added vitamins.','juice',1.49,_binary '\0'),(72,'Strathmore Still Spring Water','Pure, clear, still Scottish spring water.','juice',1.59,_binary '\0'),(73,'Orange Juice','Pasteurised smooth orange juice.','juice',1.89,_binary '\0'),(74,'Apple Juice','Pasteurised apple juice.','juice',1.89,_binary '\0'),(75,'Cranberry Juice','Pasteurised cranberry juice.','juice',1.89,_binary '\0'),(76,'Remedy Kombucha Cherry Plum','Red cherries + Kakadu plum. A taste bud tango.','juice',1.79,_binary '\0'),(77,'J2O Orange & Passion Fruit','Orange and Passion Fruit Soft Drink with Sugar and Sweetener.','juice',1.89,_binary '\0'),(78,'J2O Apple & Raspberry','Apple and Raspberry Soft Drink with Sugar and Sweetener.','juice',1.89,_binary '\0'),(79,'J2O Apple & Mango','Apple and Mango Soft Drink with Sugar and Sweetener','juice',1.89,_binary '\0'),(80,'Lime Cordial','Concentrated Lime Juice Cordial','juice',0.40,_binary '\0'),(81,'Blackcurrant Cordial','Concentrated Blackcurrant Juice Cordial','juice',0.40,_binary '\0'),(82,'Orange Cordial','Concentrated Orange Juice Cordial','juice',0.40,_binary '\0'),(83,'Britvic Tonic Water','Britvic Tonic Water is the delightful, bubbly soda water that tastes fantastic and imparts a unique and refreshing sensation.','mixer',0.95,_binary '\0'),(84,'Fentimans Tonic Water','Fentimans Tonic Water is the delightful, bubbly soda water that tastes fantastic and imparts a unique and refreshing sensation.','mixer',1.15,_binary '\0'),(85,'Fentimans Orange Tonic Water','Made with beautifully sweet Valencian oranges and infused with Lemongrass.','mixer',1.15,_binary '\0'),(86,'Britvic Ginger Ale','Lightly sparkling with warming ginger root flavour','mixer',0.95,_binary '\0'),(87,'Britvic Bitter Lemon','A zesty and revitalising taste and aroma, Low calorie','mixer',0.95,_binary '\0'),(88,'Britvic Pineapple Juice','Light and fresh, this marbled juice is tasty and tropical','mixer',0.95,_binary '\0'),(89,'Britvic Tomato Juice','Ruby red with a hint of lemon juice and spicy Worcestershire sauce flavour','mixer',0.95,_binary '\0'),(90,'Lighlty Salted Kettle Chips','Hand Cooked Potato Chips, Lightly Salted.','crisps',0.85,_binary '\0'),(91,'Sea Salt & Vinegar Kettle Chips','Hand Cooked Potato Chips with Sea Salt and \"Aceto Balsamico di Modena IGP\".','crisps',0.85,_binary '\0'),(92,'Mature Cheddar & Red Onion Kettle Chips','Hand Cooked Potato Chips with Mature Cheddar Cheese and Red Onion Seasoning.','crisps',0.85,_binary '\0'),(93,'Sweet Chilli & Sour Cream Kettle Chips','Hand Cooked Potato Chips with Sweet Chilli and Sour Cream Seasoning.','crisps',0.85,_binary '\0'),(94,'KP Original Salted Peanuts','Roasted Salted Peanuts','nuts',0.70,_binary '\0'),(95,'KP Dry Roasted Peanuts','Dry Roasted Peanuts','nuts',0.70,_binary '\0'),(96,'KP Salted Cashews','Roasted Salted Cashew Nuts','nuts',0.70,_binary '\0'),(97,'KP Spicy Chilli Peanuts','Spicy Chilli Flavour Peanuts','nuts',0.70,_binary '\0'),(98,'Viennese Finger','Two biscuits sandwiched with buttercream and jam.','biscuits',0.40,_binary '\0'),(99,'Stem Ginger Biscuits',' Tasty, wholesome and bursting with natural flavour.','biscuits',0.65,_binary '\0'),(100,'Salted Caramel Brownie Bar','ruit & Peanut Bar with Cacao, Sea Salt, Natural Flavouring & Sweetener','biscuits',1.30,_binary '\0'),(101,'Twix','Milk Chocolate (35%) covered caramel (32%) and biscuit (26%)','biscuits',0.75,_binary '\0'),(102,'Gingerbread Muffin','Generously spiced, perfectly moist and lightly sweet. ','cake',1.50,_binary '\0'),(103,'Mince Tart','Filled with a spicy yet sweet vegetarian-style homemade mincemeat.','cake',1.50,_binary '\0'),(104,'Jaffa Cakes','20 Light Sponge Cakes with Dark Crackly Chocolate and a Smashing Orangey Centre','cake',1.00,_binary '\0'),(105,'Mr Kipling Angel Slices','Delectable layers of pink and yellow sponge with a heavenly vanilla filling topped with fondant icing.','cake',1.00,_binary '\0'),(106,'WKD Blue','Sparkling flavoured vodka pre-mix drink, made by blending mixed fruit flavours with triple distilled vodka.','cider',2.75,_binary '\0'),(107,'Smirnoff Ice','A malt beverage with a light, fruity flavor that\'s on the sweet side.','cider',2.59,_binary '\0');
/*!40000 ALTER TABLE `cw_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!50001 DROP VIEW IF EXISTS `sales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `sales` AS SELECT 
 1 AS `TotalCost`,
 1 AS `orderID`,
 1 AS `customerID`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'isad251_eward'
--

--
-- Dumping routines for database 'isad251_eward'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `AddCustomer`(p_CustomerName VARCHAR(50), p_DOB DATE)
BEGIN
	SELECT
		@customerID:= MAX(customerID)+1
	FROM
		CW_Customers;
		
	INSERT INTO CW_Customers(customerID, customerName, DOB)
		VALUES(@customerID, p_CustomerName, p_DOB);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `addOrder`(CustomerID INT, TableNo INT)
BEGIN
	SELECT
		@OrderID:= MAX(orderID)+1
	FROM
		CW_Orders;

	INSERT INTO CW_Orders(orderID, customerID, orderDate, tableNo)
		VALUES(@OrderID, CustomerID, Now(), TableNo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addOrderItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `addOrderItem`(OrderID INT, ItemID INT, ProductID INT, Quantity INT)
BEGIN
	INSERT INTO CW_OrderItem(orderID, itemID, productID, quantity)
		VALUES(OrderID, ItemID, ProductID, Quantity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `addProduct`(ProductID INT, ProductName VARCHAR(50), ProductDescription VARCHAR(200), ProductType VARCHAR(10), Price DECIMAL(10, 2))
BEGIN
	INSERT INTO CW_Products(productID, productName, productDescription, productType, price)
		VALUES(ProductID, ProductName, ProductDescription, ProductType, Price);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `editProduct`(ProductID INT, ProductName VARCHAR(50), ProductDescription VARCHAR(200), Price DECIMAL(10,2))
BEGIN
	UPDATE CW_Products 
		SET 
			CW_Products.productName = ProductName,
			CW_Products.productDescription = ProductDescription,
            CW_Products.price = Price
		WHERE CW_Products.productID = ProductID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `getAdmin`(AdminUsername VARCHAR(20))
BEGIN
	SELECT
		adminPassword
	FROM
		CW_AdminUsers
	WHERE
		AdminUsername = CW_AdminUsers.adminUsername;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `getAllOrders`()
BEGIN
	SELECT 
		*
	FROM 
		CW_Orders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `getCustomer`(CustomerName VARCHAR(40), dob DATE)
BEGIN
	SELECT
		*
	FROM
		CW_Customers
	WHERE
		CustomerName = CW_Customers.customerName && dob = CW_Customers.DOB;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCustomerName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `getCustomerName`(CustomerID INT)
BEGIN
	SELECT 
		CW_Customers.customerName
	FROM 
		CW_Customers
	WHERE 
		CW_Customers.customerID = CustomerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCustomerOrderItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `getCustomerOrderItems`(OrderID INT)
BEGIN
	SELECT 
		*
	FROM 
		CW_OrderItem
	WHERE 
		OrderID = CW_OrderItem.orderID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCustomerOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `getCustomerOrders`(CustomerID INT)
BEGIN
	SELECT 
		*
	FROM 
		CW_Orders
	WHERE 
		CW_Orders.customerID = CustomerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLastCustomerID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `getLastCustomerID`()
BEGIN
	SELECT
		@CustomerID:= MAX(customerID)+1
	FROM
		CW_Customers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLastOrderID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `getLastOrderID`()
BEGIN
	SELECT
		@orderID:= MAX(orderID)+1
	FROM
		CW_Orders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLastProductID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `getLastProductID`()
BEGIN
	SELECT
		@productID:= MAX(productID)+1
	FROM
		CW_Products;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `getProduct`(ProductID INT)
BEGIN
	SELECT * FROM CW_Products
		WHERE CW_Products.productID = ProductID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProductName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `getProductName`(ProductID INT)
BEGIN
	SELECT 
		CW_Products.productName
	FROM 
		CW_Products
	WHERE 
		ProductID = CW_Products.productID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `removeProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `removeProduct`(ProductID INT)
BEGIN
	DELETE FROM CW_Products 
		WHERE CW_Products.productID = ProductID; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `updateStatus`(OrderID INT)
BEGIN
	UPDATE CW_Orders SET CW_Orders.orderStatus = 'CONFIMRED'
		WHERE CW_Orders.orderID = OrderID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `withdrawProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ISAD251_EWard`@`%` PROCEDURE `withdrawProduct`(ProductID INT)
BEGIN
	DELETE FROM CW_Products
		WHERE CW_Products.productID = ProductID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `sales`
--

/*!50001 DROP VIEW IF EXISTS `sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ISAD251_EWard`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `sales` AS select sum((`cw_orderitem`.`quantity` * `cw_products`.`price`)) AS `TotalCost`,`cw_orders`.`orderID` AS `orderID`,`cw_customers`.`customerID` AS `customerID` from (((`cw_orderitem` join `cw_products`) join `cw_orders`) join `cw_customers`) where ((`cw_orders`.`orderID` = `cw_orderitem`.`orderID`) and (`cw_orderitem`.`productID` = `cw_products`.`productID`) and (`cw_customers`.`customerID` = `cw_orders`.`customerID`)) group by `cw_orders`.`orderID`,`cw_customers`.`customerID` */;
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

-- Dump completed on 2020-01-08 19:31:39
