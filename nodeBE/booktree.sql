-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2023 at 11:49 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booktree`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ISBN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `weight` decimal(8,3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN`, `title`, `desc`, `cover_img`, `author`, `translator`, `publisher`, `supplier_name`, `genre`, `price`, `weight`) VALUES
('8859735411382', 'เสริมทักษะอังกฤษประถมต้น', NULL, 'https://drive.google.com/uc?id=1oP_lkGT4svlQN3RkXgkwf2TQvPIGaqh9', 'สุดธิดา เปลี่ยนสายสืบ', '-', 'ซันไชล์ดเลิร์นนิง, สนพ.', 'SE-ED', NULL, '89.00', '0.137'),
('8859735412037', 'เล่มแรกของอนุบาลคนเก่ง 1-100', NULL, NULL, 'สุดธิดา เปลี่ยนสายสืบ', '-', 'ซันไชล์ดเลิร์นนิง, สนพ.', 'SE-ED', NULL, '169.00', '0.268'),
('9786160842681', 'Business English@Work อังกฤษธุรกิจเพื่อมนุษย์ออฟฟิศมือโปร', NULL, NULL, 'Su Qin (ซู ฉิน)', 'กัญญารัตน์ จิราสวัสดิ์', 'ซีเอ็ดยูเคชั่น, บมจ.', 'SE-ED', NULL, '299.00', '0.400'),
('9786160848843', 'ตลาดไทยใหญ่ทั้งโลก ', NULL, NULL, 'ฉันทพัทธ์ ปัญจมานนท์ ', '-', 'ซีเอ็ดยูเคชั่น, บมจ.', 'SE-ED', NULL, '285.00', '0.410'),
('9786161855987', 'หมาป่าค้ำบัลลังก์ เล่ม 4', NULL, NULL, 'เนรือชีอน (Nersion)', 'Vitamin B', 'Lilac', 'อมรินทร์', NULL, '385.00', NULL),
('9786161856120', 'ชายาแพทย์ขั้นหนึ่ง เล่ม 2', NULL, NULL, 'ชิงอวิ๋นเช่อ', 'Qifengmei', 'Camellia Novel', 'อมรินทร์', NULL, '445.00', NULL),
('9786161856144', 'เกิดใหม่ชาตินี้ ฉันจะเป็นเจ้าตระกูล ล.2', NULL, NULL, 'คิมโรอา', '8 hours', 'Peony Publishing', 'อมรินทร์', NULL, '485.00', NULL),
('9786161856809', 'ต้นส้มแสนรัก ขอให้ดวงอาทิตย์ส่องแสงอีกครั้ง ', NULL, NULL, 'โจเซ่ เมอโร เดอ วาสคอนเซลอส', 'ประโลม บุญรัศมี', 'แพรวสำนักพิมพ์', 'อมรินทร์', NULL, '345.00', NULL),
('9786161856854', 'มีใครคนหนึ่งพร้อมจะนั่งข้างเธอเสมอ', NULL, NULL, 'คูฮโยซอ', 'มินตรา อินทรารัตน์', 'Piccolo', 'อมรินทร์', NULL, '265.00', NULL),
('9786161857011', 'Unique Selling Point ลูกค้าจำได้ ซื้อซํ้า แค่ยํ้าจุดขายเดียว', NULL, NULL, 'สโรจ เลาหศิริ', NULL, 'Shortcut', 'อมรินทร์', NULL, '255.00', NULL),
('9786161857196', 'โชคลาภหมื่นล้านบันดาลรัก เล่ม 5', NULL, NULL, 'เจียงจื่อกุย', 'เหวินหรง', 'อรุณ', 'อมรินทร์', NULL, '495.00', NULL),
('9786163813626', 'Super Easy Memory Note วิทย์ ระดับ ป.4-5-6 เรียนก็เข้าใจ สอบยิ่งง่ายเลย', NULL, NULL, 'ภาธิศา มะนุ่น (ครูพี่ภา)', '-', 'Life Balance, สนพ. ', 'SE-ED', NULL, '119.00', '0.245'),
('9786165788694', 'เรียนจีนเพื่อการสื่อสารและเริ่มต้นธุรกิจซื้อขาย', NULL, NULL, 'วิทิต รุจิรวณิช', '-', 'โอเพ่น ไอเดีย, สนพ.', 'SE-ED', NULL, '325.00', '0.440'),
('9786165989480', 'ระบบรัฐสวัสดิการในเมืองฝรั่ง', NULL, NULL, 'ภรณี ภูรีสิทธิ์', NULL, 'เสมสิกขาลัย', 'เคล็ดไทย', NULL, '220.00', '0.220'),
('9786167894317', 'Visit Hokkaido-Tohoku เที่ยวฮอกไกโด-โทโฮกุ', NULL, NULL, 'อดิศักดิ์ จันทร์ดวง', '-', 'ฟอร์เวิร์ด, สนพ.', 'SE-ED', NULL, '389.00', '0.465'),
('9786169392989', 'ฟางลี่จือ : นักวิทย์ ปะทะ คอมมิวนิสต์จีน', NULL, NULL, 'ฟาง ลี่จือ/อนวัช อรรถจินดาและเนติวิทย์ โชติภัทร์ไพศาล', NULL, 'นิสิตสามย่าน', 'เคล็ดไทย', NULL, '280.00', '0.510'),
('9786169417880', 'ม็อก แมวขี้หลงขี้ลืม', NULL, NULL, 'Judith Kerr (จูดิธ เคอร์)', 'Tinybeans', 'Tinybeans', 'SE-ED', NULL, '225.00', '0.223'),
('9786169417897', 'เมื่อเสือโคร่งแวะมาดื่มชา', NULL, NULL, 'Judith Kerr (จูดิธ เคอร์)', 'Tinybeans', 'Tinybeans', 'SE-ED', NULL, '210.00', '0.189');

--
-- Triggers `books`
--
DELIMITER $$
CREATE TRIGGER `add_supplier_insert` AFTER INSERT ON `books` FOR EACH ROW BEGIN
    -- Check if the supplier exists in the supplier table
    DECLARE supplierCount INT;
    SELECT COUNT(*) INTO supplierCount FROM suppliers WHERE supplier_name = NEW.supplier_name;

    -- If the supplier does not exist, insert a new row into the supplier table
    IF supplierCount = 0 THEN
        INSERT INTO suppliers (supplier_name, in_stock, total_stock) VALUES (NEW.supplier_name, 0, 0);
    END IF;

    -- Insert a new row into the stocks table
    INSERT INTO stocks (book_ISBN, supplier_name, in_stock, total_stock) VALUES (NEW.ISBN, NEW.supplier_name, 0, 0);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `password`, `phone_number`, `address`, `member_id`) VALUES
(5, '1', '1', '1', '1', '123', '1', '123\r\n');

--
-- Triggers `customers`
--
DELIMITER $$
CREATE TRIGGER `insert_member` AFTER INSERT ON `customers` FOR EACH ROW BEGIN
    IF NEW.member_id IS NOT NULL THEN
        SET @current_time = NOW();
        SET @one_year_later = DATE_ADD(@current_time, INTERVAL 1 YEAR);
        
        INSERT INTO members (member_id, start_date, end_date)
        VALUES (NEW.member_id, @current_time, @one_year_later);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_member` AFTER UPDATE ON `customers` FOR EACH ROW BEGIN
    IF NEW.member_id IS NOT NULL THEN
        SET @current_time = NOW();
        SET @one_year_later = DATE_ADD(@current_time, INTERVAL 1 YEAR);
        
        -- Check if the member_id already exists in the members table
        IF EXISTS (SELECT 1 FROM members WHERE member_id = NEW.member_id) THEN
            -- Update the existing row in the members table
            UPDATE members
            SET start_date = @current_time,
                end_date = @one_year_later
            WHERE member_id = NEW.member_id;
        ELSE
            -- Insert a new row in the member table
            INSERT INTO members (member_id, start_date, end_date)
            VALUES (NEW.member_id, @current_time, @one_year_later);
        END IF;
    ELSE
        -- If member_id becomes NULL, delete the corresponding row in the member table
        DELETE FROM members WHERE member_id = OLD.member_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_name`, `type`) VALUES
('Bigbook', 'fiction'),
('Dictionary', 'non-fiction'),
('DIY/งานอดิเรก', 'non-fiction'),
('Punica', 'fiction'),
('กฎหมาย', 'non-fiction'),
('การ์ตูนความรู้', 'fiction'),
('กิจกรรมเสริมทักษะเด็ก', 'non-fiction'),
('คู่มือ ป.1-ป.6', 'คู่มือเรียน-สอบ'),
('คู่มือ ม.1-ม.3', 'คู่มือเรียน-สอบ'),
('คู่มือ ม.4-ม.6', 'คู่มือเรียน-สอบ'),
('ท่องเที่ยว', 'non-fiction'),
('นวนิยายไทย', 'fiction'),
('นิทานเด็ก', 'fiction'),
('นิยายจีนกำลังภายใน', 'fiction'),
('นิยายจีนโรแมนติก', 'fiction'),
('นิยายวาย', 'fiction'),
('นิยายโนเวลSMM', 'fiction'),
('นิยายโนเวลเซนชู', 'fiction'),
('บริหาร/การเงิน', 'non-fiction'),
('ประวัติบุคคล', 'non-fiction'),
('ประวัติศาสตร์/การเมือง', 'non-fiction'),
('ปรัชญา/พัฒนาตนเอง', 'non-fiction'),
('ภาษาต่างประเทศ', 'non-fiction'),
('มังงะSMM', 'fiction'),
('มังงะยูริ', 'fiction'),
('มังงะวาย', 'fiction'),
('มังงะเซนชู', 'fiction'),
('วรรณกรรมเยาวชน', 'fiction'),
('วรรณกรรมแปล ', 'fiction'),
('วรรณกรรมไทย', 'fiction'),
('วิทยาศาสตร์/สารคดี', 'non-fiction'),
('สอบเข้า ม.1', 'คู่มือเรียน-สอบ'),
('สอบเข้า ม.4', 'คู่มือเรียน-สอบ'),
('สอบเข้าทำงาน', 'คู่มือเรียน-สอบ'),
('สอบเข้ามหาวิทยาลัย', 'คู่มือเรียน-สอบ'),
('สารานุกรม/พจนานุกรมภาพ', 'non-fiction'),
('สุขภาพ/การดูแลเด็ก', 'non-fiction'),
('เรื่องสั้น/กวี', 'fiction'),
('แฟนตาซี', 'fiction');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `start_date`, `end_date`) VALUES
('123', '2023-06-15', '2024-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) UNSIGNED NOT NULL,
  `payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `book_ISBN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_price` decimal(10,2) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restocks`
--

CREATE TABLE `restocks` (
  `restock_id` int(11) NOT NULL,
  `book_ISBN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `return_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_details`
--

CREATE TABLE `return_details` (
  `return_details_id` int(10) UNSIGNED NOT NULL,
  `return_id` int(10) UNSIGNED NOT NULL,
  `book_ISBN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stationeries`
--

CREATE TABLE `stationeries` (
  `ISBN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `book_ISBN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_stock` int(10) UNSIGNED NOT NULL,
  `total_stock` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`book_ISBN`, `supplier_name`, `in_stock`, `total_stock`) VALUES
('8859735411382', 'SE-ED', 0, 0),
('8859735412037', 'SE-ED', 0, 0),
('9786160842681', 'SE-ED', 0, 0),
('9786160848843', 'SE-ED', 0, 0),
('9786161855987', 'อมรินทร์', 0, 0),
('9786161856120', 'อมรินทร์', 0, 0),
('9786161856144', 'อมรินทร์', 0, 0),
('9786161856809', 'อมรินทร์', 0, 0),
('9786161856854', 'อมรินทร์', 0, 0),
('9786161857011', 'อมรินทร์', 0, 0),
('9786161857196', 'อมรินทร์', 0, 0),
('9786163813626', 'SE-ED', 0, 0),
('9786165788694', 'SE-ED', 0, 0),
('9786165989480', 'เคล็ดไทย', 0, 0),
('9786167894317', 'SE-ED', 0, 0),
('9786169392989', 'เคล็ดไทย', 0, 0),
('9786169417880', 'SE-ED', 0, 0),
('9786169417897', 'SE-ED', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` smallint(6) DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountant_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_name`, `percent`, `phone_number`, `sales_email`, `accountant_email`, `tax_number`, `address`, `account`, `status`) VALUES
('SE-ED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('อมรินทร์', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('เคล็ดไทย', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `books_ibfk_3` (`genre`),
  ADD KEY `books_ibfk_2` (`supplier_name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_name`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `FK_order_details_orders_order_id` (`order_id`),
  ADD KEY `FK_order_details_books_ISBN` (`book_ISBN`);

--
-- Indexes for table `restocks`
--
ALTER TABLE `restocks`
  ADD PRIMARY KEY (`restock_id`),
  ADD KEY `book_ISBN` (`book_ISBN`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `return_details`
--
ALTER TABLE `return_details`
  ADD PRIMARY KEY (`return_details_id`),
  ADD KEY `FK_return_details_returns_return_id` (`return_id`),
  ADD KEY `FK_return_details_books_ISBN` (`book_ISBN`);

--
-- Indexes for table `stationeries`
--
ALTER TABLE `stationeries`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`book_ISBN`),
  ADD KEY `stocks_ibfk_2` (`supplier_name`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restocks`
--
ALTER TABLE `restocks`
  MODIFY `restock_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `return_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_details`
--
ALTER TABLE `return_details`
  MODIFY `return_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`supplier_name`) REFERENCES `suppliers` (`supplier_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`genre`) REFERENCES `genres` (`genre_name`) ON UPDATE CASCADE;

--
-- Constraints for table `restocks`
--
ALTER TABLE `restocks`
  ADD CONSTRAINT `restocks_ibfk_1` FOREIGN KEY (`book_ISBN`) REFERENCES `books` (`ISBN`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_2` FOREIGN KEY (`supplier_name`) REFERENCES `suppliers` (`supplier_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks_ibfk_3` FOREIGN KEY (`book_ISBN`) REFERENCES `books` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
