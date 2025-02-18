-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2025 at 09:40 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fashionverse2`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`) VALUES
(13, 2),
(16, 28),
(17, 34);

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE `cart_detail` (
  `cart_detail_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_detail_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_detail`
--

INSERT INTO `cart_detail` (`cart_detail_id`, `quantity`, `product_detail_id`, `cart_id`) VALUES
(133, 3, 1, 16),
(134, 2, 2, 16),
(161, 1, 117, 13),
(162, 2, 113, 13),
(165, 3, 116, 13),
(167, 3, 114, 13),
(168, 4, 66, 13),
(169, 1, 116, 16),
(173, 1, 117, 16);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_parent_id` int(11) DEFAULT NULL,
  `category_name` varchar(225) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_parent_id`, `category_name`, `is_hidden`) VALUES
(101, 1, 'Áo thun', 0),
(102, 1, 'Áo sơ mi', 0),
(103, 1, 'Áo Polo', 0),
(104, 1, 'Áo Khoác\r\n', 0),
(201, 2, 'Quần tây', 0),
(202, 2, 'Quần Jeans', 0),
(203, 2, 'Quần Kaki', 0),
(204, 2, 'Quần Thun', 0),
(205, 2, 'Quần Short Jeans', 0),
(206, 2, 'Quần Short Kaki', 0),
(207, 2, 'Quần Short Thun', 0),
(208, 2, 'Quần Short Thể Thao', 0),
(301, 3, 'Dây Nịt Da', 0),
(302, 3, 'Ví Da', 0),
(303, 3, 'Nón', 0),
(304, 3, 'Tất - Vớ', 0),
(305, 3, 'Găng tay', 0),
(401, 4, 'Giày', 0);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `shipping_fee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `shipping_fee`) VALUES
(1, 'Hà Nội', 20000),
(2, 'Hồ Chí Minh', 0),
(3, 'Đà Nẵng', 20000),
(4, 'Cần Thơ', 20000),
(5, 'Hải Phòng', 20000),
(6, 'An Giang', 20000),
(7, 'Bà Rịa-Vũng Tàu', 20000),
(8, 'Bắc Giang', 20000),
(9, 'Bắc Kạn', 20000),
(10, 'Bến Tre', 20000),
(11, 'Bình Dương', 20000),
(12, 'Bình Phước', 20000),
(13, 'Bình Thuận', 20000),
(14, 'Cao Bằng', 20000),
(15, 'Đắk Lắk', 20000),
(16, 'Đắk Nông', 20000),
(17, 'Điện Biên', 20000),
(18, 'Đồng Nai', 20000),
(19, 'Đồng Tháp', 20000),
(20, 'Gia Lai', 20000),
(21, 'Hà Giang', 20000),
(22, 'Hà Nam', 20000),
(23, 'Hà Tĩnh', 20000),
(24, 'Hậu Giang', 20000),
(25, 'Hoà Bình', 20000),
(26, 'Hưng Yên', 20000),
(27, 'Khánh Hoà', 20000),
(28, 'Kiên Giang', 20000),
(29, 'Kon Tum', 20000),
(30, 'Lâm Đồng', 20000),
(31, 'Lạng Sơn', 20000),
(32, 'Lào Cai', 20000),
(33, 'Long An', 20000),
(34, 'Nam Định', 20000),
(35, 'Nghệ An', 20000),
(36, 'Ninh Bình', 20000),
(37, 'Ninh Thuận', 20000),
(38, 'Phú Thọ', 20000),
(39, 'Phú Yên', 20000),
(40, 'Quảng Bình', 20000),
(41, 'Quảng Nam', 20000),
(42, 'Quảng Ngãi', 20000),
(43, 'Quảng Ninh', 20000),
(44, 'Sóc Trăng', 20000),
(45, 'Sơn La', 20000),
(46, 'Tây Ninh', 20000),
(47, 'Thái Bình', 20000),
(48, 'Thái Nguyên', 20000),
(49, 'Thanh Hóa', 20000),
(50, 'Thừa Thiên Huế', 20000),
(51, 'Tiền Giang', 20000),
(52, 'Trà Vinh', 20000),
(53, 'Tuyên Quang', 20000),
(54, 'Vĩnh Long', 20000),
(55, 'Vĩnh Phúc', 20000),
(56, 'Yên Bái', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`color_id`, `color_name`) VALUES
(1, 'Đen'),
(2, 'Trắng'),
(3, 'Xám'),
(4, 'Xanh Dương'),
(5, 'Xanh Lá Cây'),
(6, 'Nâu'),
(7, 'Đỏ'),
(8, 'Hồng'),
(9, 'Vàng'),
(10, 'Tím'),
(11, 'Kem');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `user_id`, `product_id`) VALUES
(1, 28, 90);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title_news` varchar(1000) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `image_news` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `views` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title_news`, `summary`, `image_news`, `status`, `createdAt`, `updatedAt`, `author`, `content`, `views`) VALUES
(1, 'Những xu hướng thời trang nổi bật mùa xuân 2025', 'Khám phá các xu hướng thời trang mới nhất cho mùa xuân năm 2025.', 'news1.jpg', 1, '2025-01-04 17:26:04', '2025-01-04 17:26:04', 'Lê Thành Thắng', 'Mùa Xuân 2025: Những Xu Hướng Thời Trang Trở Lại Từ Những Năm 80 Và Sự Pha Trộn Cùng Yếu Tố Hiện Đại\r\n\r\nMùa xuân 2025 đang đến gần và với nó là sự trở lại của những xu hướng thời trang đặc trưng từ những năm 80, thời kỳ mà màu sắc tươi sáng, đường nét cứng cáp và phong cách nổi bật chiếm lĩnh các sàn diễn. Nhưng lần này, những bộ sưu tập này sẽ không chỉ đơn giản là sự tái hiện của quá khứ, mà còn là sự pha trộn độc đáo với các yếu tố hiện đại, tạo nên một làn sóng mới đầy sức hút trong ngành công nghiệp thời trang.\r\n\r\nSự Trở Lại Của Những Món Đồ Kinh Điển\r\n\r\nVới sự trở lại của những chiếc áo khoác rộng, quần jeans cao cấp và giày thể thao chunky, thời trang mùa xuân 2025 sẽ đậm chất retro. Những bộ đồ màu sắc sặc sỡ, những chiếc áo khoác da bóng bẩy cùng những họa tiết độc đáo từ thập niên 80 hứa hẹn sẽ được tái sinh, nhưng được làm mới theo cách rất riêng biệt.\r\n\r\nTrong khi đó, những bộ trang phục với form dáng oversized sẽ tiếp tục giữ vững vị trí của mình trong các bộ sưu tập xuân 2025. Áo khoác bomber, blazer rộng, và những chiếc váy dài thướt tha, kết hợp với những đường nét táo bạo, sẽ là sự lựa chọn hoàn hảo cho những ai yêu thích phong cách mạnh mẽ và đầy cá tính.\r\n\r\nPha Trộn Giữa Quá Khứ Và Hiện Đại\r\n\r\nMột trong những điểm nhấn nổi bật của mùa xuân năm nay là sự pha trộn hoàn hảo giữa các yếu tố hoài cổ của những năm 80 và xu hướng thời trang hiện đại. Các nhà thiết kế đã khéo léo kết hợp những đường cắt sắc sảo của các trang phục thời kỳ trước với chất liệu và công nghệ sản xuất hiện đại. Các loại vải siêu nhẹ, bền và thoáng khí sẽ được sử dụng rộng rãi, mang đến cho người mặc cảm giác thoải mái tối đa.\r\n\r\nMột ví dụ điển hình là sự xuất hiện của những bộ suit không chỉ có sự hiện diện của chiếc quần ống rộng hay áo khoác dài, mà còn được làm từ các chất liệu như len, cotton cao cấp, mang đến một cảm giác hiện đại và sang trọng. Các chi tiết như túi to bản, logo nổi bật và họa tiết hình học sẽ tạo nên một phong cách thời trang đậm chất thập niên 80 nhưng lại có sự cập nhật hợp thời.\r\n\r\nPhong Cách \"Streetwear\" Và Thời Trang Phối Hợp\r\n\r\nTrong mùa xuân 2025, phong cách \"streetwear\" sẽ tiếp tục lên ngôi. Những mẫu trang phục đường phố kết hợp với các món đồ thể thao, từ những chiếc áo hoodie đến những đôi giày thể thao đế cao, sẽ chiếm lĩnh sàn diễn. Thậm chí, những thương hiệu lớn như Balenciaga, Gucci, và Louis Vuitton cũng đang ngày càng đưa yếu tố \"street\" vào các bộ sưu tập của mình. Những chiếc áo thun in logo, những chiếc quần jogger và phụ kiện như mũ lưỡi trai, túi đeo chéo sẽ là những món đồ không thể thiếu trong mùa xuân này.\r\n\r\nBước Đột Phá Từ Các Thương Hiệu Lớn\r\n\r\nCác thương hiệu thời trang nổi tiếng đang không ngừng thử nghiệm với các xu hướng mới, từ việc sử dụng các vật liệu tái chế thân thiện với môi trường đến việc kết hợp các công nghệ tiên tiến trong thiết kế. Những bộ sưu tập thời trang mùa xuân 2025 từ các thương hiệu lớn hứa hẹn sẽ tạo ra những bước đột phá mới, từ việc phát triển các trang phục mang tính ứng dụng cao, dễ dàng phối hợp, đến việc phát triển những sản phẩm thời trang tích hợp công nghệ như quần áo có khả năng thay đổi màu sắc hay điều chỉnh nhiệt độ.\r\n\r\nCác nhà thiết kế đang chú trọng đến tính bền vững và giảm thiểu tác động tiêu cực đến môi trường, điều này đã trở thành xu hướng chủ đạo trong ngành công nghiệp thời trang toàn cầu. Những bộ sưu tập \"thời trang xanh\" dự kiến sẽ thu hút sự chú ý mạnh mẽ trong năm 2025, với chất liệu hữu cơ, tái chế và không chứa các chất độc hại.\r\n\r\nNhìn Về Tương Lai Của Thời Trang\r\n\r\nMùa xuân 2025 không chỉ là sự trở lại của những xu hướng cũ mà còn là sự khởi đầu của một kỷ nguyên mới trong ngành công nghiệp thời trang. Các xu hướng mới này không chỉ phản ánh những thay đổi trong thẩm mỹ, mà còn là những bước tiến trong sự kết hợp giữa công nghệ, tính bền vững và sáng tạo. Với sự kết hợp giữa quá khứ và hiện tại, thời trang mùa xuân 2025 sẽ là một mùa lễ hội đầy màu sắc, sáng tạo và tươi mới, khiến bất kỳ ai yêu thích thời trang cũng phải trầm trồ.\r\n\r\nCác bộ sưu tập của các thương hiệu lớn như Chanel, Dior, và Prada sẽ làm say đắm những tín đồ thời trang, hứa hẹn mang đến một mùa xuân bùng nổ với nhiều điều bất ngờ. Sự hòa quyện giữa những xu hướng cổ điển và hiện đại chắc chắn sẽ khiến mùa xuân này trở thành một kỷ niệm không thể quên trong thế giới thời trang.', 2004),
(2, 'Tự do sáng tạo trong trang phục: Kết hợp màu sắc bất ngờ', 'Làm thế nào để tự do sáng tạo trong việc kết hợp màu sắc trang phục?', 'news2.jpg', 1, '2025-01-04 17:26:04', '2025-01-04 17:26:04', 'Và Ngọc Khoa', 'Sự Sáng Tạo Trong Việc Kết Hợp Màu Sắc Đối Lập: Xu Hướng Thời Trang 2025\r\n\r\nNăm 2025 hứa hẹn sẽ là một năm của sự bùng nổ màu sắc trong ngành thời trang. Một trong những xu hướng nổi bật sẽ là sự sáng tạo trong việc kết hợp các màu sắc đối lập. Những sự kết hợp này không chỉ phá vỡ những quy tắc màu sắc thông thường mà còn mang đến những bộ trang phục thú vị, đầy cá tính, tạo điểm nhấn trong mọi dịp. Từ những bộ trang phục công sở nghiêm túc đến những bộ đồ sang trọng cho buổi tiệc tối, chúng ta có thể nhìn thấy sự đổi mới trong cách lựa chọn màu sắc, mở rộng khả năng sáng tạo của mỗi người mặc.\r\n\r\nSự Pha Trộn Màu Sắc Tạo Nên Đặc Trưng Cá Nhân\r\n\r\nKết hợp các màu sắc đối lập không chỉ là một sự thử nghiệm táo bạo, mà còn là một cách để thể hiện cá tính riêng của mỗi người. Những gam màu mạnh mẽ như đỏ và xanh lá cây, vàng và tím, hay đen và trắng sẽ không còn là sự đối lập \"không thể hòa hợp\", mà sẽ được các nhà thiết kế khéo léo kết hợp, mang lại sự hòa quyện đầy bất ngờ.\r\n\r\nNhững bộ trang phục kết hợp các màu sắc đối lập này không chỉ tạo nên sự thu hút mà còn thể hiện được gu thẩm mỹ của người mặc. Những chiếc áo khoác màu đỏ tươi kết hợp với quần màu xanh lá cây, hay bộ váy đen kết hợp với phụ kiện trắng tinh khôi, đều là những lựa chọn đáng chú ý trong mùa thời trang 2025. Xu hướng này sẽ thúc đẩy sự tự do trong việc kết hợp các sắc màu và tạo ra những phong cách mới mẻ, cá tính.\r\n\r\nTừ Công Sở Đến Tiệc Tối: Màu Sắc Phù Hợp Mọi Lúc\r\n\r\nMột trong những điểm đặc biệt của xu hướng này là sự linh hoạt của các lựa chọn màu sắc, có thể áp dụng vào mọi hoàn cảnh, từ trang phục công sở cho đến những buổi tiệc tối sang trọng.\r\n\r\nVới các bộ trang phục công sở, việc kết hợp các màu sắc đối lập sẽ tạo nên những bộ đồ không chỉ chuyên nghiệp mà còn đầy sáng tạo. Ví dụ, một chiếc áo sơ mi trắng kết hợp với vest màu xanh navy, hay một chiếc quần tây màu xám kết hợp với giày đỏ sẽ mang lại cho người mặc một vẻ ngoài vừa nghiêm túc, vừa đầy phong cách.\r\n\r\nTrong khi đó, đối với những buổi tiệc tối, sự kết hợp giữa các màu sắc đối lập sẽ tạo nên những bộ trang phục đầy quyến rũ và nổi bật. Những chiếc váy đen kết hợp với phụ kiện vàng kim loại, hay một bộ suit đỏ kết hợp với áo sơ mi trắng tinh khôi sẽ làm chủ nhân của chúng nổi bật giữa đám đông, tạo nên một ấn tượng mạnh mẽ ngay từ lần đầu gặp gỡ.\r\n\r\nBước Đột Phá Trong Ngành Công Nghiệp Thời Trang\r\n\r\nViệc kết hợp các màu sắc đối lập không chỉ là một xu hướng tạm thời mà còn là một bước đột phá trong ngành công nghiệp thời trang. Các nhà thiết kế đang dần loại bỏ những quy tắc màu sắc cứng nhắc để tạo ra những bộ sưu tập đa dạng và đầy sức sống. Sự kết hợp giữa các sắc màu táo bạo và các kỹ thuật thiết kế tinh tế sẽ mang đến cho các bộ trang phục một diện mạo hoàn toàn mới.\r\n\r\nChúng ta sẽ chứng kiến những bộ sưu tập thời trang đầy sắc màu từ các thương hiệu lớn như Gucci, Valentino và Versace, nơi mà màu sắc không còn bị ràng buộc bởi những quy ước thông thường. Các nhà thiết kế không chỉ tạo ra những bộ đồ đẹp mà còn khơi dậy một phong cách sống đầy sáng tạo, tự do và không giới hạn.\r\n\r\nSự Tự Do Trong Lựa Chọn Màu Sắc\r\n\r\nMột trong những điều đặc biệt của xu hướng kết hợp màu sắc đối lập chính là việc nó khuyến khích sự tự do trong lựa chọn trang phục. Bạn không còn phải lo lắng về việc \"màu sắc có hợp nhau hay không\" mà thay vào đó là tự do thể hiện cá tính qua các sắc màu bạn yêu thích.\r\n\r\nĐiều này mở ra một thế giới thời trang vô cùng phong phú, nơi mỗi người có thể sáng tạo với những gam màu yêu thích của mình, tạo ra những bộ trang phục vừa độc đáo, vừa phản ánh chính con người mình. Những bộ đồ kết hợp màu sắc đối lập không chỉ giúp bạn nổi bật mà còn tạo nên một tuyên ngôn cá nhân, khẳng định phong cách và sở thích của riêng bạn.\r\n\r\nKết Luận: Xu Hướng Màu Sắc 2025 - Thời Trang Không Giới Hạn\r\n\r\nNhìn chung, sự sáng tạo trong việc kết hợp các màu sắc đối lập sẽ là một trong những xu hướng đáng chú ý nhất trong năm 2025. Đây không chỉ là một xu hướng về màu sắc mà còn là một cách để thể hiện bản sắc cá nhân và sự đổi mới trong ngành công nghiệp thời trang. Cho dù là trong công sở, buổi tiệc tối hay những dịp đặc biệt khác, việc kết hợp các màu sắc đối lập sẽ là lựa chọn hoàn hảo để bạn tỏa sáng.\r\n\r\nVới sự hỗ trợ của các nhà thiết kế tài năng và các thương hiệu nổi tiếng, xu hướng này sẽ nhanh chóng lan tỏa và trở thành một phần không thể thiếu trong tủ đồ của những tín đồ thời trang trong mùa xuân 2025.S', 29502),
(3, 'Lịch sử thời trang: Từ cổ điển đến hiện đại', 'Khám phá sự phát triển của thời trang qua các thập kỷ.', 'news3.jpg', 1, '2025-01-04 17:26:04', '2025-01-04 17:26:04', 'Cao Văn Mạnh', 'Lịch Sử và Sự Phát Triển Của Thời Trang: Từ Cổ Điển Đến Hiện Đại\r\n\r\nThời trang là một nghệ thuật không ngừng thay đổi, phản ánh những xu hướng văn hóa và xã hội qua từng giai đoạn. Bài viết này sẽ đưa bạn qua từng giai đoạn phát triển của thời trang, từ những bộ trang phục cổ điển mang đậm dấu ấn lịch sử đến những bộ sưu tập hiện đại đầy sáng tạo của các nhà thiết kế nổi tiếng, với sự kết hợp tinh tế giữa truyền thống và sự đổi mới.\r\n\r\nThời Trang Cổ Điển: Một Cái Nhìn Về Quá Khứ\r\n\r\nThời trang cổ điển có thể được coi là nền tảng, là bước đầu tiên trong hành trình phát triển mạnh mẽ của ngành công nghiệp thời trang. Những bộ trang phục của thế kỷ 18 và 19, với các chi tiết cầu kỳ và thiết kế sang trọng, không chỉ phục vụ mục đích che chắn cơ thể mà còn là biểu tượng của địa vị xã hội và sự quyền lực.\r\n\r\nTrong thời kỳ này, thời trang thường gắn liền với những trang phục dài, phức tạp và tỉ mỉ, điển hình là những chiếc váy rộng, corset, và những bộ vest lịch lãm. Các bộ sưu tập thời trang của những nhà thiết kế nổi tiếng như Charles Frederick Worth, người được coi là nhà thiết kế thời trang đầu tiên, đã định hình nhiều xu hướng và đặt nền móng cho ngành công nghiệp thời trang hiện đại.\r\n\r\nThời Trang Những Năm 20: Cách Mạng Thời Trang Và Phong Cách Mới\r\n\r\nBước sang thế kỷ 20, thời trang bắt đầu chuyển mình mạnh mẽ, đặc biệt là trong những năm 1920, khi phong cách \"Flapper\" ra đời. Những bộ váy ngắn, thẳng thớm và không có đường may rõ ràng trở thành biểu tượng của sự tự do và thay đổi trong xã hội. Cùng với đó, những thiết kế của Coco Chanel đã thay đổi cách thức nhìn nhận về thời trang nữ giới, phá vỡ các chuẩn mực cổ điển với những bộ đồ thanh lịch nhưng tiện dụng, đơn giản và hiện đại.\r\n\r\nNgoài ra, các bộ sưu tập của Christian Dior trong thập niên 1940 đã tạo nên \"New Look\", một phong cách thời trang với những đường cắt sắc nét, tôn vinh vóc dáng phụ nữ với những bộ váy eo thon, vai tròn. Đây là một trong những sự kiện quan trọng trong lịch sử thời trang, không chỉ tạo ra sự thay đổi về kiểu dáng mà còn về cách thức thiết kế.\r\n\r\nSự Thịnh Vượng Của Thời Trang Hiện Đại: Đột Phá Sáng Tạo Và Phong Cách Cá Nhân\r\n\r\nVới sự phát triển của công nghệ và sự thay đổi trong xã hội, thời trang hiện đại đã chứng kiến những bước đột phá ngoạn mục, nơi các nhà thiết kế không chỉ giới hạn trong những khuôn khổ cũ mà còn khai phá những lãnh thổ mới. Sự pha trộn giữa các yếu tố cổ điển và hiện đại tạo ra những bộ sưu tập đầy sáng tạo, phá vỡ mọi giới hạn về hình thức và chất liệu.\r\n\r\nNgày nay, chúng ta có thể nhìn thấy sự xuất hiện của những bộ sưu tập từ các nhà thiết kế nổi tiếng như Alexander McQueen, Versace, và Balenciaga, nơi mà nghệ thuật thiết kế không còn chỉ là việc tạo ra trang phục đẹp mà còn là cách thức kể chuyện, thể hiện cá tính và tôn vinh sự đa dạng văn hóa. Các xu hướng thời trang hiện đại như streetwear, athleisure, và những bộ sưu tập bền vững đang chiếm ưu thế, với những thiết kế không chỉ đẹp mà còn phải thân thiện với môi trường.\r\n\r\nThời Trang Tương Lai: Sự Kết Hợp Giữa Công Nghệ Và Sáng Tạo\r\n\r\nKhi nhìn về tương lai, thời trang sẽ tiếp tục phát triển theo xu hướng kết hợp giữa công nghệ và sự sáng tạo. Những bộ sưu tập không chỉ được tạo ra bằng tay mà còn được hỗ trợ bởi công nghệ in 3D, thiết kế thông minh và chất liệu mới. Việc sử dụng các công nghệ tiên tiến như AI để thiết kế và sản xuất các sản phẩm sẽ mở ra một kỷ nguyên mới cho ngành công nghiệp thời trang.\r\n\r\nHơn nữa, xu hướng thời trang bền vững và có trách nhiệm với môi trường đang ngày càng được chú trọng. Các nhà thiết kế hiện đại đang nỗ lực để sử dụng nguyên liệu tái chế, giảm thiểu tác động tiêu cực đến môi trường và tạo ra những bộ sưu tập thời trang không chỉ đẹp mà còn có giá trị bảo vệ hành tinh.\r\n\r\nKết Luận: Thời Trang Là Một Hành Trình Không Ngừng Tiến Bước\r\n\r\nTừ những bộ trang phục cổ điển đến những bộ sưu tập hiện đại đầy sáng tạo, thời trang luôn phản ánh sự thay đổi và phát triển của xã hội, công nghệ và văn hóa. Những bước đột phá trong ngành công nghiệp thời trang không chỉ tạo ra sự mới mẻ trong thiết kế mà còn khẳng định thời trang là một nghệ thuật sống động, không ngừng tiến bước. Đứng trước thách thức và cơ hội của tương lai, ngành công nghiệp thời trang sẽ tiếp tục là nguồn cảm hứng bất tận cho những người yêu thích cái đẹp, sự sáng tạo và sự đổi mới.', 1000),
(4, '10 bí quyết chọn trang phục phù hợp với dáng người', 'Chọn trang phục như thế nào để tôn lên vóc dáng của bạn?', 'news4.jpg', 1, '2025-01-04 17:26:04', '2025-01-04 17:26:04', 'Phan Văn Khải', 'Mẹo Chọn Trang Phục Phù Hợp Với Dáng Người Để Tự Tin Và Nổi Bật\r\n\r\nKhông phải ai cũng biết cách chọn trang phục phù hợp với dáng người. Mỗi người có một vóc dáng riêng biệt, và việc lựa chọn những bộ đồ phù hợp không chỉ giúp bạn trở nên tự tin mà còn tôn vinh những ưu điểm cơ thể. Với một vài mẹo đơn giản nhưng hiệu quả, bạn có thể tạo dựng phong cách riêng biệt, nổi bật và phù hợp với chính mình. Dưới đây là những bí quyết giúp bạn luôn tự tin khi chọn lựa trang phục.\r\n\r\n1. Xác Định Dáng Người Của Bạn\r\n\r\nTrước khi bắt đầu lựa chọn trang phục, điều quan trọng nhất là hiểu rõ dáng người của mình. Dáng người có thể chia thành các kiểu cơ bản như quả lê, quả táo, đồng hồ cát, và hình chữ nhật. Mỗi dáng người đều có những điểm mạnh và điểm yếu riêng. Ví dụ, nếu bạn có dáng người hình quả lê (hông rộng và vai hẹp), bạn có thể chọn trang phục giúp cân bằng tỷ lệ cơ thể, như áo có chi tiết ở phần vai và chân váy chữ A để tạo vẻ thon gọn. Nếu bạn có dáng người đồng hồ cát, những trang phục ôm sát và tôn đường cong sẽ là sự lựa chọn lý tưởng.\r\n\r\n2. Lựa Chọn Màu Sắc Tôn Da Và Dáng Người\r\n\r\nMàu sắc có ảnh hưởng lớn đến cách bạn nhìn nhận bản thân và cách người khác nhìn bạn. Những gam màu tối như đen, navy, hoặc xám sẽ tạo cảm giác cơ thể mảnh mai hơn, trong khi những gam màu sáng như trắng hoặc pastel có thể giúp tạo ra sự nổi bật. Ngoài ra, bạn có thể kết hợp những màu sắc khác nhau để tạo ra hiệu ứng thu hút ánh nhìn vào những khu vực bạn muốn tôn lên và che đi những điểm không mong muốn. Chẳng hạn, nếu bạn muốn làm nổi bật vòng eo, những chiếc đai lưng hoặc áo sơ mi ôm sát sẽ giúp bạn tạo đường cong rõ nét hơn.\r\n\r\n3. Chọn Phụ Kiện Thông Minh\r\n\r\nPhụ kiện là yếu tố quan trọng giúp bạn tạo dấu ấn và thể hiện phong cách cá nhân. Nhưng việc chọn lựa phụ kiện cũng cần phải tinh tế và hài hòa với trang phục. Đối với những người có dáng người thấp và nhỏ, việc chọn giày cao gót hoặc những phụ kiện nhỏ gọn sẽ giúp tạo dáng cao ráo và thanh thoát hơn. Trong khi đó, những phụ kiện lớn như vòng cổ hoặc kính mát thời trang có thể giúp bạn làm nổi bật các chi tiết trên trang phục, đặc biệt nếu bạn có dáng người cao lớn.\r\n\r\n4. Lựa Chọn Đúng Kiểu Dáng Trang Phục\r\n\r\nNgoài màu sắc, kiểu dáng của trang phục cũng rất quan trọng trong việc tôn vinh dáng người. Nếu bạn có đôi chân dài và thon, những chiếc váy ngắn hoặc quần shorts sẽ là sự lựa chọn tuyệt vời để khoe đôi chân đẹp. Ngược lại, nếu bạn muốn che đi một số khuyết điểm như vòng eo lớn hay bắp tay to, bạn có thể chọn những chiếc áo dài tay, áo sơ mi xòe hoặc những chiếc váy có độ xòe nhẹ ở phần dưới.\r\n\r\n5. Đừng Ngại Thử Những Bộ Đồ Tinh Tế\r\n\r\nCuối cùng, điều quan trọng nhất trong việc lựa chọn trang phục là bạn phải tự tin với những gì mình mặc. Đừng ngại thử những bộ đồ mới và tinh tế, thậm chí là những xu hướng thời trang mà bạn chưa bao giờ thử trước đây. Việc chọn lựa trang phục không chỉ là tìm kiếm sự thoải mái mà còn là cách để bạn thể hiện cá tính và sự sáng tạo của mình.', 2810),
(5, 'Top 5 bộ sưu tập thời trang nổi bật trong năm 2024', 'Những bộ sưu tập thời trang nào đã gây tiếng vang lớn trong năm qua?', 'news5.jpg', 1, '2025-01-04 17:26:04', '2025-01-04 17:26:04', 'Thái Nhựt Hạ', '5 Bộ Sưu Tập Thời Trang Ấn Tượng Nhất Của Năm 2024: Kết Hợp Hoàn Hảo Giữa Cổ Điển Và Hiện Đại\r\n\r\nNăm 2024 chứng kiến sự trở lại mạnh mẽ của những xu hướng thời trang cổ điển, kết hợp với những sáng tạo hiện đại đầy đột phá. Những bộ sưu tập từ các nhà thiết kế hàng đầu không chỉ tái hiện lại vẻ đẹp của những thập kỷ trước mà còn mang đến những điều mới mẻ, bất ngờ, làm thay đổi diện mạo ngành công nghiệp thời trang. Dưới đây là 5 bộ sưu tập đáng chú ý mà giới mộ điệu không thể bỏ qua trong năm nay.\r\n\r\n1. Bộ Sưu Tập của Balenciaga: Kỷ Niệm Những Thập Kỷ Cổ Điển\r\n\r\nTrong bộ sưu tập mùa xuân-hè 2024, Balenciaga đã đưa người xem trở lại với những thiết kế cổ điển nhưng lại được tinh chỉnh để phù hợp với thời đại ngày nay. Những chiếc áo khoác oversized, quần baggy và giày thể thao chunky vẫn được giữ nguyên nhưng được kết hợp với những chi tiết hiện đại như chất liệu nhựa, kim loại, tạo nên một vẻ ngoài vừa mạnh mẽ, vừa thời thượng. Bộ sưu tập này như một lời tri ân đối với các xu hướng thập niên 80 nhưng vẫn mang đến sự tươi mới, đầy sáng tạo.\r\n\r\n2. Dior: Nữ Tính Truyền Thống Và Sự Tinh Tế Hiện Đại\r\n\r\nDior tiếp tục khẳng định vị thế của mình với bộ sưu tập thời trang nữ xuân-hè 2024. Các thiết kế của Dior trong mùa này hòa quyện giữa sự nữ tính truyền thống và phong cách hiện đại. Những chiếc đầm dài, áo khoác nhẹ nhàng được kết hợp với các chi tiết trang trí thanh lịch như ren, thêu tay, mang đến vẻ đẹp mềm mại nhưng không kém phần mạnh mẽ. Dior đã chứng minh rằng sự kết hợp giữa cổ điển và hiện đại không chỉ đơn thuần là việc tái tạo lại quá khứ mà còn là sự sáng tạo không ngừng nghỉ.\r\n\r\n3. Gucci: Vượt Ra Khỏi Giới Hạn Thời Trang Với Sự Lạ Mắt\r\n\r\nGucci trong bộ sưu tập 2024 đã phá vỡ mọi quy chuẩn và đưa ra một phong cách hoàn toàn mới mẻ. Những thiết kế lạ mắt, kết hợp giữa thời trang thập niên 90 và những yếu tố siêu hiện đại đã tạo nên một bộ sưu tập vô cùng ấn tượng. Gucci không chỉ mang đến những trang phục với đường cắt tinh tế mà còn sử dụng các chất liệu độc đáo, màu sắc tươi sáng và chi tiết đột phá. Bộ sưu tập này không chỉ phản ánh sự sáng tạo vô biên mà còn khẳng định rằng thời trang không có giới hạn.\r\n\r\n4. Chanel: Sự Quay Về Cổ Điển Với Phong Cách Đương Đại\r\n\r\nChanel đã quay lại với phong cách cổ điển quen thuộc của mình nhưng lần này, nhà mốt này đã mang đến một làn sóng mới trong thế giới thời trang. Những bộ váy tweed huyền thoại được phối hợp với những chi tiết hiện đại như màu sắc tươi sáng, họa tiết mạnh mẽ, tạo nên một vẻ đẹp thanh lịch nhưng đầy cá tính. Sự kết hợp của chất liệu vải tweed với các chi tiết kim loại và trang trí bắt mắt đã làm nổi bật sự hoàn hảo của những bộ trang phục, mang đến một phong cách vừa cổ điển, vừa đương đại.\r\n\r\n5. Prada: Tương Lai Thời Trang Với Xu Hướng Minimalism\r\n\r\nPrada đã thể hiện một cái nhìn mới mẻ về xu hướng tối giản (minimalism) trong bộ sưu tập 2024. Những thiết kế đơn giản nhưng sắc sảo, với các đường nét sạch sẽ và tinh tế, mang đến một vẻ ngoài thanh lịch và hiện đại. Màu sắc chủ đạo là những gam màu trung tính như đen, trắng, xám và nâu, giúp tạo nên những bộ trang phục dễ dàng kết hợp và phù hợp với mọi hoàn cảnh. Prada không chỉ giới thiệu một phong cách đơn giản mà còn khẳng định rằng sự tinh tế trong từng chi tiết mới là yếu tố tạo nên đẳng cấp.\r\n\r\nKết Luận: Xu Hướng Thời Trang 2024 – Cổ Điển Gặp Gỡ Hiện Đại\r\n\r\nNhìn chung, thời trang 2024 mang đến một sự kết hợp hoàn hảo giữa các yếu tố cổ điển và hiện đại, thể hiện sự sáng tạo không ngừng nghỉ của các nhà thiết kế. Các bộ sưu tập từ Balenciaga, Dior, Gucci, Chanel và Prada không chỉ tái hiện lại vẻ đẹp của những thập kỷ trước mà còn kết hợp với những xu hướng mới, tạo nên những bộ trang phục vừa thời thượng, vừa dễ tiếp cận. Đây chắc chắn là những bộ sưu tập mà giới mộ điệu không thể bỏ qua trong mùa thời trang này.\r\n\r\n', 2306),
(6, 'Thời Trang Gen Z: Những Xu Hướng Đang Lên Ngôi', 'Thời trang Gen Z là sự kết hợp độc đáo giữa phong cách cá nhân và những xu hướng mới mẻ, tạo nên những bộ trang phục đa dạng và đầy sức sống.', 'news6.jpg', 1, '2025-01-08 15:21:48', '2025-01-08 15:21:48', 'Lâm Ngọc Hùng', 'Thời Trang Gen Z: Phong Cách Sáng Tạo và Bền Vững\r\nThế hệ Gen Z, sinh ra trong thời đại công nghệ và mạng xã hội, không chỉ là những người tiên phong trong việc thay đổi cách chúng ta kết nối và giao tiếp, mà còn có ảnh hưởng sâu rộng đến ngành thời trang toàn cầu. Phong cách thời trang của Gen Z không chỉ là sự phản ánh về cá nhân hóa mà còn là một cuộc cách mạng trong việc thể hiện bản thân thông qua những bộ trang phục độc đáo và đầy sáng tạo.\r\n\r\n1. Tự Do Thể Hiện Bản Thân Qua Trang Phục\r\nMột trong những đặc điểm nổi bật của thời trang Gen Z là sự tự do trong cách lựa chọn trang phục. Họ không ngần ngại thử nghiệm với những bộ trang phục nổi bật và táo bạo, phản ánh cá tính và sự sáng tạo của bản thân. Các bộ trang phục thường xuyên kết hợp giữa yếu tố vintage cổ điển và các xu hướng hiện đại, tạo nên một phong cách độc đáo, dễ nhận diện.\r\n\r\nGen Z yêu thích việc phá vỡ các quy chuẩn trong thời trang. Các bộ quần áo mang đậm dấu ấn cá nhân như áo phông in hình, giày thể thao, hay những bộ đồ theo phong cách đường phố (street style) không chỉ giúp họ cảm thấy thoải mái mà còn khẳng định cái tôi mạnh mẽ. Sự đa dạng trong lựa chọn phong cách, từ những chiếc áo khoác oversize đến các trang phục thể thao năng động, là một minh chứng rõ ràng cho sự tự do trong biểu đạt cá nhân của thế hệ này.\r\n\r\n2. Kết Hợp Giữa Cổ Điển và Hiện Đại\r\nGen Z đặc biệt yêu thích việc kết hợp các yếu tố vintage với những món đồ hiện đại, tạo ra một sự hòa quyện giữa quá khứ và tương lai. Phong cách này không chỉ giúp họ gợi nhớ lại những năm tháng của các thế hệ trước mà còn thể hiện sự tôn trọng đối với những di sản thời trang. Chẳng hạn, họ có thể kết hợp một chiếc áo sơ mi oversize với quần jeans rách, hoặc một đôi giày thể thao cũ với những món đồ thời trang cao cấp.\r\n\r\nĐiều này không chỉ giúp tạo ra phong cách thời trang độc đáo mà còn giúp họ tiết kiệm chi phí bằng cách tái sử dụng các món đồ cũ. Gen Z biết rằng việc tái chế và sử dụng đồ vintage không chỉ giúp tiết kiệm tiền bạc mà còn là một hành động có ý thức về bảo vệ môi trường.\r\n\r\n3. Chú Trọng Đến Yếu Tố Bền Vững\r\nMột yếu tố quan trọng trong thời trang Gen Z là sự chú trọng đến vấn đề bền vững. Gen Z đặc biệt quan tâm đến tác động môi trường của ngành công nghiệp thời trang, nơi mà sự sản xuất và tiêu thụ quá mức đang gây ảnh hưởng nghiêm trọng đến hành tinh. Họ ưa chuộng những thương hiệu chú trọng đến việc sản xuất trang phục bằng vật liệu tái chế hoặc sử dụng các quy trình sản xuất thân thiện với môi trường.\r\n\r\nThế hệ này đã chứng minh rằng thời trang có thể là một công cụ mạnh mẽ để truyền tải những thông điệp xã hội quan trọng. Họ không ngừng tìm kiếm và ủng hộ các thương hiệu có trách nhiệm với môi trường, đồng thời thúc đẩy sự thay đổi trong ngành công nghiệp thời trang. Họ cũng khuyến khích việc tiêu dùng có trách nhiệm, chẳng hạn như việc chọn mua ít nhưng chất lượng, hoặc hỗ trợ các thương hiệu tái chế và làm lại quần áo.\r\n\r\n4. Sự Đa Dạng và Tôn Vinh Các Giá Trị Văn Hóa\r\nBên cạnh việc thể hiện bản thân qua những bộ trang phục sáng tạo, Gen Z cũng đặc biệt chú trọng đến sự đa dạng và sự tôn vinh các giá trị văn hóa trong thời trang. Họ khuyến khích sự hòa nhập của các nền văn hóa khác nhau vào thiết kế và phong cách, giúp mở rộng tầm nhìn và phá vỡ những giới hạn cứng nhắc về cái đẹp.\r\n\r\nThời trang Gen Z không chỉ dừng lại ở việc tạo ra những bộ trang phục đẹp mắt mà còn là một cuộc cách mạng về cách thức chúng ta nhìn nhận và đánh giá cái đẹp. Họ khuyến khích sự chấp nhận và tôn vinh sự đa dạng trong tất cả các hình thức của cái đẹp, bao gồm màu da, kích cỡ cơ thể, và phong cách sống.\r\n\r\n5. Tầm Quan Trọng Của Mạng Xã Hội Trong Thời Trang Gen Z\r\nMạng xã hội là một công cụ vô cùng quan trọng trong việc lan tỏa phong cách thời trang của Gen Z. Instagram, TikTok, và Pinterest là những nền tảng chính giúp thế hệ này thể hiện phong cách cá nhân, học hỏi từ các thần tượng thời trang, và kết nối với các thương hiệu yêu thích. Họ không chỉ chia sẻ những hình ảnh của bản thân mà còn sử dụng mạng xã hội để tạo ra các trào lưu và xu hướng mới.\r\n\r\nMột yếu tố không thể thiếu trong sự phát triển của thời trang Gen Z là sự ảnh hưởng mạnh mẽ của các Influencers và những người nổi tiếng trên mạng xã hội. Những người này không chỉ đơn giản là mặc đẹp, mà họ còn là những người truyền cảm hứng cho các thế hệ tiếp theo về cách thức thể hiện bản thân qua thời trang.\r\n\r\nKết Luận\r\nThời trang Gen Z là sự kết hợp giữa sáng tạo, sự tự do thể hiện bản thân, và cam kết bảo vệ môi trường. Với sự yêu thích các yếu tố vintage, tinh thần phá cách và việc ưu tiên yếu tố bền vững, họ đang dần thay đổi cục diện ngành công nghiệp thời trang toàn cầu. Cùng với việc sử dụng mạng xã hội như một công cụ truyền thông mạnh mẽ, Gen Z không chỉ định hình lại xu hướng thời trang mà còn tạo ra một cuộc cách mạng mới trong cách thức chúng ta nhìn nhận về cái đẹp, sự sáng tạo và trách nhiệm xã hội trong thời trang.', 611);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `total_price` int(11) NOT NULL,
  `order_status` enum('Chờ xử lý','Đã xác nhận','Đang giao','Đã giao','Đã hủy bởi cửa hàng','Đã hủy bởi khách hàng') NOT NULL DEFAULT 'Chờ xử lý',
  `user_id` int(11) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `code`, `order_date`, `total_price`, `order_status`, `user_id`, `payment_date`, `payment_method`, `shipping_address`, `city_id`) VALUES
(41, 'F40981', '2024-12-17 02:50:02', 440000, 'Đã giao', 2, NULL, 'cash', '1 Quang Trung, P. Tân Thuận Tây, Q.10, TP.HCM', 3),
(42, 'F408976', '2024-12-17 02:50:13', 400000, 'Chờ xử lý', 2, NULL, 'VNPAY', '1 Quang Trung, P. Tân Thuận Tây, Q.10, TP.HCM', 11),
(43, 'F484783', '2024-12-17 02:52:11', 339000, 'Chờ xử lý', 2, NULL, 'cash', '1 Quang Trung, P. Tân Thuận Tây, Q.10, TP.HCM', 16),
(44, 'F649182', '2024-12-17 02:52:34', 400000, 'Chờ xử lý', 2, NULL, 'VNPAY', '1 Quang Trung, P. Tân Thuận Tây, Q.10, TP.HCM', 13),
(45, 'F912491', '2024-12-17 02:55:34', 1180000, 'Chờ xử lý', 2, NULL, 'VNPAY', '1 Quang Trung, P. Tân Thuận Tây, Q.10, TP.HCM', 14),
(46, 'F746727', '2024-12-17 02:59:42', 1180000, 'Chờ xử lý', 2, NULL, 'cash', '1 Quang Trung, P. Tân Thuận Tây, Q.10, TP.HCM', 13),
(47, 'F198760', '2024-12-17 02:59:53', 380000, 'Chờ xử lý', 2, '2024-12-17 03:00:05', 'VNPAY', '1 Quang Trung, P. Tân Thuận Tây, Q.10, TP.HCM', 3),
(48, 'F704684', '2024-12-17 03:04:39', 400000, 'Chờ xử lý', 2, '2024-12-17 03:04:41', 'VNPAY', '1 Quang Trung, P. Tân Thuận Tây, Q.10, TP.HCM', 12),
(49, 'F806825', '2024-12-17 15:30:42', 440000, 'Chờ xử lý', 2, '2024-12-17 15:31:13', 'VNPAY', '1 Quang Trung, P. Tân Thuận Tây, Q.10', 16),
(50, 'F391700', '2024-12-22 10:06:57', 380000, 'Đã hủy bởi cửa hàng', 34, NULL, 'cash', 'Thị Trấn Đắk Hà', 1),
(51, 'F148023', '2024-12-22 10:07:18', 400000, 'Đang giao', 34, NULL, 'cash', 'Thị Trấn Đắk Hà', 3),
(52, 'F15042', '2024-12-22 10:07:54', 380000, 'Đã giao', 34, NULL, 'cash', 'Thị Trấn Đắk Hà', 19),
(53, 'F822537', '2025-01-06 20:35:02', 380000, 'Chờ xử lý', 28, NULL, 'VNPAY', '3 Nguyễn Quý Anh, Tân Sơn Nhì, Tân Phú', 15);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `order_detail_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_detail_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`order_detail_id`, `quantity`, `total_amount`, `orders_id`, `product_detail_id`) VALUES
(52, 1, 420000, 41, 112),
(53, 1, 380000, 42, 116),
(54, 1, 319000, 43, 1),
(55, 1, 380000, 44, 116),
(56, 2, 1160000, 45, 115),
(57, 2, 1160000, 46, 115),
(58, 1, 360000, 47, 117),
(59, 1, 380000, 48, 116),
(60, 1, 420000, 49, 113),
(61, 1, 360000, 50, 117),
(62, 1, 380000, 51, 116),
(63, 1, 360000, 52, 117),
(64, 1, 360000, 53, 117);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `price_promotion` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `price`, `price_promotion`, `category_id`, `is_hidden`) VALUES
(1, 'Áo Thun Let The Good Times Roll On', 319000, 0, 101, 0),
(2, 'Áo Polo Cổ Bẻ Tay Ngắn', 197000, 180000, 103, 0),
(3, 'Áo Polo Cổ Bẻ Sọc Đỏ Tay Ngắn ', 147000, 0, 103, 0),
(4, 'Áo Polo Cổ Bẻ Tay Ngắn Roston', 297000, 0, 103, 0),
(5, 'Áo Polo Cổ Bẻ Tay Dài Stay Positive', 357000, 0, 103, 0),
(6, 'Áo Polo Cổ Bẻ Tay Ngắn Los Angeles', 287000, 0, 103, 0),
(7, 'Áo Sơ Mi Cổ Bẻ Tay Dài Sợi Modal', 197000, 0, 102, 0),
(8, 'Áo Sơ Mi Cổ Trụ Tay Ngắn Sợi Nhân Tạo', 257000, 0, 102, 0),
(9, 'Áo Sơ Mi Cổ Bẻ Tay Dài Sợi Tre Ít Nhăn', 427000, 0, 102, 0),
(10, 'Áo Sơ Mi Cổ Bẻ Tay Ngắn Sợi Nhân Tạo Seventy Seven', 197000, 0, 102, 0),
(11, 'Áo Sơ Mi Doraemon Và Bảo Bối Generic', 357000, 0, 102, 0),
(12, 'Áo Khoác Không Nón Vải Jean Chống Nắng Wash Nhẹ', 297000, 0, 104, 0),
(13, 'Áo Khoác Có Nón Vải Kaki Chống Nắng', 277000, 0, 104, 0),
(14, 'Áo Khoác Có Nón Vải Thun Mặc Ấm', 497000, 0, 104, 0),
(15, 'Áo Khoác Không Nón Vải Dù Chống Nắng', 247000, 0, 104, 0),
(16, 'Áo Khoác Có Nón Vải Thun Mặc Mát Trơn Dáng', 397000, 0, 104, 0),
(17, 'Quần Tây Lưng Gài Ống Đứng Sợi Nhân Tạo Co Giãn Trơn Dáng Vừa', 277000, 250000, 201, 0),
(18, 'Quần Tây Lưng Gài Sợi Nhân Tạo Co Giãn Trung Bình Trơn Dáng Vừa', 277000, 0, 201, 0),
(19, 'Quần Tây Lưng Gài Sợi Nhân Tạo Vải Sợi Rayon Co Dãn', 277000, 0, 201, 0),
(20, 'Quần Tây Lưng Gài Ống Đứng Sợi Nhân Tạo Vải Trouser Fabric', 397000, 0, 201, 0),
(21, 'Quần Tây Lưng Thun Ống Đứng Sợi Nhân Tạo Mặc Thoải Mái Trơn Dáng Vừa', 397000, 0, 201, 0),
(22, 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Mặc Bền Wash Nhẹ Dáng Vừa', 277000, 0, 202, 0),
(23, 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Mặc Mềm Trơn Dáng Vừa', 457000, 0, 202, 0),
(24, 'Quần Jean Lưng Gài Ống Đứng Vải Cà Phê Mặc Bền Wash Nhẹ Dáng Vừa', 557000, 0, 202, 0),
(25, 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Trơn Dáng Vừa', 387000, 0, 202, 0),
(26, 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Trơn Dáng Vừa', 387000, 0, 202, 0),
(27, 'Quần Dài Lưng Gài Ống Đứng Vải Kaki Đứng Dáng Trơn Dáng Vừa Giá Tốt No Style M115 Vol 24', 497000, 0, 203, 0),
(28, 'Quần Dài Lưng Thun Ống Đứng Vải Dù Co Giãn Trơn Dáng Rộng Giá Tốt No Style M98 Vol 24', 387000, 0, 203, 0),
(29, 'Quần Dài Lưng Thun Ống Ôm Vải Dù Co Giãn Trơn Dáng Rộng Giá Tốt No Style M97 Vol 24', 457000, 0, 203, 0),
(30, 'Quần Dài Lưng Thun Ống Ôm Vải Dù Nhanh Khô Biểu Tượng Dáng Rộng Giá Tốt Seventy Seven 34 Vol 24', 277000, 0, 203, 0),
(31, 'Quần Dài Lưng Thun Ống Đứng Vải Kaki Thấm Hút Biểu Tượng Dáng Rộng Giá Tốt Seventy Seven 33 Vol 24', 297000, 0, 203, 0),
(32, 'Quần Dài Lưng Thun Ống Ôm Vải Thun Thoáng Mát Trơn Dáng Vừa Cao Cấp Cool Touch 03 Vol 24', 277000, 0, 204, 0),
(33, 'Quần Dài Lưng Thun Ống Ôm Vải Thun Co Giãn Biểu Tượng Dáng Vừa Thể Thao Beginner 08 Vol 24', 257000, 0, 204, 0),
(34, 'Quần Dài Lưng Thun Ống Ôm Vải Thun Mặc Thoải Mái Biểu Tượng Dáng Rộng Giá Tốt Seventy Seven 35 Vol 24', 277000, 0, 204, 0),
(35, 'Quần Dài Lưng Thun Ống Ôm Vải Thun Co Giãn Trơn Dáng Ôm Giá Tốt Non Branded 07 Vol 24', 197000, 0, 204, 0),
(36, 'Quần Dài Lưng Thun Ống Ôm Vải Thun Co Giãn Biểu Tượng Dáng Rộng Giá Tốt No Style M121 Vol 24', 397000, 0, 204, 0),
(37, 'Quần Short Lưng Gài Dưới Gối Vải Jean Mặc Bền Wash Nhẹ Dáng Vừa Giá Tốt Seventy Seven 29 Vol 24', 227000, 0, 205, 0),
(38, 'Quần Short Lưng Thun Trên Gối Vải Jean Mặc Bền Wash Nhẹ Dáng Rộng Giá Tốt No Style M84 Vol 24', 227000, 0, 205, 0),
(39, 'Quần Short Lưng Thun Trên Gối Vải Kaki Thấm Hút Biểu Tượng Dáng Rộng Giá Tốt Seventy Seven 32 Vol 24', 227000, 0, 206, 0),
(40, 'Quần Short Lưng Thun Trên Gối Vải Kaki Thấm Hút Trơn Dáng Rộng Giá Tốt No Style M94 Vol 24', 287000, 0, 206, 0),
(41, 'Quần Short Lưng Thun Trên Gối Vải Kaki Thấm Hút Trơn Dáng Rộng Giá Tốt No Style M95 Vol 24', 287000, 0, 206, 0),
(42, 'Quần Short Lưng Thun Trên Gối Vải Thun Thoải Mái Vận Động Biểu Tượng Dáng Rộng Giá Tốt Seventy Seven 30 Vol 24', 177000, 0, 207, 0),
(43, 'Quần Short Lưng Thun Dưới Gối Vải Thun Mặc Mát Trơn Dáng Vừa Cao Cấp Cool Touch 04 Vol 24', 287000, 0, 207, 0),
(44, 'Quần Short Lưng Thun Dưới Gối Vải Thun Mặc Mát Trơn Dáng Vừa Cao Cấp Cool Touch 05 Vol 24', 127000, 0, 207, 0),
(45, 'Quần Short Lưng Thun 7 Inch Vải Thun Thoáng Mát Biểu Tượng Dáng Vừa Thể Thao Beginner 05 Vol 24', 147000, 0, 207, 0),
(46, 'Quần Short Lưng Thun Trên Gối Vải Thun Co Giãn Biểu Tượng Dáng Rộng Giá Tốt No Style M131 Vol 24', 257000, 220000, 207, 0),
(47, 'Quần Short Lưng Thun Trên Gối Vải Thun Thoáng Mát Biểu Tượng Dáng Rộng Ready To Go The Seafarer 14 Vol 24', 287000, 0, 207, 0),
(48, 'Quần Short Lưng Thun 5 Inch Vải Dù Mỏng Nhẹ Biểu Tượng Dáng Vừa Thể Thao Beginner 04 Vol 24', 97000, 0, 208, 0),
(49, 'Quần Short Lưng Thun Trên Gối Vải Dù Nhanh Khô Trơn Dáng Rộng Giá Tốt No Style M91 Vol 24', 287000, 0, 208, 0),
(50, 'Quần Short Lưng Thun Trên Gối Vải Dù Mỏng Nhẹ Trơn Dáng Vừa Giá Tốt Non Branded 06 Vol 24', 127000, 0, 208, 0),
(51, 'Quần Short Lưng Thun Trên Gối Vải Dù Nhanh Khô Biểu Tượng Dáng Rộng Giá Tốt Seventy Seven 31 Vol 24', 227000, 0, 208, 0),
(52, 'Quần Short Lưng Thun Trên Gối Vải Dù Nhanh Khô Trơn Dáng Rộng Giá Tốt No Style M90 Vol 24', 257000, 0, 208, 0),
(53, 'PKTT Dây Nịt Da #Y2010 D14 Vol 24', 227000, 0, 301, 0),
(54, 'PKTT Dây Nịt Da #Y2010 D02 Vol 24', 227000, 0, 301, 0),
(55, 'PKTT Dây Nịt Da #Y2010 D10 Vol 24', 197000, 0, 301, 0),
(56, 'PKTT Dây Nịt Da #Y2010 D08 Vol 24', 285000, 0, 301, 0),
(57, 'PKTT Dây Nịt Da #Y2010 D07 Vol 24', 285000, 230000, 301, 0),
(58, 'PKTT Dây Nịt Da #Y2010 D01 Vol 24', 285000, 0, 301, 0),
(59, 'PKTT Ví Da Thịnh Vượng 7 Vol 24', 227000, 0, 302, 0),
(60, 'PKTT Ví #Y2010 01 Vol 24', 127000, 0, 302, 0),
(61, 'PKTT Ví #Y2010 02 Vol 24', 127000, 0, 302, 0),
(62, 'PKTT Ví Đa Năng #Y2010 03 Vol 24', 127000, 0, 302, 0),
(63, 'PKTT Ví #Y2010 M3 Vol 24', 197000, 0, 302, 0),
(64, 'PKTT Ví Da Tài Lộc 03 Vol 24', 297000, 0, 302, 0),
(65, 'PKTT Nón Vải Cotton Phụ Kiện #Y2010 02 Vol 24', 97000, 0, 303, 0),
(66, 'PKTT Nón Lưỡi Trai Vải Kaki Trơn Phụ Kiện Seventy Seven 47 Vol 24', 97000, 0, 303, 0),
(67, 'PKTT Nón Lưỡi Trai Vải Dù Trơn Phụ Kiện #Y2010 03 Vol 24', 87000, 0, 303, 0),
(68, 'PKTT Nón Lưỡi Trai Vải Dù Trơn Phụ Kiện #Y2010 03 Vol 24', 87000, 0, 303, 0),
(69, 'PKTT Nón Lưỡi Trai Vải Dù Trơn Ready To Go 15 Vol 24', 147000, 0, 303, 0),
(70, 'PKTT Găng Tay Chống UV (Chống Nắng) #Y2010 04 Vol 24', 47000, 0, 305, 0),
(71, 'PKTT Găng Tay #Y2010 02 Vol 24', 27000, 0, 305, 0),
(72, 'PKTT Găng Tay #Y2010 01 Vol 24', 27000, 0, 305, 0),
(73, 'PKTT Găng Tay Đa Năng #Y2010 05 Vol 24', 57000, 0, 305, 0),
(74, 'PKTT Găng Tay Đa Năng #Y2010 05 Vol 24', 57000, 0, 305, 0),
(75, 'PKTT Găng Tay #Y2010 01 Vol 24', 27000, 14500, 305, 0),
(76, 'Nike Air Force 1 \'07', 3239000, 0, 401, 0),
(77, 'Nike Air Max Dn', 4699000, 0, 401, 0),
(78, 'Nike Air Max 90 Drift', 4409000, 0, 401, 0),
(79, 'Nike Zoom Vomero Roam', 5279000, 0, 401, 0),
(80, 'Nike Zoom Vomero 5', 4699000, 0, 401, 0),
(81, 'S-ULTIMATE TEE', 420000, 370000, 101, 0),
(82, 'S-ULTIMATE TANKTOP', 350000, 0, 101, 0),
(83, 'BLACK S-WILD STATION TEE', 420000, 370000, 101, 0),
(84, 'S-JEEP CAMP TEE', 420000, 0, 101, 0),
(85, 'S-URBANWANDERERS TEE WHITE', 420000, 0, 101, 0),
(86, 'S-WANDERLUST GEAR TEE WHITE', 420000, 0, 101, 0),
(87, 'S-CARABINER TEE GREY', 460000, 0, 101, 0),
(88, 'SUPERTRAMP ZERO JERSEY', 580000, 520000, 101, 0),
(89, 'SALVATION BABY TEE', 380000, 320000, 101, 0),
(90, 'CREAM BAD & LAZY BABY TEE', 360000, 250000, 101, 0),
(92, 'Áo Thun Let The Good Times Roll On 1', 23999000, 0, 101, 0),
(93, 'abc', 123, 0, 101, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_detail`
--

CREATE TABLE `product_detail` (
  `product_detail_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `isFeatured` tinyint(1) DEFAULT 0,
  `isHot` tinyint(1) NOT NULL DEFAULT 0,
  `is_primary` tinyint(4) NOT NULL DEFAULT 1,
  `is_hidden` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_detail`
--

INSERT INTO `product_detail` (`product_detail_id`, `color_id`, `size_id`, `quantity`, `description`, `product_id`, `isFeatured`, `isHot`, `is_primary`, `is_hidden`) VALUES
(1, 2, 5, 100, 'asssssssssssss', 1, 0, 1, 1, 0),
(2, 1, 3, 0, '1. Kiểu sản phẩm: Áo thun Polo tay ngắn.\r\n2. Ưu điểm:\r\n○ Mặc Mát giúp áo thoáng mát và thoát ẩm hiệu quả, giữ bạn luôn khô ráo và thoải mái vận động\r\n○ Công nghệ Cool Touch giúp vải siêu mềm mướt, mịn mát và co giãn cực thoải mái khi sử dụng.\r\n○ Nhiều ton', 2, 1, 0, 1, 0),
(3, 2, 3, 0, '1. Kiểu sản phẩm: Áo Polo tay ngắn dáng vừa.\r\n2. Ưu điểm: thoáng mát (nhờ mắt vải lớn), khả năng hút ẩm tốt, mềm mịn, bo poly có độ bền cao giúp ôm sát nhưng vẫn thoải mái khi mặc.\r\n3. Chất liệu: Vải Cá Sấu Tici 4 chiều, thành phần gồm 61% Polyester, 33% ', 3, 0, 0, 1, 0),
(4, 2, 3, 0, '1. Kiểu sản phẩm: Áo Polo tay ngắn.\r\n2. Ưu điểm: Cấu trúc hút ẩm thoát khí ưu việt, co giãn 2 chiều cho sự thoải mái tối đa.\r\n3. Chất liệu: Thành phần gồm 60% Cotton và 40% Polyester mang lại cảm giác mềm mại và độ bền cao.\r\n4. Kỹ thuật: Xẻ trụ hình thang', 4, 0, 0, 1, 0),
(5, 5, 4, 0, '1. Kiểu sản phẩm: Áo polo tay dài.\r\n2. Ưu điểm: Với khả năng co giãn, thoáng khí và nhanh khô, chiếc áo này không chỉ mang lại sự tiện lợi mà còn tạo nên vẻ ngoài thời trang. Kiểu dáng raglan phối màu cầu kỳ cùng đường cắt may tinh tế giúp tôn lên form dá', 5, 0, 0, 1, 0),
(6, 9, 3, 0, '1. Kiểu sản phẩm: Áo Thun Polo tay ngắn\r\n2. Ưu điểm: Thấm hút, thoát ẩm tốt, bề mặt mềm mại, kiểm soát mùi, điều hòa nhiệt, thân thiện với môi trường, co giãn tối ưu, ít nhăn\r\n3. Chất liệu: Vải Cotton Compact 4 (92% Cotton 8% Spandex)\r\n4. Kỹ thuật: Kết hợ', 6, 1, 0, 1, 0),
(7, 2, 4, 0, '1. Kiểu sản phẩm: Áo sơ mi cổ bẻ tay dài.\r\n2. Ưu điểm: Co giãn tốt, chống co rút tốt giữ form sau nhiều lần sử dụng, thấm hút và thoát mồ hôi tốt.\r\n3. Chất liệu: Modal Fabric, thành phần 12% Modal 88% Polyester.\r\n4. Kỹ thuật: Thiết kế form vừa thanh lịch,', 7, 1, 0, 1, 0),
(8, 2, 3, 0, '1. Kiểu sản phẩm: Áo Sơ Mi Cổ Trụ Tay Ngắn\r\n2. Ưu điểm:\r\n● Vải thấm hút mồ hôi tốt, thoáng mát mang lại cảm giác thoải mái mềm mại, dễ chịu\r\n● Nhanh khô, ít nhăn tiện lợi cho việc giặt ủi và bảo quản.\r\n● Chất liệu linen tự nhiên, an toàn cho sức khỏe và T', 8, 0, 0, 1, 0),
(9, 2, 4, 0, '1. Kiểu sản phẩm: Áo sơ mi nam tay dài cổ bẻ\r\n2. Ưu điểm:\r\n● Vải sợi tre thiên nhiên thân thiện với môi trường và sức khỏe.\r\n● Công nghệ vải hiện đại giúp áo có nhiều tính năng ưu việt như: kháng khuẩn, giảm tĩnh điện, thấm hút mồ hôi.\r\n● Ít nhăn, dễ ủi: ', 9, 1, 0, 1, 0),
(10, 6, 3, 0, '1. Kiểu sản phẩm: Áo sơ mi tay ngắn phối màu\r\n2. Ưu điểm:\r\n○ Với bề mặt dạng nhung hiệu ứng sọc tăm, bảng màu trầm ấm cho cảm giác ấm áp và mang vẻ đẹp Retro.\r\n○ Chất liệu sợi nhân tạo thấm hút giúp bạn luôn thoải mái, ít nhăn và duy trì màu sắc lâu dài.\r', 10, 0, 1, 1, 0),
(11, 2, 4, 0, '1. Kiểu sản phẩm: Áo sơ mi cổ bẻ tay ngắn.\r\n2. Ưu điểm: Bền màu, ít nhăn, tạo cảm giác thoải mái và cá tính. Họa tiết nhãn ép các bảo bối và Doraemon được in chuyển nhiệt tinh xảo và thêu wappen, tạo nên một tổng thể hài hòa và bắt mắt.\r\n3. Chất liệu: Den', 11, 0, 1, 1, 0),
(12, 4, 4, 0, '1.Kiểu sản phẩm: Áo khoác jean không nón dáng vừa.\r\n2. Ưu điểm: Dễ dàng phối đồ với nhiều phong cách khác nhau, từ cá tính đến thanh lịch, không chỉ mang đến vẻ thời trang mà còn có công dụng chống nắng hiệu quả.\r\n3. Chất liệu: 100% cotton vải jean bền bỉ', 12, 1, 0, 1, 0),
(13, 1, 5, 0, '1. Kiểu sản phẩm: Áo khoác có nón.\r\n2. Ưu điểm:\r\nGiữ ấm, tránh nắng.\r\nNhiều màu sắc để lựa chọn.\r\n3. Chất liệu: Vải Khaki 87% Polyester 13% Cotton\r\n4. Kỹ thuật:\r\nMay đắp nhãn dệt thiết kế riêng BST.\r\nTúi trong tiện dụng, lai luồn dây thun rút có nút chặn,', 13, 1, 0, 1, 0),
(14, 6, 4, 0, '1. Kiểu sản phẩm: Áo khoác thun\r\n2. Ưu điểm:\r\n● Mặc ấm: Chất liệu thun French Terry giúp giữ ấm cho cơ thể trong thời tiết lạnh.\r\n● Chống nắng: Áo khoác có thể là một lớp bảo vệ khỏi tác động của tia UV khi bạn ra ngoài.\r\n3. Chất liệu: Vải CVC French Terr', 14, 0, 1, 1, 0),
(15, 9, 4, 0, '1. Kiểu sản phẩm: Áo khoác không nón, áo khoác dù.\r\n2. Ưu điểm:\r\nCản gió: Giữ ấm và bảo vệ khỏi gió lạnh.\r\nTrượt nước: Tránh được những cơn mưa nhỏ bất chợt, và cũng có thể khoác tránh sương khi đêm về.\r\nNhẹ, nhanh khô.\r\nNhiều màu sắc để lựa chọn.\r\n3. Ch', 15, 0, 0, 1, 0),
(16, 1, 4, 0, '1. Kiểu sản phẩm: Áo Khoác có nón, áo khoác thun\r\n2. Ưu điểm:\r\nSiêu mềm mướt, mịn mát, thấm hút mồ hôi tốt\r\nSợi Cotton High TPI có chỉ số vòng xoắn cao hơn 25% so với sợi thông thường. Điều này giúp vải có độ co giãn tốt và thoải mái khi mặc\r\nNhiều màu sắ', 16, 0, 0, 1, 0),
(17, 1, 4, 0, '1. Kiểu sản phẩm: Quần tây nam lưng gài.\r\n2. Ưu điểm:\r\n• Vừa vặn, thoải mái form dáng vừa vặn, ống quần không quá ôm hoặc quá rộng, kết hợp với chất liệu co giãn giúp bạn thoải mái khi vận động.\r\n• Dễ dàng phối đồ với nhiều loại áo khác nhau, từ áo sơ mi ', 17, 0, 0, 1, 0),
(18, 3, 4, 0, '1. Kiểu sản phẩm: Quần Tây Dáng Vừa.\r\n2. Ưu điểm: Thiết kế phom dáng vừa, phù hợp nhiều lứa tuổi, môi trường khác nhau.\r\n○ Co giãn trung bình giúp quần luôn giữ được form dáng.\r\n○ Kháng khuẩn, mềm mịn, ít nhăn\r\n○ Độ bền màu tương đối tốt\r\n3. Chất liệu: 82', 18, 1, 0, 1, 0),
(19, 1, 4, 0, '1. Kiểu sản phẩm: Quần Tây Dáng Vừa.\r\n2. Ưu điểm: Thiết kế phom dáng vừa, phù hợp nhiều lứa tuổi, môi trường khác nhau.\r\n○ Co giãn trung bình giúp quần luôn giữ được form dáng.\r\n○ Kháng khuẩn, mềm mịn, ít nhăn\r\n○ Độ bền màu tương đối tốt\r\n3. Chất liệu: 82', 19, 1, 0, 1, 0),
(20, 1, 4, 0, '1. Kiểu sản phẩm: Quần tây dáng vừa.\r\n2. Ưu điểm: Tôn dáng, có thể mặc trong nhiều hoàn cảnh khác nhau.\r\n3. Chất liệu: 96% Polyester, 4% Spandex, ít nhăn và dễ giặt ủi, co giãn 2 chiều.\r\n4. Kỹ thuật: Họa tiết thêu 2D, miếng đắp lưng làm cho chiếc quần trở', 20, 0, 1, 1, 0),
(21, 3, 3, 0, '1. Kiểu sản phẩm: Quần tây lưng thun ống đứng\r\n2. Ưu điểm:\r\n• Phong cách đa năng: Kết hợp hài hòa giữa phong cách công sở và thời trang đường phố, phù hợp với nhiều hoàn cảnh khác nhau.\r\n• Chất liệu cao cấp: Vải Trouser Fabric mềm mại, thoáng mát, có độ b', 21, 1, 0, 1, 0),
(22, 1, 3, 0, '1. Kiểu sản phẩm: Quần Jean lưng gài ống đứng.\r\n2. Ưu điểm:\r\n● Khả năng chịu bền tốt.\r\n● Sợi Spandex giúp sản phẩm có độ co giãn nhẹ, tạo sự thoải mái khi di chuyển.\r\n● Giữ form dáng tốt, không bị nhão hay biến dạng sau nhiều lần giặt.\r\n● Đa dạng màu sắc ', 22, 1, 0, 1, 0),
(23, 1, 3, 0, '1. Kiểu sản phẩm: Quần Jean co giãn, ống đứng.\r\n2. Ưu điểm:\r\n○ Mặc mềm, mặc mịn và mặc mát.\r\n○ Co giãn đa chiều, tạo sự thoải mái khi vận động.\r\n○ Sản phẩm có 4 màu phục vụ nhiều sở thích về màu sắc.\r\n3. Chất liệu: Jean Cotton Spandex độ dày 10,5 oz (98% ', 23, 0, 1, 1, 0),
(24, 4, 3, 0, '1. Kiểu sản phẩm: Quần Jean co giãn, ống đứng.\r\n2. Ưu điểm:\r\n○ Mặc mềm, mặc mịn\r\n○ Co giãn đa chiều, tạo sự thoải mái khi vận động.\r\n○ Sản phẩm có 3 màu, gồm có 8 size từ 29 đến 36 phục vụ lựa chọn size dễ dàng hơn.\r\n3. Chất liệu: Vải Jean với thành phần ', 24, 0, 0, 1, 0),
(25, 3, 3, 0, '1. Kiểu sản phẩm: Quần jean lưng gài ống đứng.\r\n2. Ưu điểm: Sản phẩm có nhiều màu sắc để chọn lựa, vải cotton mềm mại, thoáng mát, thấm hút mồ hôi tốt, spandex co giãn tạo sự thoải mái khi vận động.\r\n3. Chất liệu: Jean, thành phần bao gồm 98% Cotton, 2% S', 25, 0, 0, 1, 0),
(26, 5, 3, 0, '1. Kiểu sản phẩm: Quần jean lưng gài ống đứng.\r\n2. Ưu điểm: Sản phẩm có nhiều màu sắc để chọn lựa, vải cotton mềm mại, thoáng mát, thấm hút mồ hôi tốt, spandex co giãn tạo sự thoải mái khi vận động.\r\n3. Chất liệu: Jean, thành phần bao gồm 98% Cotton, 2% S', 26, 0, 1, 1, 0),
(27, 1, 1, 0, 'Kiểu sản phẩm: Quần dài lưng gài, ống đứng.\r\nƯu điểm:\r\nForm dáng chuẩn: Ống đứng vừa vặn, tôn dáng.\r\nThiết kế tinh tế: Đường may tỉ mỉ, chắc chắn, bền bỉ.\r\nĐa năng: Dễ phối với nhiều loại áo, phù hợp nhiều hoàn cảnh.\r\nThân thiện môi trường: Cotton tự nhiê', 27, 1, 1, 1, 0),
(28, 3, 2, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống đứng.\r\nƯu điểm:\r\nVải dù thun thấm hút mồ hôi tốt, khô thoáng.\r\nCo giãn 2 chiều, chất liệu nhẹ, dễ vận động.\r\nTúi hộp lớn hai bên tiện lợi, dây rút điều chỉnh eo linh hoạt.\r\nChất liệu: Vải dù thun (parachute), 90% Nyl', 28, 0, 0, 1, 0),
(29, 6, 1, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nChất liệu Parachute giúp quần khô nhanh.\r\nThoát ẩm tốt, giảm nóng bức.\r\nCo giãn tốt, dễ vận động.\r\nVải mềm mại, không nhăn, không xù.\r\nNhiều màu sắc, đa dạng lựa chọn.\r\nChất liệu: Parachute, 100% Polye', 29, 0, 0, 1, 0),
(30, 1, 1, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nVải Parachute khô nhanh sau khi giặt.\r\nThoát hơi ẩm, giảm nóng bức.\r\nCo giãn tốt, thoải mái vận động.\r\nVải mềm mại, không nhăn, không xù lông.\r\nĐa dạng màu sắc, nhiều lựa chọn.\r\nChất liệu: Parachute, 1', 30, 0, 0, 1, 0),
(31, 1, 2, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống đứng.\r\nƯu điểm:\r\nThấm hút mồ hôi, thoải mái khi mặc.\r\nVải ít nhăn, giữ dáng tốt, bền màu.\r\nĐa dạng màu sắc, nhiều lựa chọn.\r\nChất liệu: Corduroy, 100% Polyester.\r\nKỹ thuật: Thêu 2D tinh tế, phối viền hai bên tạo cảm ', 31, 1, 1, 1, 0),
(32, 6, 1, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống đứng.\r\nƯu điểm:\r\nThấm hút mồ hôi, thoải mái khi mặc.\r\nVải ít nhăn, giữ dáng tốt, bền màu.\r\nĐa dạng màu sắc, nhiều lựa chọn.\r\nChất liệu: Corduroy, 100% Polyester.\r\nKỹ thuật: Thêu 2D tinh tế, phối viền hai bên tạo cảm ', 32, 0, 0, 1, 0),
(33, 3, 3, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nCo giãn nhẹ, thoải mái vận động.\r\nNhanh khô, thấm hút mồ hôi tốt.\r\nĐa dạng màu sắc, dễ phối đồ.\r\nChất liệu: Parachute, 100% Polyester.\r\nKỹ thuật: In nhũ ánh kim thời trang, đường rã thông minh không cả', 33, 0, 0, 1, 0),
(34, 1, 1, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nCo giãn nhẹ, thoải mái vận động.\r\nNhanh khô, thấm hút mồ hôi tốt.\r\nĐa dạng màu sắc, dễ phối đồ.\r\nChất liệu: Parachute, 100% Polyester.\r\nKỹ thuật: In nhũ ánh kim thời trang, đường rã thông minh không cả', 34, 0, 0, 1, 0),
(35, 3, 1, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nCo giãn nhẹ, thoải mái vận động.\r\nNhanh khô, thấm hút mồ hôi tốt.\r\nĐa dạng màu sắc, dễ phối đồ.\r\nChất liệu: Parachute, 100% Polyester.\r\nKỹ thuật: In nhũ ánh kim thời trang, đường rã thông minh không cả', 35, 0, 0, 1, 0),
(36, 1, 4, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nCo giãn nhẹ, thoải mái vận động.\r\nNhanh khô, thấm hút mồ hôi tốt.\r\nĐa dạng màu sắc, dễ phối đồ.\r\nChất liệu: Parachute, 100% Polyester.\r\nKỹ thuật: In nhũ ánh kim thời trang, đường rã thông minh không cả', 36, 0, 0, 1, 0),
(37, 1, 3, 0, 'Kiểu sản phẩm: Quần short lưng gài dưới gối.\r\nƯu điểm: Độ bền cao, thấm hút tốt.\r\nChất liệu: Jean, 100% cotton.\r\nKỹ thuật: Thêu 2D sắc nét, bền màu, không bong tróc sau nhiều lần giặt.\r\nPhù hợp với ai: Người yêu thích sự bền bỉ, thoải mái và năng động.\r\nB', 37, 0, 0, 1, 0),
(38, 1, 1, 0, 'Kiểu sản phẩm: Quần short lưng gài dưới gối.\r\nƯu điểm: Độ bền cao, thấm hút tốt.\r\nChất liệu: Jean, 100% cotton.\r\nKỹ thuật: Thêu 2D sắc nét, bền màu, không bong tróc sau nhiều lần giặt.\r\nPhù hợp với ai: Người yêu thích sự bền bỉ, thoải mái và năng động.\r\nB', 38, 0, 0, 1, 0),
(39, 3, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, trên gối, dáng rộng.\r\nƯu điểm: Thấm hút tốt.\r\nChất liệu: Corduroy, 100% Polyester; bề mặt gân xếp, chắc chắn và mịn.\r\nKỹ thuật: Họa tiết thêu FEO nổi bật, bắt mắt.\r\nPhù hợp với: Người yêu thích phong cách năng động.', 39, 0, 0, 1, 0),
(40, 6, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, trên gối, dáng rộng.\r\nƯu điểm: Thấm hút tốt.\r\nChất liệu: Corduroy, 100% Polyester; bề mặt gân xếp, chắc chắn và mịn.\r\nKỹ thuật: Họa tiết thêu FEO nổi bật, bắt mắt.\r\nPhù hợp với: Người yêu thích phong cách năng động.', 40, 0, 0, 1, 0),
(41, 1, 1, 0, 'Kiểu sản phẩm: Quần short lưng thun, trên gối, dáng rộng.\r\nƯu điểm: Thấm hút tốt.\r\nChất liệu: Corduroy, 100% Polyester; bề mặt gân xếp, chắc chắn và mịn.\r\nKỹ thuật: Họa tiết thêu FEO nổi bật, bắt mắt.\r\nPhù hợp với: Người yêu thích phong cách năng động.', 41, 0, 0, 1, 0),
(42, 2, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 42, 0, 0, 1, 0),
(43, 1, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 43, 0, 0, 1, 0),
(44, 1, 1, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 44, 0, 0, 1, 0),
(45, 1, 1, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 45, 0, 0, 1, 0),
(46, 2, 1, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 46, 0, 0, 1, 0),
(47, 1, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.\r\n', 47, 0, 0, 1, 0),
(48, 1, 1, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 48, 0, 0, 1, 0),
(49, 3, 1, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 49, 0, 0, 1, 0),
(50, 6, 1, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 50, 1, 0, 1, 0),
(51, 2, 1, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 51, 1, 0, 1, 0),
(52, 1, 1, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 52, 0, 0, 1, 0),
(53, 1, 4, 0, 'Chất liệu cao cấp: 100% da bò thật, bền bỉ, mềm mại, mang lại cảm giác thoải mái.\r\nThiết kế sang trọng: Đầu khóa Zinc contract sáng bóng, tạo điểm nhấn nổi bật.\r\nĐộ bền: Da bò thật và đầu khóa hợp kim chống gỉ giúp sản phẩm có tuổi thọ cao.\r\nĐa năng: Phù ', 53, 1, 0, 1, 0),
(54, 1, 1, 0, 'Chất liệu cao cấp: 100% da bò thật, bền bỉ, mềm mại, mang lại cảm giác thoải mái.\r\nThiết kế sang trọng: Đầu khóa Zinc contract sáng bóng, tạo điểm nhấn nổi bật.\r\nĐộ bền: Da bò thật và đầu khóa hợp kim chống gỉ giúp sản phẩm có tuổi thọ cao.\r\nĐa năng: Phù ', 54, 0, 0, 1, 0),
(55, 1, 5, 0, 'Chất liệu cao cấp: 100% da bò thật, bền bỉ, mềm mại, mang lại cảm giác thoải mái.\r\nThiết kế sang trọng: Đầu khóa Zinc contract sáng bóng, tạo điểm nhấn nổi bật.\r\nĐộ bền: Da bò thật và đầu khóa hợp kim chống gỉ giúp sản phẩm có tuổi thọ cao.\r\nĐa năng: Phù ', 55, 0, 0, 1, 0),
(56, 1, 2, 0, 'Chất liệu cao cấp: 100% da bò thật, bền bỉ, mềm mại, mang lại cảm giác thoải mái.\r\nThiết kế sang trọng: Đầu khóa Zinc contract sáng bóng, tạo điểm nhấn nổi bật.\r\nĐộ bền: Da bò thật và đầu khóa hợp kim chống gỉ giúp sản phẩm có tuổi thọ cao.\r\nĐa năng: Phù ', 56, 0, 0, 1, 0),
(57, 1, 2, 0, 'Chất liệu cao cấp: 100% da bò thật, bền bỉ, mềm mại, mang lại cảm giác thoải mái.\r\nThiết kế sang trọng: Đầu khóa Zinc contract sáng bóng, tạo điểm nhấn nổi bật.\r\nĐộ bền: Da bò thật và đầu khóa hợp kim chống gỉ giúp sản phẩm có tuổi thọ cao.\r\nĐa năng: Phù ', 57, 0, 0, 1, 0),
(58, 1, 4, 0, 'Chất liệu cao cấp: 100% da bò thật, bền bỉ, mềm mại, mang lại cảm giác thoải mái.\r\nThiết kế sang trọng: Đầu khóa Zinc contract sáng bóng, tạo điểm nhấn nổi bật.\r\nĐộ bền: Da bò thật và đầu khóa hợp kim chống gỉ giúp sản phẩm có tuổi thọ cao.\r\nĐa năng: Phù ', 58, 0, 0, 1, 0),
(59, 1, 2, 0, 'Kiểu sản phẩm: Ví ngang da bò cao cấp.\r\nƯu điểm:\r\nThiết kế gọn nhẹ, phù hợp nhiều phong cách.\r\nDa bò thật nhập khẩu, vân độc đáo.\r\nNhiều ngăn tiện lợi: 2 ngăn tiền, 1 ngăn khóa kéo, 1 ngăn ảnh, 4 ngăn thẻ, và 2 ngăn tùy thích.\r\nHộp đựng sang trọng, thích ', 59, 0, 0, 1, 0),
(60, 1, 1, 0, 'Kiểu sản phẩm: Ví ngang da bò cao cấp.\r\nƯu điểm:\r\nThiết kế gọn nhẹ, phù hợp nhiều phong cách.\r\nDa bò thật nhập khẩu, vân độc đáo.\r\nNhiều ngăn tiện lợi: 2 ngăn tiền, 1 ngăn khóa kéo, 1 ngăn ảnh, 4 ngăn thẻ, và 2 ngăn tùy thích.\r\nHộp đựng sang trọng, thích ', 60, 0, 0, 1, 0),
(61, 1, 4, 0, 'Kiểu sản phẩm: Ví ngang da bò cao cấp.\r\nƯu điểm:\r\nThiết kế gọn nhẹ, phù hợp nhiều phong cách.\r\nDa bò thật nhập khẩu, vân độc đáo.\r\nNhiều ngăn tiện lợi: 2 ngăn tiền, 1 ngăn khóa kéo, 1 ngăn ảnh, 4 ngăn thẻ, và 2 ngăn tùy thích.\r\nHộp đựng sang trọng, thích ', 61, 0, 0, 1, 0),
(62, 1, 2, 0, 'Kiểu sản phẩm: Ví ngang da bò cao cấp.\r\nƯu điểm:\r\nThiết kế gọn nhẹ, phù hợp nhiều phong cách.\r\nDa bò thật nhập khẩu, vân độc đáo.\r\nNhiều ngăn tiện lợi: 2 ngăn tiền, 1 ngăn khóa kéo, 1 ngăn ảnh, 4 ngăn thẻ, và 2 ngăn tùy thích.\r\nHộp đựng sang trọng, thích ', 62, 0, 0, 1, 0),
(63, 1, 5, 0, 'Kiểu sản phẩm: Ví ngang da bò cao cấp.\r\nƯu điểm:\r\nThiết kế gọn nhẹ, phù hợp nhiều phong cách.\r\nDa bò thật nhập khẩu, vân độc đáo.\r\nNhiều ngăn tiện lợi: 2 ngăn tiền, 1 ngăn khóa kéo, 1 ngăn ảnh, 4 ngăn thẻ, và 2 ngăn tùy thích.\r\nHộp đựng sang trọng, thích ', 63, 0, 0, 1, 0),
(64, 1, 3, 0, 'Kiểu sản phẩm: Ví ngang da bò cao cấp.\r\nƯu điểm:\r\nThiết kế gọn nhẹ, phù hợp nhiều phong cách.\r\nDa bò thật nhập khẩu, vân độc đáo.\r\nNhiều ngăn tiện lợi: 2 ngăn tiền, 1 ngăn khóa kéo, 1 ngăn ảnh, 4 ngăn thẻ, và 2 ngăn tùy thích.\r\nHộp đựng sang trọng, thích ', 64, 0, 0, 1, 0),
(65, 1, 4, 0, 'Kiểu sản phẩm: PKTT Nón lưỡi trai vải dù thể thao.\r\nƯu điểm:\r\nThoáng khí: Lỗ nhỏ giúp không khí lưu thông, giữ đầu mát mẻ khi vận động.\r\nGiảm mồ hôi: Khả năng thoáng khí giúp mồ hôi nhanh chóng bay hơi, giảm cảm giác bí bách.\r\nĐa dạng màu sắc: Dễ dàng lựa', 65, 0, 0, 1, 0),
(66, 3, 2, 0, 'Kiểu sản phẩm: PKTT Nón lưỡi trai vải dù thể thao.\r\nƯu điểm:\r\nThoáng khí: Lỗ nhỏ giúp không khí lưu thông, giữ đầu mát mẻ khi vận động.\r\nGiảm mồ hôi: Khả năng thoáng khí giúp mồ hôi nhanh chóng bay hơi, giảm cảm giác bí bách.\r\nĐa dạng màu sắc: Dễ dàng lựa', 66, 0, 0, 1, 0),
(67, 6, 2, 0, 'Kiểu sản phẩm: PKTT Nón lưỡi trai vải dù thể thao.\r\nƯu điểm:\r\nThoáng khí: Lỗ nhỏ giúp không khí lưu thông, giữ đầu mát mẻ khi vận động.\r\nGiảm mồ hôi: Khả năng thoáng khí giúp mồ hôi nhanh chóng bay hơi, giảm cảm giác bí bách.\r\nĐa dạng màu sắc: Dễ dàng lựa', 67, 0, 0, 1, 0),
(68, 1, 5, 0, 'Kiểu sản phẩm: PKTT Nón lưỡi trai vải dù thể thao.\r\nƯu điểm:\r\nThoáng khí: Lỗ nhỏ giúp không khí lưu thông, giữ đầu mát mẻ khi vận động.\r\nGiảm mồ hôi: Khả năng thoáng khí giúp mồ hôi nhanh chóng bay hơi, giảm cảm giác bí bách.\r\nĐa dạng màu sắc: Dễ dàng lựa', 68, 0, 0, 1, 0),
(69, 3, 2, 0, 'Kiểu sản phẩm: PKTT Nón lưỡi trai vải dù thể thao.\r\nƯu điểm:\r\nThoáng khí: Lỗ nhỏ giúp không khí lưu thông, giữ đầu mát mẻ khi vận động.\r\nGiảm mồ hôi: Khả năng thoáng khí giúp mồ hôi nhanh chóng bay hơi, giảm cảm giác bí bách.\r\nĐa dạng màu sắc: Dễ dàng lựa', 69, 0, 0, 1, 0),
(70, 1, 4, 0, 'Kiểu sản phẩm: Găng tay ngắn.\r\nƯu điểm:\r\nBám dính tốt: Lòng bàn tay phủ silicon giúp cầm nắm chắc chắn.\r\nTiện dụng: Thiết kế xỏ ngón cho phép điều khiển phương tiện, sử dụng điện thoại mà không cần tháo găng.\r\nCo giãn và đàn hồi: Găng tay ôm sát, thoải má', 70, 1, 0, 1, 0),
(71, 3, 4, 0, 'Kiểu sản phẩm: Găng tay ngắn.\r\nƯu điểm:\r\nBám dính tốt: Lòng bàn tay phủ silicon giúp cầm nắm chắc chắn.\r\nTiện dụng: Thiết kế xỏ ngón cho phép điều khiển phương tiện, sử dụng điện thoại mà không cần tháo găng.\r\nCo giãn và đàn hồi: Găng tay ôm sát, thoải má', 71, 0, 0, 1, 0),
(72, 1, 3, 0, 'Kiểu sản phẩm: Găng tay ngắn.\r\nƯu điểm:\r\nBám dính tốt: Lòng bàn tay phủ silicon giúp cầm nắm chắc chắn.\r\nTiện dụng: Thiết kế xỏ ngón cho phép điều khiển phương tiện, sử dụng điện thoại mà không cần tháo găng.\r\nCo giãn và đàn hồi: Găng tay ôm sát, thoải má', 72, 0, 0, 1, 0),
(73, 1, 4, 0, 'Kiểu sản phẩm: Găng tay ngắn.\r\nƯu điểm:\r\nBám dính tốt: Lòng bàn tay phủ silicon giúp cầm nắm chắc chắn.\r\nTiện dụng: Thiết kế xỏ ngón cho phép điều khiển phương tiện, sử dụng điện thoại mà không cần tháo găng.\r\nCo giãn và đàn hồi: Găng tay ôm sát, thoải má', 73, 0, 0, 1, 0),
(74, 1, 1, 0, 'Kiểu sản phẩm: Găng tay ngắn.\r\nƯu điểm:\r\nBám dính tốt: Lòng bàn tay phủ silicon giúp cầm nắm chắc chắn.\r\nTiện dụng: Thiết kế xỏ ngón cho phép điều khiển phương tiện, sử dụng điện thoại mà không cần tháo găng.\r\nCo giãn và đàn hồi: Găng tay ôm sát, thoải má', 74, 0, 0, 1, 0),
(75, 3, 1, 0, 'Kiểu sản phẩm: Găng tay ngắn.\r\nƯu điểm:\r\nBám dính tốt: Lòng bàn tay phủ silicon giúp cầm nắm chắc chắn.\r\nTiện dụng: Thiết kế xỏ ngón cho phép điều khiển phương tiện, sử dụng điện thoại mà không cần tháo găng.\r\nCo giãn và đàn hồi: Găng tay ôm sát, thoải má', 75, 0, 0, 1, 0),
(76, 4, 2, 0, 'Kiểu sản phẩm: Quần dài lưng gài, ống đứng.\r\nƯu điểm:\r\nForm dáng chuẩn: Ống đứng vừa vặn, tôn dáng.\r\nThiết kế tinh tế: Đường may tỉ mỉ, chắc chắn, bền bỉ.\r\nĐa năng: Dễ phối với nhiều loại áo, phù hợp nhiều hoàn cảnh.\r\nThân thiện môi trường: Cotton tự nhiê', 27, 1, 1, 0, 0),
(77, 1, 3, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống đứng.\r\nƯu điểm:\r\nVải dù thun thấm hút mồ hôi tốt, khô thoáng.\r\nCo giãn 2 chiều, chất liệu nhẹ, dễ vận động.\r\nTúi hộp lớn hai bên tiện lợi, dây rút điều chỉnh eo linh hoạt.\r\nChất liệu: Vải dù thun (parachute), 90% Nyl', 28, 0, 0, 0, 0),
(78, 1, 2, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nChất liệu Parachute giúp quần khô nhanh.\r\nThoát ẩm tốt, giảm nóng bức.\r\nCo giãn tốt, dễ vận động.\r\nVải mềm mại, không nhăn, không xù.\r\nNhiều màu sắc, đa dạng lựa chọn.\r\nChất liệu: Parachute, 100% Polye', 29, 0, 0, 0, 0),
(79, 3, 2, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nVải Parachute khô nhanh sau khi giặt.\r\nThoát hơi ẩm, giảm nóng bức.\r\nCo giãn tốt, thoải mái vận động.\r\nVải mềm mại, không nhăn, không xù lông.\r\nĐa dạng màu sắc, nhiều lựa chọn.\r\nChất liệu: Parachute, 1', 30, 0, 0, 0, 0),
(80, 3, 3, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống đứng.\r\nƯu điểm:\r\nThấm hút mồ hôi, thoải mái khi mặc.\r\nVải ít nhăn, giữ dáng tốt, bền màu.\r\nĐa dạng màu sắc, nhiều lựa chọn.\r\nChất liệu: Corduroy, 100% Polyester.\r\nKỹ thuật: Thêu 2D tinh tế, phối viền hai bên tạo cảm ', 31, 0, 0, 0, 0),
(81, 1, 2, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống đứng.\r\nƯu điểm:\r\nThấm hút mồ hôi, thoải mái khi mặc.\r\nVải ít nhăn, giữ dáng tốt, bền màu.\r\nĐa dạng màu sắc, nhiều lựa chọn.\r\nChất liệu: Corduroy, 100% Polyester.\r\nKỹ thuật: Thêu 2D tinh tế, phối viền hai bên tạo cảm ', 32, 0, 0, 0, 0),
(82, 1, 4, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nCo giãn nhẹ, thoải mái vận động.\r\nNhanh khô, thấm hút mồ hôi tốt.\r\nĐa dạng màu sắc, dễ phối đồ.\r\nChất liệu: Parachute, 100% Polyester.\r\nKỹ thuật: In nhũ ánh kim thời trang, đường rã thông minh không cả', 33, 0, 0, 0, 0),
(83, 3, 2, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nCo giãn nhẹ, thoải mái vận động.\r\nNhanh khô, thấm hút mồ hôi tốt.\r\nĐa dạng màu sắc, dễ phối đồ.\r\nChất liệu: Parachute, 100% Polyester.\r\nKỹ thuật: In nhũ ánh kim thời trang, đường rã thông minh không cả', 34, 0, 0, 0, 0),
(84, 1, 2, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nCo giãn nhẹ, thoải mái vận động.\r\nNhanh khô, thấm hút mồ hôi tốt.\r\nĐa dạng màu sắc, dễ phối đồ.\r\nChất liệu: Parachute, 100% Polyester.\r\nKỹ thuật: In nhũ ánh kim thời trang, đường rã thông minh không cả', 35, 0, 0, 0, 0),
(85, 3, 2, 0, 'Kiểu sản phẩm: Quần dài lưng thun, ống ôm.\r\nƯu điểm:\r\nCo giãn nhẹ, thoải mái vận động.\r\nNhanh khô, thấm hút mồ hôi tốt.\r\nĐa dạng màu sắc, dễ phối đồ.\r\nChất liệu: Parachute, 100% Polyester.\r\nKỹ thuật: In nhũ ánh kim thời trang, đường rã thông minh không cả', 36, 0, 0, 0, 0),
(86, 3, 4, 0, 'Kiểu sản phẩm: Quần short lưng gài dưới gối.\r\nƯu điểm: Độ bền cao, thấm hút tốt.\r\nChất liệu: Jean, 100% cotton.\r\nKỹ thuật: Thêu 2D sắc nét, bền màu, không bong tróc sau nhiều lần giặt.\r\nPhù hợp với ai: Người yêu thích sự bền bỉ, thoải mái và năng động.', 37, 0, 0, 0, 0),
(87, 2, 2, 0, 'Kiểu sản phẩm: Quần short lưng gài dưới gối.\r\nƯu điểm: Độ bền cao, thấm hút tốt.\r\nChất liệu: Jean, 100% cotton.\r\nKỹ thuật: Thêu 2D sắc nét, bền màu, không bong tróc sau nhiều lần giặt.\r\nPhù hợp với ai: Người yêu thích sự bền bỉ, thoải mái và năng động.', 38, 0, 0, 0, 0),
(88, 2, 3, 0, 'Kiểu sản phẩm: Quần short lưng thun, trên gối, dáng rộng.\r\nƯu điểm: Thấm hút tốt.\r\nChất liệu: Corduroy, 100% Polyester; bề mặt gân xếp, chắc chắn và mịn.\r\nKỹ thuật: Họa tiết thêu FEO nổi bật, bắt mắt.\r\nPhù hợp với: Người yêu thích phong cách năng động.', 39, 0, 0, 0, 0),
(89, 1, 3, 0, 'Kiểu sản phẩm: Quần short lưng thun, trên gối, dáng rộng.\r\nƯu điểm: Thấm hút tốt.\r\nChất liệu: Corduroy, 100% Polyester; bề mặt gân xếp, chắc chắn và mịn.\r\nKỹ thuật: Họa tiết thêu FEO nổi bật, bắt mắt.\r\nPhù hợp với: Người yêu thích phong cách năng động.', 40, 0, 0, 0, 0),
(90, 3, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, trên gối, dáng rộng.\r\nƯu điểm: Thấm hút tốt.\r\nChất liệu: Corduroy, 100% Polyester; bề mặt gân xếp, chắc chắn và mịn.\r\nKỹ thuật: Họa tiết thêu FEO nổi bật, bắt mắt.\r\nPhù hợp với: Người yêu thích phong cách năng động.', 41, 0, 0, 0, 0),
(91, 1, 3, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 42, 0, 0, 0, 0),
(92, 2, 3, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 43, 0, 0, 0, 0),
(93, 2, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 44, 0, 0, 0, 0),
(94, 2, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 45, 0, 0, 0, 0),
(95, 1, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 46, 0, 0, 0, 0),
(96, 2, 3, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 47, 0, 0, 0, 0),
(97, 2, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 48, 0, 0, 0, 0),
(98, 1, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 49, 0, 0, 0, 0),
(99, 1, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 50, 0, 0, 0, 0),
(101, 1, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 51, 1, 0, 0, 0),
(102, 2, 2, 0, 'Kiểu sản phẩm: Quần short lưng thun, dưới gối, dáng vừa.\r\nƯu điểm: Thấm hút mồ hôi tốt, giữ mát và thoải mái, đặc biệt cho ngày hè nóng bức.\r\nChất liệu: Thun 4 chiều, 94% Cotton, 6% Spandex; thoáng mát, mềm mịn, co giãn tốt.', 52, 0, 0, 0, 0),
(103, 2, 4, 0, 'Thoải mái, bền bỉ và vượt thời gian—có lý do để trở thành số 1. Thiết kế của thập niên 80 kết hợp với màu sắc cổ điển tạo nên phong cách phù hợp với cả khi bạn đang ở trên sân hay đang di chuyển.\r\n\r\nLợi ích\r\nPhần trên bằng da mềm mại và mang lại nét cổ đi', 76, 1, 0, 1, 0),
(104, 3, 4, 0, 'Chào mừng thế hệ công nghệ Air tiếp theo. Air Max Dn có hệ thống ống áp suất kép Dynamic Air của chúng tôi, tạo cảm giác phản ứng với mỗi bước đi. Điều này tạo nên thiết kế mang tính tương lai, đủ thoải mái để mang từ ngày đến đêm. Tiến lên nào—Cảm nhận s', 77, 0, 1, 1, 0),
(105, 5, 4, 0, 'Air Max 90 Drift bổ sung thêm một lựa chọn bền hơn cho bộ sưu tập giày của bạn. Thiết kế phối màu giúp làm nổi bật các kết cấu và lớp khác nhau, bao gồm lớp Ripstop và cao su cứng cáp kết hợp với da thật và da tổng hợp. Trong khi đó, đệm Max Air và đế ngo', 78, 0, 0, 1, 0),
(106, 2, 4, 0, 'Được thiết kế cho điều kiện thành phố, phiên bản Vomero dành cho mùa đông này được thiết kế cho thời tiết ẩm ướt. Các vật liệu bền và chắn bùn cao su kết hợp với nhau để giúp bảo vệ đôi giày của bạn khỏi bụi bẩn và vũng nước. Thêm vào đó, đế giữa chắc chắ', 79, 0, 1, 1, 0),
(107, 2, 4, 0, 'Hãy tự tạo cho mình một làn đường mới trong Zoom Vomero 5. Thiết kế nhiều lớp kết hợp vải thoáng khí với da tổng hợp và điểm nhấn bằng nhựa để tạo nên phần trên phức tạp, dễ phối đồ. Và hãy xem qua phần đế trong, tôn vinh huấn luyện viên chạy bộ biểu tượn', 80, 1, 0, 1, 0),
(108, 1, 3, 0, 'S-ULTIMATE TEE được xuất hiện trong dòng tee với chi tiết chữ in đơn giản. SUPERTRAMP được ra mắt với những sản phẩm thiết kế ấn tượng, khẳng định tinh thần \"Dare to be out\". Cảm hứng từ những sự thoát khỏi ngột ngạo được tạo ra từ định kiến, chiến dịch D', 81, 0, 1, 1, 0),
(109, 1, 3, 0, 'S-ULTIMATE TANKTOP là sản phẩm Tanktop duy nhất trong dòng tee mà BAD HABITS ra mắt trong BST lần này. SUPERTRAMP được ra mắt với những sản phẩm thiết kế ấn tượng, khẳng định tinh thần \"Dare to be out\". Cảm hứng từ những sự thoát khỏi ngột ngạo được tạo r', 82, 0, 1, 1, 0),
(110, 1, 3, 0, 'SUPERTRAMP S-WILD STATION TEE BLACK là được xuất hiện trong dòng tee với graphic sắc màu mặt sau. SUPERTRAMP được ra mắt với những sản phẩm thiết kế ấn tượng, khẳng định tinh thần \"Dare to be out\". Cảm hứng từ những sự thoát khỏi ngột ngạo được tạo ra từ ', 83, 0, 0, 1, 0),
(111, 1, 3, 0, 'SUPERTRAMPS-JEEP CAMP TEE được xuất hiện trong dòng tee với graphic in trame ở mặt sau. SUPERTRAMP được ra mắt với những sản phẩm thiết kế ấn tượng, khẳng định tinh thần \"Dare to be out\".Cảm hứng từ những sự thoát khỏi ngột ngạo được tạo ra từ định kiến, ', 84, 0, 1, 1, 0),
(112, 2, 3, 0, 'SUPERTRAMP S-URBANWANDERERS TEE WHITE được xuất hiện trong dòng tee với graphic sắc màu mặt sau. SUPERTRAMP được ra mắt với những sản phẩm thiết kế ấn tượng, khẳng định tinh thần \"Dare to be out\". Cảm hứng từ những sự thoát khỏi ngột ngạo được tạo ra từ đ', 85, 1, 0, 1, 0),
(113, 2, 3, 0, 'S-WANDERLUST GEAR TEE WHITE được xuất hiện trong dòng tee với graphic in trame mặt sau, với phối màu: trắng và đen. SUPERTRAMP được ra mắt với những sản phẩm thiết kế ấn tượng, khẳng định tinh thần \"Dare to be out\".Cảm hứng từ những sự thoát khỏi ngột ngạ', 86, 0, 1, 1, 0),
(114, 3, 3, 0, 'SUPERTRAMP S-CARABINER TEE GREY được xuất hiện trong dòng tee với graphic in trame ở mặt trước, với ba phối màu: đen, xám xanh và olive. SUPERTRAMP được ra mắt với những sản phẩm thiết kế ấn tượng, khẳng định tinh thần \"Dare to be out\".Cảm hứng từ những s', 87, 1, 0, 1, 0),
(115, 1, 3, 0, 'SUPERTRAMP ZERO JERSEY là sản phẩm Jersey duy nhất trong dòng tee mà BAD HABITS ra mắt trong BST lần này. SUPERTRAMP được ra mắt với những sản phẩm thiết kế ấn tượng, khẳng định tinh thần \"Dare to be out\". Cảm hứng từ những sự thoát khỏi ngột ngạo được tạ', 88, 1, 0, 1, 0),
(116, 1, 3, 0, 'SALVATION BABY TEE là sản phẩm duy nhất trong dòng tee mà BAD HABITS ra mắt trong BST lần này. SALVATION được ra mắt với những sản phẩm thiết kế ấn tượng, khẳng định tinh thần \"Dare to be out\". Cảm hứng từ những sự thoát khỏi ngột ngạo được tạo ra từ định', 89, 0, 0, 1, 0),
(117, 11, 3, 0, 'Mô tả sản phẩm: Sản phẩm áo thun CREAM BAD & LAZY BABY TEE mang phong cách đơn giản nhưng đầy cuốn hút với thiết kế độc đáo. Màu nền kem nhã nhặn, kết hợp với dòng chữ \"BAD & LAZY\" nổi bật ở phía trước, giúp bạn thể hiện phong cách tự tin và cá tính.\r\n\r\nC', 90, 1, 0, 1, 0),
(123, 2, 2, 20, '1. Kiểu sản phẩm: Áo thun Polo tay ngắn. \r\n2. Ưu điểm: \r\nMặc Mát giúp áo thoáng mát và thoát ẩm hiệu quả, giữ bạn luôn khô ráo và thoải mái vận động \r\nCông nghệ Cool Touch giúp vải siêu mềm mướt, mịn mát và co giãn cực thoải mái khi sử dụng.', 2, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_detail_id` int(11) NOT NULL,
  `is_primary` varchar(255) NOT NULL,
  `img_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`product_image_id`, `product_detail_id`, `is_primary`, `img_url`) VALUES
(1, 1, '1', 'ao1.webp'),
(2, 2, '1', 'ao2.jpg'),
(3, 3, '1', 'ao3.jpg'),
(4, 4, '1', 'ao4.jpg'),
(5, 5, '1', 'ao5.jpg'),
(6, 6, '1', 'ao6.jpg'),
(7, 7, '1', 'ao7.jpg'),
(8, 8, '1', 'ao8.jpg'),
(9, 9, '1', 'ao9.jpg'),
(10, 10, '1', 'ao10.jpg'),
(11, 11, '1', 'ao11.jpg'),
(12, 12, '1', 'ao12.jpg'),
(13, 13, '1', 'ao13.jpg'),
(14, 14, '1', 'ao14.jpg'),
(15, 15, '1', 'ao15.jpg'),
(16, 16, '1', 'quan16.jpg'),
(17, 17, '1', 'quan17.jpg'),
(18, 18, '1', 'quan18.jpg'),
(19, 19, '1', 'quan19.jpg'),
(20, 20, '1', 'quan20.jpg'),
(21, 21, '1', 'quan21.jpg'),
(22, 22, '1', 'quan22.jpg'),
(23, 23, '1', 'quan23.jpg'),
(24, 24, '1', 'quan24.jpg'),
(25, 25, '1', 'quan25.jpg'),
(26, 26, '1', 'quan26.jpg'),
(27, 27, '1', 'quan27.jpg'),
(28, 28, '1', 'quan28.jpg'),
(29, 29, '1', 'quan29.jpg'),
(30, 30, '1', 'quan30.jpg'),
(31, 31, '1', 'quan31.jpg'),
(32, 32, '1', 'quan32.jpg'),
(33, 33, '1', 'quan33.jpg'),
(34, 34, '1', 'quan34.jpg'),
(35, 35, '1', 'quan35.jpg'),
(36, 36, '1', 'quan36.jpg'),
(37, 37, '1', 'quan37.jpg'),
(38, 38, '1', 'quan38.jpg'),
(39, 39, '1', 'quan39.jpg'),
(40, 40, '1', 'quan40.jpg'),
(41, 41, '1', 'quan41.jpg'),
(42, 42, '1', 'quan42.jpg'),
(43, 43, '1', 'quan43.jpg'),
(44, 44, '1', 'quan44.jpg'),
(45, 45, '1', 'quan45.jpg'),
(46, 46, '1', 'quan46.jpg'),
(47, 47, '1', 'quan47.jpg'),
(48, 48, '1', 'quan48.jpg'),
(49, 49, '1', 'quan49.jpg'),
(50, 50, '1', 'quan50.jpg'),
(51, 51, '1', 'quan51.jpg'),
(52, 52, '1', 'quan52.jpg'),
(53, 53, '1', 'phukien53.jpg'),
(54, 54, '1', 'phukien54.jpg'),
(55, 55, '1', 'phukien55.jpg'),
(56, 56, '1', 'phukien56.jpg'),
(57, 57, '1', 'phukien57.jpg\r\n'),
(58, 58, '1', 'phukien58.jpg'),
(59, 59, '1', 'phukien59.jpg'),
(60, 60, '1', 'phukien60.jpg'),
(61, 61, '1', 'phukien61.jpg'),
(62, 62, '1', 'phukien62.jpg'),
(63, 63, '1', 'phukien63.jpg'),
(64, 64, '1', 'phukien64.jpg'),
(65, 65, '1', 'phukien65.jpg'),
(66, 66, '1', 'phukien66.jpg'),
(67, 67, '1', 'phukien67.jpg'),
(68, 68, '1', 'phukien68.jpg'),
(69, 69, '1', 'phukien69.jpg'),
(70, 70, '1', 'phukien70.jpg'),
(71, 71, '1', 'phukien71.jpg'),
(72, 72, '1', 'phukien72.jpg'),
(73, 73, '1', 'phukien73.jpg'),
(74, 74, '1', 'phukien74.jpg'),
(75, 75, '1', 'phukien75.jpg'),
(103, 103, '1', 'giay103.png'),
(104, 104, '1', 'giay104.png'),
(105, 105, '1', 'giay105.png'),
(106, 106, '1', 'giay106.png'),
(107, 107, '1', 'giay107.png'),
(108, 108, '1', 'ao81.webp'),
(109, 109, '1', 'ao82.webp'),
(110, 110, '1', 'ao83.jpg'),
(111, 111, '1', 'ao84.webp'),
(112, 112, '1', 'ao85.webp'),
(113, 113, '1', 'ao86.webp'),
(114, 114, '1', 'ao87.jpg'),
(115, 115, '1', 'ao88.jpg'),
(116, 116, '1', 'ao89.webp'),
(117, 117, '1', 'ao90.webp'),
(118, 123, '0', 'ao2-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_detail_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `content`, `date`, `user_id`, `product_detail_id`) VALUES
(1, 'sản phẩm đẹp', '2024-12-08 03:38:22', 2, 89),
(2, 'giày tốt', '2024-12-08 03:38:36', 2, 89),
(3, 'áo trắng', '2024-12-08 03:41:30', 2, 90),
(6, 'ao dep\n', '2024-12-11 09:34:39', 28, 1),
(15, 'quần đẹp\n', '2024-12-13 14:44:05', 2, 17),
(16, 'á', '2024-12-13 14:51:09', 2, 17),
(17, 'á', '2024-12-13 14:52:57', 2, 90),
(23, 'hjkhhj', '2024-12-13 20:54:03', 2, 89),
(24, 'áo đẹp', '2024-12-17 15:43:02', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `size_id` int(11) NOT NULL,
  `size_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`size_id`, `size_name`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL'),
(5, 'XXL');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT 'default-ava.jpg',
  `registration_date` timestamp NULL DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expires` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT 0 COMMENT '0: Active, 1: Locked',
  `voucher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`, `role`, `phone`, `address`, `avatar`, `registration_date`, `confirmation_token`, `is_confirmed`, `reset_token`, `reset_token_expires`, `is_locked`, `voucher_id`) VALUES
(2, 'Lâm Ngọc Hùng', 'hungboma333@gmail.com', '$2b$10$RPUawLyP1mcGB5T1VETG2.RwtX6LkL7TTbI3JwnNs/yu710/hO5.S', 0, '0123456780', '1 Quang Trung, P. Tân Thuận Tây, Q.10', '1734092633488-giohang.png', '2024-11-06 08:20:58', NULL, 1, NULL, NULL, 0, 0),
(28, 'Lê Thành Thắng', 'thangleth1511@gmail.com', '$2b$10$0ouzh.AlUmOMt2tRxmluNOH9WaUF0uxdVhnAbvc301qB.KDeQGHly', 1, '0933978090', '3 Nguyễn Quý Anh, Tân Sơn Nhì, Tân Phú', 'default-ava.jpg', '2024-12-11 02:22:54', NULL, 1, NULL, NULL, 0, 0),
(34, 'Lâm Ngọc Hùng', 'ngochung210604@gmail.com', '$2b$10$ZmIahvWdpqTGVquQGwKzdesrolsSlMgNBWqETTq.NUhC15g7FJSR2', 1, '0346704417', 'Thị Trấn Đắk Hà', 'default-ava.jpg', '2024-12-22 03:03:34', NULL, 1, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount_amount` int(11) NOT NULL,
  `expiration_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `code`, `discount_amount`, `expiration_date`) VALUES
(2, 'DISCOUNT2025', 15, '2025-12-31 07:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`cart_detail_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `cart_detail_ibfk_1` (`product_detail_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite` (`product_id`),
  ADD KEY `favorites` (`user_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `orders_ibfk_2` (`city_id`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `orders_id` (`orders_id`),
  ADD KEY `orders_detail_ibfk_2` (`product_detail_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`product_detail_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `size_id` (`size_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_detail_id` (`product_detail_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `review_ibfk_1` (`product_detail_id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`size_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `cart_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `product_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `cart_detail_ibfk_1` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`product_detail_id`),
  ADD CONSTRAINT `cart_detail_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`);

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `favorites` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- Constraints for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_ibfk_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`),
  ADD CONSTRAINT `orders_detail_ibfk_2` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`product_detail_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD CONSTRAINT `product_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `product_detail_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  ADD CONSTRAINT `product_detail_ibfk_3` FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`product_detail_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`product_detail_id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
