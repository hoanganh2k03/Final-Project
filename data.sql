-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for multimedia
CREATE DATABASE IF NOT EXISTS `multimedia` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `multimedia`;

-- Dumping structure for table multimedia.documents
CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_date` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table multimedia.documents: ~100 rows (approximately)
INSERT INTO `documents` (`id`, `title`, `content`, `created_date`) VALUES
	(1, 'Điền kinh Olympic 2020: Sự thống trị của Usain Bolt', 'sports_docs/doc_1.txt', '2025-04-05'),
	(2, 'Olympic 2024: Những khoảnh khắc đáng nhớ tại Paris', 'sports_docs/doc_2.txt', '2025-04-05'),
	(3, 'Bóng rổ Olympic 2020: Mỹ tiếp tục thống trị', 'sports_docs/doc_3.txt', '2025-04-05'),
	(4, 'Công nghệ VAR trong bóng đá: Thay đổi cuộc chơi', 'sports_docs/doc_4.txt', '2025-04-05'),
	(5, 'Quần vợt Grand Slam 2023: Sự lên ngôi của Alcaraz', 'sports_docs/doc_5.txt', '2025-04-05'),
	(6, 'Marathon Boston 2023: Chiến thắng của Evans Chebet', 'sports_docs/doc_6.txt', '2025-04-05'),
	(7, 'Bơi lội: Kỷ lục của Leon Marchand tại Olympic 2024', 'sports_docs/doc_7.txt', '2025-04-05'),
	(8, 'Bóng chuyền Thế giới 2022: Sự thống trị của Pháp', 'sports_docs/doc_8.txt', '2025-04-05'),
	(9, 'Đua xe F1 2023: Cuộc chiến giữa Verstappen và Leclerc', 'sports_docs/doc_9.txt', '2025-04-05'),
	(10, 'Golf: Sự trở lại của Rory McIlroy tại Masters 2023', 'sports_docs/doc_10.txt', '2025-04-05'),
	(11, 'Cầu lông Việt Nam: Nguyễn Thùy Linh tại Giải châu Á 2023', 'sports_docs/doc_11.txt', '2025-04-05'),
	(12, 'Bóng bàn: Sự thống trị của Trung Quốc tại các giải quốc tế', 'sports_docs/doc_12.txt', '2025-04-05'),
	(13, 'Điền kinh: Những kỷ lục đáng nhớ tại các giải đấu lớn', 'sports_docs/doc_13.txt', '2025-04-05'),
	(14, 'Leo núi: Everest kỷ lục của Kami Rita Sherpa 2023', 'sports_docs/doc_14.txt', '2025-04-05'),
	(15, 'Khúc côn cầu trên băng: Canada vô địch 2023', 'sports_docs/doc_15.txt', '2025-04-05'),
	(16, 'Bóng bầu dục Mỹ NFL 2023: Kansas City Chiefs lên ngôi', 'sports_docs/doc_16.txt', '2025-04-05'),
	(17, 'Đấu vật: Sự vượt trội của Nhật Bản tại các giải quốc tế', 'sports_docs/doc_17.txt', '2025-04-05'),
	(18, 'Trượt tuyết: Mikaela Shiffrin phá kỷ lục 2023', 'sports_docs/doc_18.txt', '2025-04-05'),
	(19, 'Cricket: Nam Phi vô địch ODI World Cup 2023', 'sports_docs/doc_19.txt', '2025-04-05'),
	(20, 'Đua thuyền: Thành tích ấn tượng của Anh tại các giải quốc tế', 'sports_docs/doc_20.txt', '2025-04-05'),
	(21, 'Thể dục dụng cụ: Simone Biles tỏa sáng tại các giải quốc tế', 'sports_docs/doc_21.txt', '2025-04-05'),
	(22, 'Boxing: Tyson Fury đánh bại Ngannou 2023', 'sports_docs/doc_22.txt', '2025-04-05'),
	(23, 'Judo: Nhật Bản dẫn đầu Olympic 2024', 'sports_docs/doc_23.txt', '2025-04-05'),
	(24, 'Taekwondo: Hàn Quốc tại Olympic 2024', 'sports_docs/doc_24.txt', '2025-04-05'),
	(25, 'Karate: Nhật Bản tại Olympic 2024', 'sports_docs/doc_25.txt', '2025-04-05'),
	(26, 'Bắn súng: Trung Quốc tại Olympic 2024', 'sports_docs/doc_26.txt', '2025-04-05'),
	(27, 'Bắn cung: Hàn Quốc tại Olympic 2024', 'sports_docs/doc_27.txt', '2025-04-05'),
	(28, 'Cưỡi ngựa: Đức tại Olympic 2024', 'sports_docs/doc_28.txt', '2025-04-05'),
	(29, 'Đua xe đạp: Tour de France 2023', 'sports_docs/doc_29.txt', '2025-04-05'),
	(30, 'Lướt sóng: Italo Ferreira tại các giải quốc tế', 'sports_docs/doc_30.txt', '2025-04-05'),
	(31, 'Trượt ván: Yuto Horigome tại các giải quốc tế', 'sports_docs/doc_31.txt', '2025-04-05'),
	(32, 'Bóng ném: Đan Mạch tại các giải quốc tế', 'sports_docs/doc_32.txt', '2025-04-05'),
	(33, 'Hockey trên cỏ: Ấn Độ tại các giải quốc tế', 'sports_docs/doc_33.txt', '2025-04-05'),
	(34, 'Bóng nước: Serbia tại các giải quốc tế', 'sports_docs/doc_34.txt', '2025-04-05'),
	(35, 'Thể thao điện tử 2023: Esports bùng nổ', 'sports_docs/doc_35.txt', '2025-04-05'),
	(36, 'Đua ngựa: Kentucky Derby 2023', 'sports_docs/doc_36.txt', '2025-04-05'),
	(37, 'Polo: Argentina tại Giải quốc tế 2023', 'sports_docs/doc_37.txt', '2025-04-05'),
	(38, 'Bóng chày: World Series 2023', 'sports_docs/doc_38.txt', '2025-04-05'),
	(39, 'Curling: Thụy Điển tại Olympic Đông 2022', 'sports_docs/doc_39.txt', '2025-04-05'),
	(40, 'Đấu kiếm: Pháp tại các giải quốc tế', 'sports_docs/doc_40.txt', '2025-04-05'),
	(41, 'Thể thao người khuyết tật: Paralympics 2024', 'sports_docs/doc_41.txt', '2025-04-05'),
	(42, 'Bóng đá nữ: Mỹ vô địch World Cup 2019', 'sports_docs/doc_42.txt', '2025-04-05'),
	(43, 'Đua mô tô: MotoGP 2023', 'sports_docs/doc_43.txt', '2025-04-05'),
	(44, 'Yoga: Giải quốc tế tại Ấn Độ 2023', 'sports_docs/doc_44.txt', '2025-04-05'),
	(45, 'Thể thao học đường: Việt Nam tại SEA Games 2023', 'sports_docs/doc_45.txt', '2025-04-05'),
	(46, 'Bóng rổ 3x3: Mỹ tại các giải quốc tế', 'sports_docs/doc_46.txt', '2025-04-05'),
	(47, 'Đua thuyền buồm: Anh tại các giải quốc tế', 'sports_docs/doc_47.txt', '2025-04-05'),
	(48, 'Thể thao dưới nước: Nga tại các giải quốc tế', 'sports_docs/doc_48.txt', '2025-04-05'),
	(49, 'Bóng đá futsal: Bồ Đào Nha vô địch World Cup 2021', 'sports_docs/doc_49.txt', '2025-04-05'),
	(50, 'Triathlon: Alistair Brownlee tại Olympic 2020', 'sports_docs/doc_50.txt', '2025-04-05'),
	(51, 'Bóng đá bãi biển: Brazil tại Thế giới 2023', 'sports_docs/doc_51.txt', '2025-04-05'),
	(52, 'Đua xe địa hình: Dakar Rally 2023', 'sports_docs/doc_52.txt', '2025-04-05'),
	(53, 'Bóng đá đường phố: Sean Garnier tại Red Bull 2023', 'sports_docs/doc_53.txt', '2025-04-05'),
	(54, 'Đua thuyền rồng: Việt Nam tại SEA Games 2023', 'sports_docs/doc_54.txt', '2025-04-05'),
	(55, 'Bóng rổ đường phố: AND1 Mixtape Tour 2023', 'sports_docs/doc_55.txt', '2025-04-05'),
	(56, 'Điền kinh đường trường: New York City Marathon 2023', 'sports_docs/doc_56.txt', '2025-04-05'),
	(57, 'Bóng đá thiếu niên: La Masia đào tạo tài năng', 'sports_docs/doc_57.txt', '2025-04-05'),
	(58, 'Thể thao mạo hiểm: Leo núi đá Alex Honnold 2023', 'sports_docs/doc_58.txt', '2025-04-05'),
	(59, 'Bóng bàn đôi: Trung Quốc tại các giải quốc tế', 'sports_docs/doc_59.txt', '2025-04-05'),
	(60, 'Thể thao truyền thống: Sumo Nhật Bản 2023', 'sports_docs/doc_60.txt', '2025-04-05'),
	(61, 'Bóng chuyền bãi biển: Brazil tại các giải quốc tế', 'sports_docs/doc_61.txt', '2025-04-05'),
	(62, 'Đua xe đạp leo núi: Nino Schurter tại Thế giới 2023', 'sports_docs/doc_62.txt', '2025-04-05'),
	(63, 'Bóng đá ảo: FIFA Online 2023', 'sports_docs/doc_63.txt', '2025-04-05'),
	(64, 'Thể thao mùa đông: Trượt băng nghệ thuật 2023', 'sports_docs/doc_64.txt', '2025-04-05'),
	(65, 'Bóng rổ nữ: WNBA 2023', 'sports_docs/doc_65.txt', '2025-04-05'),
	(66, 'Đua xe đạp lòng chảo: Anh tại Olympic 2020', 'sports_docs/doc_66.txt', '2025-04-05'),
	(67, 'Thể thao đồng đội: Bóng bầu dục 7 người tại các giải quốc tế', 'sports_docs/doc_67.txt', '2025-04-05'),
	(68, 'Bóng đá châu Phi: CAN 2021 tại Cameroon', 'sports_docs/doc_68.txt', '2025-04-05'),
	(69, 'Thể thao trẻ em: Tại Việt Nam 2023', 'sports_docs/doc_69.txt', '2025-04-05'),
	(70, 'Đua thuyền kayak: Đức tại các giải quốc tế', 'sports_docs/doc_70.txt', '2025-04-05'),
	(71, 'Bóng đá châu Á: AFC Asian Cup 2023', 'sports_docs/doc_71.txt', '2025-04-05'),
	(72, 'Thể thao đô thị: Parkour tại Pháp 2023', 'sports_docs/doc_72.txt', '2025-04-05'),
	(73, 'Bóng đá Nam Mỹ: Copa América 2021', 'sports_docs/doc_73.txt', '2025-04-05'),
	(74, 'Thể thao cổ điển: Ném đĩa tại các giải quốc tế', 'sports_docs/doc_74.txt', '2025-04-05'),
	(75, 'Bóng đá châu Âu: UEFA Champions League 2023', 'sports_docs/doc_75.txt', '2025-04-05'),
	(76, 'Thể thao trên không: Nhảy dù tại Dubai 2023', 'sports_docs/doc_76.txt', '2025-04-05'),
	(77, 'Bóng đá Việt Nam: SEA Games 2023', 'sports_docs/doc_77.txt', '2025-04-05'),
	(78, 'Bóng rổ châu Âu: EuroBasket 2023', 'sports_docs/doc_78.txt', '2025-04-05'),
	(79, 'Cầu lông châu Á: Sự lên ngôi của Viktor Axelsen', 'sports_docs/doc_79.txt', '2025-04-05'),
	(80, 'Bóng chuyền nữ: Ý tại Thế giới 2022', 'sports_docs/doc_80.txt', '2025-04-05'),
	(81, 'Đua xe đạp lòng chảo: Hà Lan tại các giải quốc tế', 'sports_docs/doc_81.txt', '2025-04-05'),
	(82, 'Bóng đá trẻ: World Cup U20 2023', 'sports_docs/doc_82.txt', '2025-04-05'),
	(83, 'Bơi lội đường dài: Florian Wellbrock tại Olympic 2020', 'sports_docs/doc_83.txt', '2025-04-05'),
	(84, 'Bóng rổ 5x5: Đức vô địch FIBA World Cup 2023', 'sports_docs/doc_84.txt', '2025-04-05'),
	(85, 'Đua xe F1: Công nghệ hybrid 2023', 'sports_docs/doc_85.txt', '2025-04-05'),
	(86, 'Golf nữ: Jin Young Ko tại LPGA 2023', 'sports_docs/doc_86.txt', '2025-04-05'),
	(87, 'Bắn súng nữ: Trung Quốc tại các giải quốc tế', 'sports_docs/doc_87.txt', '2025-04-05'),
	(88, 'Thể thao dưới nước: Lặn tự do tại Thế giới 2023', 'sports_docs/doc_88.txt', '2025-04-05'),
	(89, 'Bóng đá châu Đại Dương: OFC Nations Cup 2022', 'sports_docs/doc_89.txt', '2025-04-05'),
	(90, 'Thể thao mạo hiểm: Nhảy bungee tại New Zealand 2023', 'sports_docs/doc_90.txt', '2025-04-05'),
	(91, 'Bóng rổ học sinh: Mỹ 2023', 'sports_docs/doc_91.txt', '2025-04-05'),
	(92, 'Điền kinh trẻ: Faith Kipyegon tại U20 2021', 'sports_docs/doc_92.txt', '2025-04-05'),
	(93, 'Bóng bàn nữ: Trung Quốc tại các giải châu Á', 'sports_docs/doc_93.txt', '2025-04-05'),
	(94, 'Thể thao cổ đại: Đấu vật La Mã tại Ý 2023', 'sports_docs/doc_94.txt', '2025-04-05'),
	(95, 'Bóng chuyền nam: Pháp tại Olympic 2020', 'sports_docs/doc_95.txt', '2025-04-05'),
	(96, 'Đua xe đạp đường trường: Remco Evenepoel tại Thế giới 2023', 'sports_docs/doc_96.txt', '2025-04-05'),
	(97, 'Bóng đá phòng ngự: Chiến thuật Catenaccio 2023', 'sports_docs/doc_97.txt', '2025-04-05'),
	(98, 'Thể thao mùa hè: Nhảy cầu tại các giải quốc tế', 'sports_docs/doc_98.txt', '2025-04-05'),
	(99, 'Bóng rổ quốc tế: FIBA World Cup 2023', 'sports_docs/doc_99.txt', '2025-04-05'),
	(100, 'Thể thao tương lai: Robot Soccer 2023', 'sports_docs/doc_100.txt', '2025-04-05');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
