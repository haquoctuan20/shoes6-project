-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: shoes_shop
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ID` char(10) NOT NULL,
  `Name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Slug` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('D01','Flip Flop','flip-flop',NULL,NULL),('D02','Giày bóng đá','giay-bong-da',NULL,NULL),('D03','Sneaker','sneaker',NULL,NULL),('D04','Khác','khac',NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `SaleOrderID` int NOT NULL,
  `ProductID` char(10) NOT NULL,
  `Number` int NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `Color` varchar(100) NOT NULL,
  `Size` varchar(100) NOT NULL,
  PRIMARY KEY (`SaleOrderID`,`ProductID`),
  KEY `ProductID_idx` (`ProductID`),
  CONSTRAINT `_ID_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ID`),
  CONSTRAINT `saleID` FOREIGN KEY (`SaleOrderID`) REFERENCES `sale_order` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ID` char(10) NOT NULL,
  `Avatar` varchar(100) NOT NULL,
  `Name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Slug` varchar(180) NOT NULL,
  `Description` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Material` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Rate` int DEFAULT NULL,
  `OriginPrice` decimal(13,0) DEFAULT NULL,
  `SalePrice` decimal(13,0) NOT NULL,
  `Quantity` int NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `CategoryID` char(10) NOT NULL,
  `Avatarr` varchar(100) NOT NULL,
  `Color` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Size` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CategoryID_idx` (`CategoryID`),
  CONSTRAINT `CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('D01SP01','/Images/AD01SP01_1.png','DÉP ADILETTE LITE','dep-adilette-lite','Nói về sự thoải mái thì đôi dép adidas adilette là số một. Bạn sẽ thấy đôi dép này bên thành bể bơi, trên con đường ven biển hoặc bất cứ nơi nào mang lại không khí thật chill. Mà có ai chill bằng một chú quái vật to lớn đáng yêu, vậy nên đôi dép này được hợp tác thiết kế cùng Pixar và có sự góp mặt của nhóm bạn sôi nổi, vui nhộn trong bộ phim Monsters, Inc. của Disney.','Chất liệu tổng hợp','RẺ',4,800000,600000,50,NULL,NULL,'D01','/Images/AD01SP01_2.png','Trắng','29'),('D01SP02','/Images/AD01SP02_1.png','DÉP ADILETTE','dep-adilette','Bước ra khỏi phòng tắm mới chỉ là bước khởi đầu buổi sáng — nhưng đừng để cảm giác thoải mái tiêu tan ngay khi bạn vừa bước chân ra khỏi nhà. Đôi dép adidas này giúp bạn tận hưởng cảm giác dễ chịu như khi ở nhà suốt cả ngày dài. Quai dép nhanh khô phù hợp cho bạn mang dép từ phòng tắm ra phố thật tiện lợi. Phối màu classic kiểu sinh viên mang đến vẻ thể thao mà linh hoạt cho outfit của bạn.','Chất liệu tổng hợp','RẺ',5,800000,500000,50,NULL,NULL,'D01','/Images/AD01SP02_2.png','Đỏ','30'),('D01SP03','/Images/AD01SP03_1.png','DÉP QUAI NGANG ADILETTE COMFORT','dep-quai-ngang-adilette-comfort','Hãy xỏ chân vào đôi dép nam thoải mái và dễ đi này. Thân dép ôm chân với công nghệ Cloudfoam Plus mang đến cảm giác đệm chân siêu êm ái. Quai dép đơn nổi bật với huy hiệu thể thao adidas thể hiện tình yêu dành cho thương hiệu.','Chất liệu tổng hợp, EVA và vải dệt','MỚI',0,NULL,830000,50,NULL,NULL,'D01','/Images/AD01SP03_2.png','Xanh','30'),('D01SP04','/Images/AD01SP04_1.png','DÉP RACER TR','dep-racer-tr','Ra mắt vào năm 1972, đôi dép adidas adilette rất được yêu thích này dù đã bị \"copy\" rất nhiều lần nhưng vẫn chưa bao giờ thất thế. Với thiết kế phù hợp ở cả bãi biển lẫn phòng thay đồ và cả khi ra phố giải quyết công chuyện, phiên bản này có quai dép bằng EVA mềm mại cùng lòng dép ôm chân thoải mái.','Chất liệu EVA và vải dệt','CHẠY',3,2500000,2100000,50,NULL,NULL,'D01','/Images/AD01SP04_2.png','Đen','31'),('D01SP05','/Images/AD01SP05_1.png','SANDAL ADILETTE COMFORT','sandal-adilette-comfort','Trước hết để bàn chân chìm vào thoải mái. Với thiết kế cổ điển, đôi dép adidas này chính là thực thể cô đọng tính đa năng và cảm giác thoải mái. Thân dép có đường viền ôm chân giúp nâng đỡ êm ái cho bạn cả ngày dễ chịu. Thân dép quai ngang đầy phong cách tự hào thương hiệu adidas.','Chất liệu EVA','CHẠY',5,800000,600000,50,NULL,NULL,'D01','/Images/AD01SP05_2.png','Bạc','32'),('D02SP01','/Images/AD02SP01_1.png','GIÀY COPA SENSE.1','giay-copa-sense1','Có những cầu thủ thích gây chú ý. Nhưng chiến binh đích thực lại hoạt động thầm lặng và nổi bật với cú chạm nhẹ nhất. Tập trung vào bản năng bóng đá của bạn với đôi giày adidas Copa Sense. Với mút xốp Sensepod lấp đầy mọi khoảng trống ở gót giày cùng thân giày bằng da kangaroo mềm mại, đôi giày bóng đá sân cỏ tự nhiên này giúp bạn luôn giữ vững phong độ. Bên ngoài, lớp đệm Touchpod và Softstud giúp bạn bí mật kiểm soát thế trận.','Da kangaroo và xốp Sensepod','ĐẮT',3,NULL,5000000,50,NULL,NULL,'D02','/Images/AD02SP01_2.png','Đỏ','33'),('D02SP02','/Images/AD02SP02_1.png','GIÀY X SPEEDFLOW.1','giay-x-speedflow1','Quan sát, đọc tình huống rồi dứt điểm. Và lặp lại. Khi tinh thần nhạy bén hòa hợp cùng sự nhanh nhẹn của cơ thể, bạn sẽ trở thành phiên bản nhanh nhất của chính mình. Hãy kiếm tìm nhịp điệu của bạn và bỏ lại mọi thứ phía sau. Bất kể khái niệm \"tốc độ\" của bạn là gì, đôi giày đá bóng adidas X này sẽ giúp bạn luôn dẫn đầu. Với vận động viên nước rút, miếng đệm bằng sợi carbon Carbitex và mũi giày hếch nhẹ tạo lực đẩy bùng nổ. Với phù thủy sân cỏ, khung AgilityCage tạo độ ổn định và mang lại cảm giác chắc chắn cho những bước đổi hướng ma thuật. Với cỗ máy săn bàn, chất liệu adidas Primeknit co giãn tăng thêm cảm giác thoải mái trong lúc chờ đợi cơ hội tỏa sáng.','Chất liệu Adidas Primeknit, sợi carbon Carbitex và vải dệt','MỚI',0,NULL,5000000,50,NULL,NULL,'D02','/Images/AD02SP02_2.png','Đỏ','31'),('D02SP03','/Images/AD02SP03_1.png','GIÀY X SPEEDFLOW.3','giay-x-speedflow3','Quan sát, đọc tình huống rồi dứt điểm. Và lặp lại. Khi tinh thần nhạy bén hòa hợp cùng sự nhanh nhẹn của cơ thể, bạn sẽ trở thành phiên bản nhanh nhất của chính mình. Hãy kiếm tìm nhịp điệu của bạn và bỏ lại mọi thứ phía sau. Thân giày Speedskin trong mờ của đôi giày bóng đá adidas X này giúp bạn luôn thoải mái khi bùng nổ sức mạnh chiến đấu. Bên dưới là đế ngoài bằng TPU giúp bạn bứt tốc trên mặt sân cỏ tự nhiên. Thiết kế ôm chân vừa vặn giúp bạn vững vàng trong các pha đổi hướng và xoay người để luôn nhanh hơn một bước.','Vải dệt Speedskin, chất liệu co dãn 4 chiều và TPU','MỚI',5,NULL,1900000,50,NULL,NULL,'D02','/Images/AD02SP03_2.png','Đỏ','32'),('D02SP04','/Images/AD02SP04_1.png','GIÀY PREDATOR FREAK.3','giay-predator-freak3','Bên ngoài khán đài, có thể bạn không nổi bật. Nhưng trên sân đấu, bạn nắm toàn quyền kiểm soát. Bung tỏa nội lực dữ dội trong bạn với đôi giày adidas Predator. Bạn sẽ dễ dàng xỏ chân vào đôi giày đá bóng này nhờ lưỡi giày đơn co giãn. Thân giày bằng vải dệt có lớp phủ và kiểu dáng cổ lửng nâng đỡ giúp bạn thoải mái làm chủ trận đấu. Các chi tiết Demonscale in 3D mở rộng tạo độ bám bóng giúp bạn luôn kiểm soát tốt.','Cao su, vải dệt','RẺ',5,3000000,2500000,50,NULL,NULL,'D02','/Images/AD02SP04_2.png','Đỏ','29'),('D02SP05','/Images/AD02SP05_1.png','GIÀY X SPEEDFLOW.5','giay-x-speedflow5','Trên sân tập, tốc độ là một thế mạnh. Trên sân đấu, đó là yếu tố quyết định. Nhanh trí. Nhanh chân. Hãy kiếm tìm nhịp điệu của bạn và bỏ lại mọi thứ phía sau. Càn quét trên từng sải bước với đôi giày đá bóng adidas X này. Thân giày bằng vải dệt mềm mại có lớp phủ cho sải bước thoải mái cùng bạn bùng nổ sức mạnh chiến đấu. Bên dưới là đế ngoài bằng cao su có đinh cho bước chân thần tốc trên sân cỏ nhân tạo.','Cao su, vải dệt','MỚI',0,NULL,1500000,50,NULL,NULL,'D02','/Images/AD02SP05_2.png','Đen','29'),('D03SP01','/Images/AD03SP01_1.png','GIÀY 4D FUSIO','giay-4d-fusio','Kiểu dáng tốc độ. Cảm giác thoải mái. Đôi giày adidas này hé lộ tương lai với đế giữa 4D đột phá giúp hoàn trả năng lượng có kiểm soát. Với đôi giày này, bạn có thể ra đường cả ngày. Và tận hưởng cảm giác thoải mái tuyệt đối. Đôi giày này không chỉ hỗ trợ hành trình của bạn mà còn khích lệ bạn tiến bước.','Vải dệt Adidas Primeknit, cao su','ĐẮT',3,6000000,5500000,50,NULL,NULL,'D03','/Images/AD03SP01_2.png','Đen','30'),('D03SP02','/Images/AD03SP02_1.png','GIÀY COURT TOURINO','giay-court-tourino','Nếu phải lựa chọn một đôi giày để đi suốt đời, bạn sẽ chọn đôi nào? Phải, đôi giày adidas Court Tourino là một lựa chọn rất ổn. Lấy cảm hứng từ một thiết kế classic thời những năm 2000, đôi giày trainer thanh lịch này có thân giày mượt mà bằng da và da lộn tổng hợp, có thể phối với cả đồ đi làm lẫn đi chơi. Dây giày bản rộng mang đến phong cách mới mẻ, nhờ đó outfit hàng ngày của bạn sẽ không bao giờ nhàm chán. Sản phẩm này có sử dụng chất liệu tái chế, là một phần cam kết của chúng tôi hướng tới chấm dứt rác thải nhựa. 20% thân giày làm từ chất liệu có chứa tối thiểu 50% thành phần tái chế.','Cao su, da và da lộn tổng hợp','CHẠY',4,NULL,2400000,50,NULL,NULL,'D03','/Images/AD03SP02_2.png','Trắng','30'),('D03SP03','/Images/AD03SP03_1.png','GIÀY FORUM LOW','giay-forum-low','Đam mê, quan điểm và ý tưởng của bạn là những gì khiến bạn trở nên khác biệt. Khi bạn tìm thấy cho mình tinh thần sáng tạo và biểu đạt bản thân, đôi giày adidas này cũng hòa quyện các màu sắc cơ bản và pastel vào từng sải bước. Khi cất lên tiếng nói là bạn tạo ra cơ hội để cộng đồng của mình thêm lớn mạnh. Logo Ba Lá như lời nhắc về sức mạnh của tình đoàn kết. Sản phẩm này có sử dụng chất liệu tái chế, là một phần cam kết của chúng tôi hướng tới chấm dứt rác thải nhựa. 20% thân giày làm từ chất liệu có chứa tối thiểu 50% thành phần tái chế.','Cao su, da và vải lưới','RẺ',5,NULL,2500000,50,NULL,NULL,'D03','/Images/AD03SP03_2.png','Trắng','31'),('D03SP04','/Images/AD03SP04_1.png','GIÀY TRAXION LITE','giay-traxion-lite','Bỏ lại công việc phía sau. Tìm kiếm sự tập trung trên sân với đôi giày golf adidas này. Đế ngoài gắn đinh tạo cảm giác sát đất cho tư thế vững chãi để bạn tự tin vung gậy và ghi điểm vào mọi lỗ golf. Thân giày không bám ẩm giữ cho đôi chân khô ráo trên nền cỏ đẫm nước và thời tiết ẩm ướt.','Da tổng hợp vi sợi','CHẠY',4,2600000,2395000,50,NULL,NULL,'D03','/Images/AD03SP04_2.png','Trắng','31'),('D03SP05','/Images/AD03SP05_1.png','GIÀY ULTRABOOST 21','giay-ultraboost-21','Nỗ lực vì chính bản thân bạn. Đôi giày chạy bộ adidas Ultraboost 21 này giúp mọi chuyện dễ dàng hơn. Siêu nhẹ nhưng vẫn giữ nguyên độ nâng đỡ, thân giày adidas Primeknit+ thích ứng theo hình dáng bàn chân khi chuyển động. Lớp đệm Boost đàn hồi cho cảm giác trợ lực như lời nhắc bạn luôn có thể cố gắng thêm một sải bước, một dãy phố hay thậm chí hẳn một dặm. (Nhớ thêm vài bài hát vào playlist chạy bộ. Biết đâu bạn sẽ cần đến.)','Vải dệt Adidas Primeknit, cao su Continental™ Rubber','MỚI',4,NULL,5000000,50,NULL,NULL,'D03','/Images/AD03SP05_2.png','Đen','32'),('D04SP01','/Images/AD04SP01_1.png','GIÀY ADIDAS 4D FUTURECRAFT','giay-adidas-4d-futurecraft','Chạy bộ chính là tập trung vào hiện tại. Đôi giày chạy bộ adidas này dẫn dắt bạn nhanh chóng tới tương lai. Đế giữa adidas 4D đột phá dựa trên dữ liệu chạy bộ thu thập suốt 17 năm và công nghệ gia công kỹ thuật số, giúp tăng cường thoải mái cho từng sải bước. Thân giày adidas Primeknit đảm bảo cảm giác ôm chắc chắn, thích ứng theo bàn chân trong suốt chu kỳ của bước đi.','Vải dệt Adidas Primeknit','ĐẮT',5,NULL,6000000,50,NULL,NULL,'D04','/Images/AD04SP01_2.png','Đen','32'),('D04SP02','/Images/AD04SP02_1.png','GIÀY ADIZERO BOSTON 10','giay-adizero-boston-10','Vì cơ thể khỏe mạnh. Vì đầu óc minh mẫn. Vì kỷ lục cá nhân. Bất kể bạn chạy bộ vì lý do nào, đôi giày Adizero Boston 10 sẽ giúp bạn bắt kịp phiên bản tốc độ nhất của mình. Đế giữa kết hợp hai công nghệ Lightstrike và Lighstrike Pro tạo nên lớp đệm êm ái hơn so với giày marathon thông thường. Với cảm giác gọn ghẽ đến từ công nghệ ENERGYRODS, tất cả mang đến sải bước siêu đàn hồi cho bạn tốc độ thần sầu như trên đường đua mỗi khi mang giày.','Vải lưới siêu nhẹ, cao su Continental™ Rubber','MỚI',0,4200000,3800000,50,NULL,NULL,'D04','/Images/AD04SP02_2.png','Đen','33'),('D04SP03','/Images/AD04SP03_1.png','GIÀY GOLF ZG21 BOA TOKYO','giay-golf-zg21-boa-tokyo','Cú vung gậy tự tin đến từ cảm giác ổn định và thoải mái. Đôi giày golf adidas ZG21 BOA Tokyo cho cảm giác sát đất chắc chắn, tạo điểm tựa vững chắc để tung cú drive mạnh mẽ, chuẩn xác. Đế giữa kết hợp công nghệ Lightstrike và Boost tiếp thêm năng lượng cho từng sải bước cùng cảm giác siêu nhẹ. Công nghệ BOA® Fit System cho phép tùy chỉnh độ ôm chân nhanh chóng và chính xác. Thân giày chống thấm nước đảm bảo bàn chân luôn khô ráo khi trời ẩm ướt.','Chất liệu tổng hợp Sprintskin','ĐẮT',0,5500000,5300000,50,NULL,NULL,'D04','/Images/AD04SP03_2.png','Đen','33'),('D04SP04','/Images/AD04SP04_1.png','GIÀY ROGUERA','giay-roguera','Cảm nhận sức mạnh của xu hướng tập luyện thập niên 80. Mẫu giày này là phiên bản hiện đại của đôi giày tập kinh điển với thiết kế tràn đầy phong cách và thoải mái suốt ngày dài. Thân giày bằng da phủ và đế giữa twin-cup đặc trưng tăng cường độ bật nảy trong từng bước chân.','Da phủ, cao su, vải dệt, EVA','RẺ',0,NULL,1800000,50,NULL,NULL,'D04','/Images/AD04SP04_2.png','Đen','29'),('D04SP05','/Images/AD04SP05_1.png','GIÀY SUPERNOVA','giay-supernova','Buổi chạy của bạn bắt đầu trước cả giây phút bạn sải bước trên đường. Với niềm tin, mục tiêu hay khao khát đạt được phong độ tốt nhất. Hãy mang đôi giày chạy bộ adidas này và bắt đầu buổi chạy. Các yếu tố hiệu năng cao như lớp đệm đàn hồi và lớp phủ ngoài nâng đỡ mang đến sự thoải mái cho sải bước của bạn. Thân giày thoáng khí, không đường may giúp đôi chân bạn luôn thoáng mát kể cả khi tăng tốc. Sản phẩm này may bằng vải công nghệ Primegreen, thuộc dòng chất liệu tái chế hiệu năng cao. Thân giày chứa 50% thành phần tái chế. Không sử dụng polyester nguyên sinh.','Vải lưới, vải dệt, cao su','ĐẮT',5,NULL,5300000,50,NULL,NULL,'D04','/Images/AD04SP05_2.png','Đen','31');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Path` varchar(100) NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `ProductID` char(10) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Path_UNIQUE` (`Path`),
  KEY `ProductID_idx` (`ProductID`),
  CONSTRAINT `ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,'/Images/AD01SP01_1.png',NULL,NULL,'D01SP01'),(2,'/Images/AD01SP01_2.png',NULL,NULL,'D01SP01'),(3,'/Images/AD01SP01_3.png',NULL,NULL,'D01SP01'),(4,'/Images/AD01SP01_4.png',NULL,NULL,'D01SP01'),(5,'/Images/AD01SP01_5.png',NULL,NULL,'D01SP01'),(6,'/Images/AD01SP02_1.png',NULL,NULL,'D01SP02'),(7,'/Images/AD01SP02_2.png',NULL,NULL,'D01SP02'),(8,'/Images/AD01SP02_3.png',NULL,NULL,'D01SP02'),(9,'/Images/AD01SP02_4.png',NULL,NULL,'D01SP02'),(10,'/Images/AD01SP02_5.png',NULL,NULL,'D01SP02'),(11,'/Images/AD01SP03_1.png',NULL,NULL,'D01SP03'),(12,'/Images/AD01SP03_2.png',NULL,NULL,'D01SP03'),(13,'/Images/AD01SP03_3.png',NULL,NULL,'D01SP03'),(14,'/Images/AD01SP03_4.png',NULL,NULL,'D01SP03'),(15,'/Images/AD01SP03_5.png',NULL,NULL,'D01SP03'),(16,'/Images/AD01SP04_1.png',NULL,NULL,'D01SP04'),(17,'/Images/AD01SP04_2.png',NULL,NULL,'D01SP04'),(18,'/Images/AD01SP04_3.png',NULL,NULL,'D01SP04'),(19,'/Images/AD01SP04_4.png',NULL,NULL,'D01SP04'),(20,'/Images/AD01SP04_5.png',NULL,NULL,'D01SP04'),(21,'/Images/AD01SP05_1.png',NULL,NULL,'D01SP05'),(22,'/Images/AD01SP05_2.png',NULL,NULL,'D01SP05'),(23,'/Images/AD01SP05_3.png',NULL,NULL,'D01SP05'),(24,'/Images/AD01SP05_4.png',NULL,NULL,'D01SP05'),(25,'/Images/AD01SP05_5.png',NULL,NULL,'D01SP05'),(26,'/Images/AD02SP01_1.png',NULL,NULL,'D02SP01'),(27,'/Images/AD02SP01_2.png',NULL,NULL,'D02SP01'),(28,'/Images/AD02SP01_3.png',NULL,NULL,'D02SP01'),(29,'/Images/AD02SP01_4.png',NULL,NULL,'D02SP01'),(30,'/Images/AD02SP01_5.png',NULL,NULL,'D02SP01'),(31,'/Images/AD02SP02_1.png',NULL,NULL,'D02SP02'),(32,'/Images/AD02SP02_2.png',NULL,NULL,'D02SP02'),(33,'/Images/AD02SP02_3.png',NULL,NULL,'D02SP02'),(34,'/Images/AD02SP02_4.png',NULL,NULL,'D02SP02'),(35,'/Images/AD02SP02_5.png',NULL,NULL,'D02SP02'),(36,'/Images/AD02SP03_1.png',NULL,NULL,'D02SP03'),(37,'/Images/AD02SP03_2.png',NULL,NULL,'D02SP03'),(38,'/Images/AD02SP03_3.png',NULL,NULL,'D02SP03'),(39,'/Images/AD02SP03_4.png',NULL,NULL,'D02SP03'),(40,'/Images/AD02SP03_5.png',NULL,NULL,'D02SP03'),(41,'/Images/AD02SP04_1.png',NULL,NULL,'D02SP04'),(42,'/Images/AD02SP04_2.png',NULL,NULL,'D02SP04'),(43,'/Images/AD02SP04_3.png',NULL,NULL,'D02SP04'),(44,'/Images/AD02SP04_4.png',NULL,NULL,'D02SP04'),(45,'/Images/AD02SP04_5.png',NULL,NULL,'D02SP04'),(46,'/Images/AD02SP05_1.png',NULL,NULL,'D02SP05'),(47,'/Images/AD02SP05_2.png',NULL,NULL,'D02SP05'),(48,'/Images/AD02SP05_3.png',NULL,NULL,'D02SP05'),(49,'/Images/AD02SP05_4.png',NULL,NULL,'D02SP05'),(50,'/Images/AD02SP05_5.png',NULL,NULL,'D02SP05'),(51,'/Images/AD03SP01_1.png',NULL,NULL,'D03SP01'),(52,'/Images/AD03SP01_2.png',NULL,NULL,'D03SP01'),(53,'/Images/AD03SP01_3.png',NULL,NULL,'D03SP01'),(54,'/Images/AD03SP01_4.png',NULL,NULL,'D03SP01'),(55,'/Images/AD03SP01_5.png',NULL,NULL,'D03SP01'),(56,'/Images/AD03SP02_1.png',NULL,NULL,'D03SP02'),(57,'/Images/AD03SP02_2.png',NULL,NULL,'D03SP02'),(58,'/Images/AD03SP02_3.png',NULL,NULL,'D03SP02'),(59,'/Images/AD03SP02_4.png',NULL,NULL,'D03SP02'),(60,'/Images/AD03SP02_5.png',NULL,NULL,'D03SP02'),(61,'/Images/AD03SP03_1.png',NULL,NULL,'D03SP03'),(62,'/Images/AD03SP03_2.png',NULL,NULL,'D03SP03'),(63,'/Images/AD03SP03_3.png',NULL,NULL,'D03SP03'),(64,'/Images/AD03SP03_4.png',NULL,NULL,'D03SP03'),(65,'/Images/AD03SP03_5.png',NULL,NULL,'D03SP03'),(66,'/Images/AD03SP04_1.png',NULL,NULL,'D03SP04'),(67,'/Images/AD03SP04_2.png',NULL,NULL,'D03SP04'),(68,'/Images/AD03SP04_3.png',NULL,NULL,'D03SP04'),(69,'/Images/AD03SP04_4.png',NULL,NULL,'D03SP04'),(70,'/Images/AD03SP04_5.png',NULL,NULL,'D03SP04'),(71,'/Images/AD03SP05_1.png',NULL,NULL,'D03SP05'),(72,'/Images/AD03SP05_2.png',NULL,NULL,'D03SP05'),(73,'/Images/AD03SP05_3.png',NULL,NULL,'D03SP05'),(74,'/Images/AD03SP05_4.png',NULL,NULL,'D03SP05'),(75,'/Images/AD03SP05_5.png',NULL,NULL,'D03SP05'),(76,'/Images/AD04SP01_1.png',NULL,NULL,'D04SP01'),(77,'/Images/AD04SP01_2.png',NULL,NULL,'D04SP01'),(78,'/Images/AD04SP01_3.png',NULL,NULL,'D04SP01'),(79,'/Images/AD04SP01_4.png',NULL,NULL,'D04SP01'),(80,'/Images/AD04SP01_5.png',NULL,NULL,'D04SP01'),(81,'/Images/AD04SP02_1.png',NULL,NULL,'D04SP02'),(82,'/Images/AD04SP02_2.png',NULL,NULL,'D04SP02'),(83,'/Images/AD04SP02_3.png',NULL,NULL,'D04SP02'),(84,'/Images/AD04SP02_4.png',NULL,NULL,'D04SP02'),(85,'/Images/AD04SP02_5.png',NULL,NULL,'D04SP02'),(86,'/Images/AD04SP03_1.png',NULL,NULL,'D04SP03'),(87,'/Images/AD04SP03_2.png',NULL,NULL,'D04SP03'),(88,'/Images/AD04SP03_3.png',NULL,NULL,'D04SP03'),(89,'/Images/AD04SP03_4.png',NULL,NULL,'D04SP03'),(90,'/Images/AD04SP03_5.png',NULL,NULL,'D04SP03'),(91,'/Images/AD04SP04_1.png',NULL,NULL,'D04SP04'),(92,'/Images/AD04SP04_2.png',NULL,NULL,'D04SP04'),(93,'/Images/AD04SP04_3.png',NULL,NULL,'D04SP04'),(94,'/Images/AD04SP04_4.png',NULL,NULL,'D04SP04'),(95,'/Images/AD04SP04_5.png',NULL,NULL,'D04SP04'),(96,'/Images/AD04SP05_1.png',NULL,NULL,'D04SP05'),(97,'/Images/AD04SP05_2.png',NULL,NULL,'D04SP05'),(98,'/Images/AD04SP05_3.png',NULL,NULL,'D04SP05'),(99,'/Images/AD04SP05_4.png',NULL,NULL,'D04SP05'),(100,'/Images/AD04SP05_5.png',NULL,NULL,'D04SP05');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order`
--

DROP TABLE IF EXISTS `sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Phone` char(10) NOT NULL,
  `Address` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TotalMoney` decimal(13,0) NOT NULL,
  `Status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID_idx` (`UserID`),
  CONSTRAINT `USER_ID` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order`
--

LOCK TABLES `sale_order` WRITE;
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
INSERT INTO `sale_order` VALUES (112,'string','string',0,'Chờ xác nhận','2021-08-31',NULL,2);
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Role` char(10) NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@gmail.com','0123456789','admin','admin','ADMIN',NULL,NULL),(2,'customer@gmail.com','0987654321','customer','customer','CUSTOMER',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-31 18:06:53
