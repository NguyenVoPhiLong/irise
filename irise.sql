-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2023 at 04:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `irise`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `accountid` int(11) NOT NULL,
  `addresswallet` longtext DEFAULT NULL,
  `publickey` longtext DEFAULT NULL,
  `privatekey` varchar(250) DEFAULT NULL,
  `education` longtext DEFAULT NULL,
  `skill` longtext DEFAULT NULL,
  `workexperience` longtext DEFAULT NULL,
  `project` longtext DEFAULT NULL,
  `reputationscore` varchar(250) DEFAULT NULL,
  `competencelevel` varchar(250) DEFAULT NULL,
  `phonenumber` varchar(250) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `birthday` datetime(6) DEFAULT NULL,
  `job` varchar(250) DEFAULT NULL,
  `gender` varchar(250) DEFAULT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `editdate` datetime(6) DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `userid_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accountid`, `addresswallet`, `publickey`, `privatekey`, `education`, `skill`, `workexperience`, `project`, `reputationscore`, `competencelevel`, `phonenumber`, `avatar`, `birthday`, `job`, `gender`, `createdate`, `editdate`, `isenable`, `note`, `userid_id`) VALUES
(1, 'LbNYQLhWKNemwCvVe144zcq5f5HvP8g7EP', '2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq36Pw12iSujtNmEuX867YQL6TWHnD6D9CHHiSiexX2pQ94', '2EPbyvKQKUaUPMF7Mm94FjEzvs5tsLWfesyc97W1dqYeeZFEG5CexZEZwvDhF7nHJWfyKnXhAAbdhWkAWLGeXceE42fsCDLoCWevEoXx7DBeQqVy5rbKQoHWBZd98yFvFyZXEvyz5WcDtezmxcEx8VAn8PsGitSsn6vooKZnGdPPf365zegjLyUD1WEud', NULL, NULL, NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(2, 'LUzMdnH7BeuXtSTTfPggqFYPUks5P4xeqp', '2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq3NKeXbFMf7ztRRtxPvu9A8AaC5hTtwpov1JqPKKqnsWSt', '2EPbyvKQKUaUPMF7Mm94FjEzvs5tsLWfesyc97W1dqYeeZFEG3B246Nh6w5sCfr78XTEwyfMMPv52YtqGdtf1wGiN6PGJMtMmvvm19P7FnT52D1HEmD2jup8Y4t8vG7C2njak9pbsqcXuwpU8YfADiBRwtXKjuyhk2p9CfBNSizsLvP5Lg9xtvzDxhWwn', NULL, NULL, NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(3, 'LeuXEjViiB6rdJS321jEoh2XLw8pmALNSY', '2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq37sTkVCdn8GVhc6WXxHCtqwQD4C9RHpxYMbWHfZJk4Tq6', '2EPbyvKQKUaUPMF7Mm94FjEzvs5tsLWfesyc97W1dqYeeZFEG3ACjUx7keHBjC4r1WiBrUyS3LvNAqwt1Varmd2iVB9An6JJLmjqiUbmCdCyGixkYsy2Hahtm8oGTRhHNrWCG4b37URwP6WJXicHK4DK3CZr3e2Uco2nQcJT8Uj6bKXdTprEtCmKTf93F', NULL, NULL, NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activityid` int(11) NOT NULL,
  `keyname` varchar(250) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `requirement` varchar(250) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `editdate` datetime(6) DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `competenceid_id` int(11) DEFAULT NULL,
  `keynameskill_id` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activityid`, `keyname`, `name`, `requirement`, `description`, `createdate`, `editdate`, `isenable`, `note`, `competenceid_id`, `keynameskill_id`) VALUES
(1, '1s1.1.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Hỗ trợ các kỹ sư lấy yêu cầu (nghề Kĩ sư lấy yêu cầu) trong việc chuẩn bị các khảo sát và các dụng cụ thu thập khác (F/A)', NULL, NULL, 1, NULL, 1, 's1.1'),
(2, '1s1.3.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Hỗ trợ chuẩn bị các yêu cầu về tính nhất quán với các tiêu chuẩn nội bộ và tiêu chuẩn đã được công bố (F/A)', NULL, NULL, 1, NULL, 1, 's1.3'),
(3, '1s1.4.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Hỗ trợ xây dựng và kiểm thử nguyên mẫu (F/A)', NULL, NULL, 1, NULL, 1, 's1.4'),
(4, '1s1.5.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Tuân thủ và áp dụng các quy trình đã xác định về kĩ thuật lấy các yêu cầu theo sự hướng dẫn. (F/A)', NULL, NULL, 1, NULL, 1, 's1.5'),
(5, '1s2.1.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Hỗ trợ các nhà thiết kế phần mềm bằng những công cụ và kỹ thuật để thu thập thông tin về việc ứng dụng và sử dụng các nguyên tắc cơ bản trong thiết kế phần mềm. (F/A)', NULL, NULL, 1, NULL, 1, 's2.1'),
(6, '1s2.2.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Cung cấp hỗ trợ cài đặt và sử dụng các công cụ thích hợp cho chiến lược và phương pháp luận thiết kế được chỉ định của dự án (ví dụ như cách tiếp cận hướng đối tượng gia tăng). (F/A)', NULL, NULL, 1, NULL, 1, 's2.2'),
(7, '1s2.3.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Cung cấp hướng dẫn cài đặt và sử dụng các công cụ liên quan đến kiến trúc phần mềm. (F/A)', NULL, NULL, 1, NULL, 1, 's2.3'),
(8, '1s2.4.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Hỗ trợ các nhà thiết kế phần mềm bằng nhiều công cụ và kỹ thuật trong việc thu thập chỉ số thiết kế và đánh giá chất lượng phần mềm. (F/A)', NULL, NULL, 1, NULL, 1, 's2.4'),
(9, '1s3.1.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ cài đặt các công cụ và kho lưu trữ để kiểm soát phiên bản và quản lý cấu hình. (A)', NULL, NULL, 1, NULL, 1, 's3.1'),
(10, '1s3.3.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ cài đặt các công cụ và kho lưu trữ để thiết kế và viết mã nguồn. (A)', NULL, NULL, 1, NULL, 1, 's3.3'),
(11, '1s3.4.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ cài đặt các công cụ để gỡ lỗi và kiểm thử. (A)', NULL, NULL, 1, NULL, 1, 's3.4'),
(12, '1s3.5.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ cài đặt các công cụ tích hợp. (A)', NULL, NULL, 1, NULL, 1, 's3.5'),
(13, '1s3.5.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ tạo các gói kiểm tra mã nguồn. (A)', NULL, NULL, 1, NULL, 1, 's3.5'),
(14, '1s3.5.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ lập thời gian kiểm tra mã nguồn. (A)', NULL, NULL, 1, NULL, 1, 's3.5'),
(15, '1s3.5.4', NULL, 'P - Tham gia', '4. Thiết lập môi trường xây dựng và cài đặt nơi các gói phần mềm có thể được tích hợp. (P)', NULL, NULL, 1, NULL, 1, 's3.5'),
(16, '1s4.2.1', NULL, 'P - Tham gia', '1. Chuẩn bị môi trường kiểm tra và thử nghiệm cần thiết. (P)', NULL, NULL, 1, NULL, 1, 's4.2'),
(17, '1s4.2.2', NULL, 'P - Tham gia', '2. Cài đặt các công cụ cần thiết. (P)', NULL, NULL, 1, NULL, 1, 's4.2'),
(18, '1s4.2.3', NULL, 'P - Tham gia', '3. Phát triển cơ sở hạ tầng thích hợp cho kho dữ liệu. (P)', NULL, NULL, 1, NULL, 1, 's4.2'),
(19, '1s4.3.1', NULL, 'P - Tham gia', '1. Thực hiện các hoạt động kiểm tra thủ công (ví dụ như nhập dữ liệu, thực thi các trường hợp kiểm thử,...) (P)', NULL, NULL, 1, NULL, 1, 's4.3'),
(20, '1s4.3.2', NULL, 'P - Tham gia', '2. Thực thi kiểm thử hồi quy. (P)', NULL, NULL, 1, NULL, 1, 's4.3'),
(21, '1s4.3.3', NULL, 'A - Hỗ trợ', '3. Giám sát khách hàng sử dụng và ghi nhận phản hồi trong suốt quá trình thử nghiệm để cải tiến sản phẩm. (A)', NULL, NULL, 1, NULL, 1, 's4.3'),
(22, '1s4.4.1', NULL, 'P - Tham gia', '1. Thực hiện các công việc cần làm cho tất cả các kho dữ liệu phù hợp (thu thập dữ liệu được thực thi, nhập dữ liệu, lưu trữ dữ liệu,...). (P)', NULL, NULL, 1, NULL, 1, 's4.4'),
(23, '1s4.4.2', NULL, 'P - Tham gia', '2. Tạo các báo cáo thích hợp liên quan đến việc thực thi kiểm tra/thử nghiệm. (P)', NULL, NULL, 1, NULL, 1, 's4.4'),
(24, '1s4.4.3', NULL, 'P - Tham gia', '3. Thu thập dữ liệu thích hợp liên quan đến việc thực thi các trường hợp kiểm thử. (P)', NULL, NULL, 1, NULL, 1, 's4.4'),
(25, '1s4.4.4', NULL, 'P - Tham gia', '4. Cung cấp báo cáo kết quả kiểm thử cho các bên liên quan thích hợp. (P)', NULL, NULL, 1, NULL, 1, 's4.4'),
(26, '1s5.1.1', NULL, 'F - Tuân thủ', '1. Tuân theo các hướng dẫn để giúp đỡ xây dựng tài liệu về cách chuyển đổi và vận hành của phần mềm. (F)', NULL, NULL, 1, NULL, 1, 's5.1'),
(27, '1s5.1.2', NULL, 'F - Tuân thủ', '2. Tuân theo các hướng dẫn để giúp đỡ cài đặt phần mềm. (F)', NULL, NULL, 1, NULL, 1, 's5.1'),
(28, '1s5.1.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ đào tạo cho nhân viên hỗ trợ vận hành. (A)', NULL, NULL, 1, NULL, 1, 's5.1'),
(29, '1s5.2.1', NULL, 'A - Hỗ trợ', '1. Điều hành các công cụ quản lý cấu hình vận hành phần mềm. (A)', NULL, NULL, 1, NULL, 1, 's5.2'),
(30, '1s5.2.2', NULL, 'F - Tuân thủ', '2. Tuân theo các hướng dẫn để thực hiện các nhiệm vụ đảm bảo phần mềm được vận hành. (F)', NULL, NULL, 1, NULL, 1, 's5.2'),
(31, '1s5.2.3', NULL, 'P - Tham gia', '3. Cài đặt các bản cập nhật của phần mềm thương mại có sẵn trên thị trường (COTS) và phần mềm khác. (P)', NULL, NULL, 1, NULL, 1, 's5.2'),
(32, '1s5.2.4', NULL, 'P - Tham gia', '4. Chẩn đoán và phản hồi các lỗi phần mềm, các bất thường, các sự cố và các sự kiện vận hành được báo cáo. (P)', NULL, NULL, 1, NULL, 1, 's5.2'),
(33, '1s5.2.5', NULL, 'F - Tuân thủ', '5. Điều hành các công cụ để thu thập dữ liệu vận hành dưới sự giám sát. (F)', NULL, NULL, 1, NULL, 1, 's5.2'),
(34, '1s5.3.1', NULL, 'P - Tham gia', '1. Tham gia lấy các sản phẩm phụ đi kèm trong việc phát triển phần mềm được sử dụng làm đường cơ sở. (P)', NULL, NULL, 1, NULL, 1, 's5.3'),
(35, '1s5.3.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ thực hiện các hoạt động bảo trì định kỳ và tái thiết kế phần mềm. (A)', NULL, NULL, 1, NULL, 1, 's5.3'),
(36, '1s6.1.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Cung cấp hỗ trợ cài đặt và sử dụng các công cụ sao cho phù hợp với mô hình vòng đời được chỉ định cho dự án. (F/A)', NULL, NULL, 1, NULL, 1, 's6.1'),
(37, '1s6.2.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Cung cấp hỗ trợ cài đặt và sử dụng các công cụ để xác định và sửa đổi các quy trình phần mềm. (F/A)', NULL, NULL, 1, NULL, 1, 's6.2'),
(38, '1s6.3.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Cung cấp hỗ trợ cài đặt và sử dụng các công cụ để triển khai, quản lý và đo lường các quy trình phần mềm. (F/A)', NULL, NULL, 1, NULL, 1, 's6.3'),
(39, '1s6.4.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Cung cấp hỗ trợ cài đặt và sử dụng các công cụ để truy cấp và cải tiến các quy trình phần mềm. (F/A)', NULL, NULL, 1, NULL, 1, 's6.4'),
(40, '1s7.1.1', NULL, 'F - Tuân thủ', '1. Sử dụng các công cụ và tuân theo các hướng dẫn trong các mô tả, tài liệu được chuẩn bị về các mô hình phát triển phù hợp. (F)', NULL, NULL, 1, NULL, 1, 's7.1'),
(41, '1s7.2.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ xác định các bên liên quan. (A)', NULL, NULL, 1, NULL, 1, 's7.2'),
(42, '1s7.2.2', NULL, 'A - Hỗ trợ', '2. Sắp xếp các cuộc họp với bên liên quan. (A)', NULL, NULL, 1, NULL, 1, 's7.2'),
(43, '1s7.2.3', NULL, 'A - Hỗ trợ', '3. Tham dự các cuộc họp với bên liên quan và lập biên bản cho mỗi cuộc họp. (A)', NULL, NULL, 1, NULL, 1, 's7.2'),
(44, '1s7.2.4', NULL, 'F - Tuân thủ', '4. Thực hiện theo các hướng dẫn để chuẩn bị các yếu tố liên quan đến khái niệm về các hoạt động (Concept of Operations). (F)', NULL, NULL, 1, NULL, 1, 's7.2'),
(45, '1s7.3.1', NULL, 'P - Tham gia', '1. Tham gia các cuộc họp và lập tài liệu viết về môi trường phát triển hệ thống cùng các ràng buộc về công nghệ. (P)', NULL, NULL, 1, NULL, 1, 's7.3'),
(46, '1s7.3.2', NULL, 'P - Tham gia', '2. Tìm mua và vận hành các công cụ truy xuất nguồn gốc để thiết lập và duy trì khả năng truy xuất nguồn gốc. (P)', NULL, NULL, 1, NULL, 1, 's7.3'),
(47, '1s7.3.3', NULL, 'F - Tuân thủ', '3. Tuân theo các hướng dẫn để ghi lại đặc tả yêu cầu hệ thống. (F)', NULL, NULL, 1, NULL, 1, 's7.3'),
(48, '1s7.3.4', NULL, 'A - Hỗ trợ', '4. Lập tài liệu bao gồm các kế hoạch, các thủ tục, các kịch bản để tích hợp, xác minh, xác thực và triển khai hệ thống. (A)', NULL, NULL, 1, NULL, 1, 's7.3'),
(49, '1s7.4.1', NULL, 'A - Hỗ trợ', '1. Xác định nguồn gốc để mua các thành phần cần thiết. (A)', NULL, NULL, 1, NULL, 1, 's7.4'),
(50, '1s7.5.1', NULL, 'F - Tuân thủ', '1. Lập tài liệu gồm các yêu cầu phân bổ và không phân bổ. (F)', NULL, NULL, 1, NULL, 1, 's7.5'),
(51, '1s7.5.2', NULL, 'F - Tuân thủ', '2. Lập tài liệu phân bổ các yêu cầu (chức năng, hành vi, cấu trúc, chất lượng) và kết nối các thành phần phần mềm với các thành phần chính khác của hệ thống bằng một giao diện. (F)', NULL, NULL, 1, NULL, 1, 's7.5'),
(52, '1s7.5.3', NULL, 'F - Tuân thủ', '3. Vận hành các công cụ và tạo các báo cáo truy xuất nguồn gốc. (F)', NULL, NULL, 1, NULL, 1, 's7.5'),
(53, '1s7.5.4', NULL, 'A - Hỗ trợ', '4. Hỗ trợ làm rõ và tinh chỉnh các yêu cầu được phân bổ cho phần mềm. (A)', NULL, NULL, 1, NULL, 1, 's7.5'),
(54, '1s7.6.1', NULL, 'A - Hỗ trợ', '1. Lập tài liệu cho việc đưa ra quyết định mua/xây dựng các thành phần phần mềm. (A)', NULL, NULL, 1, NULL, 1, 's7.6'),
(55, '1s7.6.2', NULL, 'A - Hỗ trợ', '2. Duy trì các cơ sở của các thành phần phần mềm. (A)', NULL, NULL, 1, NULL, 1, 's7.6'),
(56, '1s7.7.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ tích hợp phần mềm với các thành phần khác của hệ thống. (A)', NULL, NULL, 1, NULL, 1, 's7.7'),
(57, '1s7.8.1', NULL, 'F - Tuân thủ', '1. Vận hành các công cụ để thực hiện kiểm thử hệ thống theo cách mô phỏng trực tiếp. (F)', NULL, NULL, 1, NULL, 1, 's7.8'),
(58, '1s7.8.2', NULL, 'F - Tuân thủ', '2. Vận hành các công cụ để thực hiện việc kiểm thử nghiệm thu/chấp nhận hệ thống. (F)', NULL, NULL, 1, NULL, 1, 's7.8'),
(59, '1s8.1.1', NULL, 'P - Tham gia', '1. Tuân theo các quy trình và các tiêu chuẩn chất lượng đã xác định. (P)', NULL, NULL, 1, NULL, 1, 's8.1'),
(60, '1s8.1.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ thiết lập cơ sở hạ tầng thích hợp (ví dụ như các công cụ lưu vết lỗi) để hỗ trợ cho nhiều mục tiêu về chất lượng của các tổ chức. (A)', NULL, NULL, 1, NULL, 1, 's8.1'),
(61, '1s8.2.1', NULL, 'P - Tham gia', '1. Hỗ trợ hậu cần cần thiết liên quan đến việc đánh giá và kiểm tra, không giới hạn ở những mục sau:\na. Các cuộc họp hậu cần (P)\nb. Thực hiện tất cả các kho dữ liệu thích hợp (P)\nc. Tạo các báo cáo thích hợp có liên quan đến cuộc họp (P)', NULL, NULL, 1, NULL, 1, 's8.2'),
(62, '1s8.3.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Thiết lập môi trường cần thiết để tiến hành kiểm tra độc lập. (A/P)', NULL, NULL, 1, NULL, 1, 's8.3'),
(63, '1s8.4.1', NULL, 'P - Tham gia', '1. Thiết lập môi trường cần thiết để thu thập và lưu trữ dữ liệu. (P)', NULL, NULL, 1, NULL, 1, 's8.4'),
(64, '1s9.4.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ thu thập các số liệu cho các quy trình đánh giá bảo mật. (A)', NULL, NULL, 1, NULL, 1, 's9.4'),
(65, '1s9.5.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ cài đặt các công cụ phân tích mã nguồn tĩnh. (A)', NULL, NULL, 1, NULL, 1, 's9.5'),
(66, '1s10.1.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Hỗ trợ thu thập dữ liệu để tạo ra danh sách nguy cơ trong việc bảo mật. (F/A)', NULL, NULL, 1, NULL, 1, 's10.1'),
(67, '1s10.1.2', NULL, 'F/A - Tuân thủ/Hỗ trợ', '2. Hỗ trợ xác định các nguy cơ cấp cao và nguyên nhân dẫn đến những nguy cơ đó. (F/A)', NULL, NULL, 1, NULL, 1, 's10.1'),
(68, '1s10.1.3', NULL, 'F/A - Tuân thủ/Hỗ trợ', '3. Hỗ trợ cài đặt các công cụ an toàn và đáng tin cậy. (F/A)', NULL, NULL, 1, NULL, 1, 's10.1'),
(69, '1s10.2.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Hỗ trợ xác định các kỹ thuật giảm thiểu để xác định các yêu cầu an toàn. (F/A)', NULL, NULL, 1, NULL, 1, 's10.2'),
(70, '1s10.4.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Hỗ trợ cài đặt các công cụ và cơ sở hạ tầng để kiểm thử các yêu cầu an toàn. (F/A)', NULL, NULL, 1, NULL, 1, 's10.4'),
(71, '1s10.5.1', NULL, 'F/A - Tuân thủ/Hỗ trợ', '1. Hỗ trợ thu thập dữ liệu để thiết lập trường hợp an toàn cho dự án. (F/A)', NULL, NULL, 1, NULL, 1, 's10.5'),
(72, '1s10.6.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ thu thập dữ liệu quản lý chất lượng an toàn. (A)', NULL, NULL, 1, NULL, 1, 's10.6'),
(73, '1s11.1.1', NULL, 'F - Tuân thủ', '1. Vận hành các công cụ quản lý cấu hình phần mềm. (F)', NULL, NULL, 1, NULL, 1, 's11.1'),
(74, '1s11.1.2', NULL, 'F - Tuân thủ', '2. Vận hành và duy trì thư viện quản lý cấu hình phần mềm dưới sự giám sát lãnh đạo của bên kỹ thuật. (F)', NULL, NULL, 1, NULL, 1, 's11.1'),
(75, '1s11.2.1', NULL, 'F - Tuân thủ', '1. Vận hành các công cụ để tạo trạng thái của quản lý cấu hình phần mềm và tạo các báo cáo kiểm tra độc lập. (F)', NULL, NULL, 1, NULL, 1, 's11.2'),
(76, '1s11.2.2', NULL, 'F/A - Tuân thủ/Hỗ trợ', '2. Tạo, phân loại và quản lý các báo cáo về sự cố. (F/A)', NULL, NULL, 1, NULL, 1, 's11.2'),
(77, '1s11.3.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Vận hành các công cụ để xây dựng các bản phát hành phần mềm. (A/P)', NULL, NULL, 1, NULL, 1, 's11.3'),
(78, '1s11.3.2', NULL, 'A - Hỗ trợ', '2. Sử dụng các công cụ phát hành phần mềm để tạo ra các bản phát hành phần mềm. (A)', NULL, NULL, 1, NULL, 1, 's11.3'),
(79, '1s12.1.1', NULL, 'A - Hỗ trợ', '1. Mua và cài đặt các công cụ đo lường. (A)', NULL, NULL, 1, NULL, 1, 's12.1'),
(80, '1s12.2.1', NULL, 'P - Tham gia', '1. Sử dụng các công cụ đo lường để thu thập dữ liệu. (P)', NULL, NULL, 1, NULL, 1, 's12.2'),
(81, '1s12.2.2', NULL, 'P - Tham gia', '2. Duy trì dữ liệu hợp lệ trong kho lưu trữ. (P)', NULL, NULL, 1, NULL, 1, 's12.2'),
(82, '1s12.2.3', NULL, 'P - Tham gia', '3. Tạo và phân phối các báo cáo. (P)', NULL, NULL, 1, NULL, 1, 's12.2'),
(83, '1s13.1.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ xác định các đối tượng người dùng. (A)', NULL, NULL, 1, NULL, 1, 's13.1'),
(84, '1s13.1.2', NULL, 'F - Tuân thủ', '2. Thực hiện theo các hướng dẫn để tạo ra các nguyên mẫu đơn giản nhằm sử dụng trong việc làm rõ các yêu cầu về giao diện người dùng. (F)', NULL, NULL, 1, NULL, 1, 's13.1'),
(85, '1s13.2.1', NULL, 'F - Tuân thủ', '1. Thực hiện theo hướng dẫn để hỗ trợ ghi lại các trường hợp sử dụng, các kịch bản, các hộp thoại tương tác và các bảng phân cảnh. (F)', NULL, NULL, 1, NULL, 1, 's13.2'),
(86, '1s13.2.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ xác định các lỗi đầu vào bên phía người dùng. (A)', NULL, NULL, 1, NULL, 1, 's13.2'),
(87, '1s13.2.3', NULL, 'P - Tham gia', '3. Lập tài liệu ghi chú truy xuất nguồn gốc hai chiều đối với các yêu cầu, các trường hợp và các kịch bản thử nghiệm. (P)', NULL, NULL, 1, NULL, 1, 's13.2'),
(88, '1s13.2.4', NULL, 'P - Tham gia', '4. Thực hiện theo hướng dẫn để phát triển hoặc tinh chỉnh các nguyên mẫu giao diện. (F)', NULL, NULL, 1, NULL, 1, 's13.2'),
(89, '1s13.3.1', NULL, 'F - Tuân thủ', '1. Tuân theo các hướng dẫn để hỗ trợ tạo các mô hình và các bản phác thảo. (F)', NULL, NULL, 1, NULL, 1, 's13.3'),
(90, '1s13.4.1', NULL, 'A - Hỗ trợ', '1. Viết các bài kiểm tra người dùng để đánh giá hành vi của người dùng. (A)', NULL, NULL, 1, NULL, 1, 's13.4'),
(91, '1s13.4.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ tiến hành các bài kiểm tra khả năng sử dụng và thu thập dữ liệu. (A)', NULL, NULL, 1, NULL, 1, 's13.4'),
(92, '1s13.4.3', NULL, 'F - Tuân thủ', '3. Tuân theo các hướng dẫn để hỗ trợ phân tích các kết quả kiểm tra khả năng sử dụng. (F)', NULL, NULL, 1, NULL, 1, 's13.4'),
(93, '2s1.1.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ tương tác với các bên liên quan khác nhau để xác định nhu cầu và yêu cầu. (A)', NULL, NULL, 1, NULL, 2, 's1.1'),
(94, '2s1.1.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ ứng dụng các phương pháp khác nhau cho dự án một cách thích hợp để làm rõ các yêu cầu. (A)', NULL, NULL, 1, NULL, 2, 's1.1'),
(95, '2s1.2.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ phân tích miền. (A)\nPhân tích miền là một quy trình kỹ sư phần mềm tìm hiểu thông tin cơ bản. Kĩ sư phần mềm phải tìm hiểu thông tin đầy đủ để có thể hiểu vấn đề và đưa ra quyết định đúng đắn trong quá trình phân tích yêu cầu và các giai đoạn khác của quy trình kỹ thuật phần mềm', NULL, NULL, 1, NULL, 2, 's1.2'),
(96, '2s1.3.1', NULL, 'P - Tham gia', '1. Chuẩn bị tài liệu yêu cầu mô tả giao diện, yêu cầu chức năng và yêu cầu phi chức năng. (P)', NULL, NULL, 1, NULL, 2, 's1.3'),
(97, '2s1.4.1', NULL, 'P - Tham gia', '1. Đánh giá các đặc tả yêu cầu để đưa ra các lỗi và thiếu sót. (P)', NULL, NULL, 1, NULL, 2, 's1.4'),
(98, '2s1.5.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ áp dụng các quy trình đã xác định vào kỹ thuật lấy các yêu cầu. (A)', NULL, NULL, 1, NULL, 2, 's1.5'),
(99, '2s2.1.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ ứng dụng các kỹ thuật hỗ trợ trong việc thiết kế các thành phần và mô-đun phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's2.1'),
(100, '2s2.1.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ ứng dụng các kỹ thuật thiết kế trong các lĩnh vực cùng một lúc, cũng như trong xử lý các sự kiện, ổn định dữ liệu hoặc phân phối phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's2.1'),
(101, '2s2.1.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ ứng dụng các kỹ thuật xử lý ngoại lệ và khả năng chịu lỗi trong việc thiết kế các thành phần và mô-đun phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's2.1'),
(102, '2s2.1.4', NULL, 'A - Hỗ trợ', '4. Hỗ trợ sử dụng các phương pháp tái cấu trúc và cải tiến mã nguồn trong thiết kế các thành phần và mô-đun phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's2.1'),
(103, '2s2.2.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Hỗ trợ ứng dụng chiến lược và phương pháp luận được chỉ định trong thiết kế phần mềm để tạo ra một thiết kế phần mềm (ví dụ như cách tiếp cận hướng đối tượng gia tăng). (A/P)', NULL, NULL, 1, NULL, 2, 's2.2'),
(104, '2s2.3.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ các nhiệm vụ thiết kế kiến trúc liên quan đến việc sử dụng những ký hiệu/ghi chú dạng chuẩn, các kỹ thuật lập sơ đồ, các mô hình và các mẫu. (A)', NULL, NULL, 1, NULL, 2, 's2.3'),
(105, '2s2.3.2', NULL, 'A/P - Hỗ trợ/Tham gia', '2. Áp dụng mẫu thiết kế phần mềm đã chọn để thiết kế thành phần và mô-đun phần mềm. (A/P)', NULL, NULL, 1, NULL, 2, 's2.3'),
(106, '2s2.4.1', NULL, 'P - Tham gia', '1. Tham gia các buổi đánh giá thiết kế phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's2.4'),
(107, '2s2.4.2', NULL, 'P - Tham gia', '2. Tiến hành các nhiệm vụ phân tích mã nguồn tĩnh để đánh giá chất lượng thiết kế. (P)', NULL, NULL, 1, NULL, 2, 's2.4'),
(108, '2s2.4.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ phát triển, sử dụng bản mô phỏng và các nguyên mẫu để đánh giá chất lượng thiết kế phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's2.4'),
(109, '2s3.2.1', NULL, 'P - Tham gia', '1. Sử dụng các công cụ và quy trình theo tiêu chuẩn để kiểm soát phiên bản và quản lý cấu hình. (P)', NULL, NULL, 1, NULL, 2, 's3.2'),
(110, '2s3.2.2', NULL, 'P - Tham gia', '2. Thu thập các thước đo tiêu chuẩn về chất lượng và kích thước mã. (P)', NULL, NULL, 1, NULL, 2, 's3.2'),
(111, '2s3.3.1', NULL, 'P - Tham gia', '1. Tạo mã nguồn để thực hiện các thiết kế chi tiết. (P)', NULL, NULL, 1, NULL, 2, 's3.3'),
(112, '2s3.3.2', NULL, 'P - Tham gia', '2. Cải tiến mã nguồn khi cần thiết. (P)', NULL, NULL, 1, NULL, 2, 's3.3'),
(113, '2s3.3.3', NULL, 'F - Tuân thủ', '3. Tuân theo các tiêu chuẩn của dự án và tổ chức trong thiết kế và viết mã nguồn. (F)', NULL, NULL, 1, NULL, 2, 's3.3'),
(114, '2s3.3.4', NULL, 'P - Tham gia', '4. Sử dụng các mẫu thiết kế thích hợp. (P)', NULL, NULL, 1, NULL, 2, 's3.3'),
(115, '2s3.3.5', NULL, 'P - Tham gia', '5. Sử dụng các kỹ thuật mã hóa phòng thủ để giảm thiểu sự lan truyền của các lỗi và các mối đe dọa. (P)', NULL, NULL, 1, NULL, 2, 's3.3'),
(116, '2s3.3.6', NULL, 'P - Tham gia', '6. Ghi lại mã nguồn thông qua các nhận xét để hỗ trợ bảo trì phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's3.3'),
(117, '2s3.3.7', NULL, 'P - Tham gia', '7. Tạo mã nguồn và các hệ thống thích hợp từ những mô hình (ví như UML). (P)', NULL, NULL, 1, NULL, 2, 's3.3'),
(118, '2s3.4.1', NULL, 'P - Tham gia', '1. Sử dụng các công cụ và kỹ thuật thích hợp để gỡ lỗi. (P)', NULL, NULL, 1, NULL, 2, 's3.4'),
(119, '2s3.4.2', NULL, 'P - Tham gia', '2. Tạo và thực thi các bài kiểm thử đơn vị cho tất cả mã nguồn được phân phối. (P)', NULL, NULL, 1, NULL, 2, 's3.4'),
(120, '2s3.4.3', NULL, 'P - Tham gia', '3. Đạt được các mục tiêu về phạm vi kiểm tra theo các tiêu chuẩn của dự án và tổ chức. (P)', NULL, NULL, 1, NULL, 2, 's3.4'),
(121, '2s3.5.1', NULL, 'P - Tham gia', '1. Tuân theo chiến lược và các quy trình tích hợp với dự án. (P)', NULL, NULL, 1, NULL, 2, 's3.5'),
(122, '2s3.5.2', NULL, 'P - Tham gia', '2. Thực hiện kiểm thử tích hợp như một phần của quy trình tích hợp. (P)', NULL, NULL, 1, NULL, 2, 's3.5'),
(123, '2s3.5.3', NULL, 'P - Tham gia', '3. Hợp tác cùng các thành viên trong nhóm khác trong việc phát triển các hoạt động (ví dụ như lập trình cặp, các buổi đánh giá không chính thức). (P)', NULL, NULL, 1, NULL, 2, 's3.5'),
(124, '2s3.5.4', NULL, 'P - Tham gia', '4. Tham gia các buổi đánh giá và kiểm tra các dự án đã được xác định.', NULL, NULL, 1, NULL, 2, 's3.5'),
(125, '2s4.1.1', NULL, 'P - Tham gia', '1. Xác định các tiêu chí thành công và thất bại của kiểm thử đơn vị cùng kiểm thử tích hợp. (P)', NULL, NULL, 1, NULL, 2, 's4.1'),
(126, '2s4.1.2', NULL, 'P - Tham gia', '2. Tuân theo kế hoạch kiểm thử phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's4.1'),
(127, '2s4.1.3', NULL, 'P - Tham gia', '3. Thiết lập các tiêu chí để hoàn thành việc thực thi kiểm thử đơn vị (ví dụ như phạm vi của mã nguồn, cường độ hư hỏng,...) (P)', NULL, NULL, 1, NULL, 2, 's4.1'),
(128, '2s4.1.4', NULL, 'P - Tham gia', '4. Phát triển kế hoạch kiểm thử đơn vị. (P)', NULL, NULL, 1, NULL, 2, 's4.1'),
(129, '2s4.1.5', NULL, 'A - Hỗ trợ', '5. Hỗ trợ phát triển kế hoạch kiểm thử.', NULL, NULL, 1, NULL, 2, 's4.1'),
(130, '2s4.2.1', NULL, 'P - Tham gia', '1. Lựa chọn các kỹ thuật phù hợp với kiểm thử đơn vị. (P)', NULL, NULL, 1, NULL, 2, 's4.2'),
(131, '2s4.2.2', NULL, 'P - Tham gia', '2. Lựa chọn các công cụ kiểm thử phù hợp nhất. (P)', NULL, NULL, 1, NULL, 2, 's4.2'),
(132, '2s4.2.3', NULL, 'P - Tham gia', '3. Thiết kế và thực hiện môi trường kiểm thử. (P)', NULL, NULL, 1, NULL, 2, 's4.2'),
(133, '2s4.3.1', NULL, 'P - Tham gia', '1. Thiết kế và thực thi các trường hợp kiểm thử đơn vị. (P)', NULL, NULL, 1, NULL, 2, 's4.3'),
(134, '2s4.3.2', NULL, 'P - Tham gia', '2. Hỗ trợ phát triển các trường hợp kiểm thử. (P)', NULL, NULL, 1, NULL, 2, 's4.3'),
(135, '2s4.3.3', NULL, 'P - Tham gia', '3. Thực thi các trường hợp kiểm thử tích hợp và kiểm thử hệ thống. (P)', NULL, NULL, 1, NULL, 2, 's4.3'),
(136, '2s4.3.4', NULL, 'P/L - Tham gia/Dẫn dắt', '4. Đảm bảo hệ thống được sẵn sàng để kiểm thử bằng cách thực hiện các kiểm thử nghiệm thu/chấp nhận. (P/L)', NULL, NULL, 1, NULL, 2, 's4.3'),
(137, '2s4.4.1', NULL, 'P - Tham gia', '1. Thu thập dữ liệu thích hợp liên quan đên thực thi kiểm thử. (P)', NULL, NULL, 1, NULL, 2, 's4.4'),
(138, '2s4.4.2', NULL, 'P - Tham gia', '2. Đánh giá các kết quả thực thi kiểm thử và xác định công việc làm lại phù hợp. (P)', NULL, NULL, 1, NULL, 2, 's4.4'),
(139, '2s4.4.3', NULL, 'A/P - Hỗ trợ/Tham gia', '3. Giám sát tiến độ kiểm thử bằng cách đánh giá tỉ lệ xuất hiện lỗi, cường độ lỗi,... (A/P)', NULL, NULL, 1, NULL, 2, 's4.4'),
(140, '2s5.1.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ xác định các hệ thống có thể áp dụng và các tiêu chuẩn vận hành phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's5.1'),
(141, '2s5.1.2', NULL, 'A - Hỗ trợ\nP - Tham gia', '2. Hỗ trợ phát triển chuyển đổi phần mềm và tài liệu vận hành. (A)\nCài đặt phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's5.1'),
(142, '2s5.1.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ phát triển tài nguyên đào tạo cho nhân viên hỗ trợ vận hành. (A)', NULL, NULL, 1, NULL, 2, 's5.1'),
(143, '2s5.1.4', NULL, 'P - Tham gia', '4. Đào tạo nhân viên hỗ trợ vận hành phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's5.1'),
(144, '2s5.1.5', NULL, 'P - Tham gia', '5. Thực hiện các thủ tục kích hoạt và kiểm tra hệ thống phần mềm lần cuối. (P)', NULL, NULL, 1, NULL, 2, 's5.1'),
(145, '2s5.1.6', NULL, 'A - Hỗ trợ', '6. Hỗ trợ xác định các tác động của thay đổi phần mềm đến môi trường vận hành. (A)', NULL, NULL, 1, NULL, 2, 's5.1'),
(146, '2s5.1.7', NULL, 'A - Hỗ trợ', '7. Hỗ trợ chấp nhận hệ thống. (A)', NULL, NULL, 1, NULL, 2, 's5.1'),
(147, '2s5.2.1', NULL, 'P - Tham gia', '1. Thực hiện quản lý cấu hình của phần mềm vận hành. (P)', NULL, NULL, 1, NULL, 2, 's5.2'),
(148, '2s5.2.2', NULL, 'P - Tham gia', '2. Thực hiện đảm bảo phần mềm vận hành. (P)', NULL, NULL, 1, NULL, 2, 's5.2'),
(149, '2s5.2.3', NULL, 'P - Tham gia', '3. Cập nhật các công nghệ phần mềm thương mại có sẵn trên thị trường (COTS) và các công nghệ phần mềm khác để tạo quỹ giúp duy trì. (P)', NULL, NULL, 1, NULL, 2, 's5.2'),
(150, '2s5.2.4', NULL, 'L - Dẫn dắt', '4. Dẫn dắt các hoạt động hỗ trợ phần mềm. (L)', NULL, NULL, 1, NULL, 2, 's5.2'),
(151, '2s5.2.5', NULL, 'P - Tham gia', '5. Phân tích dữ liệu vận hành. (P)', NULL, NULL, 1, NULL, 2, 's5.2'),
(152, '2s5.2.6', NULL, 'A - Hỗ trợ', '6. Hỗ trợ triển khai các thủ tục hủy bỏ sự tồn tại của phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's5.2'),
(153, '2s5.3.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ triển khai các quy trình và kế hoạch bảo trì phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's5.3'),
(154, '2s5.3.2', NULL, 'P - Tham gia', '2. Lấy và bảo trì các sản phẩm phụ đi kèm trong việc phát triển phần mềm được sử dụng làm đường cơ sở. (P)', NULL, NULL, 1, NULL, 2, 's5.3'),
(155, '2s5.3.3', NULL, 'P - Tham gia', '3. Thực hiện xác định vấn đề. (P)', NULL, NULL, 1, NULL, 2, 's5.3'),
(156, '2s5.3.4', NULL, 'A - Hỗ trợ', '4. Hỗ trợ thực hiện các thay đổi đối với phần mềm (sửa chữa, thích ứng và hoàn thiện). (A)', NULL, NULL, 1, NULL, 2, 's5.3'),
(157, '2s5.3.5', NULL, 'P - Tham gia', '5. Thực hiện các hoạt động bảo trì định kỳ và tái thiết kế phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's5.3'),
(158, '2s5.3.6', NULL, 'A - Hỗ trợ', '6. Hỗ trợ giám sát và phân tích các hoạt động bảo trì phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's5.3'),
(159, '2s6.1.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Thực hiện các hoạt động quy trình được chỉ định theo kịch bản của mô hình quy trình vòng đời. (A/P)', NULL, NULL, 1, NULL, 2, 's6.1'),
(160, '2s6.2.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Diễn giải và điều chỉnh một quy trình phần mềm sao cho phù hợp với những trách nhiệm và nhiệm vụ của quy trình riêng lẻ. (A/P)', NULL, NULL, 1, NULL, 2, 's6.2'),
(161, '2s6.3.1', NULL, 'P - Tham gia', '1. Cộng tác trong việc thực thi quy trình phần mềm của nhóm. (P)', NULL, NULL, 1, NULL, 2, 's6.3'),
(162, '2s6.3.2', NULL, 'F/A - Tuân thủ/Hỗ trợ', '2. Thực hiện và quản lý các quy trình riêng lẻ. (F/A)', NULL, NULL, 1, NULL, 2, 's6.3'),
(163, '2s6.4.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ thu thập dữ liệu để đánh giá quy trình phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's6.4'),
(164, '2s6.4.2', NULL, 'F/A - Tuân thủ/Hỗ trợ', '2. Thu thập dữ liệu liên quan đến việc thực thi quy trình riêng lẻ. (F/A)', NULL, NULL, 1, NULL, 2, 's6.4'),
(165, '2s6.4.3', NULL, 'A/P - Hỗ trợ/Tham gia', '3. Đánh giá và thực hiện cải tiến quy trình phần mềm riêng lẻ. (A/P)', NULL, NULL, 1, NULL, 2, 's6.4'),
(166, '2s7.1.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ tích hợp mô hình phát triển phần mềm đã chọn vào mô hình phát triển các hệ thống. (A)', NULL, NULL, 1, NULL, 2, 's7.1'),
(167, '2s7.1.2', NULL, 'A - Hỗ trợ', '2. Tham gia các cuộc họp kỹ thuật hệ thống và chuẩn bị các biên bản cuộc họp bao gồm các quyết định đã đưa ra, các cuộc họp mở, các cuộc thảo luận có liên quan khác, và các mục hành động. (A) ', NULL, NULL, 1, NULL, 2, 's7.1'),
(168, '2s7.2.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Xác định tiềm năng của các bên liên quan bằng cách kiểm tra dữ liệu lịch sử và thảo luận với nhân viên thích hợp ở trong và ngoài nhóm kỹ thuật hệ thống. (A/P)', NULL, NULL, 1, NULL, 2, 's7.2'),
(169, '2s7.2.2', NULL, 'P - Tham gia', '2. Tham dự các cuộc họp với các bên liên quan để ghi lại những nhu cầu, mong muốn và khát vọng của họ. (P)', NULL, NULL, 1, NULL, 2, 's7.2'),
(170, '2s7.2.3', NULL, 'A - Hỗ trợ', '3. Phát triển các yếu tố liên quan đến khái niệm về các hoạt động. (A)', NULL, NULL, 1, NULL, 2, 's7.2'),
(171, '2s7.3.1', NULL, 'A - Hỗ trợ', '1. Cung cấp đào tạo về các thủ tục và các công cụ truy xuất nguồn gốc. (A)', NULL, NULL, 1, NULL, 2, 's7.3'),
(172, '2s7.3.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ phát triển đặc tả yêu cầu hệ thống. (A)', NULL, NULL, 1, NULL, 2, 's7.3'),
(173, '2s7.3.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ phát triển các kế hoạch, các thủ tục, các kịch bản để tích hợp, xác minh, xác thực và triển khai hệ thống. (A)', NULL, NULL, 1, NULL, 2, 's7.3'),
(174, '2s7.4.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ phát triển các khái niệm giải pháp thay thế và tiến hành thực hiện các nghiên cứu thương mại để xác định các thành phần chính của hệ thống. (A)', NULL, NULL, 1, NULL, 2, 's7.4'),
(175, '2s7.4.2', NULL, 'P - Tham gia', '2. Tham gia vào việc đưa ra quyết định mua hoặc xây dựng các thành phần phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's7.4'),
(176, '2s7.4.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ lựa chọn các thành phần cần mua. (A)', NULL, NULL, 1, NULL, 2, 's7.4'),
(177, '2s7.5.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ xác định các yêu cầu phân bổ và không phân bổ. (A)', NULL, NULL, 1, NULL, 2, 's7.5'),
(178, '2s7.5.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Tham dự các cuộc họp và lập biên bản gồm phân bổ các yêu cầu (chức năng, hành vi, cấu trúc, chất lượng) và kết nối các thành phần phần mềm với các thành phần chính khác của hệ thống bằng một giao diện. (P/L)', NULL, NULL, 1, NULL, 2, 's7.5'),
(179, '2s7.5.3', NULL, 'P - Tham gia', '3. Phát triển khả năng truy xuất nguồn gốc hai chiều giữa các yêu cầu hệ thống và các yêu cầu phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's7.5'),
(180, '2s7.5.4', NULL, 'P - Tham gia', '4. Tham gia làm rõ và tinh chỉnh các yêu cầu được phân bổ cho phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's7.5'),
(181, '2s7.6.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ xác định và lập tài liệu ghi lại các loại thành phần cần thiết phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's7.6'),
(182, '2s7.6.2', NULL, 'L - Dẫn dắt', '2. Hỗ trợ xác định quyết định mua/xây dựng các thành phần phần mềm. (L)', NULL, NULL, 1, NULL, 2, 's7.6'),
(183, '2s7.6.3', NULL, 'A/P - Hỗ trợ/Tham gia', '3. Phát triển và tích hợp các thành phần phần mềm. (A/P)', NULL, NULL, 1, NULL, 2, 's7.6'),
(184, '2s7.7.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ các hoạt động xác minh hệ thống. (A)', NULL, NULL, 1, NULL, 2, 's7.7'),
(185, '2s7.7.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ cung cấp liên lạc cho các kỹ sư linh kiện phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's7.7'),
(186, '2s7.8.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ thực hiện kiểm thử hệ thống theo cách mô phỏng trực tiếp. (A)', NULL, NULL, 1, NULL, 2, 's7.8'),
(187, '2s7.8.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ kiểm thử nghiệm thu/chấp nhận hệ thống. (A)', NULL, NULL, 1, NULL, 2, 's7.8'),
(188, '2s7.9.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ lập kế hoạch duy trì hệ thống. (A)', NULL, NULL, 1, NULL, 2, 's7.9'),
(189, '2s8.1.1', NULL, 'P - Tham gia', '1. Tuân theo các tiêu chuẩn chất lượng cho sản phẩm và các quy trình hỗ trợ. (P)', NULL, NULL, 1, NULL, 2, 's8.1'),
(190, '2s8.1.2', NULL, 'P - Tham gia', '2. Tuân theo các mô hình chất lượng đã xác định. (P)', NULL, NULL, 1, NULL, 2, 's8.1'),
(191, '2s8.1.3', NULL, 'P - Tham gia', '3. Sử dụng các công cụ và tài nguyên phù hợp để phát triển nhiều sản phẩm có chất lượng. (P)', NULL, NULL, 1, NULL, 2, 's8.1'),
(192, '2s8.1.4', NULL, 'A/P - Hỗ trợ/Tham gia', '4. Hỗ trợ xác định các đặc tính và thuộc tính chất lượng khác nhau cho sản phẩm. (A/P)', NULL, NULL, 1, NULL, 2, 's8.1'),
(193, '2s8.1.5', NULL, 'P - Tham gia', '5. Đảm bảo các mục tiêu chất lượng sản phẩm sẽ đạt được. (P)', NULL, NULL, 1, NULL, 2, 's8.1'),
(194, '2s8.1.6', NULL, 'P - Tham gia', '6. Thu thập các chỉ số chất lượng và chuẩn bị tài liệu có chất lượng để chia sẻ với các bên liên quan phù hợp. (P)', NULL, NULL, 1, NULL, 2, 's8.1'),
(195, '2s8.1.7', NULL, 'P - Tham gia', '7. Phát triển và cập nhật ma trận truy xuất nguồn gốc thích hợp cho sản phẩm. (P)', NULL, NULL, 1, NULL, 2, 's8.1'),
(196, '2s8.2.1', NULL, 'P - Tham gia', '1. Tham gia như một thành viên tích cực của nhóm đánh giá để đạt được các mục tiêu hoạt động. (P)', NULL, NULL, 1, NULL, 2, 's8.2'),
(197, '2s8.2.2', NULL, 'P - Tham gia', '2. Sử dụng các danh sách kiểm tra phù hợp theo yêu cầu của người tổ chức đánh giá. (P)', NULL, NULL, 1, NULL, 2, 's8.2'),
(198, '2s8.2.3', NULL, 'P - Tham gia', '3. Thu thập dữ liệu phù hợp và chính xác theo yêu cầu của người tổ chức đánh giá. (P)', NULL, NULL, 1, NULL, 2, 's8.2'),
(199, '2s8.2.4', NULL, 'P - Tham gia', '4. Sản xuất tài liệu thích hợp theo yêu cầu trong kế hoạch quản lý chất lượng. (P)', NULL, NULL, 1, NULL, 2, 's8.2'),
(200, '2s8.2.5', NULL, 'P - Tham gia', '5. Tuân thủ các thông lệ thích hợp được xác định trong kế hoạch quản lý chất lượng. (P)', NULL, NULL, 1, NULL, 2, 's8.2'),
(201, '2s8.3.1', NULL, 'P - Tham gia', '1. Tham gia các buổi kiểm tra độc lập. (P)', NULL, NULL, 1, NULL, 2, 's8.3'),
(202, '2s8.4.1', NULL, 'P - Tham gia', '1. Thu thập bộ dữ liệu chất lượng dưới sự kiểm soát thống kê. (P)', NULL, NULL, 1, NULL, 2, 's8.4'),
(203, '2s9.2.1', NULL, 'F - Tuân thủ', '1. Tuân theo các nguyên tắc cơ bản được khuyến nghị để tạo ra các hệ thống an toàn (ví dụ như cung cấp nhiều lớp bảo vệ, sử dụng các cơ chế kiểm soát truy cập và mã hoá những dữ liệu nhạy cảm). (F)', NULL, NULL, 1, NULL, 2, 's9.2'),
(204, '2s9.2.2', NULL, 'F - Tuân thủ', '2. Sử dụng các mẫu thiết kế phù hợp và an toàn. (F)', NULL, NULL, 1, NULL, 2, 's9.2'),
(205, '2s9.3.1', NULL, 'F - Tuân thủ', '1. Tuân theo các nguyên tắc mã hoá an toàn được khuyến nghị để tránh các lỗ hỏng bảo mật (ví dụ như tràn bộ nhớ đệm, xác thực đầu vào). (F)', NULL, NULL, 1, NULL, 2, 's9.3'),
(206, '2s9.3.2', NULL, 'F - Tuân thủ', '2. Tuân theo các tiêu chuẩn mã hoá được khuyến nghị để tránh các lỗ hỏng bảo mật (ví dụ như xác thực đầu vào và ngăn chặn các cơ chế xử lý ngoại lệ từ việc để lộ quá nhiều thông tin về các ứng dụng, các hệ thống). (F)', NULL, NULL, 1, NULL, 2, 's9.3'),
(207, '2s9.4.1', NULL, 'F - Tuân thủ', '1. Tuân theo các tiêu chuẩn dự án trong bộ sưu tập các số liệu đánh giá bảo mật. (F)', NULL, NULL, 1, NULL, 2, 's9.4'),
(208, '2s9.5.1', NULL, 'P - Tham gia', '1. Thực hiện các buổi đánh giá mã nguồn để xác định các lỗ hỏng bảo mật. (P)', NULL, NULL, 1, NULL, 2, 's9.5'),
(209, '2s9.5.2', NULL, 'P - Tham gia', '2. Sử dụng các phương pháp phân tích mã nguồn tĩnh để xác định các lỗ hỏng bảo mật. (P)', NULL, NULL, 1, NULL, 2, 's9.5'),
(210, '2s10.1.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Tạo và xác minh các danh sách nguy cơ sơ bộ. (A/P)', NULL, NULL, 1, NULL, 2, 's10.1'),
(211, '2s10.1.2', NULL, 'A/P - Hỗ trợ/Tham gia', '2. Sử dụng các công cụ phần mềm để xây dựng các mô hình an toàn (FTA, ETA, FMEA). (A/P)', NULL, NULL, 1, NULL, 2, 's10.1'),
(212, '2s10.1.3', NULL, 'F/A - Tuân thủ/Hỗ trợ', '3. Hỗ trợ xác định các yêu cầu an toàn. (F/A)', NULL, NULL, 1, NULL, 2, 's10.1'),
(213, '2s10.2.1', NULL, 'A - Hỗ trợ', '1. Thực hiện các giải pháp thiết kế để đảm bảo các nguy cơ được giảm thiểu và đáp ứng được các yêu cầu an toàn. (A)', NULL, NULL, 1, NULL, 2, 's10.2'),
(214, '2s10.2.2', NULL, 'P - Tham gia', '2. Tuân theo các nguyên tắc thiết kế được khuyến nghị. (P)', NULL, NULL, 1, NULL, 2, 's10.2'),
(215, '2s10.3.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Thực hiện các mã nguồn lớn và các giao diện của các thành phần, xem xét các phương pháp mã hoá an toàn để tránh các vi phạm an toàn. (A/P)', NULL, NULL, 1, NULL, 2, 's10.3'),
(216, '2s10.4.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Thực hiện kiểm thử bằng các công cụ tập trung vào các yêu cầu an toàn. (A/P)', NULL, NULL, 1, NULL, 2, 's10.4'),
(217, '2s10.5.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Xác định các sản phẩm phụ đi kèm được yêu cầu để thiết lập trường hợp an toàn và tuân theo tiêu chuẩn chuyên ngành. (A/P)', NULL, NULL, 1, NULL, 2, 's10.5'),
(218, '2s10.6.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Thu thập dữ liệu quản lý chất lượng an toàn và báo trạng thái dự án. (A/P)', NULL, NULL, 1, NULL, 2, 's10.6'),
(219, '2s11.1.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ xác định tác động của các ràng buộc trong quản lý cấu hình phần mềm được áp dụng bởi chính sách, hợp đồng và vòng đời phát triển phần mềm. (A) ', NULL, NULL, 1, NULL, 2, 's11.1'),
(220, '2s11.1.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ phát triển, cập nhật và duy trì kế hoạch quản lý cấu hình phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's11.1'),
(221, '2s11.1.3', NULL, 'P - Tham gia', '3. Cung cấp dữ liệu đo lường cho các cách đo lường trong quản lý cấu hình phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's11.1'),
(222, '2s11.1.4', NULL, 'A - Hỗ trợ', '4. Hỗ trợ xác định các mục cấu hình phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's11.1'),
(223, '2s11.1.5', NULL, 'A - Hỗ trợ', '5. Hỗ trợ lựa chọn và mua các công cụ quản lý cấu hình phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's11.1'),
(224, '2s11.1.6', NULL, 'L - Dẫn dắt', '6. Khởi động thư viện quản lý cấu hình phần mềm cho dự án dưới sự giám sát lãnh đạo của bên kỹ thuật. (L)', NULL, NULL, 1, NULL, 2, 's11.1'),
(225, '2s11.2.1', NULL, 'P - Tham gia', '1. Triển khai và lập tài liệu ghi lại các thay đổi được phê duyệt cho các mục cấu hình phần mềm.', NULL, NULL, 1, NULL, 2, 's11.2'),
(226, '2s11.2.2', NULL, 'P - Tham gia', '2. Tạo, phân loại và quản lý các báo cáo về sự cố. (P)', NULL, NULL, 1, NULL, 2, 's11.2'),
(227, '2s11.2.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ sử dụng các cơ chế được phê duyệt để yêu cầu, đánh giá và phê duyệt các thay đổi của phần mềm - bao gồm cả những sai lệch và loại trừ. (A)', NULL, NULL, 1, NULL, 2, 's11.2'),
(228, '2s11.2.4', NULL, 'A - Hỗ trợ', '4. Hỗ trợ thiết lập và duy trì các cơ chế để ghi lại, báo cáo thông tin quản lý cấu hình phần mềm và tạo các báo cáo kiểm tra độc lập trong việc quản lý cấu hình phần mềm. (A)', NULL, NULL, 1, NULL, 2, 's11.2'),
(229, '2s11.2.5', NULL, 'P - Tham gia', '5. Cung cấp các báo cáo kiểm tra độc lập theo lịch trình và yêu cầu. (P)', NULL, NULL, 1, NULL, 2, 's11.2'),
(230, '2s11.3.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Tham gia phát triển các kế hoạch phát hành phần mềm. (A/P)', NULL, NULL, 1, NULL, 2, 's11.3'),
(231, '2s11.3.2', NULL, 'P - Tham gia', '2. Tham gia xây dựng và xác minh các bản phát hành phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's11.3'),
(232, '2s11.3.3', NULL, 'P - Tham gia', '3. Tham gia xây dựng các bản phát hành phần mềm. (P)', NULL, NULL, 1, NULL, 2, 's11.3'),
(233, '2s12.1.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ lập kế hoạch lưu trữ dữ liệu. (A)', NULL, NULL, 1, NULL, 2, 's12.1'),
(234, '2s12.1.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ lựa chọn các phương pháp thu thập và phân tích dữ liệu. (A)', NULL, NULL, 1, NULL, 2, 's12.1'),
(235, '2s12.1.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ xác định các công cụ đo lường và các thủ tục thủ công. (A)', NULL, NULL, 1, NULL, 2, 's12.1'),
(236, '2s12.2.1', NULL, 'P - Tham gia', '1. Sử dụng các công cụ đo lường để thu thập dữ liệu. (P)', NULL, NULL, 1, NULL, 2, 's12.2'),
(237, '2s12.2.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ xác thực dữ liệu đã thu thập. (A)', NULL, NULL, 1, NULL, 2, 's12.2'),
(238, '2s12.2.3', NULL, 'A - Hỗ trợ', '3. Xác định và đề xuất cải tiến các quy trình đo lường. (A)', NULL, NULL, 1, NULL, 2, 's12.2'),
(239, '2s13.1.1', NULL, 'P - Tham gia', '1. Xác định các bên liên quan cung cấp các yêu cầu tương tác giữa người và máy tính. (P)', NULL, NULL, 1, NULL, 2, 's13.1'),
(240, '2s13.1.2', NULL, 'P - Tham gia', '2. Xác định các đối tượng và thuộc tính người dùng. (P)', NULL, NULL, 1, NULL, 2, 's13.1'),
(241, '2s13.1.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ xác định các yêu cầu của giao diện người dùng. (A)', NULL, NULL, 1, NULL, 2, 's13.1'),
(242, '2s13.1.4', NULL, 'P - Tham gia', '4. Thiết kế và tạo các nguyên mẫu để sử dụng trong việc làm rõ các yêu cầu về giao diện người dùng. (P)', NULL, NULL, 1, NULL, 2, 's13.1'),
(243, '2s13.2.1', NULL, 'P - Tham gia', '1. Ghi lại các trường hợp sử dụng, các kịch bản, các hộp thoại tương tác và các bảng phân cảnh. (P)', NULL, NULL, 1, NULL, 2, 's13.2'),
(244, '2s13.2.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ xác định các lỗi đầu vào của người dùng và xác định các phương pháp xử lý lỗi. (A)', NULL, NULL, 1, NULL, 2, 's13.2'),
(245, '2s13.2.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ xác định các chế độ tương tác. (A)', NULL, NULL, 1, NULL, 2, 's13.2'),
(246, '2s13.2.4', NULL, 'P - Tham gia', '4. Thiết lập truy xuất nguồn gốc hai chiều giữa các trường hợp sử dụng, các kịch bản, các hộp thoại tương tác, các bảng phân cảnh, cũng như các yêu cầu giao diện người dùng cụ thể và các tiêu chí nghiệm thu/chấp nhận. (P)', NULL, NULL, 1, NULL, 2, 's13.2'),
(247, '2s13.2.5', NULL, 'P - Tham gia', '5. Phát triển các nguyên mẫu giao diện. (P)', NULL, NULL, 1, NULL, 2, 's13.2'),
(248, '2s13.3.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ thiết kế bố cục trang/màn hình. (A)', NULL, NULL, 1, NULL, 2, 's13.3'),
(249, '2s13.3.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ lựa chọn từ các biểu tượng có sẵn và thiết kế các biểu tượng mới. (A)', NULL, NULL, 1, NULL, 2, 's13.3'),
(250, '2s13.3.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ lựa chọn chủ đề màu sắc, các kiểu và cỡ chữ. (A)', NULL, NULL, 1, NULL, 2, 's13.3'),
(251, '2s13.3.4', NULL, 'A - Hỗ trợ', '4. Hỗ trợ thiết kế bảng. (A)', NULL, NULL, 1, NULL, 2, 's13.3'),
(252, '2s13.3.5', NULL, 'P - Tham gia', '5. Tạo các mô hình và các bản phác thảo. (P)', NULL, NULL, 1, NULL, 2, 's13.3'),
(253, '2s13.4.1', NULL, 'P - Tham gia', '1. Phân tích thiết kế với danh sách kiểm tra khả năng sử dụng. (P)', NULL, NULL, 1, NULL, 2, 's13.4'),
(254, '2s13.4.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ xác định các đối tượng đại diện kiểm tra từ nhóm đối tượng người dùng. (A)', NULL, NULL, 1, NULL, 2, 's13.4'),
(255, '2s13.4.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ lấy các đối tượng kiểm tra. (A)', NULL, NULL, 1, NULL, 2, 's13.4'),
(256, '2s13.4.4', NULL, 'A - Hỗ trợ', '4. Hỗ trợ thiết kế các bài kiểm tra khả năng sử dụng. (A)', NULL, NULL, 1, NULL, 2, 's13.4'),
(257, '2s13.4.5', NULL, 'P - Tham gia', '5. Tiến hành thực hiện các bài kiểm tra khả năng sử dụng và thu thập dữ liệu. (P)', NULL, NULL, 1, NULL, 2, 's13.4'),
(258, '2s13.4.6', NULL, 'P - Tham gia', '6. Phân tích các kết quả kiểm tra khả năng sử dụng. (P)', NULL, NULL, 1, NULL, 2, 's13.4'),
(259, '2s13.5.1', NULL, 'A - Hỗ trợ', '1. Hỗ trợ xác các định nhu cầu tiếp cận cho các giao diện người dùng. (A)', NULL, NULL, 1, NULL, 2, 's13.5'),
(260, '2s13.5.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ xác các định nhu cầu về khả năng tiếp cận quốc tế (ngôn ngữ, cân nhắc văn hóa,...). (A)', NULL, NULL, 1, NULL, 2, 's13.5'),
(261, '2s13.5.3', NULL, 'A - Hỗ trợ', '3. Sử dụng các công cụ và kỹ thuật được chọn để thực hiện khả năng tiếp cận cần thiết. (A)', NULL, NULL, 1, NULL, 2, 's13.5'),
(262, '3s1.1.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Xác định các bên quan trọng có liên quan. (P/L)', NULL, NULL, 1, NULL, 3, 's1.1'),
(263, '3s1.1.2', NULL, 'P - Tham gia', '2. Thu hút các bên liên quan khác nhau để xác định nhu cầu và yêu cầu. (P)', NULL, NULL, 1, NULL, 3, 's1.1'),
(264, '3s1.1.3', NULL, 'P - Tham gia', '3. Hỗ trợ ứng dụng các phương pháp khác nhau cho dự án một cách thích hợp để làm rõ các yêu cầu. (P)', NULL, NULL, 1, NULL, 3, 's1.1'),
(265, '3s1.1.4', NULL, 'A - Hỗ trợ', '4. Hỗ trợ đàm phán các xung đột giữa các bên liên quan trong việc làm rõ các yêu cầu. (A)', NULL, NULL, 1, NULL, 3, 's1.1'),
(266, '3s1.2.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Lựa chọn các phương pháp phân tích miền phù hợp nhất (P/L)', NULL, NULL, 1, NULL, 3, 's1.2'),
(267, '3s1.2.2', NULL, 'P - Tham gia', '2. Xác định các thuộc tính và yêu cầu mới sẽ xuất hiện trong suốt vòng đời phát triển phần mềm (P)', NULL, NULL, 1, NULL, 3, 's1.2'),
(268, '3s1.3.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Lựa chọn các ghi chú/ký hiệu chính thức và không chính thức thích hợp nhất để mô tả các giao diện, các yêu cầu chức năng và các yêu cầu phi chức năng (P/L)', NULL, NULL, 1, NULL, 3, 's1.3'),
(269, '3s1.4.1', NULL, 'L - Dẫn dắt', '1.Đánh giá đặc tả yêu cầu để đưa ra các lỗi và thiếu sót (L)', NULL, NULL, 1, NULL, 3, 's1.4'),
(270, '3s1.4.2', NULL, 'P - Tham gia', '2. Tạo các nguyên mẫu cho các loại khác nhau khi cần thiết. (P)', NULL, NULL, 1, NULL, 3, 's1.4'),
(271, '3s1.4.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ đàm phán các xung đột giữa các bên liên quan trong việc xác minh các yêu cầu. (A)', NULL, NULL, 1, NULL, 3, 's1.4'),
(272, '3s1.5.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Thực hiện phân tích đánh đổi với các hoạt động đã lấy yêu cầu. (P/L)', NULL, NULL, 1, NULL, 3, 's1.5'),
(273, '3s2.1.1', NULL, 'P - Tham gia', '1. Ứng dụng các kỹ thuật hỗ trợ (ví dụ như kỹ thuật trừu tượng, ghép nối/liên kết, ẩn thông tin,...) để thiết kế các thành phần và mô-đun phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's2.1'),
(274, '3s2.1.2', NULL, 'P - Tham gia', '2. Với miền ứng dụng thích hợp thì áp dụng các kỹ thuật thiết kế thích hợp trong các lĩnh vực cùng một lúc, cũng như trong xử lý các sự kiện, ổn định dữ liệu hoặc phân phối phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's2.1'),
(275, '3s2.1.3', NULL, 'P - Tham gia', '3. Ứng dụng các kỹ thuật xử lý ngoại lệ và khả năng chịu lỗi trong thiết kế các thành phần và mô-đun phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's2.1'),
(276, '3s2.1.4', NULL, 'P - Tham gia', '4. Sử dụng các phương pháp tái cấu trúc và cải tiến mã nguồn trong thiết kế các thành phần và mô-đun phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's2.1'),
(277, '3s2.2.1', NULL, 'P - Tham gia', '1. Ứng dụng chiến lược và phương pháp luận thiết kế phần mềm được chỉ định để tạo ra một thiết kế phần mềm (ví dụ như cách tiếp cận hướng đối tượng gia tăng). (P)', NULL, NULL, 1, NULL, 3, 's2.2'),
(278, '3s2.2.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Xác định các lựa chọn thay thế thiết kế và thực hiện phân tích đánh đổi. (P/L)', NULL, NULL, 1, NULL, 3, 's2.2'),
(279, '3s2.3.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Ứng dụng các ký hiệu/ghi chú dạng chuẩn, các kỹ thuật lập sơ đồ, các mô hình và các mẫu (ví dụ như các kiểu kiến trúc, các mô hình cấu trúc và hành vi, các mẫu GoF, các mô hình thiết kế nhiều hệ thống có cấu trúc, UML) để mô hình hóa tổ chức cấp cao của hệ thống phần mềm. (P/L)', NULL, NULL, 1, NULL, 3, 's2.3'),
(280, '3s2.3.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Tạo góc nhìn đa chiều về hệ thống phần mềm. (P/L)', NULL, NULL, 1, NULL, 3, 's2.3'),
(281, '3s2.3.3', NULL, 'P - Tham gia', '3. Sử dụng các mẫu và khung thiết kế có sẵn để thiết kế các thành phần và mô-đun phần mềm ở cấp độ trung bình. (P)', NULL, NULL, 1, NULL, 3, 's2.3'),
(282, '3s2.4.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Tạo điều kiện thuận lợi cho các việc đánh giá thiết kế phần mềm. (P/L)', NULL, NULL, 1, NULL, 3, 's2.4'),
(283, '3s2.4.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Dẫn dắt các nhiệm vụ phân tích mã nguồn tĩnh để đánh giá chất lượng thiết kế. (P/L)', NULL, NULL, 1, NULL, 3, 's2.4'),
(284, '3s2.4.3', NULL, 'P - Tham gia', '3. Phát triển, sử dụng bản mô phỏng và các nguyên mẫu để đánh giá chất lượng thiết kế phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's2.4'),
(285, '3s3.1.1', NULL, 'F/L - Tuân theo/Dẫn dắt', '1. Hỗ trợ lựa chọn các quy trình và các mô hình thích hợp để xây dựng phần mềm. (F/L)', NULL, NULL, 1, NULL, 3, 's3.1'),
(286, '3s3.1.2', NULL, 'F/P - Tuân theo/Tham gia', '2. Hỗ trợ lựa chọn các ngôn ngữ và các công cụ thích hợp để xây dựng phần mềm. (F/P)', NULL, NULL, 1, NULL, 3, 's3.1'),
(287, '3s3.1.3', NULL, 'F/P - Tuân theo/Tham gia', '3. Hỗ trợ lựa chọn các khung phần mềm, các nền tảng và các môi trường thích hợp cho xây dựng phần mềm. (F/P)', NULL, NULL, 1, NULL, 3, 's3.1'),
(288, '3s3.2.1', NULL, 'P - Tham gia', '1. Giám sát các thước đo tiêu chuẩn về chất lượng và kích thước mã. (P)', NULL, NULL, 1, NULL, 3, 's3.2'),
(289, '3s3.3.1', NULL, 'P - Tham gia', '1. Tạo và đánh giá các thiết kế chi tiết cùng mã nguồn mà đã đáp ứng những yêu cầu về chất lượng. (P)', NULL, NULL, 1, NULL, 3, 's3.3'),
(290, '3s3.3.2', NULL, 'L - Dẫn dắt', '2. Đề nghị và thực hiện cải tiến mã nguồn thích hợp khi cần thiết. (L)', NULL, NULL, 1, NULL, 3, 's3.3'),
(291, '3s3.3.3', NULL, 'P - Tham gia', '3. Chọn lựa và thiết lập các tiêu chuẩn dự án cho việc thiết kế và viết mã nguồn. (P)', NULL, NULL, 1, NULL, 3, 's3.3'),
(292, '3s3.3.4', NULL, 'L - Dẫn dắt', '4. Đề xuất và sử dụng các mẫu thiết kế thích hợp. (L)', NULL, NULL, 1, NULL, 3, 's3.3'),
(293, '3s3.3.5', NULL, 'P - Tham gia', '5. Đề xuất và sử dụng các công cụ mã hóa để phòng thủ và giảm thiểu sự lan truyền của các lỗi và các mối đe dọa. (P)', NULL, NULL, 1, NULL, 3, 's3.3'),
(294, '3s3.3.6', NULL, 'P/L - Tham gia/Dẫn dắt', '6. Viết các mô hình thực thi phù hợp để tạo mã nguồn khi thích hợp. (P/L)', NULL, NULL, 1, NULL, 3, 's3.3'),
(295, '3s3.4.1', NULL, 'P - Tham gia', '1. Đảm bảo các tiêu chuẩn dự án về phạm vi kiểm tra các bài kiểm thử đơn vị được tuân theo. (P)', NULL, NULL, 1, NULL, 3, 's3.4'),
(296, '3s3.5.1', NULL, 'L - Dẫn dắt', '1. Dẫn dắt các buổi đánh giá và kiểm tra mã nguồn. (L)', NULL, NULL, 1, NULL, 3, 's3.5'),
(297, '3s4.1.1', NULL, 'P - Tham gia', '1. Xác định các bên liên quan tham gia các hoạt động thử nghiệm và kiểm tra. (P)', NULL, NULL, 1, NULL, 3, 's4.1'),
(298, '3s4.1.2', NULL, 'P - Tham gia', '2. Thiết kế và thực hiện kế hoạch kiểm thử phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's4.1'),
(299, '3s4.1.3', NULL, 'L/P - Dẫn dắt/Tham gia', '3. Xác định các tiêu chí thành công và thất bại trong thử nghiệm. (L/P)', NULL, NULL, 1, NULL, 3, 's4.1'),
(300, '3s4.1.4', NULL, 'P - Tham gia', '4. Phát triển các kế hoạch khác cho thử nghiệm và kiểm tra. (P)', NULL, NULL, 1, NULL, 3, 's4.1'),
(301, '3s4.1.5', NULL, 'A/P - Hỗ trợ/Tham gia', '5. Thiết lập các tiêu chí để sẵn sàng kiểm thử. (A/P)', NULL, NULL, 1, NULL, 3, 's4.1'),
(302, '3s4.1.6', NULL, 'P - Tham gia', '6. Lựa chọn kỹ thuật thử nghiệm và kiểm tra phù hợp nhất. (P)', NULL, NULL, 1, NULL, 3, 's4.1'),
(303, '3s4.1.7', NULL, 'P - Tham gia', '7. Thiết lập các tiêu chí để hoàn thành kiểm thử (ví dụ như tỷ lệ xuất hiện lỗi, cường độ lỗi,...) (P)', NULL, NULL, 1, NULL, 3, 's4.1'),
(304, '3s4.1.8', NULL, 'P/L - Tham gia/Dẫn dắt', '8. Thiết lập các tiêu chí cho kiểm thử hồi quy (ví dụ như mật độ lỗi,...) (P/L)', NULL, NULL, 1, NULL, 3, 's4.1'),
(305, '3s4.2.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Xác định thiết lập các yêu cầu/ vấn đề cần thiết để kiểm tra và thử nghiệm. (P/L)', NULL, NULL, 1, NULL, 3, 's4.2'),
(306, '3s4.2.2', NULL, 'P - Tham gia', '2. Xác định các tài liệu thích hợp cần thiết cho các hoạt động kiểm thử. (P)', NULL, NULL, 1, NULL, 3, 's4.2'),
(307, '3s4.2.3', NULL, 'L/P - Dẫn dắt/Tham gia', '3. Thiết kế môi trường kiểm thử. (L/P)', NULL, NULL, 1, NULL, 3, 's4.2'),
(308, '3s4.3.1', NULL, 'L/P - Dẫn dắt/Tham gia', '1. Chỉ định các trường hợp kiểm thử thích hợp cho các công cụ đã chọn. (L/P)', NULL, NULL, 1, NULL, 3, 's4.3'),
(309, '3s4.3.2', NULL, 'L/P - Dẫn dắt/Tham gia', '2. Thực thi các trường hợp kiểm thử. (L/P)', NULL, NULL, 1, NULL, 3, 's4.3');
INSERT INTO `activity` (`activityid`, `keyname`, `name`, `requirement`, `description`, `createdate`, `editdate`, `isenable`, `note`, `competenceid_id`, `keynameskill_id`) VALUES
(310, '3s4.3.3', NULL, 'L/P - Dẫn dắt/Tham gia', '3. Xây dựng các kịch bản tự động cho trường hợp kiểm thử. (L/P)', NULL, NULL, 1, NULL, 3, 's4.3'),
(311, '3s4.4.1', NULL, 'L/P - Dẫn dắt/Tham gia', '1. Thu thập dữ liệu thích hợp liên quan đến việc thực thi kiểm thử. (L/P)', NULL, NULL, 1, NULL, 3, 's4.4'),
(312, '3s4.4.2', NULL, 'P - Tham gia', '2. Tiến hành phân tích nguyên nhân gốc rễ. (P)', NULL, NULL, 1, NULL, 3, 's4.4'),
(313, '3s4.4.3', NULL, 'P - Tham gia', '3. Sử dụng các kết quả kiểm thử, chỉ định công việc làm lại thích hợp với các thành viên trong nhóm. (P)', NULL, NULL, 1, NULL, 3, 's4.4'),
(314, '3s4.4.4', NULL, 'P - Tham gia', '4. Sử dụng dữ liệu kiểm thử đã thực thi cùng với kết quả làm lại để đánh giá hiệu quả kiểm thử, từ đó quyết định kiểm thử bổ sung hoặc kiểm thử hồi quy. (P)', NULL, NULL, 1, NULL, 3, 's4.4'),
(315, '3s4.4.5', NULL, 'P - Tham gia', '5. Giám sát quy trình kiểm thử bằng cách đánh giá tỉ lệ xuất hiện lỗi, cường độ lỗi,... (P)', NULL, NULL, 1, NULL, 3, 's4.4'),
(316, '3s5.1.1', NULL, 'P - Tham gia', '1. Tham gia xây dựng các kế hoạch chuyển đổi. (P)', NULL, NULL, 1, NULL, 3, 's5.1'),
(317, '3s5.1.2', NULL, 'P - Tham gia', '2. Tham gia vào việc xác định các bên liên quan đến các yêu cầu chuyển đổi và vận hành. (P)', NULL, NULL, 1, NULL, 3, 's5.1'),
(318, '3s5.1.3', NULL, 'P - Tham gia', '3. Tham gia vào việc xác định các ràng buộc cho hệ thống và phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's5.1'),
(319, '3s5.1.4', NULL, 'P - Tham gia', '4. Xác định các hệ thống có thể áp dụng và các tiêu chuẩn vận hành phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's5.1'),
(320, '3s5.1.5', NULL, 'L - Dẫn dắt', '5. Dẫn dắt phát triển chuyển đổi phần mềm và phát triển tài liệu vận hành phần mềm. (L)', NULL, NULL, 1, NULL, 3, 's5.1'),
(321, '3s5.1.6', NULL, 'L - Dẫn dắt', '6. Dẫn dắt trong việc cài đặt phần mềm. (L)', NULL, NULL, 1, NULL, 3, 's5.1'),
(322, '3s5.1.7', NULL, 'P - Tham gia', '7. Phát triển tài nguyên đào tạo cho nhân viên hỗ trợ vận hành phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's5.1'),
(323, '3s5.1.8', NULL, 'L - Dẫn dắt', '8. Dẫn dắt trong việc đào tạo vận hành phần mềm. (L)', NULL, NULL, 1, NULL, 3, 's5.1'),
(324, '3s5.1.9', NULL, 'P - Tham gia', '9. Phát triển các thủ tục kích hoạt và kiểm tra hệ thống phần mềm lần cuối. (P)', NULL, NULL, 1, NULL, 3, 's5.1'),
(325, '3s5.1.10', NULL, 'P - Tham gia', '10. Tham gia xác định các tác động của thay đổi phần mềm đến môi trường vận hành. (P)', NULL, NULL, 1, NULL, 3, 's5.1'),
(326, '3s5.1.11', NULL, 'P - Tham gia', '11. Tham gia nghiệm thu/chấp nhận hệ thống. (P)', NULL, NULL, 1, NULL, 3, 's5.1'),
(327, '3s5.2.1', NULL, 'L - Dẫn dắt', '1. Phát triển các kế hoạch quản lý cấu hình của phần mềm vận hành. (L)', NULL, NULL, 1, NULL, 3, 's5.2'),
(328, '3s5.2.2', NULL, 'L - Dẫn dắt', '2. Dẫn dắt các hoạt động đảm bảo phần mềm vận hành. (L)', NULL, NULL, 1, NULL, 3, 's5.2'),
(329, '3s5.2.3', NULL, 'L - Dẫn dắt', '3. Dẫn dắt trong việc bảo trì các công nghệ phần mềm thương mại có sẵn trên thị trường (COTS) và các công nghệ phần mềm khác để tạo quỹ giúp duy trì. (L)', NULL, NULL, 1, NULL, 3, 's5.2'),
(330, '3s5.2.4', NULL, 'L - Dẫn dắt', '4. Phát triển các kế hoạch hỗ trợ phần mềm. (L)', NULL, NULL, 1, NULL, 3, 's5.2'),
(331, '3s5.2.5', NULL, 'L - Dẫn dắt', '5. Mua được các công cụ và giám sát việc phân tích dữ liệu vận hành. (L)', NULL, NULL, 1, NULL, 3, 's5.2'),
(332, '3s5.2.6', NULL, 'P - Tham gia', '6. Triển khai các thủ tục hủy bỏ sự tồn tại của phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's5.2'),
(333, '3s5.3.1', NULL, 'P - Tham gia', '1. Triển khai các quy trình và kế hoạch bảo trì phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's5.3'),
(334, '3s5.3.2', NULL, 'L - Dẫn dắt', '2. Xác định các sản phẩm phụ đi kèm trong việc phát triển phần mềm được sử dụng làm đường cơ sở. (L)', NULL, NULL, 1, NULL, 3, 's5.3'),
(335, '3s5.3.3', NULL, 'P - Tham gia', '3. Thực hiện phân tích tác động làm thay đổi. (P)', NULL, NULL, 1, NULL, 3, 's5.3'),
(336, '3s5.3.4', NULL, 'P - Tham gia', '4. Triển khai các kế hoạch và thực hiện các thay đổi đối với phần mềm (sửa chữa, thích ứng và hoàn thiện). (P)', NULL, NULL, 1, NULL, 3, 's5.3'),
(337, '3s5.3.5', NULL, 'L - Dẫn dắt', '5. Dẫn dắt các hoạt động bảo trì định kỳ và tái thiết kế phần mềm. (L)', NULL, NULL, 1, NULL, 3, 's5.3'),
(338, '3s5.3.6', NULL, 'P - Tham gia', '6. Giám sát và phân tích các hoạt động bảo trì phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's5.3'),
(339, '3s6.1.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Dẫn dắt nhóm nhỏ thực thi một số phần của mô hình quy trình vòng đời (ví dụ như thiết kế phần mềm). (P/L)', NULL, NULL, 1, NULL, 3, 's6.1'),
(340, '3s6.2.1', NULL, 'A/P - Hỗ trợ/Tham gia', '1. Cung cấp đánh giá về các quy trình đã được xác định và điều chỉnh. (A/P)', NULL, NULL, 1, NULL, 3, 's6.2'),
(341, '3s6.2.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Điều chỉnh quy trình phần mềm sao cho phù hợp với công việc của một nhóm nhỏ. (P/L)', NULL, NULL, 1, NULL, 3, 's6.2'),
(342, '3s6.3.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Dẫn dắt các nhóm nhỏ trong việc triển khai và thực thi một quy trình phần mềm. (P/L)', NULL, NULL, 1, NULL, 3, 's6.3'),
(343, '3s6.3.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Cung cấp hướng dẫn và đưa ra lời khuyên cho các cá nhân về việc triển khai và quản lý quy trình riêng của họ. (P/L)', NULL, NULL, 1, NULL, 3, 's6.3'),
(344, '3s6.3.3', NULL, 'P - Tham gia', '3. Đảm nhiệm với tư cách là một thành viên của nhóm quy trình công nghệ phần mềm (SEPG). (P)', NULL, NULL, 1, NULL, 3, 's6.3'),
(345, '3s6.4.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Dẫn dắt các nhóm nhỏ trong việc thu thập dữ liệu để đánh giá các quy trình phần mềm. (P/L)', NULL, NULL, 1, NULL, 3, 's6.4'),
(346, '3s6.4.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Phân tích dữ liệu đánh giá quy trình và triển khai cải tiến các quy trình phần mềm của nhóm nhỏ. (P/L)', NULL, NULL, 1, NULL, 3, 's6.4'),
(347, '3s6.4.3', NULL, 'A/P - Hỗ trợ/Tham gia', '3. Cung cấp đầu vào cho việc cải tiến quy trình phần mềm như một thành viên của nhóm quy trình công nghệ phần mềm. (A/P)', NULL, NULL, 1, NULL, 3, 's6.4'),
(348, '3s7.1.1', NULL, 'P - Tham gia', '1. Tham gia tích hợp mô hình phát triển phần mềm đã chọn vào mô hình phát triển hệ thống. (P)', NULL, NULL, 1, NULL, 3, 's7.1'),
(349, '3s7.2.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Phát triển danh sách các bên liên quan và phân loại các mối quan tâm mà họ có thể muốn. (P/L)', NULL, NULL, 1, NULL, 3, 's7.2'),
(350, '3s7.2.2', NULL, 'P - Tham gia', '2. Tham dự các cuộc họp với bên liên quan và trưng cầu những nhu cầu, mong muốn và khát vọng của họ. (P)', NULL, NULL, 1, NULL, 3, 's7.2'),
(351, '3s7.2.3', NULL, 'L - Dẫn dắt', '3. Dẫn dắt phát triển các kịch bản, các bảng phân cảnh, các nguyên mẫu và các trường hợp sử dụng. (L)', NULL, NULL, 1, NULL, 3, 's7.2'),
(352, '3s7.3.1', NULL, 'P - Tham gia', '1. Thiết lập môi trường phát triển hệ thống và xác định các ràng buộc công nghệ. (P)', NULL, NULL, 1, NULL, 3, 's7.3'),
(353, '3s7.3.2', NULL, 'P - Tham gia', '2. Xác định các yêu cầu và các công cụ trong việc truy xuất nguồn gốc cấp hệ thống. (P)', NULL, NULL, 1, NULL, 3, 's7.3'),
(354, '3s7.3.3', NULL, 'P - Tham gia', '3. Tham gia phát triển đặc tả yêu cầu hệ thống. (P)', NULL, NULL, 1, NULL, 3, 's7.3'),
(355, '3s7.3.4', NULL, 'A - Hỗ trợ', '4. Tham gia phát triển các kế hoạch, các thủ tục, các kịch bản để tích hợp, xác minh, xác thực và triển khai hệ thống. (A)', NULL, NULL, 1, NULL, 3, 's7.3'),
(356, '3s7.4.1', NULL, 'P - Tham gia', '1. Tham gia phát triển các khái niệm giải pháp thay thế và thực hiện các nghiên cứu thương mại để xác định các thành phần chính của hệ thống. (P)', NULL, NULL, 1, NULL, 3, 's7.4'),
(357, '3s7.4.2', NULL, 'P - Tham gia', '2. Tham gia xác định các thành phần hệ thống, đồng thời cũng tham gia xác định các giao diện và các mối quan hệ giữa những thành phần hệ thống. (P)', NULL, NULL, 1, NULL, 3, 's7.4'),
(358, '3s7.4.3', NULL, 'P - Tham gia', '3. Đề xuất các quyết định mua hoặc xây dựng các thành phần phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's7.4'),
(359, '3s7.4.4', NULL, 'L - Dẫn dắt', '4. Mua các thành phần phần mềm đã chọn. (L)', NULL, NULL, 1, NULL, 3, 's7.4'),
(360, '3s7.4.5', NULL, 'P - Tham gia', '5. Tham gia các cuộc họp thiết kế hệ thống để tránh các đơn vị phần mềm bị cô lập. (P)', NULL, NULL, 1, NULL, 3, 's7.4'),
(361, '3s7.5.1', NULL, 'P - Tham gia', '1. Xác định các yêu cầu phân bổ và không phân bổ. (P)', NULL, NULL, 1, NULL, 3, 's7.5'),
(362, '3s7.5.2', NULL, 'P - Tham gia', '2. Tham gia các cuộc họp để phân bổ các yêu cầu (chức năng, hành vi, cấu trúc, chất lượng) và kết nối các thành phần phần mềm với các thành phần chính khác của hệ thống bằng một giao diện. (P)', NULL, NULL, 1, NULL, 3, 's7.5'),
(363, '3s7.5.3', NULL, 'P - Tham gia', '3. Tham gia các cuộc họp để tinh chỉnh các yêu cầu được phân bổ cho phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's7.5'),
(364, '3s7.5.4', NULL, 'L - Dẫn dắt', '4. Dẫn dắt khả năng truy xuất nguồn gốc từ các yêu cầu hệ thống đến các yêu cầu phần mềm. (L)', NULL, NULL, 1, NULL, 3, 's7.5'),
(365, '3s7.5.5', NULL, 'L - Dẫn dắt', '5. Dẫn dắt trong việc làm rõ và tinh chỉnh các yêu cầu được phân bổ cho phần mềm. (L)', NULL, NULL, 1, NULL, 3, 's7.5'),
(366, '3s7.6.1', NULL, 'P - Tham gia', '1. Xác định các thành phần phần mềm cần thiết. (P)', NULL, NULL, 1, NULL, 3, 's7.6'),
(367, '3s7.6.2', NULL, 'P - Tham gia', '2. Xác định các quyết định mua hoặc xây dựng các thành phần phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's7.6'),
(368, '3s7.6.3', NULL, 'P/L - Tham gia/Dẫn dắt', '3. Phát triển và tích hợp các thành phần phần mềm. (P/L)', NULL, NULL, 1, NULL, 3, 's7.6'),
(369, '3s7.7.1', NULL, 'P - Tham gia', '1. Tham gia tích hợp phần mềm với các thành phần khác của hệ thống. (P)', NULL, NULL, 1, NULL, 3, 's7.7'),
(370, '3s7.7.2', NULL, 'P - Tham gia', '2. Tham gia các hoạt động xác minh hệ thống. (P)', NULL, NULL, 1, NULL, 3, 's7.7'),
(371, '3s7.7.3', NULL, 'P - Tham gia', '3. Cung cấp liên lạc cho các kỹ sư linh kiện phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's7.7'),
(372, '3s7.8.1', NULL, 'P - Tham gia', '1. Tham gia kiểm thử hệ thống theo cách mô phỏng trực tiếp. (P)', NULL, NULL, 1, NULL, 3, 's7.8'),
(373, '3s7.8.2', NULL, 'P - Tham gia', '2. Tham gia kiểm thử nghiệm thu/chấp nhận hệ thống. (P)', NULL, NULL, 1, NULL, 3, 's7.8'),
(374, '3s7.8.3', NULL, 'P - Tham gia', '3. Tham gia với tư cách là người liên lạc với các kỹ sư linh kiện phần mềm trong quá trình xác thực và triển khai hệ thống. (P)', NULL, NULL, 1, NULL, 3, 's7.8'),
(375, '3s7.9.1', NULL, 'P - Tham gia', '1. Tham gia xác định các bên liên quan, phát triển kế hoạch chuyển đổi và đưa ra các yêu cầu hỗ trợ hoạt động. (P)', NULL, NULL, 1, NULL, 3, 's7.9'),
(376, '3s7.9.2', NULL, 'P - Tham gia', '2. Chuẩn bị hỗ trợ vận hành. (P)', NULL, NULL, 1, NULL, 3, 's7.9'),
(377, '3s8.1.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Thiết lập các tiêu chuẩn chất lượng cho sản phẩm. (P/L)', NULL, NULL, 1, NULL, 3, 's8.1'),
(378, '3s8.1.2', NULL, 'P - Tham gia', '2. Chọn các quy trình quản lý chất lượng phần mềm sao cho hỗ trợ các mục tiêu chất lượng được xác định cho dự án. (P)', NULL, NULL, 1, NULL, 3, 's8.1'),
(379, '3s8.1.3', NULL, 'P - Tham gia', '3. Xác định các đặc tính và các thuộc tính chất lượng cho sản phẩm, đồng thời thiết lập các điều cần ưu tiên. (P)', NULL, NULL, 1, NULL, 3, 's8.1'),
(380, '3s8.1.4', NULL, 'P - Tham gia', '4. Xác định các mô hình chất lượng cần tuân theo cho dự án. (P)', NULL, NULL, 1, NULL, 3, 's8.1'),
(381, '3s8.1.5', NULL, 'P - Tham gia', '5. Phát triển kế hoạch đảm bảo chất lượng cho dự án. (P)', NULL, NULL, 1, NULL, 3, 's8.1'),
(382, '3s8.1.6', NULL, 'P - Tham gia', '6. Xác định các bên liên quan thích hợp có thẩm quyển và trách nhiệm giải trình liên quan đến chất lượng của quy trình và sản phẩm. (P)', NULL, NULL, 1, NULL, 3, 's8.1'),
(383, '3s8.1.7', NULL, 'P/L - Tham gia/Dẫn dắt', '7. Xác định các cách đo lường thích hợp để hỗ trợ trong việc đạt được các mục tiêu về chất lượng sản phẩm. (P/L)', NULL, NULL, 1, NULL, 3, 's8.1'),
(384, '3s8.1.8', NULL, 'P/L - Tham gia/Dẫn dắt', '8. Xác định các công cụ và tài nguyên thích hợp cần sử dụng để đạt được các mục tiêu về chất lượng sản phẩm. (P/L)', NULL, NULL, 1, NULL, 3, 's8.1'),
(385, '3s8.1.9', NULL, 'P/L - Tham gia/Dẫn dắt', '9. Xác minh các mục tiêu và các yêu cầu về chất lượng được đáp ứng. (P/L)', NULL, NULL, 1, NULL, 3, 's8.1'),
(386, '3s8.1.10', NULL, 'L - Dẫn dắt', '10. Xác định các cơ hội cải tiến liên tục trong toàn bộ dự án. (L)', NULL, NULL, 1, NULL, 3, 's8.1'),
(387, '3s8.2.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Xác định các quy trình đánh giá phù hợp cần thiết để đạt được các mục tiêu về chất lượng sản phẩm. (P/L)', NULL, NULL, 1, NULL, 3, 's8.2'),
(388, '3s8.2.2', NULL, 'P - Tham gia', '2. Xác định nhân sự thích hợp cần tham gia vào các hoạt động đánh giá. (P)', NULL, NULL, 1, NULL, 3, 's8.2'),
(389, '3s8.2.3', NULL, 'P - Tham gia', '3. Xác định các cách đo lường thích hợp cần được thu thập như một phần của quá trình đánh giá sản phẩm. (P)', NULL, NULL, 1, NULL, 3, 's8.2'),
(390, '3s8.2.4', NULL, 'P - Tham gia', '4. Xác định các sản phẩm phụ đi kèm thích hợp theo đánh giá và danh sách kiểm tra tương ứng. (P)', NULL, NULL, 1, NULL, 3, 's8.2'),
(391, '3s8.2.5', NULL, 'P - Tham gia', '5. Phân tích dữ liệu sản phẩm được thu thập nhằm mục đích phân tích nguyên nhân gốc rễ và thẩm định tính hiệu quả của đánh giá. (P)', NULL, NULL, 1, NULL, 3, 's8.2'),
(392, '3s8.2.6', NULL, 'P - Tham gia', '6. Xác định các hành động khắc phục thích hợp để đạt được sự cải tiến cho sản phẩm. (P)', NULL, NULL, 1, NULL, 3, 's8.2'),
(393, '3s8.2.7', NULL, 'P - Tham gia', '7. Dẫn dắt nhóm đánh giá. (P)', NULL, NULL, 1, NULL, 3, 's8.2'),
(394, '3s8.3.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Lập kế hoạch, tổ chức và tiến hành các buổi kiểm tra độc lập. (P/L)', NULL, NULL, 1, NULL, 3, 's8.3'),
(395, '3s8.3.2', NULL, 'P - Tham gia', '2. Phân loại các vấn đề được xác định qua các buổi kiểm tra độc lập. (P)', NULL, NULL, 1, NULL, 3, 's8.3'),
(396, '3s8.3.3', NULL, 'P - Tham gia', '3. Thiết lập và triển khai các chiến lược giải pháp phù hợp cho các vấn đề được xác định. (P)', NULL, NULL, 1, NULL, 3, 's8.3'),
(397, '3s8.4.1', NULL, 'L - Dẫn dắt', '1. Phân tích dữ liệu đã thu thập. (L)', NULL, NULL, 1, NULL, 3, 's8.4'),
(398, '3s8.4.2', NULL, 'P - Tham gia', '2. Triển khai một tập hợp của các quy trình kiểm soát. (P)', NULL, NULL, 1, NULL, 3, 's8.4'),
(399, '3s8.4.3', NULL, 'A - Hỗ trợ', '3. Đánh giá tính hiệu quả của các quy trình kiểm soát. (A)', NULL, NULL, 1, NULL, 3, 's8.4'),
(400, '3s9.1.1', NULL, 'P - Tham gia', '1. Xác định các rủi ro bảo mật (ví dụ như các trường hợp sử dụng sai) (P)', NULL, NULL, 1, NULL, 3, 's9.1'),
(401, '3s9.1.2', NULL, 'P - Tham gia', '2. Tạo các yêu cầu để nắm bắt các vấn đề bảo mật. (P)', NULL, NULL, 1, NULL, 3, 's9.1'),
(402, '3s9.1.3', NULL, 'P - Tham gia', '3. Thực hiện mô hình hóa mối đe dọa ban đầu. (P)', NULL, NULL, 1, NULL, 3, 's9.1'),
(403, '3s9.2.1', NULL, 'P - Tham gia', '1. Mô hình hóa các mối đe dọa, các rủi ro liên quan của các hệ thống mới và các hệ thống vừa được sửa đổi. (P)', NULL, NULL, 1, NULL, 3, 's9.2'),
(404, '3s9.2.2', NULL, 'P - Tham gia', '2. Xác định bề mặt tấn công (hay nói cách khác, là các khu vực tiềm ẩn các điểm yếu dễ bị những kẻ tấn công khai thác) của các hệ thống mới và các hệ thống vừa được sửa đổi. (P)', NULL, NULL, 1, NULL, 3, 's9.2'),
(405, '3s9.3.1', NULL, 'P - Tham gia', '1. Chọn và thiết lập cá tiêu chuẩn mã hoá dự án để tránh các lỗ hỏng bảo mật. (P)', NULL, NULL, 1, NULL, 3, 's9.3'),
(406, '3s9.3.2', NULL, 'P - Tham gia', '2. Đánh giá và phê duyệt các tiêu chuẩn mã hoá để tránh các lỗ hỏng bảo mật. (P)', NULL, NULL, 1, NULL, 3, 's9.3'),
(407, '3s9.5.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Chọn ra các công cụ phân tích mã nguồn tĩnh thích hợp để xác định các lỗ hỏng bảo mật. (P/L)', NULL, NULL, 1, NULL, 3, 's9.5'),
(408, '3s10.1.1', NULL, 'P - Tham gia', '1. Sử dụng các công cụ, tiến hành phân tích mối nguy cơ chính thức của hệ thống để xác minh các mô hình an toàn. (P)', NULL, NULL, 1, NULL, 3, 's10.1'),
(409, '3s10.1.2', NULL, 'P - Tham gia', '2. Xác định các yêu cầu an toàn. (P)', NULL, NULL, 1, NULL, 3, 's10.1'),
(410, '3s10.1.3', NULL, 'P - Tham gia', '3. Đảm bảo các yêu cầu an toàn được bao gồm trong tổng thể các yêu cầu hệ thống. (P)', NULL, NULL, 1, NULL, 3, 's10.1'),
(411, '3s10.2.1', NULL, 'P - Tham gia', '1. Đề xuất và lựa chọn các giải pháp thiết kế để đảm bảo giảm thiểu các nguy cơ. (P)', NULL, NULL, 1, NULL, 3, 's10.2'),
(412, '3s10.2.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Giám sát nhóm thiết kế. Phân tích rủi ro và xác minh thiết kế từ góc độ an toàn. (P/L)', NULL, NULL, 1, NULL, 3, 's10.2'),
(413, '3s10.3.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Triển khai kiến trúc và thiết kế để chắc chắn độ an toàn của mã nguồn. (P/L)', NULL, NULL, 1, NULL, 3, 's10.3'),
(414, '3s10.3.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Quản lý giao diện của các thành phần mã nguồn lớn với sự chú ý đặc biệt đến các vấn đề an toàn tiềm ẩn. (P/L)', NULL, NULL, 1, NULL, 3, 's10.3'),
(415, '3s10.4.1', NULL, 'P - Tham gia', '1. Chọn ra các kỹ thuật thử nghiệm thích hợp để đảm bảo sự an toàn của ứng dụng. (P)', NULL, NULL, 1, NULL, 3, 's10.4'),
(416, '3s10.4.2', NULL, 'P - Tham gia', '2. Áp dụng các tiêu chuẩn chuyên ngành có thể áp dụng để đảm bảo sản phẩm đáp ứng với các tiêu chí an toàn trong chuyên ngành. (P)', NULL, NULL, 1, NULL, 3, 's10.4'),
(417, '3s10.5.1', NULL, 'P - Tham gia', '1. Đóng góp và xác minh tính đầy đủ của trường hợp an toàn, tuân theo các tiêu chí chuyên ngành đã được chọn. (P)', NULL, NULL, 1, NULL, 3, 's10.5'),
(418, '3s10.6.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Giám sát việc thu thập dữ liệu quản lý chất lượng và khả năng tương thích của dữ liệu với trường hợp an toàn. (P/L)', NULL, NULL, 1, NULL, 3, 's10.6'),
(419, '3s11.1.1', NULL, 'P - Tham gia', '1. Tham gia xác định tác động của các ràng buộc trong quản lý cấu hình phần mềm được áp dụng bởi chính sách, hợp đồng và vòng đời phát triển phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's11.1'),
(420, '3s11.1.2', NULL, 'L - Dẫn dắt', '2. Phát triển và duy trì kế hoạch quản lý cấu hình phần mềm. (L)', NULL, NULL, 1, NULL, 3, 's11.1'),
(421, '3s11.1.3', NULL, 'A - Hỗ trợ', '3. Hỗ trợ xác định các cách đo lường quản lý cấu hình phần mềm sẽ sử dụng. (A)', NULL, NULL, 1, NULL, 3, 's11.1'),
(422, '3s11.1.4', NULL, 'P - Tham gia', '4. Tham gia xác định các mục cấu hình phần mềm và xác định các mối quan hệ giữa chúng. (P)', NULL, NULL, 1, NULL, 3, 's11.1'),
(423, '3s11.1.5', NULL, 'P - Tham gia', '5. Mua các công cụ quản lý cấu hình phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's11.1'),
(424, '3s11.2.1', NULL, 'P - Tham gia', '1. Đánh giá và báo cáo đến ban kiểm soát thay đổi (Change control board - CCB) về tác động của các thay đổi được đề xuất đối với các mục cấu hình phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's11.2'),
(425, '3s11.2.2', NULL, 'L - Dẫn dắt', '2. Tạo, phân loại và quản lý các báo cáo về sự cố. (L)', NULL, NULL, 1, NULL, 3, 's11.2'),
(426, '3s11.2.3', NULL, 'P - Tham gia', '3. Sử dụng các thủ tục đã thiết lập để tạo và duy trì thư viện quản lý cấu hình phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's11.2'),
(427, '3s11.2.4', NULL, 'P - Tham gia', '4. Sử dụng các cơ chế được thiết lập để ghi lại, báo cáo thông tin quản lý cấu hình phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's11.2'),
(428, '3s11.2.5', NULL, 'P - Tham gia', '5. Phát triển và điều chỉnh các công cụ để tạo các báo cáo kiểm tra độc lập trong việc quản lý cấu hình phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's11.2'),
(429, '3s11.3.1', NULL, 'P - Tham gia', '1. Tham gia phát triển các kế hoạch phát hành phần mềm. (P)', NULL, NULL, 1, NULL, 3, 's11.3'),
(430, '3s11.3.2', NULL, 'L - Dẫn dắt', '2. Dẫn dắt xây dựng và xác minh các bản phát hành phần mềm. (L)', NULL, NULL, 1, NULL, 3, 's11.3'),
(431, '3s11.3.3', NULL, 'P - Tham gia', '3. Triển khai các kế hoạch phát hành. (P)', NULL, NULL, 1, NULL, 3, 's11.3'),
(432, '3s12.1.1', NULL, 'P - Tham gia', '1. Tham gia xác định các cách đo lường cần thiết cho một dự án hay chương trình. (P)', NULL, NULL, 1, NULL, 3, 's12.1'),
(433, '3s12.1.2', NULL, 'A - Hỗ trợ', '2. Hỗ trợ lựa chọn các thước đo và các thang đo. (A)', NULL, NULL, 1, NULL, 3, 's12.1'),
(434, '3s12.1.3', NULL, 'P - Tham gia', '3. Thiết lập các phương pháp thu thập và phân tích dữ liệu. (P)', NULL, NULL, 1, NULL, 3, 's12.1'),
(435, '3s12.1.4', NULL, 'P - Tham gia', '4. Tham gia đặt ra các giá trị và các ngưỡng mục tiêu cần đạt. (P)', NULL, NULL, 1, NULL, 3, 's12.1'),
(436, '3s12.1.5', NULL, 'P - Tham gia', '5. Tham gia thiết lập các định dạng báo cáo và thiết lập các thủ tục báo cáo. (P)', NULL, NULL, 1, NULL, 3, 's12.1'),
(437, '3s12.1.6', NULL, 'P - Tham gia', '6. Xác định các công cụ đo lường và các thủ tục đo lường thủ công. (P)', NULL, NULL, 1, NULL, 3, 's12.1'),
(438, '3s12.1.7', NULL, 'P - Tham gia', '7. Lập kế hoạch lưu trữ dữ liệu. (P)', NULL, NULL, 1, NULL, 3, 's12.1'),
(439, '3s12.1.8', NULL, 'P - Tham gia', '8. Lựa chọn các phương pháp thu thập và phân tích dữ liệu. (P)', NULL, NULL, 1, NULL, 3, 's12.1'),
(440, '3s12.1.9', NULL, 'A - Hỗ trợ', '9. Lựa chọn các công cụ đo lường và các thủ tục thủ công. (A)', NULL, NULL, 1, NULL, 3, 's12.1'),
(441, '3s12.2.1', NULL, 'P - Tham gia', '1. Xác thực dữ liệu đã thu thập. (P)', NULL, NULL, 1, NULL, 3, 's12.2'),
(442, '3s13.1.1', NULL, 'P - Tham gia', '1. Đánh giá việc xác định các bên liên quan để cung cấp các yêu cầu tương tác giữa người và máy tính. (P)', NULL, NULL, 1, NULL, 3, 's13.1'),
(443, '3s13.1.2', NULL, 'P - Tham gia', '2. Hỗ trợ lựa chọn mô hình quy trình để phát triển giao diện tương tác giữa người và máy tính. (P)', NULL, NULL, 1, NULL, 3, 's13.1'),
(444, '3s13.1.3', NULL, 'A - Hỗ trợ', '3. Đề xuất các công cụ tương tác giữa người và máy tính để sử dụng cho dự án. (A)', NULL, NULL, 1, NULL, 3, 's13.1'),
(445, '3s13.1.4', NULL, 'P - Tham gia', '4. Đánh giá, tinh chỉnh việc xác định đối tượng người dùng và mô tả các thuộc tính liên quan của họ. (P)', NULL, NULL, 1, NULL, 3, 's13.1'),
(446, '3s13.1.5', NULL, 'L - Dẫn dắt', '5. Dẫn dắt trong việc xác định các yêu cầu của giao diện người dùng. (L)', NULL, NULL, 1, NULL, 3, 's13.1'),
(447, '3s13.1.6', NULL, 'P - Tham gia', '6. Đánh giá, tinh chỉnh các nguyên mẫu, các bài kiểm tra để khơi gợi và tinh chỉnh các yêu cầu về giao diện người dùng. (P)', NULL, NULL, 1, NULL, 3, 's13.1'),
(448, '3s13.1.7', NULL, 'P - Tham gia', '7. Sử dụng các nguyên mẫu để khơi gợi và tinh chỉnh các yêu cầu về giao diện người dùng. (P)', NULL, NULL, 1, NULL, 3, 's13.1'),
(449, '3s13.1.8', NULL, 'P - Tham gia', '8. Xác định các yêu cầu về giao diện kỹ thuật (giữa giao diện người dùng và các thành phần hệ thống). (P)', NULL, NULL, 1, NULL, 3, 's13.1'),
(450, '3s13.1.9', NULL, 'P - Tham gia', '9. Thiết kế chi tiết cho các yêu cầu về giao diện kỹ thuật (giữa giao diện người dùng và các thành phần hệ thống). (P)', NULL, NULL, 1, NULL, 3, 's13.1'),
(451, '3s13.2.1', NULL, 'L - Dẫn dắt', '1. Đánh giá, tinh chỉnh các trường hợp sử dụng, các kịch bản, các hộp thoại tương tác và các bảng phân cảnh. (L)', NULL, NULL, 1, NULL, 3, 's13.2'),
(452, '3s13.2.2', NULL, 'P - Tham gia', '2. Xác định các lỗi đầu vào của người dùng và xác định các phương pháp xử lý lỗi. (P)', NULL, NULL, 1, NULL, 3, 's13.2'),
(453, '3s13.2.3', NULL, 'P - Tham gia', '3. Áp dụng các phép ẩn dụ và các mô hình khái niệm để xác định phong cách tương tác. (P)', NULL, NULL, 1, NULL, 3, 's13.2'),
(454, '3s13.2.4', NULL, 'P - Tham gia', '4. Xác định và tinh chỉnh các chế độ tương tác. (P)', NULL, NULL, 1, NULL, 3, 's13.2'),
(455, '3s13.2.5', NULL, 'P - Tham gia', '5. Đánh giá và tinh chỉnh các nguyên mẫu giao diện. (P)', NULL, NULL, 1, NULL, 3, 's13.2'),
(456, '3s13.3.1', NULL, 'P - Tham gia', '1. Thiết kế bố cục trang/màn hình. (P)', NULL, NULL, 1, NULL, 3, 's13.3'),
(457, '3s13.3.2', NULL, 'P - Tham gia', '2. Lựa chọn từ các biểu tượng có sẵn và thiết kế các biểu tượng mới. (P)', NULL, NULL, 1, NULL, 3, 's13.3'),
(458, '3s13.3.3', NULL, 'P - Tham gia', '3. Chọn lựa chủ đề màu sắc, các kiểu và cỡ chữ. (P)', NULL, NULL, 1, NULL, 3, 's13.3'),
(459, '3s13.3.4', NULL, 'P - Tham gia', '4. Thiết kế các bảng. (P)', NULL, NULL, 1, NULL, 3, 's13.3'),
(460, '3s13.3.5', NULL, 'P - Tham gia', '5. Đánh giá các lựa chọn về chủ đề màu sắc, các kiểu và cỡ chữ, đồng thời kiểm tra lựa chọn so với các tiêu chuẩn áp dụng. (P)', NULL, NULL, 1, NULL, 3, 's13.3'),
(461, '3s13.3.6', NULL, 'P - Tham gia', '6. Đánh giá và sửa đổi các mô hình và các bản phát thảo với các bên liên quan. (P)', NULL, NULL, 1, NULL, 3, 's13.3'),
(462, '3s13.4.1', NULL, 'P - Tham gia', '1. Lựa chọn và điều chỉnh một hay nhiều danh sách kiểm tra khả năng sử dụng. (P)', NULL, NULL, 1, NULL, 3, 's13.4'),
(463, '3s13.4.2', NULL, 'F - Tuân theo', '2. Xác định các đối tượng đại diện kiểm tra từ nhóm đối tượng người dùng. (F)', NULL, NULL, 1, NULL, 3, 's13.4'),
(464, '3s13.4.3', NULL, 'P/F - Tham gia/Tuân theo', '3. Đánh giá các kết quả của việc phân tích danh sách kiểm tra và đề xuất các thay đổi về thiết kế. (P/F)', NULL, NULL, 1, NULL, 3, 's13.4'),
(465, '3s13.4.4', NULL, 'P - Tham gia', '4. Lấy các đối tượng kiểm tra. (P)', NULL, NULL, 1, NULL, 3, 's13.4'),
(466, '3s13.4.5', NULL, 'P - Tham gia', '5. Thiết kế các bài kiểm tra khả năng sử dụng. (P)', NULL, NULL, 1, NULL, 3, 's13.4'),
(467, '3s13.4.6', NULL, 'P/L - Tham gia/Dẫn dắt', '6. Giám sát các bài kiểm tra khả năng sử dụng. (P/L)', NULL, NULL, 1, NULL, 3, 's13.4'),
(468, '3s13.4.7', NULL, 'P - Tham gia', '7. Đưa ra các khuyến nghị dựa trên phân tích các kết quả kiểm tra khả năng sử dụng. (P)', NULL, NULL, 1, NULL, 3, 's13.4'),
(469, '3s13.5.1', NULL, 'P - Tham gia', '1. Xác định các nhu cầu tiếp cận cho các giao diện người dùng. (P)', NULL, NULL, 1, NULL, 3, 's13.5'),
(470, '3s13.5.2', NULL, 'P - Tham gia', '2. Phát triển các tiêu chí nghiệm thu/chấp nhận và các bài kiểm tra cho các khía cạnh về khả năng tiếp cận của giao diện người dùng. (P)', NULL, NULL, 1, NULL, 3, 's13.5'),
(471, '3s13.5.3', NULL, 'P - Tham gia', '3. Xác định các nhu cầu về khả năng tiếp cận quốc tế (ngôn ngữ, cân nhắc văn hóa,...). (P)', NULL, NULL, 1, NULL, 3, 's13.5'),
(472, '3s13.5.4', NULL, 'P - Tham gia', '4. Lựa chọn các công cụ và các kỹ thuật để cung cấp khả năng tiếp cận cần thiết. (P)', NULL, NULL, 1, NULL, 3, 's13.5'),
(473, '4s1.1.1', NULL, 'L - Dẫn dắt', '1. Lựa chọn các phương pháp thích hợp để cam kết và liên lạc với các bên liên quan trong các hoạt động lấy yêu cầu. (L)', NULL, NULL, 1, NULL, 4, 's1.1'),
(474, '4s1.1.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Đàm phán xung đột giữa các bên liên quan trong việc làm rõ các yêu cầu. (P/L)', NULL, NULL, 1, NULL, 4, 's1.1'),
(475, '4s1.2.1', NULL, 'P - Tham gia', '1. Chỉ đạo trong việc xác định các thuộc tính và yêu cầu mới sẽ xuất hiện trong suốt vòng đời phát triển phần mềm. (P)', NULL, NULL, 1, NULL, 4, 's1.2'),
(476, '4s1.3.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo trong việc phát triển đặc tả yêu cầu phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's1.3'),
(477, '4s1.3.2', NULL, 'L - Dẫn dắt', '2. Lựa chọn các ghi chú/ký hiệu chính thức và không chính thức thích hợp nhất để mô tả các giao diện, các yêu cầu chức năng và các yêu cầu phi chức năng (L)', NULL, NULL, 1, NULL, 4, 's1.3'),
(478, '4s1.4.1', NULL, 'L - Dẫn dắt', '1. Lựa chọn các kĩ thuật xác thực và xác minh các yêu cầu theo cách chính thức hoặc không chính thức một cách phù hợp nhất.  (L)', NULL, NULL, 1, NULL, 4, 's1.4'),
(479, '4s1.4.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Đàm phán các xung đột giữa các bên liên quan trong việc xác minh yêu cầu. (P/L)', NULL, NULL, 1, NULL, 4, 's1.4'),
(480, '4s2.1.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Đánh giá hiệu quả việc ứng dụng các kỹ thuật hỗ trợ trong thiết kế phần mềm. (P/L)', NULL, NULL, 1, NULL, 4, 's2.1'),
(481, '4s2.1.2', NULL, 'L - Dẫn dắt', '2. Cung cấp định hướng và đưa ra lời khuyên về các phương pháp, các kỹ thuật sẽ được sử dụng trong các lĩnh vực cùng một lúc, cũng như trong xử lý các sự kiện, ổn định dữ liệu hoặc phân phối phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's2.1'),
(482, '4s2.2.1', NULL, 'L - Dẫn dắt', '1. Xác định quy trình và chiến lược sẽ được sử dụng trong thiết kế phần mềm theo cấp độ của dự án (ví dụ như từ trên xuống dưới hoặc từ dưới lên trên, tinh chỉnh theo từng bước, sử dụng các mẫu và các ngôn ngữ mẫu, các quy trình lặp đi lặp lại và tăng dần,...). (L)', NULL, NULL, 1, NULL, 4, 's2.2'),
(483, '4s2.2.2', NULL, 'L - Dẫn dắt', '2. Lựa chọn phương pháp luận thiết kế (ví dụ như hướng đối tượng, hướng chức năng, dựa trên thành phần) và các chiến lược thiết kế phù hợp sẽ được sử dụng cho cấp độ dự án. (L)', NULL, NULL, 1, NULL, 4, 's2.2'),
(484, '4s2.2.3', NULL, 'L - Dẫn dắt', '3. Cung cấp hướng dẫn và đưa ra lời khuyên về việc sử dụng các chiến lược, các phương pháp luận thiết kế phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's2.2'),
(485, '4s2.2.4', NULL, 'P/L - Tham gia/Dẫn dắt', '4. Đánh giá hiệu quả của việc ứng dụng phương pháp luận thiết kế phần mềm đã chọn. (P/L)', NULL, NULL, 1, NULL, 4, 's2.2'),
(486, '4s2.2.5', NULL, 'L - Dẫn dắt', '5. Xác định các lựa chọn thay thế thiết kế và thực hiện phân tích đánh đổi. (L)', NULL, NULL, 1, NULL, 4, 's2.2'),
(487, '4s2.3.1', NULL, 'L - Dẫn dắt', '1. Cung cấp hướng dẫn và đưa ra lời khuyên về các ký hiệu/ghi chú dạng chuẩn, các kỹ thuật lập sơ đồ, các mô hình và các mẫu sẽ được áp dụng. (L)', NULL, NULL, 1, NULL, 4, 's2.3'),
(488, '4s2.3.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Đánh giá hiệu quả của việc tạo ra kiến trúc phần mềm. (P/L)', NULL, NULL, 1, NULL, 4, 's2.3'),
(489, '4s2.4.1', NULL, 'L - Dẫn dắt', '1. Lựa chọn các công cụ và các kỹ thuật phù hợp (ví dụ như các đánh giá thiết kế, phân tích mã nguồn tĩnh, mô phỏng và nguyên mẫu, các chỉ số thiết kế) để đảm bảo chất lượng thiết kế phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's2.4'),
(490, '4s2.4.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Sử dụng các kết quả của các hoạt động đánh giá chất lượng thiết kế phần mềm để đánh giá chất lượng của thiết kế và quyết định hành động khắc phục (nếu cần). (P/L)', NULL, NULL, 1, NULL, 4, 's2.4'),
(491, '4s2.4.3', NULL, 'P/L - Tham gia/Dẫn dắt', '3. Cung cấp hướng dẫn và định hướng liên quan đến nhu cầu cần thay đổi yêu cầu từ việc đánh giá thiết kế. (P/L)', NULL, NULL, 1, NULL, 4, 's2.4'),
(492, '4s3.1.1', NULL, 'L - Dẫn dắt', '1. Lựa chọn các quy trình và các mô hình thích hợp để xây dựng phần mềm trên các dự án riêng lẻ (ví dụ như biên dịch và tạo từ ngôn ngữ miền chuyên biệt). (L)', NULL, NULL, 1, NULL, 4, 's3.1'),
(493, '4s3.1.2', NULL, 'L - Dẫn dắt', '2. Lựa chọn các ngôn ngữ và công cụ thích hợp để xây dựng phần mềm trên các dự án riêng lẻ. (L)', NULL, NULL, 1, NULL, 4, 's3.1'),
(494, '4s3.1.3', NULL, 'L - Dẫn dắt', '3. Lựa chọn các khung phần mềm, các nền tảng và các môi trường thích hợp cho các dự án riêng lẻ. (L)', NULL, NULL, 1, NULL, 4, 's3.1'),
(495, '4s3.2.1', NULL, 'L - Dẫn dắt', '1. Thiết lập các tiêu chuẩn dự án để kiểm soát phiên bản và quản lý cấu hình. (L)', NULL, NULL, 1, NULL, 4, 's3.2'),
(496, '4s3.3.1', NULL, 'L - Dẫn dắt', '1. Đo lường và giám sát việc sử dụng các mẫu thiết kế của một tổ chức. (L)', NULL, NULL, 1, NULL, 4, 's3.3'),
(497, '4s3.3.2', NULL, 'L - Dẫn dắt', '2. Lập kế hoạch và khởi tạo các quy trình phát triển theo hướng mô hình sao cho phù hợp. (L)', NULL, NULL, 1, NULL, 4, 's3.3'),
(498, '4s3.4.1', NULL, 'L - Dẫn dắt', '1. Thiết lập các tiêu chuẩn dự án cho phạm vi kiểm tra đơn vị. (L)', NULL, NULL, 1, NULL, 4, 's3.4'),
(499, '4s3.4.2', NULL, 'L - Dẫn dắt', '2. Chọn lựa các công cụ và các kỹ thuật gỡ lỗi thích hợp cho một dự án. (L)', NULL, NULL, 1, NULL, 4, 's3.4'),
(500, '4s3.5.1', NULL, 'P - Tham gia', '1. Hỗ trợ lựa chọn các công cụ và các quy trình cho dự án để tích hợp. (P)', NULL, NULL, 1, NULL, 4, 's3.5'),
(501, '4s4.1.1', NULL, 'P - Tham gia', '1. Thiết lập các thủ tục có tổ chức cho kiểm thử. (P)', NULL, NULL, 1, NULL, 4, 's4.1'),
(502, '4s4.1.2', NULL, 'L - Dẫn dắt', '2. Xác định các đại diện khách hàng và các bên liên quan khác tham gia kiểm thử và thử nghiệm nghiệm thu/chấp nhận. (L)', NULL, NULL, 1, NULL, 4, 's4.1'),
(503, '4s4.1.3', NULL, 'L - Dẫn dắt', '3. Xác định các mục tiêu thử nghiệm của dự án. (L)', NULL, NULL, 1, NULL, 4, 's4.1'),
(504, '4s4.1.4', NULL, 'P - Tham gia', '4. Xác định các tiêu chí thành công và thất bại cho việc kiểm thử hệ thống và kiểm thử nghiệm thu/chấp nhận. (P)', NULL, NULL, 1, NULL, 4, 's4.1'),
(505, '4s4.1.5', NULL, 'P - Tham gia', '5. Xác định các tiêu chí hoàn thành thử nghiệm. (P)', NULL, NULL, 1, NULL, 4, 's4.1'),
(506, '4s4.2.1', NULL, 'P - Tham gia', '1. Xác định các công cụ kiểm thử và kho dữ liệu kiểm thử thông qua các dự án. (P)', NULL, NULL, 1, NULL, 4, 's4.2'),
(507, '4s4.3.1', NULL, 'L - Dẫn dắt', '1. Thiết kế kế hoạch kiểm thử hệ thống và các trường hợp kiểm thử. (L)', NULL, NULL, 1, NULL, 4, 's4.3'),
(508, '4s4.3.2', NULL, 'L/P - Dẫn dắt/Tham gia', '2. Xác định các cơ hội kiểm thử tự động. (L/P)', NULL, NULL, 1, NULL, 4, 's4.3'),
(509, '4s4.4.1', NULL, 'L/P - Dẫn dắt/Tham gia', '1. Tiến hành phân tích nguyên nhân gốc rễ. (L/P)', NULL, NULL, 1, NULL, 4, 's4.4'),
(510, '4s4.4.2', NULL, 'L - Dẫn dắt', '2. Phân tích dữ liệu kiểm thử để quyết định các hoạt động kiểm thử tiếp theo. (L)', NULL, NULL, 1, NULL, 4, 's4.4'),
(511, '4s4.4.3', NULL, 'L - Dẫn dắt', '3. Sử dụng dữ liệu để đánh giá hiệu quả của việc kiểm thử. (L)', NULL, NULL, 1, NULL, 4, 's4.4'),
(512, '4s4.4.4', NULL, 'P - Tham gia', '4. Đánh giá các kết quả kiểm thử để xác định các cơ hội cải tiến quy trình phù hợp. (P)', NULL, NULL, 1, NULL, 4, 's4.4'),
(513, '4s4.4.5', NULL, 'L - Dẫn dắt', '5. Giám sát tổng thể quy trình kiểm thử bằng cách đánh giá tỉ lệ xuất hiện lỗi, cường độ lỗi,... (L)', NULL, NULL, 1, NULL, 4, 's4.4'),
(514, '4s5.1.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo trong việc phát triển các kế hoạch chuyển đổi. (L)', NULL, NULL, 1, NULL, 4, 's5.1'),
(515, '4s5.1.2', NULL, 'L - Dẫn dắt', '2. Chỉ đạo trong việc xác định các bên liên quan đến các yêu cầu chuyển đổi và các yêu cầu vận hành. (L)', NULL, NULL, 1, NULL, 4, 's5.1'),
(516, '4s5.1.3', NULL, 'L - Dẫn dắt', '3. Chỉ đạo trong việc xác định các ràng buộc cho hệ thống và phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's5.1'),
(517, '4s5.1.4', NULL, 'L - Dẫn dắt', '4. Sửa đổi những cái hiện có và phát triển cái mới cho các tiêu chuẩn vận hành của các hệ thống và phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's5.1'),
(518, '4s5.1.5', NULL, 'L - Dẫn dắt', '5. Phê duyệt tài liệu về việc chuyển đổi và vận hành của phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's5.1'),
(519, '4s5.1.6', NULL, 'L - Dẫn dắt', '6. Phê duyệt việc cài đặt phần mềm mới. (L)', NULL, NULL, 1, NULL, 4, 's5.1'),
(520, '4s5.1.7', NULL, 'L - Dẫn dắt', '7. Phê duyệt tài nguyên đào tạo cho nhân viên hỗ trợ vận hành. (L)', NULL, NULL, 1, NULL, 4, 's5.1'),
(521, '4s5.1.8', NULL, 'L - Dẫn dắt', '8. Phê duyệt các thủ tục kích hoạt và kiểm tra hệ thống phần mềm lần cuối. (L)', NULL, NULL, 1, NULL, 4, 's5.1'),
(522, '4s5.1.9', NULL, 'L - Dẫn dắt', '9. Chỉ đạo trong việc xác định các tác động của thay đổi phần mềm đến môi trường vận hành. (L)', NULL, NULL, 1, NULL, 4, 's5.1'),
(523, '4s5.1.10', NULL, 'L - Dẫn dắt', '10. Chỉ đạo trong việc nghiệm thu/chấp nhận hệ thống. (L)', NULL, NULL, 1, NULL, 4, 's5.1'),
(524, '4s5.2.1', NULL, 'L - Dẫn dắt', '1. Phê duyệt các kế hoạch quản lý cấu hình của phần mềm vận hành. (L)', NULL, NULL, 1, NULL, 4, 's5.2'),
(525, '4s5.2.2', NULL, 'L - Dẫn dắt', '2. Phát triển các kế hoạch đảm bảo phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's5.2'),
(526, '4s5.2.3', NULL, 'C - Tạo mới', '3. Tạo các chính sách bao gồm các hoạt động của bộ phận hỗ trợ. (C)', NULL, NULL, 1, NULL, 4, 's5.2'),
(527, '4s5.2.4', NULL, 'L - Dẫn dắt', '4. Phát triển các kế hoạch thu thập và xử lý dữ liệu vận hành. (L)', NULL, NULL, 1, NULL, 4, 's5.2'),
(528, '4s5.2.5', NULL, 'L - Dẫn dắt', '5. Phát triển các kế hoạch hủy bỏ sự tồn tại của phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's5.2'),
(529, '4s5.3.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo trong việc phát triển các quy trình và các kế hoạch bảo trì phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's5.3'),
(530, '4s5.3.2', NULL, 'P - Tham gia', '2. Chỉ đạo trong việc phân tích vấn đề và phân tích tác động của kỹ thuật. (P)', NULL, NULL, 1, NULL, 4, 's5.3'),
(531, '4s5.3.3', NULL, 'L - Dẫn dắt', '3. Chỉ đạo trong việc việc phát triển các kế hoạch và giám sát các thay đổi đối với phần mềm (sửa chữa, thích ứng và hoàn thiện). (L)', NULL, NULL, 1, NULL, 4, 's5.3'),
(532, '4s5.3.4', NULL, 'L - Dẫn dắt', '4. Lập kế hoạch, giám sát các hoạt động bảo trì định kỳ và tái thiết kế phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's5.3'),
(533, '4s5.3.5', NULL, 'L - Dẫn dắt', '5. Chỉ đạo trong việc giám sát và phân tích các hoạt động bảo trì phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's5.3'),
(534, '4s6.1.1', NULL, 'L - Dẫn dắt', '1. Chọn quy trình mô hình vòng đời cho nhóm phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's6.1'),
(535, '4s6.1.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Hỗ trợ lựa chọn mô hình quy trình vòng đời của một bộ phận hoặc toàn tổ chức. (P/L)', NULL, NULL, 1, NULL, 4, 's6.1'),
(536, '4s6.2.1', NULL, 'L/C - Dẫn dắt/Tạo mới', '1. Chỉ đạo trong việc định nghĩa và điều chỉnh các quy trình phần mềm cho nhóm dự án hoặc cho hoạt động công nghệ phần mềm (ví dụ như các yêu cầu kỹ thuật, thiết kế,...) (L/C)', NULL, NULL, 1, NULL, 4, 's6.2'),
(537, '4s6.2.2', NULL, 'L - Dẫn dắt', '2. Cung cấp hướng dẫn đến những người có tham gia vào quy trình phù hợp. (cá nhân và nhóm). (L)', NULL, NULL, 1, NULL, 4, 's6.2'),
(538, '4s6.3.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo các nhóm lớn hoặc các dự án đa nhóm trong việc triển khai và thực thi một quy trình phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's6.3'),
(539, '4s6.3.2', NULL, 'L/C - Dẫn dắt/Tạo mới', '2. Cung cấp hướng dẫn và đưa ra lời khuyên cho nhóm phần mềm về cách triển khai và quản lý các quy trình phần mềm. (L/C)', NULL, NULL, 1, NULL, 4, 's6.3'),
(540, '4s6.3.3', NULL, 'L - Dẫn dắt', '3. Tham gia với tư cách là một người lãnh đạo của nhóm quy trình công nghệ phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's6.3'),
(541, '4s6.4.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Chỉ đạo các nhóm phần mềm thu thập dữ liệu để đánh giá các quy trình phần mềm. (P/L)', NULL, NULL, 1, NULL, 4, 's6.4'),
(542, '4s6.4.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Phân tích dữ liệu đánh giá quy trình và triển khai cải tiến các quy trình phần mềm theo nhóm. (P/L)', NULL, NULL, 1, NULL, 4, 's6.4'),
(543, '4s6.4.3', NULL, 'L/C - Dẫn dắt/Tạo mới', '3. Chỉ đạo nhóm quy trình công nghệ phần mềm trong việc cung cấp hướng dẫn cải tiến quy trình phần mềm trong một bộ phận hoặc toàn tổ chức. (L/C)', NULL, NULL, 1, NULL, 4, 's6.4'),
(544, '4s7.1.1', NULL, 'P - Tham gia', '1. Tham gia lựa chọn mô hình vòng đời phát triển hệ thống. (P)', NULL, NULL, 1, NULL, 4, 's7.1'),
(545, '4s7.1.2', NULL, 'L - Dẫn dắt', '2. Chỉ đạo trong việc lựa chọn mô hình vòng đời phát triển hệ thống. (L)', NULL, NULL, 1, NULL, 4, 's7.1'),
(546, '4s7.1.3', NULL, 'L - Dẫn dắt', '3. Chỉ đạo trong việc tích hợp mô hình phát triển phần mềm vào mô hình phát triển hệ thống. (L)', NULL, NULL, 1, NULL, 4, 's7.1'),
(547, '4s7.1.4', NULL, 'P/L - Tham gia/Dẫn dắt', '4. Tham gia/Chỉ đạo trong việc điều chỉnh các chính sách, các thủ tục, các mẫu có sẵn sao cho phù hợp; đồng thời lựa chọn các tiêu chuẩn ứng dụng cho các dự án, các chương trình. (P/L)', NULL, NULL, 1, NULL, 4, 's7.1'),
(548, '4s7.2.1', NULL, 'L - Dẫn dắt', '1. Chuẩn bị các tiêu chí để xác định các bên liên quan. (L)', NULL, NULL, 1, NULL, 4, 's7.2'),
(549, '4s7.2.2', NULL, 'L - Dẫn dắt', '2. Chỉ đạo các cuộc họp với bên liên quan. (L)', NULL, NULL, 1, NULL, 4, 's7.2'),
(550, '4s7.2.3', NULL, 'L - Dẫn dắt', '3. Tạo điều kiện cho sự phát triển cho khái niệm về các hoạt động. (L)', NULL, NULL, 1, NULL, 4, 's7.2'),
(551, '4s7.2.4', NULL, 'L - Dẫn dắt', '4. Đạt được sự đồng thuận của các bên liên quan về khái niệm về các hoạt động. (L)', NULL, NULL, 1, NULL, 4, 's7.2'),
(552, '4s7.2.5', NULL, 'P - Tham gia', '5. Phát triển các tiêu chí nghiệm thu/chấp nhận. (P)', NULL, NULL, 1, NULL, 4, 's7.2'),
(553, '4s7.3.1', NULL, 'L - Dẫn dắt', '1. Thiết lập môi trường phát triển hệ thống và xác định các ràng buộc công nghệ. (L)', NULL, NULL, 1, NULL, 4, 's7.3'),
(554, '4s7.3.2', NULL, 'L - Dẫn dắt', '2. Xác định các yêu cầu và các công cụ trong việc truy xuất nguồn gốc cấp hệ thống. (L)', NULL, NULL, 1, NULL, 4, 's7.3'),
(555, '4s7.3.3', NULL, 'L - Dẫn dắt', '3. Chỉ đạo trong việc phát triển đặc tả yêu cầu hệ thống. (L)', NULL, NULL, 1, NULL, 4, 's7.3'),
(556, '4s7.3.4', NULL, 'L - Dẫn dắt', '4. Chỉ đạo trong việc phát triển các kế hoạch, các thủ tục, các kịch bản để tích hợp, xác minh, xác thực và triển khai hệ thống. (L)', NULL, NULL, 1, NULL, 4, 's7.3'),
(557, '4s7.4.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo trong việc phát triển các khái niệm giải pháp thay thế để xác định các thành phần chính của hệ thống. (L)', NULL, NULL, 1, NULL, 4, 's7.4'),
(558, '4s7.4.2', NULL, 'L/P - Dẫn dắt/Tham gia', '2. Chỉ đạo/Tham gia trong việc đưa ra quyết định mua hoặc xây dựng các thành phần phần mềm. (L/P)', NULL, NULL, 1, NULL, 4, 's7.4'),
(559, '4s7.4.3', NULL, 'L - Dẫn dắt', '3. Phê duyệt các quyết định mua hoặc xây dựng phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's7.4'),
(560, '4s7.4.4', NULL, 'P/L - Tham gia/Dẫn dắt', '4. Chỉ đạo/Tham gia các cuộc họp thiết kế hệ thống để tránh các đơn vị phần mềm bị cô lập. (P/L)', NULL, NULL, 1, NULL, 4, 's7.4'),
(561, '4s7.5.1', NULL, 'L/P - Dẫn dắt/Tham gia', '1. Chỉ đạo/Tham gia các cuộc họp để xác định các yêu cầu phân bổ (chức năng, hành vi, cấu trúc, chất lượng) và kết nối các thành phần phần mềm với các thành phần chính khác của hệ thống bằng một giao diện. (L/P)', NULL, NULL, 1, NULL, 4, 's7.5'),
(562, '4s7.5.2', NULL, 'L - Dẫn dắt', '2. Chỉ đạo các cuộc họp để tinh chỉnh các yêu cầu được phân bổ cho phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's7.5'),
(563, '4s7.6.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo trong việc xác định các thành phần phần mềm cần thiết cho một dự án hay chương trình. (L)', NULL, NULL, 1, NULL, 4, 's7.6'),
(564, '4s7.6.2', NULL, 'L - Dẫn dắt', '2. Chỉ đạo trong việc đưa ra quyết định mua hoặc xây dựng các thành phần phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's7.6'),
(565, '4s7.6.3', NULL, 'L - Dẫn dắt', '3. Thiết lập các thủ tục để phát triển và tích hợp các thành phần phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's7.6'),
(566, '4s7.6.4', NULL, 'L - Dẫn dắt', '4. Cung cấp liên lạc từ công nghệ phần mềm đến kỹ thuật hệ thống và kỹ thuật thành phần chính khác. (L)', NULL, NULL, 1, NULL, 4, 's7.6'),
(567, '4s7.7.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo trong việc tích hợp phần mềm với các thành phần hệ thống khác. (L)', NULL, NULL, 1, NULL, 4, 's7.7'),
(568, '4s7.7.2', NULL, 'P - Tham gia', '2. Chỉ đạo/Tham gia các hoạt động xác minh hệ thống. (P)', NULL, NULL, 1, NULL, 4, 's7.7'),
(569, '4s7.7.3', NULL, 'L - Dẫn dắt', '3. Chỉ đạo/Tham gia trong việc cung cấp liên lạc cho các kỹ sư linh kiện phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's7.7'),
(570, '4s7.8.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Chỉ đạo/Tham gia trong việc kiểm thử hệ thống theo cách mô phỏng và trực tiếp. (P/L)', NULL, NULL, 1, NULL, 4, 's7.8'),
(571, '4s7.8.2', NULL, 'L - Dẫn dắt', '2. Thiết lập các tiêu chí nghiệm thu/chấp nhận hệ thống. (L)', NULL, NULL, 1, NULL, 4, 's7.8'),
(572, '4s7.8.3', NULL, 'P/L - Tham gia/Dẫn dắt', '3. Chỉ đạo/Tham gia trong việc kiểm thử nghiệm thu/chấp nhận hệ thống. (P/L)', NULL, NULL, 1, NULL, 4, 's7.8'),
(573, '4s7.8.4', NULL, 'P/L - Tham gia/Dẫn dắt', '4. Chỉ đạo trong việc cung cấp liên lạc cho các kỹ sư linh kiện phần mềm trong quá trình xác thực và triển khai hệ thống. (P/L)', NULL, NULL, 1, NULL, 4, 's7.8'),
(574, '4s7.9.1', NULL, 'L - Dẫn dắt', '1. Thiết lập các tiêu chí và thủ tục để duy trì hệ thống. (L)', NULL, NULL, 1, NULL, 4, 's7.9'),
(575, '4s7.9.2', NULL, 'L - Dẫn dắt', '2. Chỉ đạo/tham gia trong việc lập kế hoạch để duy trì hệ thống. (L)', NULL, NULL, 1, NULL, 4, 's7.9'),
(576, '4s8.1.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Thiết lập văn hóa trong việc tạo các sản phẩm chất lượng và trong việc tuân theo các quy trình chất lượng trong những dự án. (P/L)', NULL, NULL, 1, NULL, 4, 's8.1'),
(577, '4s8.1.2', NULL, 'P/L - Tham gia/Dẫn dắt', '2. Thiết lập các tiêu chuẩn, các mô hình và các quy trình chất lượng cho những dự án. (P/L)', NULL, NULL, 1, NULL, 4, 's8.1'),
(578, '4s8.1.3', NULL, 'P - Tham gia', '3. Phân tích ưu điểm, nhược điểm của các quy trình, các công cụ quản lý chất lượng phần mềm thay thế sẽ dùng để đạt được các mục tiêu của tổ chức về chất lượng sản phẩm. (P)', NULL, NULL, 1, NULL, 4, 's8.1'),
(579, '4s8.1.4', NULL, 'L - Dẫn dắt', '4. Phát triển kế hoạch đảm bảo chất lượng cho dự án. (L)', NULL, NULL, 1, NULL, 4, 's8.1'),
(580, '4s8.1.5', NULL, 'P/L - Tham gia/Dẫn dắt', '5. Xác định các cách đo lường có tổ chức để hỗ trợ đạt được các mục tiêu về chất lượng sản phẩm (thông qua các dự án). (P/L)', NULL, NULL, 1, NULL, 4, 's8.1'),
(581, '4s8.1.6', NULL, 'L - Dẫn dắt', '6. Xác định các cơ hội cải tiến liên tục trong các dự án. (L)', NULL, NULL, 1, NULL, 4, 's8.1'),
(582, '4s8.2.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Xác định các quy trình đánh giá toàn tổ chức phù hợp. (P/L)', NULL, NULL, 1, NULL, 4, 's8.2'),
(583, '4s8.2.2', NULL, 'P - Tham gia', '2. Tiến hành phân tích dữ liệu xuyên tổ chức nhằm mục đích phân tích nguyên nhân gốc rễ. (P)', NULL, NULL, 1, NULL, 4, 's8.2'),
(584, '4s8.2.3', NULL, 'P/L - Tham gia/Dẫn dắt', '3. Dựa trên dữ liệu được đánh giá, xác định các hành động khắc phục phù hợp sẽ được triển khai trong các dự án nhằm mục đích đạt được sự cải tiến sản phẩm. (P/L)', NULL, NULL, 1, NULL, 4, 's8.2'),
(585, '4s8.3.1', NULL, 'P - Tham gia', '1. Thiết lập cơ sở hạ tầng cho kiểm tra độc lập bằng cách xác định:\na. tổ chức thích hợp để tiến hành kiểm tra độc lập (P)\nb. các sản phẩm và các quy trình cần thiết sẽ được bao gồm trong kiểm tra độc lập (P)\nc. các bên liên quan nhận các kết quả kiểm tra độc lập. (P)', NULL, NULL, 1, NULL, 4, 's8.3'),
(586, '4s8.3.2', NULL, 'P - Tham gia', '2. Phân tích kết quả các kiểm tra độc lập để tiếp tục cải tiến. (P)', NULL, NULL, 1, NULL, 4, 's8.3'),
(587, '4s8.4.1', NULL, 'P - Tham gia', '1. Xác định bộ dữ liệu chất lượng dưới sự kiểm soát thống kê. (P)', NULL, NULL, 1, NULL, 4, 's8.4'),
(588, '4s8.4.2', NULL, 'P - Tham gia', '2. Xác định một tập hợp gồm các phương sai chủ quan và khách quan cho dữ liệu. (P)', NULL, NULL, 1, NULL, 4, 's8.4'),
(589, '4s8.4.3', NULL, 'L - Dẫn dắt', '3. Phân tích dữ liệu đã thu thập. (L)', NULL, NULL, 1, NULL, 4, 's8.4'),
(590, '4s8.4.4', NULL, 'P - Tham gia', '4. Thiết lập và triển khai một tập hợp gồm các quy trình kiểm soát. (P)', NULL, NULL, 1, NULL, 4, 's8.4'),
(591, '4s8.4.5', NULL, 'P - Tham gia', '5. Đánh giá tính hiệu quả của các quy trình kiểm soát. (P)', NULL, NULL, 1, NULL, 4, 's8.4'),
(592, '4s9.3.1', NULL, 'L - Dẫn dắt', '1. Thiết lập các tiêu chuẩn mã hoá tổ chức để tránh các lỗ hỏng bảo mật. (L)', NULL, NULL, 1, NULL, 4, 's9.3'),
(593, '4s9.4.1', NULL, 'L - Dẫn dắt', '1. Thiết lập các tiêu chuẩn tổ chức cho các quy trình đánh giá bảo mật. (L)', NULL, NULL, 1, NULL, 4, 's9.4'),
(594, '4s10.1.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Xác minh tính đầy đủ và chính xác của các yêu cầu an toàn. (P/L)', NULL, NULL, 1, NULL, 4, 's10.1'),
(595, '4s10.1.2', NULL, 'L - Dẫn dắt', '2. Tương tác với các kỹ sư hệ thống và kỹ sư phần mềm để đảm bảo các yêu cầu an toàn được hoàn chỉnh và khả thi. (L)', NULL, NULL, 1, NULL, 4, 's10.1'),
(596, '4s10.2.1', NULL, 'P/L - Tham gia/Dẫn dắt', '1. Xác minh tính đầy đủ và chính xác của thiết kế, bao gồm các nguy cơ an toàn và các chất lượng an toàn. (P/L)', NULL, NULL, 1, NULL, 4, 's10.2'),
(597, '4s10.2.2', NULL, 'L - Dẫn dắt', '2. Chỉ đạo dự án trong việc quyết định các giải pháp kiến trúc được đề xuất để giảm thiểu các nguy cơ. (L)', NULL, NULL, 1, NULL, 4, 's10.2'),
(598, '4s10.2.3', NULL, 'P/L - Tham gia/Dẫn dắt', '3. Đánh giá rủi ro liên quan đến thiết kế để đảm bảo an toàn. (P/L)', NULL, NULL, 1, NULL, 4, 's10.2'),
(599, '4s10.3.1', NULL, 'L/C - Dẫn dắt/Tạo mới', '1. Thiết lập các tiêu chuẩn có tổ chức để chắc chắn độ an toàn của mã. (L/C)', NULL, NULL, 1, NULL, 4, 's10.3'),
(600, '4s10.3.2', NULL, 'L - Dẫn dắt', '2. Giám sát và xác minh các khía cạnh an toàn của thiết kế đã được triển khai trong sản xuất mã. (L)', NULL, NULL, 1, NULL, 4, 's10.3'),
(601, '4s10.4.1', NULL, 'L/C - Dẫn dắt/Tạo mới', '1. Thiết lập các tiêu chuẩn có tổ chức để xác thực và xác minh tính an toàn. (L/C)', NULL, NULL, 1, NULL, 4, 's10.4'),
(602, '4s10.4.2', NULL, 'L - Dẫn dắt', '2. Quản lý dự án, chịu trách nhiệm về an toàn tổng thể và đáp ứng các hướng dẫn chuyên ngành. (L)', NULL, NULL, 1, NULL, 4, 's10.4'),
(603, '4s10.5.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo nhóm phụ trách an toàn chịu trách nhiệm cho trường hợp an toàn của dự án. (L)', NULL, NULL, 1, NULL, 4, 's10.5'),
(604, '4s10.5.2', NULL, 'L/C - Dẫn dắt/Tạo mới', '2. Thiết lập các tiêu chuẩn có tổ chức cho các quy trình đánh giá tính an toàn và lựa chọn các tiêu chí an toàn. (L/C)', NULL, NULL, 1, NULL, 4, 's10.5'),
(605, '4s10.6.1', NULL, 'L - Dẫn dắt', '1. Quản lý tổng thể chất lượng dự án với trọng tâm là các khía cạnh an toàn. (L)', NULL, NULL, 1, NULL, 4, 's10.6'),
(606, '4s11.1.1', NULL, 'L - Dẫn dắt', '1. Xác định các ràng buộc và tác động của các ràng buộc đối với quản lý cấu hình phần mềm được áp dụng bởi các chính sách, hợp đồng và vòng đời phát triển phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's11.1'),
(607, '4s11.1.2', NULL, 'L - Dẫn dắt', '2. Áp dụng cách tổ chức hiện có và điều chỉnh mẫu sao cho phù hợp để quản lý cấu hình phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's11.1'),
(608, '4s11.1.3', NULL, 'L - Dẫn dắt', '3. Chỉ định các cách đo lường quản lý cấu hình phần mềm sẽ được sử dụng. (L)', NULL, NULL, 1, NULL, 4, 's11.1'),
(609, '4s11.1.4', NULL, 'L - Dẫn dắt', '4. Xác định các mục cấu hình phần mềm và xác định các mối quan hệ giữa chúng. (L)', NULL, NULL, 1, NULL, 4, 's11.1'),
(610, '4s11.1.5', NULL, 'L - Dẫn dắt', '5. Chỉ định các công cụ quản lý cấu hình phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's11.1'),
(611, '4s11.1.6', NULL, 'L - Dẫn dắt', '6. Chỉ định mẫu và giám sát việc thiết lập thư viện quản lý cấu hình phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's11.1'),
(612, '4s11.2.1', NULL, 'P - Tham gia', '1. Điều chỉnh, thông qua các cơ chế yêu cầu, đánh giá và phê duyệt các thay đổi của phần mềm, bao gồm cả những sai lệch và những loại trừ. (P)', NULL, NULL, 1, NULL, 4, 's11.2');
INSERT INTO `activity` (`activityid`, `keyname`, `name`, `requirement`, `description`, `createdate`, `editdate`, `isenable`, `note`, `competenceid_id`, `keynameskill_id`) VALUES
(613, '4s11.2.2', NULL, 'L - Dẫn dắt', '2. Bổ nhiệm các thành viên và triệu tập ban kiểm soát thay đổi (CCB). (L)', NULL, NULL, 1, NULL, 4, 's11.2'),
(614, '4s11.2.3', NULL, 'L - Dẫn dắt', '3. Chỉ đạo ban kiểm soát thay đổi trong việc đưa ra các quyết định có/không đối với các yêu cầu thay đổi. (L)', NULL, NULL, 1, NULL, 4, 's11.2'),
(615, '4s11.2.4', NULL, 'L - Dẫn dắt', '4. Chắc chắn các thay đổi được phê duyệt đã thực hiện và ghi vào tài liệu. (L)', NULL, NULL, 1, NULL, 4, 's11.2'),
(616, '4s11.2.5', NULL, 'L - Dẫn dắt', '5. Duy trì các cơ chế để ghi lại và báo cáo thông tin quản lý cấu hình phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's11.2'),
(617, '4s11.2.6', NULL, 'L - Dẫn dắt', '6. Thiết lập và duy trì các cơ chế để tạo các báo cáo kiểm tra độc lập việc quản lý cấu hình phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's11.2'),
(618, '4s11.3.1', NULL, 'L - Dẫn dắt', '1. Phát triển các kế hoạch phát hành phần mềm. (L)', NULL, NULL, 1, NULL, 4, 's11.3'),
(619, '4s12.1.1', NULL, 'P - Tham gia', '1. Tham gia xác định các cách đo lường cho tổ chức. (P)', NULL, NULL, 1, NULL, 4, 's12.1'),
(620, '4s12.1.2', NULL, 'L - Dẫn dắt', '2. Chỉ đạo trong việc xác định các cách đo lường cần thiết cho một dự án hay chương trình. (L)', NULL, NULL, 1, NULL, 4, 's12.1'),
(621, '4s12.1.3', NULL, 'L - Dẫn dắt', '3. Lựa chọn các thước đo và các thang đo. (L)', NULL, NULL, 1, NULL, 4, 's12.1'),
(622, '4s12.1.4', NULL, 'L - Dẫn dắt', '4. Đánh giá và phê duyệt các phương pháp thu thập và phân tích dữ liệu. (L)', NULL, NULL, 1, NULL, 4, 's12.1'),
(623, '4s12.1.5', NULL, 'L - Dẫn dắt', '5. Đặt ra các giá trị và các ngưỡng mục tiêu cần đạt. (L)', NULL, NULL, 1, NULL, 4, 's12.1'),
(624, '4s12.1.6', NULL, 'L - Dẫn dắt', '6. Thiết lập các định dạng báo cáo và các thủ tục báo cáo. (L)', NULL, NULL, 1, NULL, 4, 's12.1'),
(625, '4s12.1.7', NULL, 'L - Dẫn dắt', '7. Đánh giá và phê duyệt các công cụ đo lường và các thủ tục đo lường thủ công. (L)', NULL, NULL, 1, NULL, 4, 's12.1'),
(626, '4s12.1.8', NULL, 'L - Dẫn dắt', '8. Đánh giá và phê duyệt kế hoạch lưu trữ dữ liệu. (L)', NULL, NULL, 1, NULL, 4, 's12.1'),
(627, '4s12.1.9', NULL, 'L - Dẫn dắt', '9. Phê duyệt các phương pháp thu thập và phân tích dữ liệu. (L)', NULL, NULL, 1, NULL, 4, 's12.1'),
(628, '4s12.1.10', NULL, 'A - Hỗ trợ', '10. Phê duyệt các công cụ đo lường và các thủ tục thủ công. (A)', NULL, NULL, 1, NULL, 4, 's12.1'),
(629, '4s12.2.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo và điều phối quy trình đo lường. (L)', NULL, NULL, 1, NULL, 4, 's12.2'),
(630, '4s12.2.2', NULL, 'L - Dẫn dắt', '2. Phê duyệt các cải tiến trong chiến thuật đối với quy trình đo lường. (L)', NULL, NULL, 1, NULL, 4, 's12.2'),
(631, '4s13.1.1', NULL, 'L - Dẫn dắt', '1. Điều phối các hoạt động công việc để xác định các bên liên quan. (L)', NULL, NULL, 1, NULL, 4, 's13.1'),
(632, '4s13.1.2', NULL, 'L - Dẫn dắt', '2. Xác định cách tiếp cận mô hình quy trình nào sẽ được nhóm tương tác giữa người và máy tính sử dụng để phát triển giao diện. (L)', NULL, NULL, 1, NULL, 4, 's13.1'),
(633, '4s13.1.3', NULL, 'P - Tham gia', '3. Lựa chọn các công cụ tương tác giữa người và máy tính để sử dụng cho dự án. (P)', NULL, NULL, 1, NULL, 4, 's13.1'),
(634, '4s13.1.4', NULL, 'L - Dẫn dắt', '4. Chỉ đạo trong việc đánh giá và tinh chỉnh các yêu cầu của giao diện người dùng. (L)', NULL, NULL, 1, NULL, 4, 's13.1'),
(635, '4s13.1.5', NULL, 'L - Dẫn dắt', '5. Xác định các ràng buộc trong việc triển khai giao diện người dùng. (L)', NULL, NULL, 1, NULL, 4, 's13.1'),
(636, '4s13.1.6', NULL, 'L - Dẫn dắt', '6. Định nghĩa các yêu cầu giao diện kỹ thuật (giữa giao diện người dùng và các thành phần hệ thống). (L)', NULL, NULL, 1, NULL, 4, 's13.1'),
(637, '4s13.1.7', NULL, 'L - Dẫn dắt', '7. Lựa chọn các tiêu chuẩn áp dụng. (L)', NULL, NULL, 1, NULL, 4, 's13.1'),
(638, '4s13.2.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo và điều phối các hoạt động thiết kế phong cách tương tác. (L)', NULL, NULL, 1, NULL, 4, 's13.2'),
(639, '4s13.2.2', NULL, 'P - Tham gia', '2. Chọn lựa và tinh chỉnh các phương pháp xử lý lỗi của người dùng. (P)', NULL, NULL, 1, NULL, 4, 's13.2'),
(640, '4s13.2.3', NULL, 'L - Dẫn dắt', '3. Lựa chọn các phép ẩn dụ và các mô hình khái niệm. (L)', NULL, NULL, 1, NULL, 4, 's13.2'),
(641, '4s13.2.4', NULL, 'L - Dẫn dắt', '4. Làm việc với nhóm thiết kế hệ thống để thiết lập các giao diện thành phần giữa giao diện người dùng và các thành phần hệ thống. (L)', NULL, NULL, 1, NULL, 4, 's13.2'),
(642, '4s13.3.1', NULL, 'L - Dẫn dắt', '1. Sửa đổi/phê duyệt bố cục trang/màn hình sau cùng. (L)', NULL, NULL, 1, NULL, 4, 's13.3'),
(643, '4s13.3.2', NULL, 'L - Dẫn dắt', '2. Sửa đổi/phê duyệt các biểu tượng và xác định các biểu tượng mới khi cần thiết. (L)', NULL, NULL, 1, NULL, 4, 's13.3'),
(644, '4s13.3.3', NULL, 'L - Dẫn dắt', '3. Sửa đổi/phê duyệt chủ đề màu sắc, các kiểu và cỡ chữ. (L)', NULL, NULL, 1, NULL, 4, 's13.3'),
(645, '4s13.3.4', NULL, 'L - Dẫn dắt', '4. Đánh giá và tinh chỉnh các thiết kế bảng. (L)', NULL, NULL, 1, NULL, 4, 's13.3'),
(646, '4s13.3.5', NULL, 'L - Dẫn dắt', '5. Phê duyệt các thành phần thiết kế trực quan và đánh giá/nhận xét thiết kế với các bên liên quan và/hoặc các đối tượng người dùng. (L)', NULL, NULL, 1, NULL, 4, 's13.3'),
(647, '4s13.4.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo, điều phối các hoạt động kiểm tra và đánh giá khả năng sử dụng. (L)', NULL, NULL, 1, NULL, 4, 's13.4'),
(648, '4s13.4.2', NULL, 'L - Dẫn dắt', '2. Phê duyệt việc lựa chọn một hay nhiều danh sách kiểm tra khả năng sử dụng. (L)', NULL, NULL, 1, NULL, 4, 's13.4'),
(649, '4s13.4.3', NULL, 'L - Dẫn dắt', '3. Phê duyệt việc lựa chọn các đối tượng kiểm tra. (L)', NULL, NULL, 1, NULL, 4, 's13.4'),
(650, '4s13.4.4', NULL, 'L - Dẫn dắt', '4. Đánh giá, tinh chỉnh và hoàn thiện các bài kiểm tra khả năng sử dụng. (L)', NULL, NULL, 1, NULL, 4, 's13.4'),
(651, '4s13.4.5', NULL, 'L - Dẫn dắt', '5. Đánh giá, phê duyệt các khuyến nghị và các kết quả của việc kiểm tra khả năng sử dụng. (L)', NULL, NULL, 1, NULL, 4, 's13.4'),
(652, '4s13.5.1', NULL, 'L - Dẫn dắt', '1. Chỉ đạo và điều phối các hoạt động về khả năng tiếp cận. (L)', NULL, NULL, 1, NULL, 4, 's13.5'),
(653, '4s13.5.2', NULL, 'L - Dẫn dắt', '2. Xác định các khả năng tiếp cận nào cần phải được giải quyết trong giao diện người dùng. (L)', NULL, NULL, 1, NULL, 4, 's13.5'),
(654, '4s13.5.3', NULL, 'L - Dẫn dắt', '3. Xác định mức độ mà giao diện người dùng phải đáp ứng các nhu cầu về khả năng truy cập quốc tế. (L)', NULL, NULL, 1, NULL, 4, 's13.5'),
(655, '5s1.1.1', NULL, 'C - Tạo mới', '1. Tạo ra các cách mới để cam kết và liên lạc với các bên liên quan, bên nhóm quản lý và các nhà phát triển trong các hoạt động lấy yêu cầu. (C)', NULL, NULL, 1, NULL, 5, 's1.1'),
(656, '5s1.2.1', NULL, 'C - Tạo mới', '1. Tạo ra các phương pháp mới trong việc phân tích miền. (C)', NULL, NULL, 1, NULL, 5, 's1.2'),
(657, '5s1.3.1', NULL, 'C - Tạo mới', '1. Tạo ra các phương pháp mới trong việc đặc tả yêu cầu. (C)', NULL, NULL, 1, NULL, 5, 's1.3'),
(658, '5s1.4.1', NULL, 'C - Tạo mới', '1. Tạo ra các kĩ thuật mới trong việc xác minh và xác thực yêu cầu. (C)', NULL, NULL, 1, NULL, 5, 's1.4'),
(659, '5s1.5.1', NULL, 'L - Dẫn dắt', '1. Đặt ra chiến lược và định hướng cho quy trình lấy yêu cầu thông qua các dự án và các đơn vị chức năng của một tổ chức. (L)', NULL, NULL, 1, NULL, 5, 's1.5'),
(660, '5s2.1.1', NULL, 'C - Tạo mới', '1. Phân tích và đưa ra các khuyến nghị liên quan đến việc áp dụng rộng rãi các nguyên tắc cơ bản về thiết kế phần mềm của tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's2.1'),
(661, '5s2.2.1', NULL, 'C - Tạo mới', '1. Kiểm tra và đánh giá hiệu quả việc ứng dụng các chiến lược và phương pháp vào thiết kế phần mềm của tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's2.2'),
(662, '5s2.2.2', NULL, 'C - Tạo mới', '2. Phân tích và đưa ra các khuyến nghị liên quan đến các chiến lược và các phương pháp luận thiết kế phần mềm của toàn tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's2.2'),
(663, '5s2.2.3', NULL, 'C - Tạo mới', '3. Tạo ra các kỹ thuật mới trong việc đánh giá chất lượng thiết kế phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's2.2'),
(664, '5s2.3.1', NULL, 'C - Tạo mới', '1. Phân tích và đưa ra các khuyến nghị liên quan đến thiêt kế kiến trúc phần mềm của toàn tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's2.3'),
(665, '5s2.3.2', NULL, 'C - Tạo mới', '2. Xác định các phương pháp mới và các kỹ thuật mới sẽ được sử dụng trong thiết kế kiến trúc. (C)', NULL, NULL, 1, NULL, 5, 's2.3'),
(666, '5s2.4.1', NULL, 'C - Tạo mới', '1. Phân tích và đưa ra các khuyến nghị liên quan đến các kỹ thuật đánh giá, kỹ thuật phân tích chất lượng thiết kế của toàn tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's2.4'),
(667, '5s2.4.2', NULL, 'C - Tạo mới', '2. Tạo ra các kỹ thuật mới trong việc đánh giá chất lượng thiết kế phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's2.4'),
(668, '5s3.1.1', NULL, 'C - Tạo mới', '1. Tạo/đề xuất các quy trình mới và các mô hình mới để xây dựng phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's3.1'),
(669, '5s3.1.2', NULL, 'C - Tạo mới', '2. Tạo các ngôn ngữ mới và các công cụ mới để xây dựng phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's3.1'),
(670, '5s3.1.3', NULL, 'C - Tạo mới', '3. Tạo/đề xuất các khung phần mềm mới, các nền tảng mới và các môi trường mới. (C)', NULL, NULL, 1, NULL, 5, 's3.1'),
(671, '5s3.2.1', NULL, 'L - Dẫn dắt', '1. Thiết lập các tiêu chuẩn tổ chức để kiểm soát phiên bản và quản lý cấu hình. (L)', NULL, NULL, 1, NULL, 5, 's3.2'),
(672, '5s3.2.2', NULL, 'L - Dẫn dắt', '2. Đặt ra các tiêu chuẩn tổ chức về chất lượng và kích thước mã nguồn. (L)', NULL, NULL, 1, NULL, 5, 's3.2'),
(673, '5s3.2.3', NULL, 'C - Tạo mới', '3. Tạo ra các công cụ mới và các quy trình mới để kiểm soát phiên bản và quản lý cấu hình. (C)', NULL, NULL, 1, NULL, 5, 's3.2'),
(674, '5s3.3.1', NULL, 'L - Dẫn dắt', '1. Thiết lập các tiêu chuẩn tổ chức về các thiết kế chi tiết và mã nguồn. (L)', NULL, NULL, 1, NULL, 5, 's3.3'),
(675, '5s3.3.2', NULL, 'C - Tạo mới', '2. Tạo ra các mẫu thiết kế mới. (C)', NULL, NULL, 1, NULL, 5, 's3.3'),
(676, '5s3.4.1', NULL, 'L - Dẫn dắt', '1. Thiết lập các tiêu chuẩn tổ chức để kiểm thử đơn vị. (L)', NULL, NULL, 1, NULL, 5, 's3.4'),
(677, '5s3.4.2', NULL, 'C - Tạo mới', '2. Tạo các công cụ mới và các phương pháp mới trong việc kiểm thử đơn vị. (C)', NULL, NULL, 1, NULL, 5, 's3.4'),
(678, '5s3.5.1', NULL, 'L - Dẫn dắt', '1. Thiết lập các tiêu chuẩn tổ chức trong việc tích hợp các công cụ và các quy trình. (L)', NULL, NULL, 1, NULL, 5, 's3.5'),
(679, '5s3.5.2', NULL, 'L - Dẫn dắt', '2. Thiết lập các tiêu chuẩn tổ chức trong việc đánh giá và kiểm tra. (L)', NULL, NULL, 1, NULL, 5, 's3.5'),
(680, '5s3.5.3', NULL, 'C - Tạo mới', '3. Tạo ra các công cụ mới và các quy trình mới để tích hợp. (C)', NULL, NULL, 1, NULL, 5, 's3.5'),
(681, '5s3.5.4', NULL, 'C - Tạo mới', '4. Tạo ra các phương pháp mới trong việc đánh giá và kiểm tra mã nguồn. (C)', NULL, NULL, 1, NULL, 5, 's3.5'),
(682, '5s4.1.1', NULL, 'L - Dẫn dắt', '1. Thiết lập các thủ tục có tổ chức để kiểm thử. (L)', NULL, NULL, 1, NULL, 5, 's4.1'),
(683, '5s4.2.1', NULL, 'L - Dẫn dắt', '1. Xác định các công cụ kiểm thử của tổ chức và xác định kho dữ liệu trong các dự án. (L)', NULL, NULL, 1, NULL, 5, 's4.2'),
(684, '5s4.2.2', NULL, 'L/P - Dẫn dắt/Tham gia', '2. Tạo ra tài liệu kiểm thử mới (hay nói cách khác là kế hoạch kiểm thử, việc ghi lại lỗi,...). (L/P)', NULL, NULL, 1, NULL, 5, 's4.2'),
(685, '5s4.3.1', NULL, 'C - Tạo mới', '1. Tạo ra các kỹ thuật kiểm thử mới (hay nói cách khác là đơn vị, tích hợp, nhấn mạnh,...) (C)', NULL, NULL, 1, NULL, 5, 's4.3'),
(686, '5s4.4.1', NULL, 'P - Tham gia', '1. Tạo ra các kỹ thuật mới trong việc phân tích nguyên nhân gốc rễ. (P)', NULL, NULL, 1, NULL, 5, 's4.4'),
(687, '5s5.1.1', NULL, 'C - Tạo mới', '1. Sửa đổi và tạo mới các hướng dẫn cho các kế hoạch chuyển đổi. (C)', NULL, NULL, 1, NULL, 5, 's5.1'),
(688, '5s5.1.2', NULL, 'C - Tạo mới', '2. Sửa đổi và tạo mới các hướng dẫn cho việc xác định các bên liên quan. (C)', NULL, NULL, 1, NULL, 5, 's5.1'),
(689, '5s5.1.3', NULL, 'C - Tạo mới', '3. Sửa đổi và tạo mới các mẫu về cách chuyển đổi phần mềm và về tài liệu vận hành.  (C)', NULL, NULL, 1, NULL, 5, 's5.1'),
(690, '5s5.1.4', NULL, 'C - Tạo mới', '4. Sửa đổi và tạo mới các hướng dẫn cho việc xác định các tác động của thay đổi phần mềm đến môi trường vận hành. (C)', NULL, NULL, 1, NULL, 5, 's5.1'),
(691, '5s5.1.5', NULL, 'C - Tạo mới', '5. Sửa đổi và phát triển cái mới cho các phương pháp, các công cụ, các kỹ thuật nghiệm thu/chấp nhận hệ thống. (C)', NULL, NULL, 1, NULL, 5, 's5.1'),
(692, '5s5.2.1', NULL, 'L - Dẫn dắt', '1. Sửa đổi và tạo mới các tiêu chuẩn, các khuôn phần mềm trong việc quản lý cấu hình của phần mềm vận hành. (L)', NULL, NULL, 1, NULL, 5, 's5.2'),
(693, '5s5.2.2', NULL, 'C - Tạo mới', '2. Sửa đổi và tạo mới các phương pháp, các công cụ, các kỹ thuật trong việc thu thập và xử lý dữ liệu vận hành. (C)', NULL, NULL, 1, NULL, 5, 's5.2'),
(694, '5s5.3.1', NULL, 'C - Tạo mới', '1. Sửa đổi và tạo mới các chính sách, các quy trình, các thủ tục trong việc bảo trì phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's5.3'),
(695, '5s5.3.2', NULL, 'C - Tạo mới', '2. Sửa đổi và tạo mới các chính sách, các thủ tục trong việc thực hiện thay đổi đối với phần mềm (sữa chữa, thích ứng và hoàn thiện). (C)', NULL, NULL, 1, NULL, 5, 's5.3'),
(696, '5s5.3.3', NULL, 'C - Tạo mới', '3. Sửa đổi và tạo mới các chính sách, các thủ tục trong việc bảo trì định kỳ và tái thiết kế phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's5.3'),
(697, '5s6.1.1', NULL, 'C - Tạo mới', '1. Xác định nhu cầu và lựa chọn/phát triển một mô hình vòng đời toàn tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's6.1'),
(698, '5s6.1.2', NULL, 'C - Tạo mới', '2. Lựa chọn mô hình quy trình vòng đời của một bộ phận hoặc toàn tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's6.1'),
(699, '5s6.1.3', NULL, 'C - Tạo mới', '3. Đưa ra lời khuyên về quy trình, cơ sở hạ tầng, đào tạo và công cụ. (C)', NULL, NULL, 1, NULL, 5, 's6.1'),
(700, '5s6.2.1', NULL, 'C - Tạo mới', '1. Tiến hành nghiên cứu định nghĩa và điều chỉnh quy trình phần mềm sao cho hiệu quả. (C)', NULL, NULL, 1, NULL, 5, 's6.2'),
(701, '5s6.2.2', NULL, 'L/C - Dẫn dắt/Tạo mới', '2. Chỉ đạo trong việc định nghĩa và điều chỉnh các quy trình phần mềm của toàn tổ chức. (L/C)', NULL, NULL, 1, NULL, 5, 's6.2'),
(702, '5s6.3.1', NULL, 'C - Tạo mới', '1. Cung cấp hướng dẫn và đưa ra lời khuyên trong toàn tổ chức về cách triển khai và quản lý các quy trình phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's6.3'),
(703, '5s6.3.2', NULL, 'C - Tạo mới', '2. Cung cấp hướng dẫn và đưa ra lời khuyên về thông tin, cấu trúc và các trách nhiệm của các nhóm quy trình công nghệ phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's6.3'),
(704, '5s6.4.1', NULL, 'C - Tạo mới', '1. Tiến hành nghiên cứu sự hiệu quả và sự cải tiến của các quy trình phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's6.4'),
(705, '5s6.4.2', NULL, 'C - Tạo mới', '2. Sử dụng dữ liệu đánh giá, các báo cáo của nhóm, các báo cáo nhóm quy trình công nghệ phần mềm trong việc thiết lập các thủ tục và tiêu chuẩn có tổ chức để cải tiến quy trình phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's6.4'),
(706, '5s7.1.1', NULL, 'C - Tạo mới', '1. Chuẩn bị các khung phần mềm để tích hợp hệ thống của một tổ chức và các mô hình phát triển phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's7.1'),
(707, '5s7.1.2', NULL, 'C - Tạo mới', '2. Sửa đổi các mô hình hiện có và tạo ra các mô hình, các cách thức mới của các mô hình phát triển công nghệ phần mềm và kỹ thuật hệ thống được tích hợp. (C)', NULL, NULL, 1, NULL, 5, 's7.1'),
(708, '5s7.1.3', NULL, 'C - Tạo mới', '3. Xác định, điều chỉnh các chính sách, các thủ tục, các tiêu chuẩn và các hướng dẫn áp dụng sao cho phù hợp với các mô hình phát triển hệ thống và phần mềm của một tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's7.1'),
(709, '5s7.2.1', NULL, 'C - Tạo mới', '1. Phát triển các kỹ thuật mới trong việc xác định các bên liên quan. (C)', NULL, NULL, 1, NULL, 5, 's7.2'),
(710, '5s7.2.2', NULL, 'C - Tạo mới', '2. Phát triển các phương pháp, các công cụ và các kỹ thuật mới trong việc định nghĩa khái niệm. (C)', NULL, NULL, 1, NULL, 5, 's7.2'),
(711, '5s7.3.1', NULL, 'P - Tham gia', '1. Thiết lập các chính sách và các thủ tục có tổ chức trong việc lập các yêu cầu kĩ thuật hệ thống. (P)', NULL, NULL, 1, NULL, 5, 's7.3'),
(712, '5s7.3.2', NULL, 'C - Tạo mới', '2. Sửa đổi, phát triển các phương pháp, các công cụ và các kỹ thuật mới trong việc lập các yêu cầu kỹ thuật hệ thống. (C)', NULL, NULL, 1, NULL, 5, 's7.3'),
(713, '5s7.4.1', NULL, 'C - Tạo mới', '1. Phát triển các chính sách và các thủ tục trong việc thiết kế hệ thống ở một tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's7.4'),
(714, '5s7.4.2', NULL, 'C - Tạo mới', '2. Phát triển các phương pháp tiếp cận mới để tránh các đơn vị phần mềm bị cô lập. (C)', NULL, NULL, 1, NULL, 5, 's7.4'),
(715, '5s7.5.1', NULL, 'C - Tạo mới', '1. Phát triển các phương pháp, các công cụ và các kỹ thuật mới trong việc phân bổ, giảm bớt các yêu cầu. (C)', NULL, NULL, 1, NULL, 5, 's7.5'),
(716, '5s7.6.1', NULL, 'C - Tạo mới', '1. Sửa đổi, phát triển các phương pháp, các công cụ và các kỹ thuật trong kỹ thuật thành phần. (C)', NULL, NULL, 1, NULL, 5, 's7.6'),
(717, '5s7.7.1', NULL, 'C - Tạo mới', '1. Sửa đổi và cung cấp các phương pháp mới trong việc tích hợp phần mềm với các thành phần hệ thống khác. (C)', NULL, NULL, 1, NULL, 5, 's7.7'),
(718, '5s7.8.1', NULL, 'C - Tạo mới', '1. Sửa đổi, phát triển các phương pháp, các công cụ và các kỹ thuật trong việc xác thực và triển khai hệ thống. (C)', NULL, NULL, 1, NULL, 5, 's7.8'),
(719, '5s8.1.1', NULL, 'C - Tạo mới', '1. Tạo ra các giải pháp mới và không ngừng cải tiến chất lượng để cung cấp các sản phẩm có chất lượng cao. (C)', NULL, NULL, 1, NULL, 5, 's8.1'),
(720, '5s8.1.2', NULL, 'C - Tạo mới', '2. Tạo các quy trình mới. (C)', NULL, NULL, 1, NULL, 5, 's8.1'),
(721, '5s8.1.3', NULL, 'C - Tạo mới', '3. Kiểm tra và đánh giá hiệu quả của quy trình cụ thể về quản lý chất lượng phần mềm trong một tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's8.1'),
(722, '5s8.1.4', NULL, 'C - Tạo mới', '4. Đưa ra các khuyến nghị liên quan đến các quy trình quản lý chất lượng phần mềm trong toàn tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's8.1'),
(723, '5s8.1.5', NULL, 'C - Tạo mới', '5. Tạo ra/Sửa đổi các quy trình quản lý chất lượng phần mềm để đạt được các sản phẩm và các quy trình có chất lượng cao hơn. (C)', NULL, NULL, 1, NULL, 5, 's8.1'),
(724, '5s8.1.6', NULL, 'L - Dẫn dắt', '6. Đề xuất/Thiết kế các công cụ mới để cải thiện việc đạt được các mục tiêu về chất lượng sản phẩm. (L)', NULL, NULL, 1, NULL, 5, 's8.1'),
(725, '5s8.2.1', NULL, 'C - Tạo mới', '1. Tạo mới hoặc tùy chỉnh các quy trình đánh giá để đáp ứng nhu cầu của tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's8.2'),
(726, '5s8.2.2', NULL, 'C - Tạo mới', '2. Phát triển các kỹ thuật mới trong việc phân tích nguyên nhân gốc rễ. (C)', NULL, NULL, 1, NULL, 5, 's8.2'),
(727, '5s8.3.1', NULL, 'C - Tạo mới', '1. Tạo ra các quy trình kiểm tra độc lập mới. (C)', NULL, NULL, 1, NULL, 5, 's8.3'),
(728, '5s8.4.1', NULL, 'C - Tạo mới', '1. Tạo hoặc sửa đổi các cổng kiểm soát chất lượng thống kê của tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's8.4'),
(729, '5s9.1.1', NULL, 'C - Tạo mới', '1. Tạo và đề xuất các phương pháp mới trong việc nhận dạng các lỗ hỏng bảo mật. (C)', NULL, NULL, 1, NULL, 5, 's9.1'),
(730, '5s9.3.1', NULL, 'C - Tạo mới', '1. Tạo ra các tiêu chuẩn mã hoá mới để tránh các lỗ hỏng bảo mật. (C)', NULL, NULL, 1, NULL, 5, 's9.3'),
(731, '5s9.5.1', NULL, 'C - Tạo mới', '1. Tạo ra các phương pháp và các công cụ mới trong việc phân tích mã nguồn tĩnh. (C)', NULL, NULL, 1, NULL, 5, 's9.5'),
(732, '5s10.1.1', NULL, 'C - Tạo mới', '1. Tạo và đề xuất các phương pháp mới trong việc đánh giá, giảm thiểu và xác minh tính an toàn. (C)', NULL, NULL, 1, NULL, 5, 's10.1'),
(733, '5s10.2.1', NULL, 'C - Tạo mới', '1. Tạo và đề xuất các giải pháp thiết kế mới, dẫn đến sự an toàn được tăng lên ở các thiết kế mới. (C)', NULL, NULL, 1, NULL, 5, 's10.2'),
(734, '5s10.3.1', NULL, 'C - Tạo mới', '1. Tạo ra các tiêu chuẩn mới để chắc chắn độ an toàn của mã. (C)', NULL, NULL, 1, NULL, 5, 's10.3'),
(735, '5s10.4.1', NULL, 'C - Tạo mới', '1. Đóng góp kiến thức chuyên môn trong việc thiết lập các hướng dẫn tổ chức mới liên quan đến việc kiểm thử tính an toàn của các ứng dụng phần mềm chuyên sâu. (C)', NULL, NULL, 1, NULL, 5, 's10.4'),
(736, '5s10.5.1', NULL, 'C - Tạo mới', '1. Đóng góp kiến thức chuyên môn trong việc thiết lập các phương tiện đánh giá an toàn tốt hơn. (C)', NULL, NULL, 1, NULL, 5, 's10.5'),
(737, '5s10.6.1', NULL, 'C - Tạo mới', '1. Đóng góp kiến thức chuyên môn trong việc cải tiến các phương tiện đo lường và trong việc thiết lập quản lý chất lượng của sản phẩm và quy trình. (C)', NULL, NULL, 1, NULL, 5, 's10.6'),
(738, '5s11.1.1', NULL, 'C - Tạo mới', '1. Phát triển các cách tổ chức mới để thực hiện quản lý cấu hình phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's11.1'),
(739, '5s11.1.2', NULL, 'C - Tạo mới', '2. Phát triển các mẫu và cách mới trong việc lập kế hoạch để quản lý cấu hình phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's11.1'),
(740, '5s11.1.3', NULL, 'C - Tạo mới', '3. Phát triển các cách đo và phép đo lường mới trong việc quản lý cấu hình phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's11.1'),
(741, '5s11.1.4', NULL, 'C - Tạo mới', '4. Phát triển các thủ tục trong việc xác định các mục cấu hình phần mềm và xác định các mối quan hệ giữa chúng. (C)', NULL, NULL, 1, NULL, 5, 's11.1'),
(742, '5s11.1.5', NULL, 'L - Dẫn dắt', '5. Chỉ định các công cụ và các cách mới trong việc kết hợp các công cụ hiện có trong quản lý cấu hình phần mềm. (L)', NULL, NULL, 1, NULL, 5, 's11.1'),
(743, '5s11.1.6', NULL, 'C - Tạo mới', '6. Chỉ định các cách mới trong việc tổ chức các thư viện quản lý cấu hình phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's11.1'),
(744, '5s11.2.1', NULL, 'C - Tạo mới', '1. Sửa đổi, phát triển các cơ chế mới để yêu cầu, đánh giá và phê duyệt các thay đổi của phần mềm, bao gồm cả những sai lệch và loại trừ. (C)', NULL, NULL, 1, NULL, 5, 's11.2'),
(745, '5s11.2.2', NULL, 'C - Tạo mới', '2. Phát triển các cơ chế mới để hạch toán trạng thái quản lý cấu hình phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's11.2'),
(746, '5s11.2.3', NULL, 'C - Tạo mới', '3. Phát triển các quy trình và các thủ tục mới để tạo các báo cáo kiểm tra độc lập trong việc quản lý cấu hình phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's11.2'),
(747, '5s11.3.1', NULL, 'C - Tạo mới', '1. Sửa đổi và phát triển các định dạng, các thủ tục mới trong việc triển khai kế hoạch phát hành phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's11.3'),
(748, '5s11.3.2', NULL, 'C - Tạo mới', '2. Sửa đổi và tạo mới các công cụ trong việc xây dựng các bản phát hành phần mềm. (C)', NULL, NULL, 1, NULL, 5, 's11.3'),
(749, '5s12.1.1', NULL, 'C - Tạo mới', '1. Xác định những thuộc tính của các cách đo lường quy trình, các cách đo lường sản phẩm sẽ được sử dụng trong toàn tổ chức. (C)', NULL, NULL, 1, NULL, 5, 's12.1'),
(750, '5s12.1.2', NULL, 'C - Tạo mới', '2. Phát triển các cách mới để xác định các phép đo lường cần thiết. (C)', NULL, NULL, 1, NULL, 5, 's12.1'),
(751, '5s12.1.3', NULL, 'C - Tạo mới', '3. Định nghĩa các thước đo mới và các thang đo mới. (C)', NULL, NULL, 1, NULL, 5, 's12.1'),
(752, '5s12.1.4', NULL, 'C - Tạo mới', '4. Phát triển các phương pháp mới trong việc thu thập và phân tích dữ liệu. (C)', NULL, NULL, 1, NULL, 5, 's12.1'),
(753, '5s12.1.5', NULL, 'C - Tạo mới', '5. Phát triển các định dạng báo cáo mới và các thủ tục báo cáo mới. (C)', NULL, NULL, 1, NULL, 5, 's12.1'),
(754, '5s12.1.6', NULL, 'C - Tạo mới', '6. Phát triển các công cụ đo lường mới và các thủ tục mới trong đo lường thủ công. (C)', NULL, NULL, 1, NULL, 5, 's12.1'),
(755, '5s12.2.1', NULL, 'C - Tạo mới', '1. Đánh giá định kỳ các phương pháp, các công cụ và các kỹ thuật được sử dụng để thực hiện quy trình đo lường. (C)', NULL, NULL, 1, NULL, 5, 's12.2'),
(756, '5s12.2.2', NULL, 'C - Tạo mới', '2. Sửa đổi và phát triển các phương pháp, các công cụ và các kỹ thuật mới được sử dụng để thực hiện quy trình đo lường. (C)', NULL, NULL, 1, NULL, 5, 's12.2'),
(757, '5s13.1.1', NULL, 'C - Tạo mới', '1. Sửa đổi và tạo mới các phương pháp, các công cụ trong việc xác định các bên liên quan. (C)', NULL, NULL, 1, NULL, 5, 's13.1'),
(758, '5s13.1.2', NULL, 'C - Tạo mới', '2. Sửa đổi và tạo mới các phương pháp, các công cụ trong việc xác định đối tượng người dùng. (C)', NULL, NULL, 1, NULL, 5, 's13.1'),
(759, '5s13.1.3', NULL, 'C - Tạo mới', '3. Sửa đổi và tạo mới các phương pháp, các công cụ trong việc tạo nguyên mẫu. (C)', NULL, NULL, 1, NULL, 5, 's13.1'),
(760, '5s13.1.4', NULL, 'C - Tạo mới', '4. Sửa đổi và tạo mới các phương pháp, các công cụ trong việc xác định rõ các yêu cầu giao diện kỹ thuật. (C)', NULL, NULL, 1, NULL, 5, 's13.1'),
(761, '5s13.2.1', NULL, 'C - Tạo mới', '1. Sửa đổi và tạo mới các phương pháp, các công cụ trong việc thiết kế phong cách tương tác. (C)', NULL, NULL, 1, NULL, 5, 's13.2'),
(762, '5s13.3.1', NULL, 'C - Tạo mới', '1. Sửa đổi và tạo mới các phương pháp, các công cụ trong việc thiết kế trực quan. (C)', NULL, NULL, 1, NULL, 5, 's13.3'),
(763, '5s13.4.1', NULL, 'C - Tạo mới', '1. Sửa đổi và tạo mới các phương pháp, các công cụ trong việc kiểm tra khả năng sử dụng. (C)', NULL, NULL, 1, NULL, 5, 's13.4'),
(764, '5s13.5.1', NULL, 'C - Tạo mới', '1. Phát triển các công cụ và các kỹ thuật mới trong việc cung cấp các phần tử giao diện có thể tiếp cận. (C)', NULL, NULL, 1, NULL, 5, 's13.5'),
(765, 's14.1.1', NULL, NULL, 'Tạo ý tưởng: Cho phép các cá nhân thực hiện khả năng sáng tạo của họ bằng cách tạo ra các giải pháp tối ưu cho các vấn đề hiện có trong một lĩnh vực nhất định.', NULL, NULL, 1, NULL, NULL, 's14.1'),
(766, 's14.1.2', NULL, NULL, 'Tư duy phản biện: là quá trình hình thành khái niệm, áp dụng, phân tích, tổng hợp và đánh giá thông tin thu thập được bởi quan sát, kinh nghiệm, suy ngẫm, lí luận hoặc giao tiếp.\nTư duy phản biện: là quá trình gồm phân tích và đánh giá một thông tin đã có theo các cách nhìn khác cho vấn đề đã đặt ra nhằm làm sáng tỏ và khẳng định lại tính chính xác của vấn đề.', NULL, NULL, 1, NULL, NULL, 's14.1'),
(767, 's14.1.3', NULL, NULL, 'Tổng hợp/Tái tổ chức\nTổng hợp nhiều thông tin của vấn đề: khả năng kết hợp các thành phần trong tổng thể theo những cách mới và khác nhau.\nTái tổ chức: là một quá trình xây dựng lại hoặc thay đổi theo chiều hướng tích cực nhằm nâng cao hiệu quả.', NULL, NULL, 1, NULL, NULL, 's14.1'),
(768, 's14.1.4', NULL, NULL, 'Giải quyết vấn đề theo cách sáng tạo: một cách giải quyết vấn đề hoặc xác định cơ hội khi suy nghĩ theo cách thông thường không thành công. Nó khuyến khích các cá nhân tìm ra những quan điểm mới và đưa ra các giải pháp sáng tạo, để có thể lập kế hoạch vượt qua những trở ngại và đạt được mục tiêu.', NULL, NULL, 1, NULL, NULL, 's14.1'),
(769, 's14.2.1', NULL, NULL, 'Xác định vấn đề: làm rõ nguyên nhân gốc rễ, cốt lõi của một vấn đề.', NULL, NULL, 1, NULL, NULL, 's14.2'),
(770, 's14.2.2', NULL, NULL, 'Tìm kiếm sự cải tiến: tìm ra và sửa đổi phần cần thiết để tiến bộ hơn, gần hơn với mục tiêu.', NULL, NULL, 1, NULL, NULL, 's14.2'),
(771, 's14.2.3', NULL, NULL, 'Thu thập và đánh giá thông tin: tổng hợp và xác định các nguồn thông tin có liên quan, sau đó tiến hành kiểm tra các thông tin đó', NULL, NULL, 1, NULL, NULL, 's14.2'),
(772, 's14.2.4', NULL, NULL, 'Tư duy độc lập: tự quyết định suy nghĩ và hành động của mình, không cần phải tra cứu hoặc tham khảo ý kiến ​​của người khác.', NULL, NULL, 1, NULL, NULL, 's14.2'),
(773, 's14.2.5', NULL, NULL, 'Hiểu biết về công nghệ: có kĩ năng và kiến ​​thức trực giác phù hợp để vận hành các thiết bị hiện đại một cách hiệu quả.', NULL, NULL, 1, NULL, NULL, 's14.2'),
(774, 's14.3.1', NULL, NULL, 'Cởi mở với các ý tưởng: sẵn sàng tiếp nhận những cái mới.', NULL, NULL, 1, NULL, NULL, 's14.3'),
(775, 's14.3.2', NULL, NULL, 'Định hướng nghiên cứu: xác định cách nghiên cứu thu thập và phân tích dữ liệu, báo cáo kết quả, và phương pháp tiến hành nghiên cứu của cá nhân hoặc nhóm.', NULL, NULL, 1, NULL, NULL, 's14.3'),
(776, 's14.3.3', NULL, NULL, 'Cộng tác: các cá nhân làm việc cùng nhau vì một mục đích chung để đạt được lợi ích.', NULL, NULL, 1, NULL, NULL, 's14.3'),
(777, 's14.3.4', NULL, NULL, 'Tham gia vào các sở thích không liên quan đến công việc.', NULL, NULL, 1, NULL, NULL, 's14.3'),
(778, 's14.4.1', NULL, NULL, 'Nhìn nhận vấn đề một cách hệ thống: cảm nhận bằng các giác quan và các khía cạnh, các yếu tố trong ngành để đánh giá và đưa ra dự báo.', NULL, NULL, 1, NULL, NULL, 's14.4'),
(779, 's14.4.2', NULL, NULL, 'Đánh giá kết quả dài hạn: đánh giá liên tục theo thời gian về hiệu quả của một việc gì đó nhằm dự đoán tương lai.', NULL, NULL, 1, NULL, NULL, 's14.4'),
(780, 's14.4.3', NULL, NULL, 'Tầm nhìn: định hướng gắn liền với mọi hoạt động của cá nhân và nhóm ở hiện tại và tương lai.', NULL, NULL, 1, NULL, NULL, 's14.4'),
(781, 's14.4.4', NULL, NULL, 'Quản lí tương lai: liên quan đến việc lập kế hoạch dài hạn hay đề ra một chiến lược để giải quyết các vấn đề có thể sẽ xảy ra.', NULL, NULL, 1, NULL, NULL, 's14.4'),
(782, 's14.5.1', NULL, NULL, 'Nhạy cảm với các tình huống: phát giác nhanh các vấn đề thay đổi mà sẽ hoặc đang xảy ra để kịp thời xử lí.', NULL, NULL, 1, NULL, NULL, 's14.5'),
(783, 's14.5.2', NULL, NULL, 'Thách thức nguyên trạng: hành xử hoặc làm một việc gì đó trái với những điều được chấp nhận, mong đợi (sự đổi mới).', NULL, NULL, 1, NULL, NULL, 's14.5'),
(784, 's14.5.3', NULL, NULL, 'Chấp nhận rủi ro một cách thông minh: cân nhắc giữa lợi ích và bất lợi của các lựa chọn để giả định những rủi ro có thể xảy ra để lựa chọn hành động phù hợp nhằm mang lại kết quả tốt nhất có thể. Chấp nhận rủi ro một cách thông minh là một hành vi có thể học được và cải thiện qua thực hành.', NULL, NULL, 1, NULL, NULL, 's14.5'),
(785, 's14.5.4', NULL, NULL, 'Tăng cường thay đổi: duy trì sự thay đổi một cách liên tục.', NULL, NULL, 1, NULL, NULL, 's14.5'),
(786, 's15.1.1', NULL, NULL, 'Năng khiếu: năng lực có sẵn trong một con người để giúp họ có thể hoàn thành một công việc nào đó ngay cả khi chưa được học tập hay rèn luyện về công việc đó.', NULL, NULL, 1, NULL, NULL, 's15.1'),
(787, 's15.1.2', NULL, NULL, 'Sáng kiến: ý kiến mang tính sáng tạo và khoa học, có tác dụng tốt khi đưa vào thực tiễn.', NULL, NULL, 1, NULL, NULL, 's15.1'),
(788, 's15.1.3', NULL, NULL, 'Nhiệt tình: có thái độ tích cực và nhiệt tình khi làm việc.', NULL, NULL, 1, NULL, NULL, 's15.1'),
(789, 's15.1.4', NULL, NULL, 'Đạo đức làm việc: cho phép cá nhân đưa ra quyết định và thực hiện nhiệm vụ của mình với các giá trị đạo đức tích cực bao gồm các yếu tố như chính trực, trách nhiệm, tiêu chuẩn cao, kỉ luật, khiêm tốn và làm việc theo nhóm.', NULL, NULL, 1, NULL, NULL, 's15.1'),
(790, 's15.1.5', NULL, NULL, 'Tự nguyện: đồng ý hoặc sẵn sàng làm điều gì đó mà không bị ép buộc, gò bó', NULL, NULL, 1, NULL, NULL, 's15.1'),
(791, 's15.1.6', NULL, NULL, 'Đáng tin cậy: là người đáng tin cậy, có trách nhiệm và hoàn toàn có thể tin tưởng được.', NULL, NULL, 1, NULL, NULL, 's15.1'),
(792, 's15.1.7', NULL, NULL, 'Các kĩ năng giao tiếp: Giao tiếp bằng miệng và bằng văn bản theo cách đơn giản, ngắn gọn, rõ ràng và dễ hiểu. Tập hợp các kĩ năng cho phép một người truyền đạt thông tin để nó được tiếp nhận và hiểu. Khả năng truyền đạt thông tin để nó được tiếp nhận và hiểu rõ. Khả năng giao tiếp hiệu quả với người khác.', NULL, NULL, 1, NULL, NULL, 's15.1'),
(793, 's15.1.8', NULL, NULL, 'Các kĩ năng tham gia nhóm: Cá nhân có khả năng tốt trong việc phối hợp và hợp tác chặt chẽ với những người đồng đội khác, khả năng làm việc hiệu quả trong môi trường nhóm và đóng góp cho mục tiêu mong muốn.', NULL, NULL, 1, NULL, NULL, 's15.1'),
(794, 's15.1.9', NULL, NULL, 'Các kĩ năng lãnh đạo công nghệ: khả năng giám sát một nhóm chuyên gia kĩ thuật trong khi đưa ra các quyết định liên quan đến kĩ thuật và phát triển phần mềm.', NULL, NULL, 1, NULL, NULL, 's15.1'),
(795, 's15.2.1', NULL, NULL, 'Tìm kiếm sự giúp đỡ: tìm kiếm sự hỗ trợ, có thể phân tích và lựa chọn ý kiến tư vấn, đưa ra cách giải quyết tối ưu sau khi được tư vấn.', NULL, NULL, 1, NULL, NULL, 's15.2'),
(796, 's15.2.2', NULL, NULL, 'Giúp đỡ người khác: hỗ trợ các cá nhân khác để đạt được mục tiêu hoặc điều gì đó hữu ích.', NULL, NULL, 1, NULL, NULL, 's15.2'),
(797, 's15.2.3', NULL, NULL, 'Định hướng nhóm: tập trung vào đồng đội hơn là vào bản thân.', NULL, NULL, 1, NULL, NULL, 's15.2'),
(798, 's15.2.4', NULL, NULL, 'Sẵn sàng đối đầu với người khác: luôn trong tâm thế chấp nhận thử thách với các cá nhân khác.', NULL, NULL, 1, NULL, NULL, 's15.2'),
(799, 's15.3.1', NULL, NULL, 'Được thúc đẩy bởi mong muốn đóng góp: mong muốn mạnh mẽ để làm hoặc có một điều đó có ích cho tập thể.', NULL, NULL, 1, NULL, NULL, 's15.3'),
(800, 's15.3.2', NULL, NULL, 'Tự hào về phẩm chất và năng lực của cá nhân: thể hiện sự đáng tin cậy và luôn mang đến chất lượng trong công việc.', NULL, NULL, 1, NULL, NULL, 's15.3'),
(801, 's15.3.3', NULL, NULL, 'Kiên trì: cố gắng hết mình, dù thất bại hay khó khăn cũng không bỏ dở công việc.', NULL, NULL, 1, NULL, NULL, 's15.3'),
(802, 's15.3.4', NULL, NULL, 'Mong muốn cải thiện mọi thứ: khát khao đạt được điều gì đó tốt hơn.', NULL, NULL, 1, NULL, NULL, 's15.3'),
(803, 's15.3.5', NULL, NULL, 'Chủ động: hành vi tự khởi xướng cố gắng giải quyết một vấn đề trước khi nó xảy ra.', NULL, NULL, 1, NULL, NULL, 's15.3'),
(804, 's15.3.6', NULL, NULL, 'Duy trì bức tranh toàn cảnh về một vấn đề: có thể giúp cá nhân sắp xếp thứ tự ưu tiên của các công việc một cách hiệu quả, đặt mục tiêu tốt hơn và cải thiện khả năng quản lí thời gian.', NULL, NULL, 1, NULL, NULL, 's15.3'),
(805, 's15.3.7', NULL, NULL, 'Có khuynh hướng hành động: không ngại đưa ra quyết định và hành động, ngay cả khi đối mặt với sự không chắc chắn. (Ví dụ: Có thể bạn đã làm việc với ai đó hoặc một nhóm không có thiên hướng hành động. Khi đối mặt với sự không chắc chắn, những người này đóng băng và không thể đưa ra quyết định)', NULL, NULL, 1, NULL, NULL, 's15.3'),
(806, 's15.3.8', NULL, NULL, 'Kĩ lưỡng: không để xảy ra sai sót, cân nhắc kĩ trước khi đưa ra quyết định.', NULL, NULL, 1, NULL, NULL, 's15.3'),
(807, 's15.3.9', NULL, NULL, 'Ý thức nhiệm vụ: xác định rõ nhiệm vụ để làm điều gì đó.', NULL, NULL, 1, NULL, NULL, 's15.3'),
(808, 's15.3.10', NULL, NULL, 'Sức mạnh của niềm tin: sự tin tưởng, tự tin vào khả năng của bản thân trong mọi việc.', NULL, NULL, 1, NULL, NULL, 's15.3'),
(809, 's15.3.11', NULL, NULL, 'Kết hợp giữa mục tiêu cá nhân và mục tiêu công việc\nMục tiêu nghề nghiệp có liên quan đến những gì cá nhân muốn hoàn thành với học vấn và sự nghiệp. \nMục tiêu cá nhân thường liên quan nhiều hơn đến sức khỏe, hạnh phúc, các mối quan hệ và hạnh phúc.', NULL, NULL, 1, NULL, NULL, 's15.3'),
(810, 's15.3.12', NULL, NULL, 'Đóng vai trò chủ động trong quản lí: nhấn mạnh vào việc lập kế hoạch chiến lược và quản lí rủi ro nhằm lường trước và giải quyết một việc gì đó trước khi nó phát sinh.', NULL, NULL, 1, NULL, NULL, 's15.3'),
(811, 's15.3.13', NULL, NULL, 'Quản lí thời gian: sắp xếp ưu tiên các nhiệm vụ quan trọng và không quan trọng; từ đó lập kế hoạch phân chia thời gian hợp lí cho từng công việc khác nhau của cá nhân.', NULL, NULL, 1, NULL, NULL, 's15.3');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add account', 7, 'add_account'),
(26, 'Can change account', 7, 'change_account'),
(27, 'Can delete account', 7, 'delete_account'),
(28, 'Can view account', 7, 'view_account'),
(29, 'Can add activity', 8, 'add_activity'),
(30, 'Can change activity', 8, 'change_activity'),
(31, 'Can delete activity', 8, 'delete_activity'),
(32, 'Can view activity', 8, 'view_activity'),
(33, 'Can add career', 9, 'add_career'),
(34, 'Can change career', 9, 'change_career'),
(35, 'Can delete career', 9, 'delete_career'),
(36, 'Can view career', 9, 'view_career'),
(37, 'Can add hint scale', 10, 'add_hintscale'),
(38, 'Can change hint scale', 10, 'change_hintscale'),
(39, 'Can delete hint scale', 10, 'delete_hintscale'),
(40, 'Can view hint scale', 10, 'view_hintscale'),
(41, 'Can add question and hint', 11, 'add_questionandhint'),
(42, 'Can change question and hint', 11, 'change_questionandhint'),
(43, 'Can delete question and hint', 11, 'delete_questionandhint'),
(44, 'Can view question and hint', 11, 'view_questionandhint'),
(45, 'Can add solution', 12, 'add_solution'),
(46, 'Can change solution', 12, 'change_solution'),
(47, 'Can delete solution', 12, 'delete_solution'),
(48, 'Can view solution', 12, 'view_solution'),
(49, 'Can add skill area', 13, 'add_skillarea'),
(50, 'Can change skill area', 13, 'change_skillarea'),
(51, 'Can delete skill area', 13, 'delete_skillarea'),
(52, 'Can view skill area', 13, 'view_skillarea'),
(53, 'Can add skill', 14, 'add_skill'),
(54, 'Can change skill', 14, 'change_skill'),
(55, 'Can delete skill', 14, 'delete_skill'),
(56, 'Can view skill', 14, 'view_skill'),
(57, 'Can add rate solution', 15, 'add_ratesolution'),
(58, 'Can change rate solution', 15, 'change_ratesolution'),
(59, 'Can delete rate solution', 15, 'delete_ratesolution'),
(60, 'Can view rate solution', 15, 'view_ratesolution'),
(61, 'Can add competence', 16, 'add_competence'),
(62, 'Can change competence', 16, 'change_competence'),
(63, 'Can delete competence', 16, 'delete_competence'),
(64, 'Can view competence', 16, 'view_competence'),
(65, 'Can add result', 17, 'add_result'),
(66, 'Can change result', 17, 'change_result'),
(67, 'Can delete result', 17, 'delete_result'),
(68, 'Can view result', 17, 'view_result');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$dPvv1LoJkX43avykI01LWT$8Id5IccMyx/k4ZfzHwfyFFO5Z1Nuzg+B5V3UpnlVJk4=', '2023-03-01 09:59:26.063825', 1, 'admin', '', '', '', 1, 1, '2023-03-01 09:58:29.010396'),
(2, 'pbkdf2_sha256$260000$JuC02f7Pw6sLMCDQ5siDCe$0A2A2wUNIUO0FXlm3JoONyjugHzOXMA0WZdEM5AT5xY=', '2023-03-01 10:02:28.689673', 0, 'longnvp', 'Long', 'Nguyễn Võ Phi', 'nguyenvophilong1112@gmail.com', 0, 1, '2023-03-01 10:02:28.491046'),
(3, 'pbkdf2_sha256$260000$ae5gmiZX8FBxxaV6Kfspgb$9EjT/z4ZLW8bzhxQfjYon5Od3yo82XOwclUULmAGMWE=', '2023-03-01 10:03:18.602173', 0, 'lannvp', 'Lân', 'Nguyễn Võ Phi', 'nguyenvophilan@gmail.com', 0, 1, '2023-03-01 10:03:18.407377'),
(4, 'pbkdf2_sha256$260000$OTpeavxyZSo6ejo8m7bBDB$VsiwJfOzFCi7hjcrPfWfRDhVO8vH3z2+x12sWG1EF78=', '2023-03-01 10:04:05.347856', 0, 'huongntt', 'Hương', 'Nguyễn Thị Thanh', 'thanhhuong@gmail.com', 0, 1, '2023-03-01 10:04:05.154449');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `career`
--

CREATE TABLE `career` (
  `careerid` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `editdate` datetime(6) DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `career`
--

INSERT INTO `career` (`careerid`, `name`, `description`, `createdate`, `editdate`, `isenable`, `note`) VALUES
(1, 'Công nghệ phần mềm', NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `competence`
--

CREATE TABLE `competence` (
  `competenceid` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `level` varchar(250) DEFAULT NULL,
  `requirement` varchar(250) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `editdate` datetime(6) DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `careerid_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `competence`
--

INSERT INTO `competence` (`competenceid`, `name`, `level`, `requirement`, `description`, `createdate`, `editdate`, `isenable`, `note`, `careerid_id`) VALUES
(1, 'Kĩ Sư Phần Mềm Hỗ Trợ', '1', NULL, 'Cá nhân có đủ năng lực làm theo hướng dẫn trong khi thực hiện một hoạt động', NULL, NULL, 1, NULL, 1),
(2, 'Kĩ Sư Phần Mềm Nhập Môn', '2', NULL, 'Cá nhân có đủ năng lực để hỗ trợ trong các hoạt động hoặc có thể thực hiện công việc dưới sự giám sát', NULL, NULL, 1, NULL, 1),
(3, 'Kĩ Sư Phần Mềm', '3', NULL, 'Cá nhân có đủ năng lực để thực hiện công việc với ít sự giám sát hoặc không cần giám sát', NULL, NULL, 1, NULL, 1),
(4, 'Trưởng Nhóm Kĩ Sư Phần Mềm', '4', NULL, 'Cá nhân có đủ khả năng lãnh đạo và chỉ đạo dẫn dắt những người tham gia thực hiện các hoạt động trong một kĩ năng hoặc lĩnh vực kĩ năng', NULL, NULL, 1, NULL, 1),
(5, 'Kĩ Sư Phần Mềm Cấp Cao', '5', NULL, 'Cá nhân có đủ khả năng sáng tạo và chỉnh sửa các quy trình, thủ tục, phương pháp và công cụ hiện có để thực hiện hoạt động, nhóm hoạt động thuộc các kĩ năng, và các kĩ năng thuộc nhiều lĩnh vực kĩ năng', NULL, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-03-01 09:59:48.637248', '1', 'Career object (1)', 1, 'new through import_export', 9, 1),
(2, '2023-03-01 10:00:03.166920', '1', 'Competence object (1)', 1, 'new through import_export', 16, 1),
(3, '2023-03-01 10:00:03.168912', '2', 'Competence object (2)', 1, 'new through import_export', 16, 1),
(4, '2023-03-01 10:00:03.169931', '3', 'Competence object (3)', 1, 'new through import_export', 16, 1),
(5, '2023-03-01 10:00:03.170948', '4', 'Competence object (4)', 1, 'new through import_export', 16, 1),
(6, '2023-03-01 10:00:03.171942', '5', 'Competence object (5)', 1, 'new through import_export', 16, 1),
(7, '2023-03-01 10:00:16.430775', '1', 'SkillArea object (1)', 1, 'new through import_export', 13, 1),
(8, '2023-03-01 10:00:16.432775', '2', 'SkillArea object (2)', 1, 'new through import_export', 13, 1),
(9, '2023-03-01 10:00:16.433775', '3', 'SkillArea object (3)', 1, 'new through import_export', 13, 1),
(10, '2023-03-01 10:00:16.435775', '4', 'SkillArea object (4)', 1, 'new through import_export', 13, 1),
(11, '2023-03-01 10:00:16.437057', '5', 'SkillArea object (5)', 1, 'new through import_export', 13, 1),
(12, '2023-03-01 10:00:16.438060', '6', 'SkillArea object (6)', 1, 'new through import_export', 13, 1),
(13, '2023-03-01 10:00:16.439059', '7', 'SkillArea object (7)', 1, 'new through import_export', 13, 1),
(14, '2023-03-01 10:00:16.440298', '8', 'SkillArea object (8)', 1, 'new through import_export', 13, 1),
(15, '2023-03-01 10:00:16.441299', '9', 'SkillArea object (9)', 1, 'new through import_export', 13, 1),
(16, '2023-03-01 10:00:16.442299', '10', 'SkillArea object (10)', 1, 'new through import_export', 13, 1),
(17, '2023-03-01 10:00:16.443300', '11', 'SkillArea object (11)', 1, 'new through import_export', 13, 1),
(18, '2023-03-01 10:00:16.444639', '12', 'SkillArea object (12)', 1, 'new through import_export', 13, 1),
(19, '2023-03-01 10:00:16.445692', '13', 'SkillArea object (13)', 1, 'new through import_export', 13, 1),
(20, '2023-03-01 10:00:16.446714', '14', 'SkillArea object (14)', 1, 'new through import_export', 13, 1),
(21, '2023-03-01 10:00:16.446714', '15', 'SkillArea object (15)', 1, 'new through import_export', 13, 1),
(22, '2023-03-01 10:00:32.352156', '1', 'Skill object (1)', 1, 'new through import_export', 14, 1),
(23, '2023-03-01 10:00:32.352866', '2', 'Skill object (2)', 1, 'new through import_export', 14, 1),
(24, '2023-03-01 10:00:32.354875', '3', 'Skill object (3)', 1, 'new through import_export', 14, 1),
(25, '2023-03-01 10:00:32.355875', '4', 'Skill object (4)', 1, 'new through import_export', 14, 1),
(26, '2023-03-01 10:00:32.356882', '5', 'Skill object (5)', 1, 'new through import_export', 14, 1),
(27, '2023-03-01 10:00:32.357871', '6', 'Skill object (6)', 1, 'new through import_export', 14, 1),
(28, '2023-03-01 10:00:32.358869', '7', 'Skill object (7)', 1, 'new through import_export', 14, 1),
(29, '2023-03-01 10:00:32.360869', '8', 'Skill object (8)', 1, 'new through import_export', 14, 1),
(30, '2023-03-01 10:00:32.361870', '9', 'Skill object (9)', 1, 'new through import_export', 14, 1),
(31, '2023-03-01 10:00:32.362870', '10', 'Skill object (10)', 1, 'new through import_export', 14, 1),
(32, '2023-03-01 10:00:32.364870', '11', 'Skill object (11)', 1, 'new through import_export', 14, 1),
(33, '2023-03-01 10:00:32.366003', '12', 'Skill object (12)', 1, 'new through import_export', 14, 1),
(34, '2023-03-01 10:00:32.366907', '13', 'Skill object (13)', 1, 'new through import_export', 14, 1),
(35, '2023-03-01 10:00:32.367875', '14', 'Skill object (14)', 1, 'new through import_export', 14, 1),
(36, '2023-03-01 10:00:32.369878', '15', 'Skill object (15)', 1, 'new through import_export', 14, 1),
(37, '2023-03-01 10:00:32.370878', '16', 'Skill object (16)', 1, 'new through import_export', 14, 1),
(38, '2023-03-01 10:00:32.371879', '17', 'Skill object (17)', 1, 'new through import_export', 14, 1),
(39, '2023-03-01 10:00:32.372840', '18', 'Skill object (18)', 1, 'new through import_export', 14, 1),
(40, '2023-03-01 10:00:32.373842', '19', 'Skill object (19)', 1, 'new through import_export', 14, 1),
(41, '2023-03-01 10:00:32.375842', '20', 'Skill object (20)', 1, 'new through import_export', 14, 1),
(42, '2023-03-01 10:00:32.376843', '21', 'Skill object (21)', 1, 'new through import_export', 14, 1),
(43, '2023-03-01 10:00:32.377843', '22', 'Skill object (22)', 1, 'new through import_export', 14, 1),
(44, '2023-03-01 10:00:32.378843', '23', 'Skill object (23)', 1, 'new through import_export', 14, 1),
(45, '2023-03-01 10:00:32.379843', '24', 'Skill object (24)', 1, 'new through import_export', 14, 1),
(46, '2023-03-01 10:00:32.381844', '25', 'Skill object (25)', 1, 'new through import_export', 14, 1),
(47, '2023-03-01 10:00:32.382844', '26', 'Skill object (26)', 1, 'new through import_export', 14, 1),
(48, '2023-03-01 10:00:32.383844', '27', 'Skill object (27)', 1, 'new through import_export', 14, 1),
(49, '2023-03-01 10:00:32.384844', '28', 'Skill object (28)', 1, 'new through import_export', 14, 1),
(50, '2023-03-01 10:00:32.386890', '29', 'Skill object (29)', 1, 'new through import_export', 14, 1),
(51, '2023-03-01 10:00:32.388163', '30', 'Skill object (30)', 1, 'new through import_export', 14, 1),
(52, '2023-03-01 10:00:32.388758', '31', 'Skill object (31)', 1, 'new through import_export', 14, 1),
(53, '2023-03-01 10:00:32.389759', '32', 'Skill object (32)', 1, 'new through import_export', 14, 1),
(54, '2023-03-01 10:00:32.390760', '33', 'Skill object (33)', 1, 'new through import_export', 14, 1),
(55, '2023-03-01 10:00:32.392760', '34', 'Skill object (34)', 1, 'new through import_export', 14, 1),
(56, '2023-03-01 10:00:32.393761', '35', 'Skill object (35)', 1, 'new through import_export', 14, 1),
(57, '2023-03-01 10:00:32.394761', '36', 'Skill object (36)', 1, 'new through import_export', 14, 1),
(58, '2023-03-01 10:00:32.396316', '37', 'Skill object (37)', 1, 'new through import_export', 14, 1),
(59, '2023-03-01 10:00:32.396896', '38', 'Skill object (38)', 1, 'new through import_export', 14, 1),
(60, '2023-03-01 10:00:32.397898', '39', 'Skill object (39)', 1, 'new through import_export', 14, 1),
(61, '2023-03-01 10:00:32.399898', '40', 'Skill object (40)', 1, 'new through import_export', 14, 1),
(62, '2023-03-01 10:00:32.400898', '41', 'Skill object (41)', 1, 'new through import_export', 14, 1),
(63, '2023-03-01 10:00:32.402341', '42', 'Skill object (42)', 1, 'new through import_export', 14, 1),
(64, '2023-03-01 10:00:32.402922', '43', 'Skill object (43)', 1, 'new through import_export', 14, 1),
(65, '2023-03-01 10:00:32.403902', '44', 'Skill object (44)', 1, 'new through import_export', 14, 1),
(66, '2023-03-01 10:00:32.404905', '45', 'Skill object (45)', 1, 'new through import_export', 14, 1),
(67, '2023-03-01 10:00:32.406904', '46', 'Skill object (46)', 1, 'new through import_export', 14, 1),
(68, '2023-03-01 10:00:32.407905', '47', 'Skill object (47)', 1, 'new through import_export', 14, 1),
(69, '2023-03-01 10:00:32.409905', '48', 'Skill object (48)', 1, 'new through import_export', 14, 1),
(70, '2023-03-01 10:00:32.410905', '49', 'Skill object (49)', 1, 'new through import_export', 14, 1),
(71, '2023-03-01 10:00:32.411908', '50', 'Skill object (50)', 1, 'new through import_export', 14, 1),
(72, '2023-03-01 10:00:32.412906', '51', 'Skill object (51)', 1, 'new through import_export', 14, 1),
(73, '2023-03-01 10:00:32.413906', '52', 'Skill object (52)', 1, 'new through import_export', 14, 1),
(74, '2023-03-01 10:00:32.415907', '53', 'Skill object (53)', 1, 'new through import_export', 14, 1),
(75, '2023-03-01 10:00:32.416907', '54', 'Skill object (54)', 1, 'new through import_export', 14, 1),
(76, '2023-03-01 10:00:32.417909', '55', 'Skill object (55)', 1, 'new through import_export', 14, 1),
(77, '2023-03-01 10:00:32.418907', '56', 'Skill object (56)', 1, 'new through import_export', 14, 1),
(78, '2023-03-01 10:00:32.419909', '57', 'Skill object (57)', 1, 'new through import_export', 14, 1),
(79, '2023-03-01 10:00:32.420908', '58', 'Skill object (58)', 1, 'new through import_export', 14, 1),
(80, '2023-03-01 10:00:32.422859', '59', 'Skill object (59)', 1, 'new through import_export', 14, 1),
(81, '2023-03-01 10:00:32.423863', '60', 'Skill object (60)', 1, 'new through import_export', 14, 1),
(82, '2023-03-01 10:00:32.424861', '61', 'Skill object (61)', 1, 'new through import_export', 14, 1),
(83, '2023-03-01 10:00:32.425802', '62', 'Skill object (62)', 1, 'new through import_export', 14, 1),
(84, '2023-03-01 10:00:32.426804', '63', 'Skill object (63)', 1, 'new through import_export', 14, 1),
(85, '2023-03-01 10:00:32.427804', '64', 'Skill object (64)', 1, 'new through import_export', 14, 1),
(86, '2023-03-01 10:00:32.428805', '65', 'Skill object (65)', 1, 'new through import_export', 14, 1),
(87, '2023-03-01 10:00:32.429804', '66', 'Skill object (66)', 1, 'new through import_export', 14, 1),
(88, '2023-03-01 10:00:32.430806', '67', 'Skill object (67)', 1, 'new through import_export', 14, 1),
(89, '2023-03-01 10:00:52.966247', '1', 'Activity object (1)', 1, 'new through import_export', 8, 1),
(90, '2023-03-01 10:00:52.967247', '2', 'Activity object (2)', 1, 'new through import_export', 8, 1),
(91, '2023-03-01 10:00:52.968247', '3', 'Activity object (3)', 1, 'new through import_export', 8, 1),
(92, '2023-03-01 10:00:52.969248', '4', 'Activity object (4)', 1, 'new through import_export', 8, 1),
(93, '2023-03-01 10:00:52.971248', '5', 'Activity object (5)', 1, 'new through import_export', 8, 1),
(94, '2023-03-01 10:00:52.972248', '6', 'Activity object (6)', 1, 'new through import_export', 8, 1),
(95, '2023-03-01 10:00:52.974249', '7', 'Activity object (7)', 1, 'new through import_export', 8, 1),
(96, '2023-03-01 10:00:52.975539', '8', 'Activity object (8)', 1, 'new through import_export', 8, 1),
(97, '2023-03-01 10:00:52.976628', '9', 'Activity object (9)', 1, 'new through import_export', 8, 1),
(98, '2023-03-01 10:00:52.977189', '10', 'Activity object (10)', 1, 'new through import_export', 8, 1),
(99, '2023-03-01 10:00:52.978192', '11', 'Activity object (11)', 1, 'new through import_export', 8, 1),
(100, '2023-03-01 10:00:52.980191', '12', 'Activity object (12)', 1, 'new through import_export', 8, 1),
(101, '2023-03-01 10:00:52.982189', '13', 'Activity object (13)', 1, 'new through import_export', 8, 1),
(102, '2023-03-01 10:00:52.983723', '14', 'Activity object (14)', 1, 'new through import_export', 8, 1),
(103, '2023-03-01 10:00:52.984727', '15', 'Activity object (15)', 1, 'new through import_export', 8, 1),
(104, '2023-03-01 10:00:52.985746', '16', 'Activity object (16)', 1, 'new through import_export', 8, 1),
(105, '2023-03-01 10:00:52.987727', '17', 'Activity object (17)', 1, 'new through import_export', 8, 1),
(106, '2023-03-01 10:00:52.988747', '18', 'Activity object (18)', 1, 'new through import_export', 8, 1),
(107, '2023-03-01 10:00:52.989729', '19', 'Activity object (19)', 1, 'new through import_export', 8, 1),
(108, '2023-03-01 10:00:52.990736', '20', 'Activity object (20)', 1, 'new through import_export', 8, 1),
(109, '2023-03-01 10:00:52.991735', '21', 'Activity object (21)', 1, 'new through import_export', 8, 1),
(110, '2023-03-01 10:00:52.993743', '22', 'Activity object (22)', 1, 'new through import_export', 8, 1),
(111, '2023-03-01 10:00:52.994934', '23', 'Activity object (23)', 1, 'new through import_export', 8, 1),
(112, '2023-03-01 10:00:52.995936', '24', 'Activity object (24)', 1, 'new through import_export', 8, 1),
(113, '2023-03-01 10:00:52.997307', '25', 'Activity object (25)', 1, 'new through import_export', 8, 1),
(114, '2023-03-01 10:00:52.998360', '26', 'Activity object (26)', 1, 'new through import_export', 8, 1),
(115, '2023-03-01 10:00:52.999550', '27', 'Activity object (27)', 1, 'new through import_export', 8, 1),
(116, '2023-03-01 10:00:53.000552', '28', 'Activity object (28)', 1, 'new through import_export', 8, 1),
(117, '2023-03-01 10:00:53.001551', '29', 'Activity object (29)', 1, 'new through import_export', 8, 1),
(118, '2023-03-01 10:00:53.003495', '30', 'Activity object (30)', 1, 'new through import_export', 8, 1),
(119, '2023-03-01 10:00:53.004562', '31', 'Activity object (31)', 1, 'new through import_export', 8, 1),
(120, '2023-03-01 10:00:53.005554', '32', 'Activity object (32)', 1, 'new through import_export', 8, 1),
(121, '2023-03-01 10:00:53.006556', '33', 'Activity object (33)', 1, 'new through import_export', 8, 1),
(122, '2023-03-01 10:00:53.007556', '34', 'Activity object (34)', 1, 'new through import_export', 8, 1),
(123, '2023-03-01 10:00:53.008556', '35', 'Activity object (35)', 1, 'new through import_export', 8, 1),
(124, '2023-03-01 10:00:53.010556', '36', 'Activity object (36)', 1, 'new through import_export', 8, 1),
(125, '2023-03-01 10:00:53.011557', '37', 'Activity object (37)', 1, 'new through import_export', 8, 1),
(126, '2023-03-01 10:00:53.012409', '38', 'Activity object (38)', 1, 'new through import_export', 8, 1),
(127, '2023-03-01 10:00:53.013717', '39', 'Activity object (39)', 1, 'new through import_export', 8, 1),
(128, '2023-03-01 10:00:53.014558', '40', 'Activity object (40)', 1, 'new through import_export', 8, 1),
(129, '2023-03-01 10:00:53.015561', '41', 'Activity object (41)', 1, 'new through import_export', 8, 1),
(130, '2023-03-01 10:00:53.016561', '42', 'Activity object (42)', 1, 'new through import_export', 8, 1),
(131, '2023-03-01 10:00:53.017704', '43', 'Activity object (43)', 1, 'new through import_export', 8, 1),
(132, '2023-03-01 10:00:53.018561', '44', 'Activity object (44)', 1, 'new through import_export', 8, 1),
(133, '2023-03-01 10:00:53.019562', '45', 'Activity object (45)', 1, 'new through import_export', 8, 1),
(134, '2023-03-01 10:00:53.020561', '46', 'Activity object (46)', 1, 'new through import_export', 8, 1),
(135, '2023-03-01 10:00:53.021561', '47', 'Activity object (47)', 1, 'new through import_export', 8, 1),
(136, '2023-03-01 10:00:53.023187', '48', 'Activity object (48)', 1, 'new through import_export', 8, 1),
(137, '2023-03-01 10:00:53.024351', '49', 'Activity object (49)', 1, 'new through import_export', 8, 1),
(138, '2023-03-01 10:00:53.025378', '50', 'Activity object (50)', 1, 'new through import_export', 8, 1),
(139, '2023-03-01 10:00:53.026381', '51', 'Activity object (51)', 1, 'new through import_export', 8, 1),
(140, '2023-03-01 10:00:53.027381', '52', 'Activity object (52)', 1, 'new through import_export', 8, 1),
(141, '2023-03-01 10:00:53.028382', '53', 'Activity object (53)', 1, 'new through import_export', 8, 1),
(142, '2023-03-01 10:00:53.029381', '54', 'Activity object (54)', 1, 'new through import_export', 8, 1),
(143, '2023-03-01 10:00:53.030381', '55', 'Activity object (55)', 1, 'new through import_export', 8, 1),
(144, '2023-03-01 10:00:53.031383', '56', 'Activity object (56)', 1, 'new through import_export', 8, 1),
(145, '2023-03-01 10:00:53.032384', '57', 'Activity object (57)', 1, 'new through import_export', 8, 1),
(146, '2023-03-01 10:00:53.033383', '58', 'Activity object (58)', 1, 'new through import_export', 8, 1),
(147, '2023-03-01 10:00:53.034724', '59', 'Activity object (59)', 1, 'new through import_export', 8, 1),
(148, '2023-03-01 10:00:53.035269', '60', 'Activity object (60)', 1, 'new through import_export', 8, 1),
(149, '2023-03-01 10:00:53.036281', '61', 'Activity object (61)', 1, 'new through import_export', 8, 1),
(150, '2023-03-01 10:00:53.037620', '62', 'Activity object (62)', 1, 'new through import_export', 8, 1),
(151, '2023-03-01 10:00:53.038986', '63', 'Activity object (63)', 1, 'new through import_export', 8, 1),
(152, '2023-03-01 10:00:53.039896', '64', 'Activity object (64)', 1, 'new through import_export', 8, 1),
(153, '2023-03-01 10:00:53.040898', '65', 'Activity object (65)', 1, 'new through import_export', 8, 1),
(154, '2023-03-01 10:00:53.040898', '66', 'Activity object (66)', 1, 'new through import_export', 8, 1),
(155, '2023-03-01 10:00:53.042496', '67', 'Activity object (67)', 1, 'new through import_export', 8, 1),
(156, '2023-03-01 10:00:53.043519', '68', 'Activity object (68)', 1, 'new through import_export', 8, 1),
(157, '2023-03-01 10:00:53.044654', '69', 'Activity object (69)', 1, 'new through import_export', 8, 1),
(158, '2023-03-01 10:00:53.045656', '70', 'Activity object (70)', 1, 'new through import_export', 8, 1),
(159, '2023-03-01 10:00:53.046656', '71', 'Activity object (71)', 1, 'new through import_export', 8, 1),
(160, '2023-03-01 10:00:53.046656', '72', 'Activity object (72)', 1, 'new through import_export', 8, 1),
(161, '2023-03-01 10:00:53.047656', '73', 'Activity object (73)', 1, 'new through import_export', 8, 1),
(162, '2023-03-01 10:00:53.048656', '74', 'Activity object (74)', 1, 'new through import_export', 8, 1),
(163, '2023-03-01 10:00:53.049657', '75', 'Activity object (75)', 1, 'new through import_export', 8, 1),
(164, '2023-03-01 10:00:53.050657', '76', 'Activity object (76)', 1, 'new through import_export', 8, 1),
(165, '2023-03-01 10:00:53.052398', '77', 'Activity object (77)', 1, 'new through import_export', 8, 1),
(166, '2023-03-01 10:00:53.053554', '78', 'Activity object (78)', 1, 'new through import_export', 8, 1),
(167, '2023-03-01 10:00:53.054489', '79', 'Activity object (79)', 1, 'new through import_export', 8, 1),
(168, '2023-03-01 10:00:53.055492', '80', 'Activity object (80)', 1, 'new through import_export', 8, 1),
(169, '2023-03-01 10:00:53.056496', '81', 'Activity object (81)', 1, 'new through import_export', 8, 1),
(170, '2023-03-01 10:00:53.057500', '82', 'Activity object (82)', 1, 'new through import_export', 8, 1),
(171, '2023-03-01 10:00:53.059499', '83', 'Activity object (83)', 1, 'new through import_export', 8, 1),
(172, '2023-03-01 10:00:53.060499', '84', 'Activity object (84)', 1, 'new through import_export', 8, 1),
(173, '2023-03-01 10:00:53.061499', '85', 'Activity object (85)', 1, 'new through import_export', 8, 1),
(174, '2023-03-01 10:00:53.063037', '86', 'Activity object (86)', 1, 'new through import_export', 8, 1),
(175, '2023-03-01 10:00:53.064040', '87', 'Activity object (87)', 1, 'new through import_export', 8, 1),
(176, '2023-03-01 10:00:53.065040', '88', 'Activity object (88)', 1, 'new through import_export', 8, 1),
(177, '2023-03-01 10:00:53.066039', '89', 'Activity object (89)', 1, 'new through import_export', 8, 1),
(178, '2023-03-01 10:00:53.067040', '90', 'Activity object (90)', 1, 'new through import_export', 8, 1),
(179, '2023-03-01 10:00:53.068160', '91', 'Activity object (91)', 1, 'new through import_export', 8, 1),
(180, '2023-03-01 10:00:53.069089', '92', 'Activity object (92)', 1, 'new through import_export', 8, 1),
(181, '2023-03-01 10:00:53.070107', '93', 'Activity object (93)', 1, 'new through import_export', 8, 1),
(182, '2023-03-01 10:00:53.071042', '94', 'Activity object (94)', 1, 'new through import_export', 8, 1),
(183, '2023-03-01 10:00:53.072044', '95', 'Activity object (95)', 1, 'new through import_export', 8, 1),
(184, '2023-03-01 10:00:53.072916', '96', 'Activity object (96)', 1, 'new through import_export', 8, 1),
(185, '2023-03-01 10:00:53.073918', '97', 'Activity object (97)', 1, 'new through import_export', 8, 1),
(186, '2023-03-01 10:00:53.074918', '98', 'Activity object (98)', 1, 'new through import_export', 8, 1),
(187, '2023-03-01 10:00:53.075918', '99', 'Activity object (99)', 1, 'new through import_export', 8, 1),
(188, '2023-03-01 10:00:53.076918', '100', 'Activity object (100)', 1, 'new through import_export', 8, 1),
(189, '2023-03-01 10:00:53.076918', '101', 'Activity object (101)', 1, 'new through import_export', 8, 1),
(190, '2023-03-01 10:00:53.077918', '102', 'Activity object (102)', 1, 'new through import_export', 8, 1),
(191, '2023-03-01 10:00:53.078918', '103', 'Activity object (103)', 1, 'new through import_export', 8, 1),
(192, '2023-03-01 10:00:53.080920', '104', 'Activity object (104)', 1, 'new through import_export', 8, 1),
(193, '2023-03-01 10:00:53.081919', '105', 'Activity object (105)', 1, 'new through import_export', 8, 1),
(194, '2023-03-01 10:00:53.082619', '106', 'Activity object (106)', 1, 'new through import_export', 8, 1),
(195, '2023-03-01 10:00:53.084363', '107', 'Activity object (107)', 1, 'new through import_export', 8, 1),
(196, '2023-03-01 10:00:53.084908', '108', 'Activity object (108)', 1, 'new through import_export', 8, 1),
(197, '2023-03-01 10:00:53.085931', '109', 'Activity object (109)', 1, 'new through import_export', 8, 1),
(198, '2023-03-01 10:00:53.086919', '110', 'Activity object (110)', 1, 'new through import_export', 8, 1),
(199, '2023-03-01 10:00:53.088681', '111', 'Activity object (111)', 1, 'new through import_export', 8, 1),
(200, '2023-03-01 10:00:53.089620', '112', 'Activity object (112)', 1, 'new through import_export', 8, 1),
(201, '2023-03-01 10:00:53.090621', '113', 'Activity object (113)', 1, 'new through import_export', 8, 1),
(202, '2023-03-01 10:00:53.091621', '114', 'Activity object (114)', 1, 'new through import_export', 8, 1),
(203, '2023-03-01 10:00:53.091621', '115', 'Activity object (115)', 1, 'new through import_export', 8, 1),
(204, '2023-03-01 10:00:53.092622', '116', 'Activity object (116)', 1, 'new through import_export', 8, 1),
(205, '2023-03-01 10:00:53.093622', '117', 'Activity object (117)', 1, 'new through import_export', 8, 1),
(206, '2023-03-01 10:00:53.094622', '118', 'Activity object (118)', 1, 'new through import_export', 8, 1),
(207, '2023-03-01 10:00:53.095623', '119', 'Activity object (119)', 1, 'new through import_export', 8, 1),
(208, '2023-03-01 10:00:53.096622', '120', 'Activity object (120)', 1, 'new through import_export', 8, 1),
(209, '2023-03-01 10:00:53.098346', '121', 'Activity object (121)', 1, 'new through import_export', 8, 1),
(210, '2023-03-01 10:00:53.099348', '122', 'Activity object (122)', 1, 'new through import_export', 8, 1),
(211, '2023-03-01 10:00:53.099348', '123', 'Activity object (123)', 1, 'new through import_export', 8, 1),
(212, '2023-03-01 10:00:53.100348', '124', 'Activity object (124)', 1, 'new through import_export', 8, 1),
(213, '2023-03-01 10:00:53.101348', '125', 'Activity object (125)', 1, 'new through import_export', 8, 1),
(214, '2023-03-01 10:00:53.103063', '126', 'Activity object (126)', 1, 'new through import_export', 8, 1),
(215, '2023-03-01 10:00:53.103982', '127', 'Activity object (127)', 1, 'new through import_export', 8, 1),
(216, '2023-03-01 10:00:53.104860', '128', 'Activity object (128)', 1, 'new through import_export', 8, 1),
(217, '2023-03-01 10:00:53.104860', '129', 'Activity object (129)', 1, 'new through import_export', 8, 1),
(218, '2023-03-01 10:00:53.105861', '130', 'Activity object (130)', 1, 'new through import_export', 8, 1),
(219, '2023-03-01 10:00:53.106861', '131', 'Activity object (131)', 1, 'new through import_export', 8, 1),
(220, '2023-03-01 10:00:53.108314', '132', 'Activity object (132)', 1, 'new through import_export', 8, 1),
(221, '2023-03-01 10:00:53.109235', '133', 'Activity object (133)', 1, 'new through import_export', 8, 1),
(222, '2023-03-01 10:00:53.110237', '134', 'Activity object (134)', 1, 'new through import_export', 8, 1),
(223, '2023-03-01 10:00:53.110237', '135', 'Activity object (135)', 1, 'new through import_export', 8, 1),
(224, '2023-03-01 10:00:53.111972', '136', 'Activity object (136)', 1, 'new through import_export', 8, 1),
(225, '2023-03-01 10:00:53.112965', '137', 'Activity object (137)', 1, 'new through import_export', 8, 1),
(226, '2023-03-01 10:00:53.113966', '138', 'Activity object (138)', 1, 'new through import_export', 8, 1),
(227, '2023-03-01 10:00:53.114965', '139', 'Activity object (139)', 1, 'new through import_export', 8, 1),
(228, '2023-03-01 10:00:53.114965', '140', 'Activity object (140)', 1, 'new through import_export', 8, 1),
(229, '2023-03-01 10:00:53.116875', '141', 'Activity object (141)', 1, 'new through import_export', 8, 1),
(230, '2023-03-01 10:00:53.117816', '142', 'Activity object (142)', 1, 'new through import_export', 8, 1),
(231, '2023-03-01 10:00:53.118708', '143', 'Activity object (143)', 1, 'new through import_export', 8, 1),
(232, '2023-03-01 10:00:53.119710', '144', 'Activity object (144)', 1, 'new through import_export', 8, 1),
(233, '2023-03-01 10:00:53.119710', '145', 'Activity object (145)', 1, 'new through import_export', 8, 1),
(234, '2023-03-01 10:00:53.120710', '146', 'Activity object (146)', 1, 'new through import_export', 8, 1),
(235, '2023-03-01 10:00:53.121711', '147', 'Activity object (147)', 1, 'new through import_export', 8, 1),
(236, '2023-03-01 10:00:53.122710', '148', 'Activity object (148)', 1, 'new through import_export', 8, 1),
(237, '2023-03-01 10:00:53.123711', '149', 'Activity object (149)', 1, 'new through import_export', 8, 1),
(238, '2023-03-01 10:00:53.124711', '150', 'Activity object (150)', 1, 'new through import_export', 8, 1),
(239, '2023-03-01 10:00:53.125711', '151', 'Activity object (151)', 1, 'new through import_export', 8, 1),
(240, '2023-03-01 10:00:53.126712', '152', 'Activity object (152)', 1, 'new through import_export', 8, 1),
(241, '2023-03-01 10:00:53.127712', '153', 'Activity object (153)', 1, 'new through import_export', 8, 1),
(242, '2023-03-01 10:00:53.128712', '154', 'Activity object (154)', 1, 'new through import_export', 8, 1),
(243, '2023-03-01 10:00:53.129712', '155', 'Activity object (155)', 1, 'new through import_export', 8, 1),
(244, '2023-03-01 10:00:53.130712', '156', 'Activity object (156)', 1, 'new through import_export', 8, 1),
(245, '2023-03-01 10:00:53.131712', '157', 'Activity object (157)', 1, 'new through import_export', 8, 1),
(246, '2023-03-01 10:00:53.132397', '158', 'Activity object (158)', 1, 'new through import_export', 8, 1),
(247, '2023-03-01 10:00:53.133420', '159', 'Activity object (159)', 1, 'new through import_export', 8, 1),
(248, '2023-03-01 10:00:53.133420', '160', 'Activity object (160)', 1, 'new through import_export', 8, 1),
(249, '2023-03-01 10:00:53.134419', '161', 'Activity object (161)', 1, 'new through import_export', 8, 1),
(250, '2023-03-01 10:00:53.135419', '162', 'Activity object (162)', 1, 'new through import_export', 8, 1),
(251, '2023-03-01 10:00:53.137459', '163', 'Activity object (163)', 1, 'new through import_export', 8, 1),
(252, '2023-03-01 10:00:53.138469', '164', 'Activity object (164)', 1, 'new through import_export', 8, 1),
(253, '2023-03-01 10:00:53.139363', '165', 'Activity object (165)', 1, 'new through import_export', 8, 1),
(254, '2023-03-01 10:00:53.139363', '166', 'Activity object (166)', 1, 'new through import_export', 8, 1),
(255, '2023-03-01 10:00:53.140364', '167', 'Activity object (167)', 1, 'new through import_export', 8, 1),
(256, '2023-03-01 10:00:53.141365', '168', 'Activity object (168)', 1, 'new through import_export', 8, 1),
(257, '2023-03-01 10:00:53.142365', '169', 'Activity object (169)', 1, 'new through import_export', 8, 1),
(258, '2023-03-01 10:00:53.143365', '170', 'Activity object (170)', 1, 'new through import_export', 8, 1),
(259, '2023-03-01 10:00:53.144366', '171', 'Activity object (171)', 1, 'new through import_export', 8, 1),
(260, '2023-03-01 10:00:53.145366', '172', 'Activity object (172)', 1, 'new through import_export', 8, 1),
(261, '2023-03-01 10:00:53.146739', '173', 'Activity object (173)', 1, 'new through import_export', 8, 1),
(262, '2023-03-01 10:00:53.147650', '174', 'Activity object (174)', 1, 'new through import_export', 8, 1),
(263, '2023-03-01 10:00:53.148463', '175', 'Activity object (175)', 1, 'new through import_export', 8, 1),
(264, '2023-03-01 10:00:53.149464', '176', 'Activity object (176)', 1, 'new through import_export', 8, 1),
(265, '2023-03-01 10:00:53.149464', '177', 'Activity object (177)', 1, 'new through import_export', 8, 1),
(266, '2023-03-01 10:00:53.151465', '178', 'Activity object (178)', 1, 'new through import_export', 8, 1),
(267, '2023-03-01 10:00:53.152775', '179', 'Activity object (179)', 1, 'new through import_export', 8, 1),
(268, '2023-03-01 10:00:53.153603', '180', 'Activity object (180)', 1, 'new through import_export', 8, 1),
(269, '2023-03-01 10:00:53.154468', '181', 'Activity object (181)', 1, 'new through import_export', 8, 1),
(270, '2023-03-01 10:00:53.155470', '182', 'Activity object (182)', 1, 'new through import_export', 8, 1),
(271, '2023-03-01 10:00:53.155470', '183', 'Activity object (183)', 1, 'new through import_export', 8, 1),
(272, '2023-03-01 10:00:53.156470', '184', 'Activity object (184)', 1, 'new through import_export', 8, 1),
(273, '2023-03-01 10:00:53.157471', '185', 'Activity object (185)', 1, 'new through import_export', 8, 1),
(274, '2023-03-01 10:00:53.158472', '186', 'Activity object (186)', 1, 'new through import_export', 8, 1),
(275, '2023-03-01 10:00:53.159472', '187', 'Activity object (187)', 1, 'new through import_export', 8, 1),
(276, '2023-03-01 10:00:53.160472', '188', 'Activity object (188)', 1, 'new through import_export', 8, 1),
(277, '2023-03-01 10:00:53.161906', '189', 'Activity object (189)', 1, 'new through import_export', 8, 1),
(278, '2023-03-01 10:00:53.162907', '190', 'Activity object (190)', 1, 'new through import_export', 8, 1),
(279, '2023-03-01 10:00:53.162907', '191', 'Activity object (191)', 1, 'new through import_export', 8, 1),
(280, '2023-03-01 10:00:53.164627', '192', 'Activity object (192)', 1, 'new through import_export', 8, 1),
(281, '2023-03-01 10:00:53.165475', '193', 'Activity object (193)', 1, 'new through import_export', 8, 1),
(282, '2023-03-01 10:00:53.166477', '194', 'Activity object (194)', 1, 'new through import_export', 8, 1),
(283, '2023-03-01 10:00:53.167464', '195', 'Activity object (195)', 1, 'new through import_export', 8, 1),
(284, '2023-03-01 10:00:53.168350', '196', 'Activity object (196)', 1, 'new through import_export', 8, 1),
(285, '2023-03-01 10:00:53.169197', '197', 'Activity object (197)', 1, 'new through import_export', 8, 1),
(286, '2023-03-01 10:00:53.169197', '198', 'Activity object (198)', 1, 'new through import_export', 8, 1),
(287, '2023-03-01 10:00:53.170199', '199', 'Activity object (199)', 1, 'new through import_export', 8, 1),
(288, '2023-03-01 10:00:53.171199', '200', 'Activity object (200)', 1, 'new through import_export', 8, 1),
(289, '2023-03-01 10:00:53.172202', '201', 'Activity object (201)', 1, 'new through import_export', 8, 1),
(290, '2023-03-01 10:00:53.173199', '202', 'Activity object (202)', 1, 'new through import_export', 8, 1),
(291, '2023-03-01 10:00:53.174199', '203', 'Activity object (203)', 1, 'new through import_export', 8, 1),
(292, '2023-03-01 10:00:53.175200', '204', 'Activity object (204)', 1, 'new through import_export', 8, 1),
(293, '2023-03-01 10:00:53.176199', '205', 'Activity object (205)', 1, 'new through import_export', 8, 1),
(294, '2023-03-01 10:00:53.177201', '206', 'Activity object (206)', 1, 'new through import_export', 8, 1),
(295, '2023-03-01 10:00:53.178200', '207', 'Activity object (207)', 1, 'new through import_export', 8, 1),
(296, '2023-03-01 10:00:53.179200', '208', 'Activity object (208)', 1, 'new through import_export', 8, 1),
(297, '2023-03-01 10:00:53.180283', '209', 'Activity object (209)', 1, 'new through import_export', 8, 1),
(298, '2023-03-01 10:00:53.181205', '210', 'Activity object (210)', 1, 'new through import_export', 8, 1),
(299, '2023-03-01 10:00:53.182207', '211', 'Activity object (211)', 1, 'new through import_export', 8, 1),
(300, '2023-03-01 10:00:53.183207', '212', 'Activity object (212)', 1, 'new through import_export', 8, 1),
(301, '2023-03-01 10:00:53.184209', '213', 'Activity object (213)', 1, 'new through import_export', 8, 1),
(302, '2023-03-01 10:00:53.185208', '214', 'Activity object (214)', 1, 'new through import_export', 8, 1),
(303, '2023-03-01 10:00:53.186209', '215', 'Activity object (215)', 1, 'new through import_export', 8, 1),
(304, '2023-03-01 10:00:53.187208', '216', 'Activity object (216)', 1, 'new through import_export', 8, 1),
(305, '2023-03-01 10:00:53.188210', '217', 'Activity object (217)', 1, 'new through import_export', 8, 1),
(306, '2023-03-01 10:00:53.189208', '218', 'Activity object (218)', 1, 'new through import_export', 8, 1),
(307, '2023-03-01 10:00:53.190132', '219', 'Activity object (219)', 1, 'new through import_export', 8, 1),
(308, '2023-03-01 10:00:53.191134', '220', 'Activity object (220)', 1, 'new through import_export', 8, 1),
(309, '2023-03-01 10:00:53.192134', '221', 'Activity object (221)', 1, 'new through import_export', 8, 1),
(310, '2023-03-01 10:00:53.193136', '222', 'Activity object (222)', 1, 'new through import_export', 8, 1),
(311, '2023-03-01 10:00:53.194496', '223', 'Activity object (223)', 1, 'new through import_export', 8, 1),
(312, '2023-03-01 10:00:53.195471', '224', 'Activity object (224)', 1, 'new through import_export', 8, 1),
(313, '2023-03-01 10:00:53.196375', '225', 'Activity object (225)', 1, 'new through import_export', 8, 1),
(314, '2023-03-01 10:00:53.197139', '226', 'Activity object (226)', 1, 'new through import_export', 8, 1),
(315, '2023-03-01 10:00:53.198141', '227', 'Activity object (227)', 1, 'new through import_export', 8, 1),
(316, '2023-03-01 10:00:53.199141', '228', 'Activity object (228)', 1, 'new through import_export', 8, 1),
(317, '2023-03-01 10:00:53.200045', '229', 'Activity object (229)', 1, 'new through import_export', 8, 1),
(318, '2023-03-01 10:00:53.201048', '230', 'Activity object (230)', 1, 'new through import_export', 8, 1),
(319, '2023-03-01 10:00:53.201048', '231', 'Activity object (231)', 1, 'new through import_export', 8, 1),
(320, '2023-03-01 10:00:53.202048', '232', 'Activity object (232)', 1, 'new through import_export', 8, 1),
(321, '2023-03-01 10:00:53.203047', '233', 'Activity object (233)', 1, 'new through import_export', 8, 1),
(322, '2023-03-01 10:00:53.204047', '234', 'Activity object (234)', 1, 'new through import_export', 8, 1),
(323, '2023-03-01 10:00:53.206048', '235', 'Activity object (235)', 1, 'new through import_export', 8, 1),
(324, '2023-03-01 10:00:53.206048', '236', 'Activity object (236)', 1, 'new through import_export', 8, 1),
(325, '2023-03-01 10:00:53.207048', '237', 'Activity object (237)', 1, 'new through import_export', 8, 1),
(326, '2023-03-01 10:00:53.208907', '238', 'Activity object (238)', 1, 'new through import_export', 8, 1),
(327, '2023-03-01 10:00:53.209893', '239', 'Activity object (239)', 1, 'new through import_export', 8, 1),
(328, '2023-03-01 10:00:53.209893', '240', 'Activity object (240)', 1, 'new through import_export', 8, 1),
(329, '2023-03-01 10:00:53.210894', '241', 'Activity object (241)', 1, 'new through import_export', 8, 1),
(330, '2023-03-01 10:00:53.211895', '242', 'Activity object (242)', 1, 'new through import_export', 8, 1),
(331, '2023-03-01 10:00:53.212895', '243', 'Activity object (243)', 1, 'new through import_export', 8, 1),
(332, '2023-03-01 10:00:53.213895', '244', 'Activity object (244)', 1, 'new through import_export', 8, 1),
(333, '2023-03-01 10:00:53.214897', '245', 'Activity object (245)', 1, 'new through import_export', 8, 1),
(334, '2023-03-01 10:00:53.215896', '246', 'Activity object (246)', 1, 'new through import_export', 8, 1),
(335, '2023-03-01 10:00:53.216896', '247', 'Activity object (247)', 1, 'new through import_export', 8, 1),
(336, '2023-03-01 10:00:53.217896', '248', 'Activity object (248)', 1, 'new through import_export', 8, 1),
(337, '2023-03-01 10:00:53.219553', '249', 'Activity object (249)', 1, 'new through import_export', 8, 1),
(338, '2023-03-01 10:00:53.220554', '250', 'Activity object (250)', 1, 'new through import_export', 8, 1),
(339, '2023-03-01 10:00:53.220554', '251', 'Activity object (251)', 1, 'new through import_export', 8, 1),
(340, '2023-03-01 10:00:53.221554', '252', 'Activity object (252)', 1, 'new through import_export', 8, 1),
(341, '2023-03-01 10:00:53.223154', '253', 'Activity object (253)', 1, 'new through import_export', 8, 1),
(342, '2023-03-01 10:00:53.224024', '254', 'Activity object (254)', 1, 'new through import_export', 8, 1),
(343, '2023-03-01 10:00:53.225025', '255', 'Activity object (255)', 1, 'new through import_export', 8, 1),
(344, '2023-03-01 10:00:53.225025', '256', 'Activity object (256)', 1, 'new through import_export', 8, 1),
(345, '2023-03-01 10:00:53.226711', '257', 'Activity object (257)', 1, 'new through import_export', 8, 1),
(346, '2023-03-01 10:00:53.227557', '258', 'Activity object (258)', 1, 'new through import_export', 8, 1),
(347, '2023-03-01 10:00:53.228558', '259', 'Activity object (259)', 1, 'new through import_export', 8, 1),
(348, '2023-03-01 10:00:53.228558', '260', 'Activity object (260)', 1, 'new through import_export', 8, 1),
(349, '2023-03-01 10:00:53.229559', '261', 'Activity object (261)', 1, 'new through import_export', 8, 1),
(350, '2023-03-01 10:00:53.230559', '262', 'Activity object (262)', 1, 'new through import_export', 8, 1),
(351, '2023-03-01 10:00:53.231559', '263', 'Activity object (263)', 1, 'new through import_export', 8, 1),
(352, '2023-03-01 10:00:53.232560', '264', 'Activity object (264)', 1, 'new through import_export', 8, 1),
(353, '2023-03-01 10:00:53.233560', '265', 'Activity object (265)', 1, 'new through import_export', 8, 1),
(354, '2023-03-01 10:00:53.234560', '266', 'Activity object (266)', 1, 'new through import_export', 8, 1),
(355, '2023-03-01 10:00:53.235560', '267', 'Activity object (267)', 1, 'new through import_export', 8, 1),
(356, '2023-03-01 10:00:53.237464', '268', 'Activity object (268)', 1, 'new through import_export', 8, 1),
(357, '2023-03-01 10:00:53.238389', '269', 'Activity object (269)', 1, 'new through import_export', 8, 1),
(358, '2023-03-01 10:00:53.239390', '270', 'Activity object (270)', 1, 'new through import_export', 8, 1),
(359, '2023-03-01 10:00:53.239390', '271', 'Activity object (271)', 1, 'new through import_export', 8, 1),
(360, '2023-03-01 10:00:53.240391', '272', 'Activity object (272)', 1, 'new through import_export', 8, 1),
(361, '2023-03-01 10:00:53.241391', '273', 'Activity object (273)', 1, 'new through import_export', 8, 1),
(362, '2023-03-01 10:00:53.242392', '274', 'Activity object (274)', 1, 'new through import_export', 8, 1),
(363, '2023-03-01 10:00:53.243391', '275', 'Activity object (275)', 1, 'new through import_export', 8, 1),
(364, '2023-03-01 10:00:53.244393', '276', 'Activity object (276)', 1, 'new through import_export', 8, 1),
(365, '2023-03-01 10:00:53.245392', '277', 'Activity object (277)', 1, 'new through import_export', 8, 1),
(366, '2023-03-01 10:00:53.246392', '278', 'Activity object (278)', 1, 'new through import_export', 8, 1),
(367, '2023-03-01 10:00:53.247485', '279', 'Activity object (279)', 1, 'new through import_export', 8, 1),
(368, '2023-03-01 10:00:53.248343', '280', 'Activity object (280)', 1, 'new through import_export', 8, 1),
(369, '2023-03-01 10:00:53.249344', '281', 'Activity object (281)', 1, 'new through import_export', 8, 1),
(370, '2023-03-01 10:00:53.249344', '282', 'Activity object (282)', 1, 'new through import_export', 8, 1),
(371, '2023-03-01 10:00:53.251345', '283', 'Activity object (283)', 1, 'new through import_export', 8, 1),
(372, '2023-03-01 10:00:53.252402', '284', 'Activity object (284)', 1, 'new through import_export', 8, 1),
(373, '2023-03-01 10:00:53.253384', '285', 'Activity object (285)', 1, 'new through import_export', 8, 1),
(374, '2023-03-01 10:00:53.254311', '286', 'Activity object (286)', 1, 'new through import_export', 8, 1),
(375, '2023-03-01 10:00:53.255313', '287', 'Activity object (287)', 1, 'new through import_export', 8, 1),
(376, '2023-03-01 10:00:53.256312', '288', 'Activity object (288)', 1, 'new through import_export', 8, 1),
(377, '2023-03-01 10:00:53.257313', '289', 'Activity object (289)', 1, 'new through import_export', 8, 1),
(378, '2023-03-01 10:00:53.258246', '290', 'Activity object (290)', 1, 'new through import_export', 8, 1),
(379, '2023-03-01 10:00:53.259248', '291', 'Activity object (291)', 1, 'new through import_export', 8, 1),
(380, '2023-03-01 10:00:53.259248', '292', 'Activity object (292)', 1, 'new through import_export', 8, 1),
(381, '2023-03-01 10:00:53.260248', '293', 'Activity object (293)', 1, 'new through import_export', 8, 1),
(382, '2023-03-01 10:00:53.261247', '294', 'Activity object (294)', 1, 'new through import_export', 8, 1),
(383, '2023-03-01 10:00:53.262248', '295', 'Activity object (295)', 1, 'new through import_export', 8, 1),
(384, '2023-03-01 10:00:53.263251', '296', 'Activity object (296)', 1, 'new through import_export', 8, 1),
(385, '2023-03-01 10:00:53.264250', '297', 'Activity object (297)', 1, 'new through import_export', 8, 1),
(386, '2023-03-01 10:00:53.265248', '298', 'Activity object (298)', 1, 'new through import_export', 8, 1),
(387, '2023-03-01 10:00:53.266250', '299', 'Activity object (299)', 1, 'new through import_export', 8, 1),
(388, '2023-03-01 10:00:53.267664', '300', 'Activity object (300)', 1, 'new through import_export', 8, 1),
(389, '2023-03-01 10:00:53.268581', '301', 'Activity object (301)', 1, 'new through import_export', 8, 1),
(390, '2023-03-01 10:00:53.269488', '302', 'Activity object (302)', 1, 'new through import_export', 8, 1),
(391, '2023-03-01 10:00:53.270254', '303', 'Activity object (303)', 1, 'new through import_export', 8, 1),
(392, '2023-03-01 10:00:53.271257', '304', 'Activity object (304)', 1, 'new through import_export', 8, 1),
(393, '2023-03-01 10:00:53.272674', '305', 'Activity object (305)', 1, 'new through import_export', 8, 1),
(394, '2023-03-01 10:00:53.273693', '306', 'Activity object (306)', 1, 'new through import_export', 8, 1),
(395, '2023-03-01 10:00:53.274695', '307', 'Activity object (307)', 1, 'new through import_export', 8, 1),
(396, '2023-03-01 10:00:53.275694', '308', 'Activity object (308)', 1, 'new through import_export', 8, 1),
(397, '2023-03-01 10:00:53.276696', '309', 'Activity object (309)', 1, 'new through import_export', 8, 1),
(398, '2023-03-01 10:00:53.277695', '310', 'Activity object (310)', 1, 'new through import_export', 8, 1),
(399, '2023-03-01 10:00:53.278696', '311', 'Activity object (311)', 1, 'new through import_export', 8, 1),
(400, '2023-03-01 10:00:53.279696', '312', 'Activity object (312)', 1, 'new through import_export', 8, 1),
(401, '2023-03-01 10:00:53.280697', '313', 'Activity object (313)', 1, 'new through import_export', 8, 1),
(402, '2023-03-01 10:00:53.281789', '314', 'Activity object (314)', 1, 'new through import_export', 8, 1),
(403, '2023-03-01 10:00:53.282933', '315', 'Activity object (315)', 1, 'new through import_export', 8, 1),
(404, '2023-03-01 10:00:53.283481', '316', 'Activity object (316)', 1, 'new through import_export', 8, 1),
(405, '2023-03-01 10:00:53.284506', '317', 'Activity object (317)', 1, 'new through import_export', 8, 1),
(406, '2023-03-01 10:00:53.285791', '318', 'Activity object (318)', 1, 'new through import_export', 8, 1),
(407, '2023-03-01 10:00:53.287092', '319', 'Activity object (319)', 1, 'new through import_export', 8, 1),
(408, '2023-03-01 10:00:53.287984', '320', 'Activity object (320)', 1, 'new through import_export', 8, 1),
(409, '2023-03-01 10:00:53.288985', '321', 'Activity object (321)', 1, 'new through import_export', 8, 1),
(410, '2023-03-01 10:00:53.289985', '322', 'Activity object (322)', 1, 'new through import_export', 8, 1),
(411, '2023-03-01 10:00:53.290986', '323', 'Activity object (323)', 1, 'new through import_export', 8, 1),
(412, '2023-03-01 10:00:53.290986', '324', 'Activity object (324)', 1, 'new through import_export', 8, 1),
(413, '2023-03-01 10:00:53.292952', '325', 'Activity object (325)', 1, 'new through import_export', 8, 1),
(414, '2023-03-01 10:00:53.293958', '326', 'Activity object (326)', 1, 'new through import_export', 8, 1),
(415, '2023-03-01 10:00:53.294970', '327', 'Activity object (327)', 1, 'new through import_export', 8, 1),
(416, '2023-03-01 10:00:53.295978', '328', 'Activity object (328)', 1, 'new through import_export', 8, 1),
(417, '2023-03-01 10:00:53.296965', '329', 'Activity object (329)', 1, 'new through import_export', 8, 1),
(418, '2023-03-01 10:00:53.297959', '330', 'Activity object (330)', 1, 'new through import_export', 8, 1),
(419, '2023-03-01 10:00:53.298965', '331', 'Activity object (331)', 1, 'new through import_export', 8, 1),
(420, '2023-03-01 10:00:53.299972', '332', 'Activity object (332)', 1, 'new through import_export', 8, 1),
(421, '2023-03-01 10:00:53.300965', '333', 'Activity object (333)', 1, 'new through import_export', 8, 1),
(422, '2023-03-01 10:00:53.302287', '334', 'Activity object (334)', 1, 'new through import_export', 8, 1),
(423, '2023-03-01 10:00:53.303195', '335', 'Activity object (335)', 1, 'new through import_export', 8, 1),
(424, '2023-03-01 10:00:53.303975', '336', 'Activity object (336)', 1, 'new through import_export', 8, 1),
(425, '2023-03-01 10:00:53.304977', '337', 'Activity object (337)', 1, 'new through import_export', 8, 1),
(426, '2023-03-01 10:00:53.305981', '338', 'Activity object (338)', 1, 'new through import_export', 8, 1),
(427, '2023-03-01 10:00:53.306978', '339', 'Activity object (339)', 1, 'new through import_export', 8, 1),
(428, '2023-03-01 10:00:53.307979', '340', 'Activity object (340)', 1, 'new through import_export', 8, 1),
(429, '2023-03-01 10:00:53.309980', '341', 'Activity object (341)', 1, 'new through import_export', 8, 1),
(430, '2023-03-01 10:00:53.310979', '342', 'Activity object (342)', 1, 'new through import_export', 8, 1),
(431, '2023-03-01 10:00:53.311979', '343', 'Activity object (343)', 1, 'new through import_export', 8, 1),
(432, '2023-03-01 10:00:53.312980', '344', 'Activity object (344)', 1, 'new through import_export', 8, 1),
(433, '2023-03-01 10:00:53.313981', '345', 'Activity object (345)', 1, 'new through import_export', 8, 1),
(434, '2023-03-01 10:00:53.314986', '346', 'Activity object (346)', 1, 'new through import_export', 8, 1),
(435, '2023-03-01 10:00:53.315897', '347', 'Activity object (347)', 1, 'new through import_export', 8, 1),
(436, '2023-03-01 10:00:53.316899', '348', 'Activity object (348)', 1, 'new through import_export', 8, 1),
(437, '2023-03-01 10:00:53.317898', '349', 'Activity object (349)', 1, 'new through import_export', 8, 1),
(438, '2023-03-01 10:00:53.318899', '350', 'Activity object (350)', 1, 'new through import_export', 8, 1),
(439, '2023-03-01 10:00:53.318899', '351', 'Activity object (351)', 1, 'new through import_export', 8, 1),
(440, '2023-03-01 10:00:53.320899', '352', 'Activity object (352)', 1, 'new through import_export', 8, 1),
(441, '2023-03-01 10:00:53.321899', '353', 'Activity object (353)', 1, 'new through import_export', 8, 1),
(442, '2023-03-01 10:00:53.322900', '354', 'Activity object (354)', 1, 'new through import_export', 8, 1),
(443, '2023-03-01 10:00:53.322900', '355', 'Activity object (355)', 1, 'new through import_export', 8, 1),
(444, '2023-03-01 10:00:53.324682', '356', 'Activity object (356)', 1, 'new through import_export', 8, 1),
(445, '2023-03-01 10:00:53.325683', '357', 'Activity object (357)', 1, 'new through import_export', 8, 1),
(446, '2023-03-01 10:00:53.325683', '358', 'Activity object (358)', 1, 'new through import_export', 8, 1),
(447, '2023-03-01 10:00:53.326683', '359', 'Activity object (359)', 1, 'new through import_export', 8, 1),
(448, '2023-03-01 10:00:53.327684', '360', 'Activity object (360)', 1, 'new through import_export', 8, 1),
(449, '2023-03-01 10:00:53.329577', '361', 'Activity object (361)', 1, 'new through import_export', 8, 1),
(450, '2023-03-01 10:00:53.330520', '362', 'Activity object (362)', 1, 'new through import_export', 8, 1),
(451, '2023-03-01 10:00:53.331375', '363', 'Activity object (363)', 1, 'new through import_export', 8, 1),
(452, '2023-03-01 10:00:53.331375', '364', 'Activity object (364)', 1, 'new through import_export', 8, 1),
(453, '2023-03-01 10:00:53.332376', '365', 'Activity object (365)', 1, 'new through import_export', 8, 1),
(454, '2023-03-01 10:00:53.333376', '366', 'Activity object (366)', 1, 'new through import_export', 8, 1),
(455, '2023-03-01 10:00:53.334376', '367', 'Activity object (367)', 1, 'new through import_export', 8, 1),
(456, '2023-03-01 10:00:53.335377', '368', 'Activity object (368)', 1, 'new through import_export', 8, 1),
(457, '2023-03-01 10:00:53.337377', '369', 'Activity object (369)', 1, 'new through import_export', 8, 1),
(458, '2023-03-01 10:00:53.338378', '370', 'Activity object (370)', 1, 'new through import_export', 8, 1),
(459, '2023-03-01 10:00:53.339379', '371', 'Activity object (371)', 1, 'new through import_export', 8, 1),
(460, '2023-03-01 10:00:53.340378', '372', 'Activity object (372)', 1, 'new through import_export', 8, 1),
(461, '2023-03-01 10:00:53.341378', '373', 'Activity object (373)', 1, 'new through import_export', 8, 1),
(462, '2023-03-01 10:00:53.342380', '374', 'Activity object (374)', 1, 'new through import_export', 8, 1),
(463, '2023-03-01 10:00:53.343378', '375', 'Activity object (375)', 1, 'new through import_export', 8, 1),
(464, '2023-03-01 10:00:53.344379', '376', 'Activity object (376)', 1, 'new through import_export', 8, 1),
(465, '2023-03-01 10:00:53.345379', '377', 'Activity object (377)', 1, 'new through import_export', 8, 1),
(466, '2023-03-01 10:00:53.346379', '378', 'Activity object (378)', 1, 'new through import_export', 8, 1),
(467, '2023-03-01 10:00:53.347380', '379', 'Activity object (379)', 1, 'new through import_export', 8, 1),
(468, '2023-03-01 10:00:53.348380', '380', 'Activity object (380)', 1, 'new through import_export', 8, 1),
(469, '2023-03-01 10:00:53.349380', '381', 'Activity object (381)', 1, 'new through import_export', 8, 1),
(470, '2023-03-01 10:00:53.350380', '382', 'Activity object (382)', 1, 'new through import_export', 8, 1),
(471, '2023-03-01 10:00:53.351380', '383', 'Activity object (383)', 1, 'new through import_export', 8, 1),
(472, '2023-03-01 10:00:53.352380', '384', 'Activity object (384)', 1, 'new through import_export', 8, 1),
(473, '2023-03-01 10:00:53.353381', '385', 'Activity object (385)', 1, 'new through import_export', 8, 1),
(474, '2023-03-01 10:00:53.354381', '386', 'Activity object (386)', 1, 'new through import_export', 8, 1),
(475, '2023-03-01 10:00:53.354381', '387', 'Activity object (387)', 1, 'new through import_export', 8, 1),
(476, '2023-03-01 10:00:53.355381', '388', 'Activity object (388)', 1, 'new through import_export', 8, 1),
(477, '2023-03-01 10:00:53.356381', '389', 'Activity object (389)', 1, 'new through import_export', 8, 1),
(478, '2023-03-01 10:00:53.357381', '390', 'Activity object (390)', 1, 'new through import_export', 8, 1),
(479, '2023-03-01 10:00:53.358382', '391', 'Activity object (391)', 1, 'new through import_export', 8, 1),
(480, '2023-03-01 10:00:53.359382', '392', 'Activity object (392)', 1, 'new through import_export', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(481, '2023-03-01 10:00:53.360382', '393', 'Activity object (393)', 1, 'new through import_export', 8, 1),
(482, '2023-03-01 10:00:53.361382', '394', 'Activity object (394)', 1, 'new through import_export', 8, 1),
(483, '2023-03-01 10:00:53.362382', '395', 'Activity object (395)', 1, 'new through import_export', 8, 1),
(484, '2023-03-01 10:00:53.363382', '396', 'Activity object (396)', 1, 'new through import_export', 8, 1),
(485, '2023-03-01 10:00:53.364384', '397', 'Activity object (397)', 1, 'new through import_export', 8, 1),
(486, '2023-03-01 10:00:53.365383', '398', 'Activity object (398)', 1, 'new through import_export', 8, 1),
(487, '2023-03-01 10:00:53.366384', '399', 'Activity object (399)', 1, 'new through import_export', 8, 1),
(488, '2023-03-01 10:00:53.367384', '400', 'Activity object (400)', 1, 'new through import_export', 8, 1),
(489, '2023-03-01 10:00:53.368384', '401', 'Activity object (401)', 1, 'new through import_export', 8, 1),
(490, '2023-03-01 10:00:53.369384', '402', 'Activity object (402)', 1, 'new through import_export', 8, 1),
(491, '2023-03-01 10:00:53.370384', '403', 'Activity object (403)', 1, 'new through import_export', 8, 1),
(492, '2023-03-01 10:00:53.371386', '404', 'Activity object (404)', 1, 'new through import_export', 8, 1),
(493, '2023-03-01 10:00:53.372385', '405', 'Activity object (405)', 1, 'new through import_export', 8, 1),
(494, '2023-03-01 10:00:53.372385', '406', 'Activity object (406)', 1, 'new through import_export', 8, 1),
(495, '2023-03-01 10:00:53.373385', '407', 'Activity object (407)', 1, 'new through import_export', 8, 1),
(496, '2023-03-01 10:00:53.374385', '408', 'Activity object (408)', 1, 'new through import_export', 8, 1),
(497, '2023-03-01 10:00:53.375385', '409', 'Activity object (409)', 1, 'new through import_export', 8, 1),
(498, '2023-03-01 10:00:53.376386', '410', 'Activity object (410)', 1, 'new through import_export', 8, 1),
(499, '2023-03-01 10:00:53.377385', '411', 'Activity object (411)', 1, 'new through import_export', 8, 1),
(500, '2023-03-01 10:00:53.378745', '412', 'Activity object (412)', 1, 'new through import_export', 8, 1),
(501, '2023-03-01 10:00:53.379726', '413', 'Activity object (413)', 1, 'new through import_export', 8, 1),
(502, '2023-03-01 10:00:53.380280', '414', 'Activity object (414)', 1, 'new through import_export', 8, 1),
(503, '2023-03-01 10:00:53.381282', '415', 'Activity object (415)', 1, 'new through import_export', 8, 1),
(504, '2023-03-01 10:00:53.382282', '416', 'Activity object (416)', 1, 'new through import_export', 8, 1),
(505, '2023-03-01 10:00:53.383282', '417', 'Activity object (417)', 1, 'new through import_export', 8, 1),
(506, '2023-03-01 10:00:53.384302', '418', 'Activity object (418)', 1, 'new through import_export', 8, 1),
(507, '2023-03-01 10:00:53.385310', '419', 'Activity object (419)', 1, 'new through import_export', 8, 1),
(508, '2023-03-01 10:00:53.386162', '420', 'Activity object (420)', 1, 'new through import_export', 8, 1),
(509, '2023-03-01 10:00:53.386162', '421', 'Activity object (421)', 1, 'new through import_export', 8, 1),
(510, '2023-03-01 10:00:53.387164', '422', 'Activity object (422)', 1, 'new through import_export', 8, 1),
(511, '2023-03-01 10:00:53.388164', '423', 'Activity object (423)', 1, 'new through import_export', 8, 1),
(512, '2023-03-01 10:00:53.389164', '424', 'Activity object (424)', 1, 'new through import_export', 8, 1),
(513, '2023-03-01 10:00:53.390165', '425', 'Activity object (425)', 1, 'new through import_export', 8, 1),
(514, '2023-03-01 10:00:53.391165', '426', 'Activity object (426)', 1, 'new through import_export', 8, 1),
(515, '2023-03-01 10:00:53.392165', '427', 'Activity object (427)', 1, 'new through import_export', 8, 1),
(516, '2023-03-01 10:00:53.393635', '428', 'Activity object (428)', 1, 'new through import_export', 8, 1),
(517, '2023-03-01 10:00:53.394614', '429', 'Activity object (429)', 1, 'new through import_export', 8, 1),
(518, '2023-03-01 10:00:53.395495', '430', 'Activity object (430)', 1, 'new through import_export', 8, 1),
(519, '2023-03-01 10:00:53.396349', '431', 'Activity object (431)', 1, 'new through import_export', 8, 1),
(520, '2023-03-01 10:00:53.397170', '432', 'Activity object (432)', 1, 'new through import_export', 8, 1),
(521, '2023-03-01 10:00:53.398172', '433', 'Activity object (433)', 1, 'new through import_export', 8, 1),
(522, '2023-03-01 10:00:53.398172', '434', 'Activity object (434)', 1, 'new through import_export', 8, 1),
(523, '2023-03-01 10:00:53.399938', '435', 'Activity object (435)', 1, 'new through import_export', 8, 1),
(524, '2023-03-01 10:00:53.400940', '436', 'Activity object (436)', 1, 'new through import_export', 8, 1),
(525, '2023-03-01 10:00:53.401939', '437', 'Activity object (437)', 1, 'new through import_export', 8, 1),
(526, '2023-03-01 10:00:53.402998', '438', 'Activity object (438)', 1, 'new through import_export', 8, 1),
(527, '2023-03-01 10:00:53.403939', '439', 'Activity object (439)', 1, 'new through import_export', 8, 1),
(528, '2023-03-01 10:00:53.403939', '440', 'Activity object (440)', 1, 'new through import_export', 8, 1),
(529, '2023-03-01 10:00:53.404941', '441', 'Activity object (441)', 1, 'new through import_export', 8, 1),
(530, '2023-03-01 10:00:53.405941', '442', 'Activity object (442)', 1, 'new through import_export', 8, 1),
(531, '2023-03-01 10:00:53.406941', '443', 'Activity object (443)', 1, 'new through import_export', 8, 1),
(532, '2023-03-01 10:00:53.408583', '444', 'Activity object (444)', 1, 'new through import_export', 8, 1),
(533, '2023-03-01 10:00:53.409481', '445', 'Activity object (445)', 1, 'new through import_export', 8, 1),
(534, '2023-03-01 10:00:53.410482', '446', 'Activity object (446)', 1, 'new through import_export', 8, 1),
(535, '2023-03-01 10:00:53.410482', '447', 'Activity object (447)', 1, 'new through import_export', 8, 1),
(536, '2023-03-01 10:00:53.411482', '448', 'Activity object (448)', 1, 'new through import_export', 8, 1),
(537, '2023-03-01 10:00:53.413035', '449', 'Activity object (449)', 1, 'new through import_export', 8, 1),
(538, '2023-03-01 10:00:53.413955', '450', 'Activity object (450)', 1, 'new through import_export', 8, 1),
(539, '2023-03-01 10:00:53.414957', '451', 'Activity object (451)', 1, 'new through import_export', 8, 1),
(540, '2023-03-01 10:00:53.414957', '452', 'Activity object (452)', 1, 'new through import_export', 8, 1),
(541, '2023-03-01 10:00:53.416686', '453', 'Activity object (453)', 1, 'new through import_export', 8, 1),
(542, '2023-03-01 10:00:53.417688', '454', 'Activity object (454)', 1, 'new through import_export', 8, 1),
(543, '2023-03-01 10:00:53.418688', '455', 'Activity object (455)', 1, 'new through import_export', 8, 1),
(544, '2023-03-01 10:00:53.418688', '456', 'Activity object (456)', 1, 'new through import_export', 8, 1),
(545, '2023-03-01 10:00:53.419689', '457', 'Activity object (457)', 1, 'new through import_export', 8, 1),
(546, '2023-03-01 10:00:53.420691', '458', 'Activity object (458)', 1, 'new through import_export', 8, 1),
(547, '2023-03-01 10:00:53.421690', '459', 'Activity object (459)', 1, 'new through import_export', 8, 1),
(548, '2023-03-01 10:00:53.422690', '460', 'Activity object (460)', 1, 'new through import_export', 8, 1),
(549, '2023-03-01 10:00:53.424236', '461', 'Activity object (461)', 1, 'new through import_export', 8, 1),
(550, '2023-03-01 10:00:53.425231', '462', 'Activity object (462)', 1, 'new through import_export', 8, 1),
(551, '2023-03-01 10:00:53.426232', '463', 'Activity object (463)', 1, 'new through import_export', 8, 1),
(552, '2023-03-01 10:00:53.426232', '464', 'Activity object (464)', 1, 'new through import_export', 8, 1),
(553, '2023-03-01 10:00:53.428233', '465', 'Activity object (465)', 1, 'new through import_export', 8, 1),
(554, '2023-03-01 10:00:53.429234', '466', 'Activity object (466)', 1, 'new through import_export', 8, 1),
(555, '2023-03-01 10:00:53.430234', '467', 'Activity object (467)', 1, 'new through import_export', 8, 1),
(556, '2023-03-01 10:00:53.431233', '468', 'Activity object (468)', 1, 'new through import_export', 8, 1),
(557, '2023-03-01 10:00:53.432233', '469', 'Activity object (469)', 1, 'new through import_export', 8, 1),
(558, '2023-03-01 10:00:53.432233', '470', 'Activity object (470)', 1, 'new through import_export', 8, 1),
(559, '2023-03-01 10:00:53.433234', '471', 'Activity object (471)', 1, 'new through import_export', 8, 1),
(560, '2023-03-01 10:00:53.434234', '472', 'Activity object (472)', 1, 'new through import_export', 8, 1),
(561, '2023-03-01 10:00:53.435235', '473', 'Activity object (473)', 1, 'new through import_export', 8, 1),
(562, '2023-03-01 10:00:53.436235', '474', 'Activity object (474)', 1, 'new through import_export', 8, 1),
(563, '2023-03-01 10:00:53.437707', '475', 'Activity object (475)', 1, 'new through import_export', 8, 1),
(564, '2023-03-01 10:00:53.438708', '476', 'Activity object (476)', 1, 'new through import_export', 8, 1),
(565, '2023-03-01 10:00:53.439708', '477', 'Activity object (477)', 1, 'new through import_export', 8, 1),
(566, '2023-03-01 10:00:53.440709', '478', 'Activity object (478)', 1, 'new through import_export', 8, 1),
(567, '2023-03-01 10:00:53.441709', '479', 'Activity object (479)', 1, 'new through import_export', 8, 1),
(568, '2023-03-01 10:00:53.442403', '480', 'Activity object (480)', 1, 'new through import_export', 8, 1),
(569, '2023-03-01 10:00:53.443393', '481', 'Activity object (481)', 1, 'new through import_export', 8, 1),
(570, '2023-03-01 10:00:53.444402', '482', 'Activity object (482)', 1, 'new through import_export', 8, 1),
(571, '2023-03-01 10:00:53.445403', '483', 'Activity object (483)', 1, 'new through import_export', 8, 1),
(572, '2023-03-01 10:00:53.446404', '484', 'Activity object (484)', 1, 'new through import_export', 8, 1),
(573, '2023-03-01 10:00:53.446404', '485', 'Activity object (485)', 1, 'new through import_export', 8, 1),
(574, '2023-03-01 10:00:53.447404', '486', 'Activity object (486)', 1, 'new through import_export', 8, 1),
(575, '2023-03-01 10:00:53.449405', '487', 'Activity object (487)', 1, 'new through import_export', 8, 1),
(576, '2023-03-01 10:00:53.450405', '488', 'Activity object (488)', 1, 'new through import_export', 8, 1),
(577, '2023-03-01 10:00:53.451404', '489', 'Activity object (489)', 1, 'new through import_export', 8, 1),
(578, '2023-03-01 10:00:53.452405', '490', 'Activity object (490)', 1, 'new through import_export', 8, 1),
(579, '2023-03-01 10:00:53.453243', '491', 'Activity object (491)', 1, 'new through import_export', 8, 1),
(580, '2023-03-01 10:00:53.453243', '492', 'Activity object (492)', 1, 'new through import_export', 8, 1),
(581, '2023-03-01 10:00:53.454244', '493', 'Activity object (493)', 1, 'new through import_export', 8, 1),
(582, '2023-03-01 10:00:53.455244', '494', 'Activity object (494)', 1, 'new through import_export', 8, 1),
(583, '2023-03-01 10:00:53.456245', '495', 'Activity object (495)', 1, 'new through import_export', 8, 1),
(584, '2023-03-01 10:00:53.457977', '496', 'Activity object (496)', 1, 'new through import_export', 8, 1),
(585, '2023-03-01 10:00:53.458886', '497', 'Activity object (497)', 1, 'new through import_export', 8, 1),
(586, '2023-03-01 10:00:53.459782', '498', 'Activity object (498)', 1, 'new through import_export', 8, 1),
(587, '2023-03-01 10:00:53.459782', '499', 'Activity object (499)', 1, 'new through import_export', 8, 1),
(588, '2023-03-01 10:00:53.460783', '500', 'Activity object (500)', 1, 'new through import_export', 8, 1),
(589, '2023-03-01 10:00:53.461784', '501', 'Activity object (501)', 1, 'new through import_export', 8, 1),
(590, '2023-03-01 10:00:53.462784', '502', 'Activity object (502)', 1, 'new through import_export', 8, 1),
(591, '2023-03-01 10:00:53.464356', '503', 'Activity object (503)', 1, 'new through import_export', 8, 1),
(592, '2023-03-01 10:00:53.465358', '504', 'Activity object (504)', 1, 'new through import_export', 8, 1),
(593, '2023-03-01 10:00:53.465358', '505', 'Activity object (505)', 1, 'new through import_export', 8, 1),
(594, '2023-03-01 10:00:53.466913', '506', 'Activity object (506)', 1, 'new through import_export', 8, 1),
(595, '2023-03-01 10:00:53.467765', '507', 'Activity object (507)', 1, 'new through import_export', 8, 1),
(596, '2023-03-01 10:00:53.468767', '508', 'Activity object (508)', 1, 'new through import_export', 8, 1),
(597, '2023-03-01 10:00:53.468767', '509', 'Activity object (509)', 1, 'new through import_export', 8, 1),
(598, '2023-03-01 10:00:53.469767', '510', 'Activity object (510)', 1, 'new through import_export', 8, 1),
(599, '2023-03-01 10:00:53.471774', '511', 'Activity object (511)', 1, 'new through import_export', 8, 1),
(600, '2023-03-01 10:00:53.472598', '512', 'Activity object (512)', 1, 'new through import_export', 8, 1),
(601, '2023-03-01 10:00:53.473519', '513', 'Activity object (513)', 1, 'new through import_export', 8, 1),
(602, '2023-03-01 10:00:53.474522', '514', 'Activity object (514)', 1, 'new through import_export', 8, 1),
(603, '2023-03-01 10:00:53.475521', '515', 'Activity object (515)', 1, 'new through import_export', 8, 1),
(604, '2023-03-01 10:00:53.475521', '516', 'Activity object (516)', 1, 'new through import_export', 8, 1),
(605, '2023-03-01 10:00:53.477210', '517', 'Activity object (517)', 1, 'new through import_export', 8, 1),
(606, '2023-03-01 10:00:53.478212', '518', 'Activity object (518)', 1, 'new through import_export', 8, 1),
(607, '2023-03-01 10:00:53.478212', '519', 'Activity object (519)', 1, 'new through import_export', 8, 1),
(608, '2023-03-01 10:00:53.479212', '520', 'Activity object (520)', 1, 'new through import_export', 8, 1),
(609, '2023-03-01 10:00:53.480212', '521', 'Activity object (521)', 1, 'new through import_export', 8, 1),
(610, '2023-03-01 10:00:53.481807', '522', 'Activity object (522)', 1, 'new through import_export', 8, 1),
(611, '2023-03-01 10:00:53.481807', '523', 'Activity object (523)', 1, 'new through import_export', 8, 1),
(612, '2023-03-01 10:00:53.482801', '524', 'Activity object (524)', 1, 'new through import_export', 8, 1),
(613, '2023-03-01 10:00:53.483801', '525', 'Activity object (525)', 1, 'new through import_export', 8, 1),
(614, '2023-03-01 10:00:53.484802', '526', 'Activity object (526)', 1, 'new through import_export', 8, 1),
(615, '2023-03-01 10:00:53.486578', '527', 'Activity object (527)', 1, 'new through import_export', 8, 1),
(616, '2023-03-01 10:00:53.487462', '528', 'Activity object (528)', 1, 'new through import_export', 8, 1),
(617, '2023-03-01 10:00:53.487462', '529', 'Activity object (529)', 1, 'new through import_export', 8, 1),
(618, '2023-03-01 10:00:53.488463', '530', 'Activity object (530)', 1, 'new through import_export', 8, 1),
(619, '2023-03-01 10:00:53.489463', '531', 'Activity object (531)', 1, 'new through import_export', 8, 1),
(620, '2023-03-01 10:00:53.490463', '532', 'Activity object (532)', 1, 'new through import_export', 8, 1),
(621, '2023-03-01 10:00:53.491464', '533', 'Activity object (533)', 1, 'new through import_export', 8, 1),
(622, '2023-03-01 10:00:53.492464', '534', 'Activity object (534)', 1, 'new through import_export', 8, 1),
(623, '2023-03-01 10:00:53.493464', '535', 'Activity object (535)', 1, 'new through import_export', 8, 1),
(624, '2023-03-01 10:00:53.494709', '536', 'Activity object (536)', 1, 'new through import_export', 8, 1),
(625, '2023-03-01 10:00:53.495612', '537', 'Activity object (537)', 1, 'new through import_export', 8, 1),
(626, '2023-03-01 10:00:53.496440', '538', 'Activity object (538)', 1, 'new through import_export', 8, 1),
(627, '2023-03-01 10:00:53.496440', '539', 'Activity object (539)', 1, 'new through import_export', 8, 1),
(628, '2023-03-01 10:00:53.498441', '540', 'Activity object (540)', 1, 'new through import_export', 8, 1),
(629, '2023-03-01 10:00:53.498441', '541', 'Activity object (541)', 1, 'new through import_export', 8, 1),
(630, '2023-03-01 10:00:53.500170', '542', 'Activity object (542)', 1, 'new through import_export', 8, 1),
(631, '2023-03-01 10:00:53.500170', '543', 'Activity object (543)', 1, 'new through import_export', 8, 1),
(632, '2023-03-01 10:00:53.501171', '544', 'Activity object (544)', 1, 'new through import_export', 8, 1),
(633, '2023-03-01 10:00:53.502171', '545', 'Activity object (545)', 1, 'new through import_export', 8, 1),
(634, '2023-03-01 10:00:53.503172', '546', 'Activity object (546)', 1, 'new through import_export', 8, 1),
(635, '2023-03-01 10:00:53.504172', '547', 'Activity object (547)', 1, 'new through import_export', 8, 1),
(636, '2023-03-01 10:00:53.505592', '548', 'Activity object (548)', 1, 'new through import_export', 8, 1),
(637, '2023-03-01 10:00:53.506457', '549', 'Activity object (549)', 1, 'new through import_export', 8, 1),
(638, '2023-03-01 10:00:53.507342', '550', 'Activity object (550)', 1, 'new through import_export', 8, 1),
(639, '2023-03-01 10:00:53.508176', '551', 'Activity object (551)', 1, 'new through import_export', 8, 1),
(640, '2023-03-01 10:00:53.509178', '552', 'Activity object (552)', 1, 'new through import_export', 8, 1),
(641, '2023-03-01 10:00:53.510299', '553', 'Activity object (553)', 1, 'new through import_export', 8, 1),
(642, '2023-03-01 10:00:53.511292', '554', 'Activity object (554)', 1, 'new through import_export', 8, 1),
(643, '2023-03-01 10:00:53.512294', '555', 'Activity object (555)', 1, 'new through import_export', 8, 1),
(644, '2023-03-01 10:00:53.513294', '556', 'Activity object (556)', 1, 'new through import_export', 8, 1),
(645, '2023-03-01 10:00:53.514295', '557', 'Activity object (557)', 1, 'new through import_export', 8, 1),
(646, '2023-03-01 10:00:53.515294', '558', 'Activity object (558)', 1, 'new through import_export', 8, 1),
(647, '2023-03-01 10:00:53.515294', '559', 'Activity object (559)', 1, 'new through import_export', 8, 1),
(648, '2023-03-01 10:00:53.516295', '560', 'Activity object (560)', 1, 'new through import_export', 8, 1),
(649, '2023-03-01 10:00:53.517462', '561', 'Activity object (561)', 1, 'new through import_export', 8, 1),
(650, '2023-03-01 10:00:53.519005', '562', 'Activity object (562)', 1, 'new through import_export', 8, 1),
(651, '2023-03-01 10:00:53.519817', '563', 'Activity object (563)', 1, 'new through import_export', 8, 1),
(652, '2023-03-01 10:00:53.520820', '564', 'Activity object (564)', 1, 'new through import_export', 8, 1),
(653, '2023-03-01 10:00:53.521820', '565', 'Activity object (565)', 1, 'new through import_export', 8, 1),
(654, '2023-03-01 10:00:53.523295', '566', 'Activity object (566)', 1, 'new through import_export', 8, 1),
(655, '2023-03-01 10:00:53.524214', '567', 'Activity object (567)', 1, 'new through import_export', 8, 1),
(656, '2023-03-01 10:00:53.525216', '568', 'Activity object (568)', 1, 'new through import_export', 8, 1),
(657, '2023-03-01 10:00:53.525216', '569', 'Activity object (569)', 1, 'new through import_export', 8, 1),
(658, '2023-03-01 10:00:53.526216', '570', 'Activity object (570)', 1, 'new through import_export', 8, 1),
(659, '2023-03-01 10:00:53.527958', '571', 'Activity object (571)', 1, 'new through import_export', 8, 1),
(660, '2023-03-01 10:00:53.528931', '572', 'Activity object (572)', 1, 'new through import_export', 8, 1),
(661, '2023-03-01 10:00:53.529810', '573', 'Activity object (573)', 1, 'new through import_export', 8, 1),
(662, '2023-03-01 10:00:53.530812', '574', 'Activity object (574)', 1, 'new through import_export', 8, 1),
(663, '2023-03-01 10:00:53.530812', '575', 'Activity object (575)', 1, 'new through import_export', 8, 1),
(664, '2023-03-01 10:00:53.531812', '576', 'Activity object (576)', 1, 'new through import_export', 8, 1),
(665, '2023-03-01 10:00:53.532812', '577', 'Activity object (577)', 1, 'new through import_export', 8, 1),
(666, '2023-03-01 10:00:53.534005', '578', 'Activity object (578)', 1, 'new through import_export', 8, 1),
(667, '2023-03-01 10:00:53.535007', '579', 'Activity object (579)', 1, 'new through import_export', 8, 1),
(668, '2023-03-01 10:00:53.536135', '580', 'Activity object (580)', 1, 'new through import_export', 8, 1),
(669, '2023-03-01 10:00:53.537029', '581', 'Activity object (581)', 1, 'new through import_export', 8, 1),
(670, '2023-03-01 10:00:53.537872', '582', 'Activity object (582)', 1, 'new through import_export', 8, 1),
(671, '2023-03-01 10:00:53.538727', '583', 'Activity object (583)', 1, 'new through import_export', 8, 1),
(672, '2023-03-01 10:00:53.539729', '584', 'Activity object (584)', 1, 'new through import_export', 8, 1),
(673, '2023-03-01 10:00:53.539729', '585', 'Activity object (585)', 1, 'new through import_export', 8, 1),
(674, '2023-03-01 10:00:53.540729', '586', 'Activity object (586)', 1, 'new through import_export', 8, 1),
(675, '2023-03-01 10:00:53.541730', '587', 'Activity object (587)', 1, 'new through import_export', 8, 1),
(676, '2023-03-01 10:00:53.542729', '588', 'Activity object (588)', 1, 'new through import_export', 8, 1),
(677, '2023-03-01 10:00:53.543729', '589', 'Activity object (589)', 1, 'new through import_export', 8, 1),
(678, '2023-03-01 10:00:53.544730', '590', 'Activity object (590)', 1, 'new through import_export', 8, 1),
(679, '2023-03-01 10:00:53.545730', '591', 'Activity object (591)', 1, 'new through import_export', 8, 1),
(680, '2023-03-01 10:00:53.546731', '592', 'Activity object (592)', 1, 'new through import_export', 8, 1),
(681, '2023-03-01 10:00:53.547732', '593', 'Activity object (593)', 1, 'new through import_export', 8, 1),
(682, '2023-03-01 10:00:53.548731', '594', 'Activity object (594)', 1, 'new through import_export', 8, 1),
(683, '2023-03-01 10:00:53.549732', '595', 'Activity object (595)', 1, 'new through import_export', 8, 1),
(684, '2023-03-01 10:00:53.550731', '596', 'Activity object (596)', 1, 'new through import_export', 8, 1),
(685, '2023-03-01 10:00:53.551863', '597', 'Activity object (597)', 1, 'new through import_export', 8, 1),
(686, '2023-03-01 10:00:53.552745', '598', 'Activity object (598)', 1, 'new through import_export', 8, 1),
(687, '2023-03-01 10:00:53.553735', '599', 'Activity object (599)', 1, 'new through import_export', 8, 1),
(688, '2023-03-01 10:00:53.553735', '600', 'Activity object (600)', 1, 'new through import_export', 8, 1),
(689, '2023-03-01 10:00:53.554737', '601', 'Activity object (601)', 1, 'new through import_export', 8, 1),
(690, '2023-03-01 10:00:53.556515', '602', 'Activity object (602)', 1, 'new through import_export', 8, 1),
(691, '2023-03-01 10:00:53.557471', '603', 'Activity object (603)', 1, 'new through import_export', 8, 1),
(692, '2023-03-01 10:00:53.558332', '604', 'Activity object (604)', 1, 'new through import_export', 8, 1),
(693, '2023-03-01 10:00:53.559333', '605', 'Activity object (605)', 1, 'new through import_export', 8, 1),
(694, '2023-03-01 10:00:53.560333', '606', 'Activity object (606)', 1, 'new through import_export', 8, 1),
(695, '2023-03-01 10:00:53.560333', '607', 'Activity object (607)', 1, 'new through import_export', 8, 1),
(696, '2023-03-01 10:00:53.561945', '608', 'Activity object (608)', 1, 'new through import_export', 8, 1),
(697, '2023-03-01 10:00:53.562743', '609', 'Activity object (609)', 1, 'new through import_export', 8, 1),
(698, '2023-03-01 10:00:53.563746', '610', 'Activity object (610)', 1, 'new through import_export', 8, 1),
(699, '2023-03-01 10:00:53.564746', '611', 'Activity object (611)', 1, 'new through import_export', 8, 1),
(700, '2023-03-01 10:00:53.565560', '612', 'Activity object (612)', 1, 'new through import_export', 8, 1),
(701, '2023-03-01 10:00:53.566434', '613', 'Activity object (613)', 1, 'new through import_export', 8, 1),
(702, '2023-03-01 10:00:53.566945', '614', 'Activity object (614)', 1, 'new through import_export', 8, 1),
(703, '2023-03-01 10:00:53.567948', '615', 'Activity object (615)', 1, 'new through import_export', 8, 1),
(704, '2023-03-01 10:00:53.568947', '616', 'Activity object (616)', 1, 'new through import_export', 8, 1),
(705, '2023-03-01 10:00:53.569947', '617', 'Activity object (617)', 1, 'new through import_export', 8, 1),
(706, '2023-03-01 10:00:53.569947', '618', 'Activity object (618)', 1, 'new through import_export', 8, 1),
(707, '2023-03-01 10:00:53.570947', '619', 'Activity object (619)', 1, 'new through import_export', 8, 1),
(708, '2023-03-01 10:00:53.571947', '620', 'Activity object (620)', 1, 'new through import_export', 8, 1),
(709, '2023-03-01 10:00:53.572948', '621', 'Activity object (621)', 1, 'new through import_export', 8, 1),
(710, '2023-03-01 10:00:53.573947', '622', 'Activity object (622)', 1, 'new through import_export', 8, 1),
(711, '2023-03-01 10:00:53.574949', '623', 'Activity object (623)', 1, 'new through import_export', 8, 1),
(712, '2023-03-01 10:00:53.576137', '624', 'Activity object (624)', 1, 'new through import_export', 8, 1),
(713, '2023-03-01 10:00:53.577141', '625', 'Activity object (625)', 1, 'new through import_export', 8, 1),
(714, '2023-03-01 10:00:53.577950', '626', 'Activity object (626)', 1, 'new through import_export', 8, 1),
(715, '2023-03-01 10:00:53.578953', '627', 'Activity object (627)', 1, 'new through import_export', 8, 1),
(716, '2023-03-01 10:00:53.579956', '628', 'Activity object (628)', 1, 'new through import_export', 8, 1),
(717, '2023-03-01 10:00:53.580958', '629', 'Activity object (629)', 1, 'new through import_export', 8, 1),
(718, '2023-03-01 10:00:53.581956', '630', 'Activity object (630)', 1, 'new through import_export', 8, 1),
(719, '2023-03-01 10:00:53.581956', '631', 'Activity object (631)', 1, 'new through import_export', 8, 1),
(720, '2023-03-01 10:00:53.582957', '632', 'Activity object (632)', 1, 'new through import_export', 8, 1),
(721, '2023-03-01 10:00:53.583958', '633', 'Activity object (633)', 1, 'new through import_export', 8, 1),
(722, '2023-03-01 10:00:53.584957', '634', 'Activity object (634)', 1, 'new through import_export', 8, 1),
(723, '2023-03-01 10:00:53.586472', '635', 'Activity object (635)', 1, 'new through import_export', 8, 1),
(724, '2023-03-01 10:00:53.587426', '636', 'Activity object (636)', 1, 'new through import_export', 8, 1),
(725, '2023-03-01 10:00:53.587947', '637', 'Activity object (637)', 1, 'new through import_export', 8, 1),
(726, '2023-03-01 10:00:53.588949', '638', 'Activity object (638)', 1, 'new through import_export', 8, 1),
(727, '2023-03-01 10:00:53.589949', '639', 'Activity object (639)', 1, 'new through import_export', 8, 1),
(728, '2023-03-01 10:00:53.590949', '640', 'Activity object (640)', 1, 'new through import_export', 8, 1),
(729, '2023-03-01 10:00:53.591949', '641', 'Activity object (641)', 1, 'new through import_export', 8, 1),
(730, '2023-03-01 10:00:53.592949', '642', 'Activity object (642)', 1, 'new through import_export', 8, 1),
(731, '2023-03-01 10:00:53.593710', '643', 'Activity object (643)', 1, 'new through import_export', 8, 1),
(732, '2023-03-01 10:00:53.594713', '644', 'Activity object (644)', 1, 'new through import_export', 8, 1),
(733, '2023-03-01 10:00:53.595883', '645', 'Activity object (645)', 1, 'new through import_export', 8, 1),
(734, '2023-03-01 10:00:53.596885', '646', 'Activity object (646)', 1, 'new through import_export', 8, 1),
(735, '2023-03-01 10:00:53.597885', '647', 'Activity object (647)', 1, 'new through import_export', 8, 1),
(736, '2023-03-01 10:00:53.598949', '648', 'Activity object (648)', 1, 'new through import_export', 8, 1),
(737, '2023-03-01 10:00:53.599716', '649', 'Activity object (649)', 1, 'new through import_export', 8, 1),
(738, '2023-03-01 10:00:53.600718', '650', 'Activity object (650)', 1, 'new through import_export', 8, 1),
(739, '2023-03-01 10:00:53.601718', '651', 'Activity object (651)', 1, 'new through import_export', 8, 1),
(740, '2023-03-01 10:00:53.602720', '652', 'Activity object (652)', 1, 'new through import_export', 8, 1),
(741, '2023-03-01 10:00:53.603720', '653', 'Activity object (653)', 1, 'new through import_export', 8, 1),
(742, '2023-03-01 10:00:53.604718', '654', 'Activity object (654)', 1, 'new through import_export', 8, 1),
(743, '2023-03-01 10:00:53.605958', '655', 'Activity object (655)', 1, 'new through import_export', 8, 1),
(744, '2023-03-01 10:00:53.606993', '656', 'Activity object (656)', 1, 'new through import_export', 8, 1),
(745, '2023-03-01 10:00:53.607892', '657', 'Activity object (657)', 1, 'new through import_export', 8, 1),
(746, '2023-03-01 10:00:53.608792', '658', 'Activity object (658)', 1, 'new through import_export', 8, 1),
(747, '2023-03-01 10:00:53.609722', '659', 'Activity object (659)', 1, 'new through import_export', 8, 1),
(748, '2023-03-01 10:00:53.610725', '660', 'Activity object (660)', 1, 'new through import_export', 8, 1),
(749, '2023-03-01 10:00:53.611725', '661', 'Activity object (661)', 1, 'new through import_export', 8, 1),
(750, '2023-03-01 10:00:53.612726', '662', 'Activity object (662)', 1, 'new through import_export', 8, 1),
(751, '2023-03-01 10:00:53.613630', '663', 'Activity object (663)', 1, 'new through import_export', 8, 1),
(752, '2023-03-01 10:00:53.614632', '664', 'Activity object (664)', 1, 'new through import_export', 8, 1),
(753, '2023-03-01 10:00:53.614632', '665', 'Activity object (665)', 1, 'new through import_export', 8, 1),
(754, '2023-03-01 10:00:53.616277', '666', 'Activity object (666)', 1, 'new through import_export', 8, 1),
(755, '2023-03-01 10:00:53.616277', '667', 'Activity object (667)', 1, 'new through import_export', 8, 1),
(756, '2023-03-01 10:00:53.617278', '668', 'Activity object (668)', 1, 'new through import_export', 8, 1),
(757, '2023-03-01 10:00:53.618279', '669', 'Activity object (669)', 1, 'new through import_export', 8, 1),
(758, '2023-03-01 10:00:53.619279', '670', 'Activity object (670)', 1, 'new through import_export', 8, 1),
(759, '2023-03-01 10:00:53.620279', '671', 'Activity object (671)', 1, 'new through import_export', 8, 1),
(760, '2023-03-01 10:00:53.621280', '672', 'Activity object (672)', 1, 'new through import_export', 8, 1),
(761, '2023-03-01 10:00:53.623060', '673', 'Activity object (673)', 1, 'new through import_export', 8, 1),
(762, '2023-03-01 10:00:53.624062', '674', 'Activity object (674)', 1, 'new through import_export', 8, 1),
(763, '2023-03-01 10:00:53.624062', '675', 'Activity object (675)', 1, 'new through import_export', 8, 1),
(764, '2023-03-01 10:00:53.625062', '676', 'Activity object (676)', 1, 'new through import_export', 8, 1),
(765, '2023-03-01 10:00:53.626799', '677', 'Activity object (677)', 1, 'new through import_export', 8, 1),
(766, '2023-03-01 10:00:53.627780', '678', 'Activity object (678)', 1, 'new through import_export', 8, 1),
(767, '2023-03-01 10:00:53.628782', '679', 'Activity object (679)', 1, 'new through import_export', 8, 1),
(768, '2023-03-01 10:00:53.628782', '680', 'Activity object (680)', 1, 'new through import_export', 8, 1),
(769, '2023-03-01 10:00:53.630430', '681', 'Activity object (681)', 1, 'new through import_export', 8, 1),
(770, '2023-03-01 10:00:53.631289', '682', 'Activity object (682)', 1, 'new through import_export', 8, 1),
(771, '2023-03-01 10:00:53.631289', '683', 'Activity object (683)', 1, 'new through import_export', 8, 1),
(772, '2023-03-01 10:00:53.632291', '684', 'Activity object (684)', 1, 'new through import_export', 8, 1),
(773, '2023-03-01 10:00:53.633291', '685', 'Activity object (685)', 1, 'new through import_export', 8, 1),
(774, '2023-03-01 10:00:53.634291', '686', 'Activity object (686)', 1, 'new through import_export', 8, 1),
(775, '2023-03-01 10:00:53.636094', '687', 'Activity object (687)', 1, 'new through import_export', 8, 1),
(776, '2023-03-01 10:00:53.636971', '688', 'Activity object (688)', 1, 'new through import_export', 8, 1),
(777, '2023-03-01 10:00:53.636971', '689', 'Activity object (689)', 1, 'new through import_export', 8, 1),
(778, '2023-03-01 10:00:53.637973', '690', 'Activity object (690)', 1, 'new through import_export', 8, 1),
(779, '2023-03-01 10:00:53.638973', '691', 'Activity object (691)', 1, 'new through import_export', 8, 1),
(780, '2023-03-01 10:00:53.639973', '692', 'Activity object (692)', 1, 'new through import_export', 8, 1),
(781, '2023-03-01 10:00:53.640974', '693', 'Activity object (693)', 1, 'new through import_export', 8, 1),
(782, '2023-03-01 10:00:53.641974', '694', 'Activity object (694)', 1, 'new through import_export', 8, 1),
(783, '2023-03-01 10:00:53.642973', '695', 'Activity object (695)', 1, 'new through import_export', 8, 1),
(784, '2023-03-01 10:00:53.644372', '696', 'Activity object (696)', 1, 'new through import_export', 8, 1),
(785, '2023-03-01 10:00:53.645254', '697', 'Activity object (697)', 1, 'new through import_export', 8, 1),
(786, '2023-03-01 10:00:53.645976', '698', 'Activity object (698)', 1, 'new through import_export', 8, 1),
(787, '2023-03-01 10:00:53.646978', '699', 'Activity object (699)', 1, 'new through import_export', 8, 1),
(788, '2023-03-01 10:00:53.647980', '700', 'Activity object (700)', 1, 'new through import_export', 8, 1),
(789, '2023-03-01 10:00:53.648978', '701', 'Activity object (701)', 1, 'new through import_export', 8, 1),
(790, '2023-03-01 10:00:53.648978', '702', 'Activity object (702)', 1, 'new through import_export', 8, 1),
(791, '2023-03-01 10:00:53.649979', '703', 'Activity object (703)', 1, 'new through import_export', 8, 1),
(792, '2023-03-01 10:00:53.650979', '704', 'Activity object (704)', 1, 'new through import_export', 8, 1),
(793, '2023-03-01 10:00:53.651979', '705', 'Activity object (705)', 1, 'new through import_export', 8, 1),
(794, '2023-03-01 10:00:53.652980', '706', 'Activity object (706)', 1, 'new through import_export', 8, 1),
(795, '2023-03-01 10:00:53.653979', '707', 'Activity object (707)', 1, 'new through import_export', 8, 1),
(796, '2023-03-01 10:00:53.654980', '708', 'Activity object (708)', 1, 'new through import_export', 8, 1),
(797, '2023-03-01 10:00:53.655980', '709', 'Activity object (709)', 1, 'new through import_export', 8, 1),
(798, '2023-03-01 10:00:53.657386', '710', 'Activity object (710)', 1, 'new through import_export', 8, 1),
(799, '2023-03-01 10:00:53.658318', '711', 'Activity object (711)', 1, 'new through import_export', 8, 1),
(800, '2023-03-01 10:00:53.658984', '712', 'Activity object (712)', 1, 'new through import_export', 8, 1),
(801, '2023-03-01 10:00:53.659985', '713', 'Activity object (713)', 1, 'new through import_export', 8, 1),
(802, '2023-03-01 10:00:53.660987', '714', 'Activity object (714)', 1, 'new through import_export', 8, 1),
(803, '2023-03-01 10:00:53.661986', '715', 'Activity object (715)', 1, 'new through import_export', 8, 1),
(804, '2023-03-01 10:00:53.662815', '716', 'Activity object (716)', 1, 'new through import_export', 8, 1),
(805, '2023-03-01 10:00:53.662815', '717', 'Activity object (717)', 1, 'new through import_export', 8, 1),
(806, '2023-03-01 10:00:53.663816', '718', 'Activity object (718)', 1, 'new through import_export', 8, 1),
(807, '2023-03-01 10:00:53.664816', '719', 'Activity object (719)', 1, 'new through import_export', 8, 1),
(808, '2023-03-01 10:00:53.665817', '720', 'Activity object (720)', 1, 'new through import_export', 8, 1),
(809, '2023-03-01 10:00:53.666820', '721', 'Activity object (721)', 1, 'new through import_export', 8, 1),
(810, '2023-03-01 10:00:53.667817', '722', 'Activity object (722)', 1, 'new through import_export', 8, 1),
(811, '2023-03-01 10:00:53.668818', '723', 'Activity object (723)', 1, 'new through import_export', 8, 1),
(812, '2023-03-01 10:00:53.669972', '724', 'Activity object (724)', 1, 'new through import_export', 8, 1),
(813, '2023-03-01 10:00:53.670974', '725', 'Activity object (725)', 1, 'new through import_export', 8, 1),
(814, '2023-03-01 10:00:53.671974', '726', 'Activity object (726)', 1, 'new through import_export', 8, 1),
(815, '2023-03-01 10:00:53.672973', '727', 'Activity object (727)', 1, 'new through import_export', 8, 1),
(816, '2023-03-01 10:00:53.673974', '728', 'Activity object (728)', 1, 'new through import_export', 8, 1),
(817, '2023-03-01 10:00:53.673974', '729', 'Activity object (729)', 1, 'new through import_export', 8, 1),
(818, '2023-03-01 10:00:53.674974', '730', 'Activity object (730)', 1, 'new through import_export', 8, 1),
(819, '2023-03-01 10:00:53.675974', '731', 'Activity object (731)', 1, 'new through import_export', 8, 1),
(820, '2023-03-01 10:00:53.676975', '732', 'Activity object (732)', 1, 'new through import_export', 8, 1),
(821, '2023-03-01 10:00:53.677975', '733', 'Activity object (733)', 1, 'new through import_export', 8, 1),
(822, '2023-03-01 10:00:53.679672', '734', 'Activity object (734)', 1, 'new through import_export', 8, 1),
(823, '2023-03-01 10:00:53.680574', '735', 'Activity object (735)', 1, 'new through import_export', 8, 1),
(824, '2023-03-01 10:00:53.681289', '736', 'Activity object (736)', 1, 'new through import_export', 8, 1),
(825, '2023-03-01 10:00:53.682291', '737', 'Activity object (737)', 1, 'new through import_export', 8, 1),
(826, '2023-03-01 10:00:53.683291', '738', 'Activity object (738)', 1, 'new through import_export', 8, 1),
(827, '2023-03-01 10:00:53.684317', '739', 'Activity object (739)', 1, 'new through import_export', 8, 1),
(828, '2023-03-01 10:00:53.685301', '740', 'Activity object (740)', 1, 'new through import_export', 8, 1),
(829, '2023-03-01 10:00:53.686303', '741', 'Activity object (741)', 1, 'new through import_export', 8, 1),
(830, '2023-03-01 10:00:53.687303', '742', 'Activity object (742)', 1, 'new through import_export', 8, 1),
(831, '2023-03-01 10:00:53.688302', '743', 'Activity object (743)', 1, 'new through import_export', 8, 1),
(832, '2023-03-01 10:00:53.689304', '744', 'Activity object (744)', 1, 'new through import_export', 8, 1),
(833, '2023-03-01 10:00:53.690013', '745', 'Activity object (745)', 1, 'new through import_export', 8, 1),
(834, '2023-03-01 10:00:53.690952', '746', 'Activity object (746)', 1, 'new through import_export', 8, 1),
(835, '2023-03-01 10:00:53.691954', '747', 'Activity object (747)', 1, 'new through import_export', 8, 1),
(836, '2023-03-01 10:00:53.692954', '748', 'Activity object (748)', 1, 'new through import_export', 8, 1),
(837, '2023-03-01 10:00:53.692954', '749', 'Activity object (749)', 1, 'new through import_export', 8, 1),
(838, '2023-03-01 10:00:53.693954', '750', 'Activity object (750)', 1, 'new through import_export', 8, 1),
(839, '2023-03-01 10:00:53.694954', '751', 'Activity object (751)', 1, 'new through import_export', 8, 1),
(840, '2023-03-01 10:00:53.695955', '752', 'Activity object (752)', 1, 'new through import_export', 8, 1),
(841, '2023-03-01 10:00:53.696955', '753', 'Activity object (753)', 1, 'new through import_export', 8, 1),
(842, '2023-03-01 10:00:53.697955', '754', 'Activity object (754)', 1, 'new through import_export', 8, 1),
(843, '2023-03-01 10:00:53.699455', '755', 'Activity object (755)', 1, 'new through import_export', 8, 1),
(844, '2023-03-01 10:00:53.700619', '756', 'Activity object (756)', 1, 'new through import_export', 8, 1),
(845, '2023-03-01 10:00:53.701515', '757', 'Activity object (757)', 1, 'new through import_export', 8, 1),
(846, '2023-03-01 10:00:53.702516', '758', 'Activity object (758)', 1, 'new through import_export', 8, 1),
(847, '2023-03-01 10:00:53.702516', '759', 'Activity object (759)', 1, 'new through import_export', 8, 1),
(848, '2023-03-01 10:00:53.704517', '760', 'Activity object (760)', 1, 'new through import_export', 8, 1),
(849, '2023-03-01 10:00:53.705462', '761', 'Activity object (761)', 1, 'new through import_export', 8, 1),
(850, '2023-03-01 10:00:53.706394', '762', 'Activity object (762)', 1, 'new through import_export', 8, 1),
(851, '2023-03-01 10:00:53.707395', '763', 'Activity object (763)', 1, 'new through import_export', 8, 1),
(852, '2023-03-01 10:00:53.707395', '764', 'Activity object (764)', 1, 'new through import_export', 8, 1),
(853, '2023-03-01 10:00:53.709074', '765', 'Activity object (765)', 1, 'new through import_export', 8, 1),
(854, '2023-03-01 10:00:53.710075', '766', 'Activity object (766)', 1, 'new through import_export', 8, 1),
(855, '2023-03-01 10:00:53.711076', '767', 'Activity object (767)', 1, 'new through import_export', 8, 1),
(856, '2023-03-01 10:00:53.712077', '768', 'Activity object (768)', 1, 'new through import_export', 8, 1),
(857, '2023-03-01 10:00:53.713076', '769', 'Activity object (769)', 1, 'new through import_export', 8, 1),
(858, '2023-03-01 10:00:53.714294', '770', 'Activity object (770)', 1, 'new through import_export', 8, 1),
(859, '2023-03-01 10:00:53.715173', '771', 'Activity object (771)', 1, 'new through import_export', 8, 1),
(860, '2023-03-01 10:00:53.716022', '772', 'Activity object (772)', 1, 'new through import_export', 8, 1),
(861, '2023-03-01 10:00:53.717023', '773', 'Activity object (773)', 1, 'new through import_export', 8, 1),
(862, '2023-03-01 10:00:53.717023', '774', 'Activity object (774)', 1, 'new through import_export', 8, 1),
(863, '2023-03-01 10:00:53.718023', '775', 'Activity object (775)', 1, 'new through import_export', 8, 1),
(864, '2023-03-01 10:00:53.720024', '776', 'Activity object (776)', 1, 'new through import_export', 8, 1),
(865, '2023-03-01 10:00:53.721024', '777', 'Activity object (777)', 1, 'new through import_export', 8, 1),
(866, '2023-03-01 10:00:53.722024', '778', 'Activity object (778)', 1, 'new through import_export', 8, 1),
(867, '2023-03-01 10:00:53.723025', '779', 'Activity object (779)', 1, 'new through import_export', 8, 1),
(868, '2023-03-01 10:00:53.724046', '780', 'Activity object (780)', 1, 'new through import_export', 8, 1),
(869, '2023-03-01 10:00:53.725052', '781', 'Activity object (781)', 1, 'new through import_export', 8, 1),
(870, '2023-03-01 10:00:53.726053', '782', 'Activity object (782)', 1, 'new through import_export', 8, 1),
(871, '2023-03-01 10:00:53.727053', '783', 'Activity object (783)', 1, 'new through import_export', 8, 1),
(872, '2023-03-01 10:00:53.728780', '784', 'Activity object (784)', 1, 'new through import_export', 8, 1),
(873, '2023-03-01 10:00:53.729666', '785', 'Activity object (785)', 1, 'new through import_export', 8, 1),
(874, '2023-03-01 10:00:53.729666', '786', 'Activity object (786)', 1, 'new through import_export', 8, 1),
(875, '2023-03-01 10:00:53.730668', '787', 'Activity object (787)', 1, 'new through import_export', 8, 1),
(876, '2023-03-01 10:00:53.732359', '788', 'Activity object (788)', 1, 'new through import_export', 8, 1),
(877, '2023-03-01 10:00:53.733361', '789', 'Activity object (789)', 1, 'new through import_export', 8, 1),
(878, '2023-03-01 10:00:53.734363', '790', 'Activity object (790)', 1, 'new through import_export', 8, 1),
(879, '2023-03-01 10:00:53.735360', '791', 'Activity object (791)', 1, 'new through import_export', 8, 1),
(880, '2023-03-01 10:00:53.736360', '792', 'Activity object (792)', 1, 'new through import_export', 8, 1),
(881, '2023-03-01 10:00:53.737362', '793', 'Activity object (793)', 1, 'new through import_export', 8, 1),
(882, '2023-03-01 10:00:53.738361', '794', 'Activity object (794)', 1, 'new through import_export', 8, 1),
(883, '2023-03-01 10:00:53.739363', '795', 'Activity object (795)', 1, 'new through import_export', 8, 1),
(884, '2023-03-01 10:00:53.740362', '796', 'Activity object (796)', 1, 'new through import_export', 8, 1),
(885, '2023-03-01 10:00:53.741850', '797', 'Activity object (797)', 1, 'new through import_export', 8, 1),
(886, '2023-03-01 10:00:53.743072', '798', 'Activity object (798)', 1, 'new through import_export', 8, 1),
(887, '2023-03-01 10:00:53.744017', '799', 'Activity object (799)', 1, 'new through import_export', 8, 1),
(888, '2023-03-01 10:00:53.744017', '800', 'Activity object (800)', 1, 'new through import_export', 8, 1),
(889, '2023-03-01 10:00:53.745019', '801', 'Activity object (801)', 1, 'new through import_export', 8, 1),
(890, '2023-03-01 10:00:53.746671', '802', 'Activity object (802)', 1, 'new through import_export', 8, 1),
(891, '2023-03-01 10:00:53.747674', '803', 'Activity object (803)', 1, 'new through import_export', 8, 1),
(892, '2023-03-01 10:00:53.748674', '804', 'Activity object (804)', 1, 'new through import_export', 8, 1),
(893, '2023-03-01 10:00:53.749673', '805', 'Activity object (805)', 1, 'new through import_export', 8, 1),
(894, '2023-03-01 10:00:53.750674', '806', 'Activity object (806)', 1, 'new through import_export', 8, 1),
(895, '2023-03-01 10:00:53.751673', '807', 'Activity object (807)', 1, 'new through import_export', 8, 1),
(896, '2023-03-01 10:00:53.752675', '808', 'Activity object (808)', 1, 'new through import_export', 8, 1),
(897, '2023-03-01 10:00:53.753674', '809', 'Activity object (809)', 1, 'new through import_export', 8, 1),
(898, '2023-03-01 10:00:53.754676', '810', 'Activity object (810)', 1, 'new through import_export', 8, 1),
(899, '2023-03-01 10:00:53.756675', '811', 'Activity object (811)', 1, 'new through import_export', 8, 1),
(900, '2023-03-01 10:01:08.985430', '1', 'HintScale object (1)', 1, 'new through import_export', 10, 1),
(901, '2023-03-01 10:01:19.318234', '1', 'QuestionAndHint object (1)', 1, 'new through import_export', 11, 1),
(902, '2023-03-01 10:01:19.319230', '2', 'QuestionAndHint object (2)', 1, 'new through import_export', 11, 1),
(903, '2023-03-01 10:01:19.320230', '3', 'QuestionAndHint object (3)', 1, 'new through import_export', 11, 1),
(904, '2023-03-01 10:01:19.322231', '4', 'QuestionAndHint object (4)', 1, 'new through import_export', 11, 1),
(905, '2023-03-01 10:01:19.323231', '5', 'QuestionAndHint object (5)', 1, 'new through import_export', 11, 1),
(906, '2023-03-01 10:01:19.324265', '6', 'QuestionAndHint object (6)', 1, 'new through import_export', 11, 1),
(907, '2023-03-01 10:01:19.325505', '7', 'QuestionAndHint object (7)', 1, 'new through import_export', 11, 1),
(908, '2023-03-01 10:01:19.326233', '8', 'QuestionAndHint object (8)', 1, 'new through import_export', 11, 1),
(909, '2023-03-01 10:01:19.328237', '9', 'QuestionAndHint object (9)', 1, 'new through import_export', 11, 1),
(910, '2023-03-01 10:01:19.329424', '10', 'QuestionAndHint object (10)', 1, 'new through import_export', 11, 1),
(911, '2023-03-01 10:01:19.330571', '11', 'QuestionAndHint object (11)', 1, 'new through import_export', 11, 1),
(912, '2023-03-01 10:01:19.331663', '12', 'QuestionAndHint object (12)', 1, 'new through import_export', 11, 1),
(913, '2023-03-01 10:01:19.332665', '13', 'QuestionAndHint object (13)', 1, 'new through import_export', 11, 1),
(914, '2023-03-01 10:01:19.334208', '14', 'QuestionAndHint object (14)', 1, 'new through import_export', 11, 1),
(915, '2023-03-01 10:01:19.335354', '15', 'QuestionAndHint object (15)', 1, 'new through import_export', 11, 1),
(916, '2023-03-01 10:01:19.336487', '16', 'QuestionAndHint object (16)', 1, 'new through import_export', 11, 1),
(917, '2023-03-01 10:01:19.337502', '17', 'QuestionAndHint object (17)', 1, 'new through import_export', 11, 1),
(918, '2023-03-01 10:01:19.338532', '18', 'QuestionAndHint object (18)', 1, 'new through import_export', 11, 1),
(919, '2023-03-01 10:01:19.339549', '19', 'QuestionAndHint object (19)', 1, 'new through import_export', 11, 1),
(920, '2023-03-01 10:01:19.340535', '20', 'QuestionAndHint object (20)', 1, 'new through import_export', 11, 1),
(921, '2023-03-01 10:01:19.341536', '21', 'QuestionAndHint object (21)', 1, 'new through import_export', 11, 1),
(922, '2023-03-01 10:01:19.343537', '22', 'QuestionAndHint object (22)', 1, 'new through import_export', 11, 1),
(923, '2023-03-01 10:01:19.344545', '23', 'QuestionAndHint object (23)', 1, 'new through import_export', 11, 1),
(924, '2023-03-01 10:01:19.346081', '24', 'QuestionAndHint object (24)', 1, 'new through import_export', 11, 1),
(925, '2023-03-01 10:01:19.347103', '25', 'QuestionAndHint object (25)', 1, 'new through import_export', 11, 1),
(926, '2023-03-01 10:01:19.348090', '26', 'QuestionAndHint object (26)', 1, 'new through import_export', 11, 1),
(927, '2023-03-01 10:01:19.349469', '27', 'QuestionAndHint object (27)', 1, 'new through import_export', 11, 1),
(928, '2023-03-01 10:01:19.350480', '28', 'QuestionAndHint object (28)', 1, 'new through import_export', 11, 1),
(929, '2023-03-01 10:01:19.351991', '29', 'QuestionAndHint object (29)', 1, 'new through import_export', 11, 1),
(930, '2023-03-01 10:01:19.352995', '30', 'QuestionAndHint object (30)', 1, 'new through import_export', 11, 1),
(931, '2023-03-01 10:01:19.353993', '31', 'QuestionAndHint object (31)', 1, 'new through import_export', 11, 1),
(932, '2023-03-01 10:01:19.355994', '32', 'QuestionAndHint object (32)', 1, 'new through import_export', 11, 1),
(933, '2023-03-01 10:01:19.356994', '33', 'QuestionAndHint object (33)', 1, 'new through import_export', 11, 1),
(934, '2023-03-01 10:01:19.357994', '34', 'QuestionAndHint object (34)', 1, 'new through import_export', 11, 1),
(935, '2023-03-01 10:01:19.360037', '35', 'QuestionAndHint object (35)', 1, 'new through import_export', 11, 1),
(936, '2023-03-01 10:01:19.360546', '36', 'QuestionAndHint object (36)', 1, 'new through import_export', 11, 1),
(937, '2023-03-01 10:01:19.362543', '37', 'QuestionAndHint object (37)', 1, 'new through import_export', 11, 1),
(938, '2023-03-01 10:01:19.363542', '38', 'QuestionAndHint object (38)', 1, 'new through import_export', 11, 1),
(939, '2023-03-01 10:01:19.364648', '39', 'QuestionAndHint object (39)', 1, 'new through import_export', 11, 1),
(940, '2023-03-01 10:01:19.365839', '40', 'QuestionAndHint object (40)', 1, 'new through import_export', 11, 1),
(941, '2023-03-01 10:01:19.366377', '41', 'QuestionAndHint object (41)', 1, 'new through import_export', 11, 1),
(942, '2023-03-01 10:01:19.367379', '42', 'QuestionAndHint object (42)', 1, 'new through import_export', 11, 1),
(943, '2023-03-01 10:01:19.369401', '43', 'QuestionAndHint object (43)', 1, 'new through import_export', 11, 1),
(944, '2023-03-01 10:01:19.370417', '44', 'QuestionAndHint object (44)', 1, 'new through import_export', 11, 1),
(945, '2023-03-01 10:01:19.371403', '45', 'QuestionAndHint object (45)', 1, 'new through import_export', 11, 1),
(946, '2023-03-01 10:01:19.372404', '46', 'QuestionAndHint object (46)', 1, 'new through import_export', 11, 1),
(947, '2023-03-01 10:01:19.373418', '47', 'QuestionAndHint object (47)', 1, 'new through import_export', 11, 1),
(948, '2023-03-01 10:01:19.374414', '48', 'QuestionAndHint object (48)', 1, 'new through import_export', 11, 1),
(949, '2023-03-01 10:01:19.376412', '49', 'QuestionAndHint object (49)', 1, 'new through import_export', 11, 1),
(950, '2023-03-01 10:01:19.377405', '50', 'QuestionAndHint object (50)', 1, 'new through import_export', 11, 1),
(951, '2023-03-01 10:01:19.378413', '51', 'QuestionAndHint object (51)', 1, 'new through import_export', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'homepage', 'account'),
(8, 'homepage', 'activity'),
(9, 'homepage', 'career'),
(16, 'homepage', 'competence'),
(10, 'homepage', 'hintscale'),
(11, 'homepage', 'questionandhint'),
(15, 'homepage', 'ratesolution'),
(17, 'homepage', 'result'),
(14, 'homepage', 'skill'),
(13, 'homepage', 'skillarea'),
(12, 'homepage', 'solution'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-01 09:57:44.516896'),
(2, 'auth', '0001_initial', '2023-03-01 09:57:44.803257'),
(3, 'admin', '0001_initial', '2023-03-01 09:57:44.872272'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-01 09:57:44.879274'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-01 09:57:44.886276'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-03-01 09:57:44.935287'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-03-01 09:57:44.964053'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-03-01 09:57:44.994757'),
(9, 'auth', '0004_alter_user_username_opts', '2023-03-01 09:57:45.002761'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-03-01 09:57:45.028768'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-03-01 09:57:45.031771'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-03-01 09:57:45.038768'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-03-01 09:57:45.051771'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-03-01 09:57:45.065774'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-03-01 09:57:45.094391'),
(16, 'auth', '0011_update_proxy_permissions', '2023-03-01 09:57:45.101392'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-03-01 09:57:45.114395'),
(18, 'homepage', '0001_initial', '2023-03-01 09:57:45.577873'),
(19, 'homepage', '0002_result', '2023-03-01 09:57:45.645948'),
(20, 'homepage', '0003_auto_20221110_0715', '2023-03-01 09:57:45.720551'),
(21, 'sessions', '0001_initial', '2023-03-01 09:57:45.742125');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5lhv6thneg26426qi48u3xyx1lk7najp', '.eJxVjMsOwiAQRf-FtSFleLt07zeQgQGpGkhKuzL-uzbpQrf3nHNfLOC21rCNvISZ2JkpdvrdIqZHbjugO7Zb56m3dZkj3xV-0MGvnfLzcrh_BxVH_daekhXWK5DSC-siep9yJnJS6wzoaTJCxaJIumiKAyqTAEgQnTbJIrD3B9qON7U:1pXClB:NrrSxAIJcwXbWxfsV5nqGKLoWLdcOtnpBmoMwtweeEA', '2023-03-15 10:04:05.351971');

-- --------------------------------------------------------

--
-- Table structure for table `hintscale`
--

CREATE TABLE `hintscale` (
  `hintscaleid` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `editdate` datetime(6) DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hintscale`
--

INSERT INTO `hintscale` (`hintscaleid`, `name`, `description`, `createdate`, `editdate`, `isenable`, `note`) VALUES
(1, NULL, '<p><span style=\"color:#2980b9\"><span style=\"font-size:16px\"><strong><input checked=\"checked\" type=\"checkbox\" />Theo thời gian trả lời đ&uacute;ng/ hợp l&yacute; nhanh nhất tương ứng với thang điểm từ 0 - 100 </strong></span></span></p>\n\n<p><span style=\"font-size:16px\">- Thời gian dự kiến trả lời cho c&acirc;u hỏi: <strong>N </strong>ph&uacute;t. Nếu thời gian trả lời:</span></p>\n\n<ul>\n	<li><span style=\"font-size:16px\"><strong>Lớn hơn</strong> N ph&uacute;t th&igrave;&nbsp;đ&aacute;nh gi&aacute;&nbsp;<strong>B&igrave;nh thường hoặc Yếu</strong></span></li>\n	<li><span style=\"font-size:16px\"><strong>Trong khoảng</strong>&nbsp;N ph&uacute;t th&igrave;&nbsp;đ&aacute;nh gi&aacute;&nbsp;<strong>Kh&aacute;</strong></span></li>\n	<li><span style=\"font-size:16px\"><strong>Dưới </strong>N/2 ph&uacute;t&nbsp;th&igrave;&nbsp;đ&aacute;nh gi&aacute;&nbsp;<strong>Tốt</strong></span></li>\n</ul>\n\n<p><span style=\"color:#2980b9\"><span style=\"font-size:16px\"><strong><input checked=\"checked\" type=\"checkbox\" />Theo mức độ ch&iacute;nh x&aacute;c:</strong></span></span></p>\n\n<p><span style=\"font-size:16px\">- Nếu c&acirc;u trả lời:</span></p>\n\n<ul>\n	<li><span style=\"font-size:16px\"><strong>Sai </strong>ho&agrave;n to&agrave;n&nbsp;th&igrave;&nbsp;đ&aacute;nh gi&aacute; <strong>0 </strong>điểm</span></li>\n	<li><span style=\"font-size:16px\"><strong>Đ&uacute;ng một số ti&ecirc;u ch&iacute;</strong>&nbsp;th&igrave;&nbsp;đ&aacute;nh gi&aacute; khoảng <strong>0 - 50</strong>&nbsp;điểm</span></li>\n	<li><span style=\"font-size:16px\"><strong>Hầu như gần đ&uacute;ng</strong>&nbsp;th&igrave;&nbsp;đ&aacute;nh gi&aacute; khoảng <strong>50 - 90</strong>&nbsp;điểm</span></li>\n	<li><span style=\"font-size:16px\"><strong>Đ&uacute;ng</strong> ho&agrave;n to&agrave;n hoặc c&oacute; thể hơn mong đợi <strong>90 - 100</strong>&nbsp;điểm</span></li>\n</ul>', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `questionandhint`
--

CREATE TABLE `questionandhint` (
  `questionandhintid` int(11) NOT NULL,
  `typequestion` varchar(250) DEFAULT NULL,
  `contentquestion` longtext DEFAULT NULL,
  `contenthint` longtext DEFAULT NULL,
  `scorebase` varchar(250) DEFAULT NULL,
  `typegroup` varchar(250) DEFAULT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `editdate` datetime(6) DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `keynameactivity_id` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questionandhint`
--

INSERT INTO `questionandhint` (`questionandhintid`, `typequestion`, `contentquestion`, `contenthint`, `scorebase`, `typegroup`, `createdate`, `editdate`, `isenable`, `note`, `keynameactivity_id`) VALUES
(1, 'singlechoice', 'Cách tốt nhất để đưa tới việc xem xét việc đánh giá yêu cầu là?_Kiểm tra lỗi mô hình hệ thống_Nhờ khách hàng kiểm tra yêu cầu_Gửi họ tới đội thiết kế và xem họ có sự quan tâm nào không_Dùng danh sách các câu hỏi kiểm tra để kiểm tra mỗi yêu cầu', 'Dùng danh sách các câu hỏi kiểm tra để kiểm tra mỗi yêu cầu', '100', NULL, NULL, NULL, 1, NULL, '1s1.1.1'),
(2, 'singlechoice', 'Vì sao tạo nguyên mẫu tiến hóa thường thích được dùng hơn tạo nguyên mẫu bỏ đi?_Cho phép tái sử dụng nguyên mẫu đầu_Không đòi hỏi làm việc nhiều với khách hàng_Dễ dành thực hiện nhanh_Nhiều tin cậy hơn', 'Không đòi hỏi làm việc nhiều với khách hàng', '100', NULL, NULL, NULL, 1, NULL, '1s1.4.1'),
(3, 'assignment', 'Hãy cho biết mô hình prototype là gì? Khi nào nên sử dụng mô hình đó? Nêu những giai đoạn có trong mô hình và ưu, nhược điểm của mô hình.', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n<ul>\n<li>Nêu được khái niệm và các loại mô hình prototype</li>\n<li>Nêu được các trường hợp cần sử dụng prototype</li>\n<li>Liệt kê và mô tả được các giai đoạn có trong mô hình</li>\n<li> Nêu được một số ưu, nhược điểm của mô hình, có thể đi kèm với ví dụ</li>\n</ul>', '100', NULL, NULL, NULL, 1, NULL, '1s1.4.1'),
(4, 'assignment', 'Trong lĩnh vực thiết kế kiến trúc và xây dựng phân mềm có rất nhiều công cụ chuyên dụng được đưa vào quá trình làm việc. Bạn hãy kể tên một số công cụ liên quan đến thiết kế kiến trúc phần mềm và cách bạn sử dụng các công cụ đó trong công việc.', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n<ul>\n<li>Liệt kê một số công cụ/trang web như Sketchup, AutoCAD,...</li>\n<li>Trình bày quá trình đăng kí hoặc cài đặt, sử dụng</li>\n</ul>', '100', NULL, NULL, NULL, 1, NULL, '1s2.3.1'),
(5, 'singlechoice', 'Loại mô hình nào không được có trong kiến trúc phần mềm?_Mô hình dữ liệu_Mô hình động_Mô hình xử lí_Mô hình cấu trúc', 'Mô hình dữ liệu', '100', NULL, NULL, NULL, 1, NULL, '1s2.3.1'),
(6, 'assignment', 'Bạn thường quản lý các phiên bản mã nguồn của mình bằng cách nào? Hãy nêu một số công cụ để quản lý mã nguồn và cách sử dụng, cài đặt công cụ đó.', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n<ul>\n<li>Liệt kê một số công cụ/trang web như gitlab, github,...</li>\n<li>Trình bày quá trình đăng kí hoặc cài đặt, sử dụng</li>\n</ul>', '100', NULL, NULL, NULL, 1, NULL, '1s3.3.1'),
(7, 'assignment', 'Hãy giải thích gỡ lỗi (debug) là gì? Bạn thường dành thời gian bao lâu để gỡ lỗi? Hãy kể tên một số công cụ debugger Linux cho việc tìm điểm yếu trong phần mềm.', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n<ul>\n<li>Giải thích được gỡ lỗi là quá trình tìm ra và sửa một lỗi của phần mềm. Tùy thuộc vào lỗi phát sinh và kinh nghiệm gỡ lỗi sẽ có thời gian sử lí khác nhau.</li>\n<li>Nêu được một số công cụ debugger linux như: GNU Debugger (GDB), LLDB, Nemiver, Interactive Disassembler (IDA),....</li>\n</ul>', '100', NULL, NULL, NULL, 1, NULL, '1s3.4.1'),
(8, 'singlechoice', 'Phát biểu nào về kiểm thử chấp thuận người dùng là đúng?_Kiểm thử người dùng tạo cơ hội cho người dùng cải thiện nhu cầu của họ._Kiểm thử người dùng nên chứng tỏ rằng hệ thống vận hành các yêu cầu đã được xác định._Kiểm thử người dùng nên được thực hiện như một phần của giai đoạn đào tạo triển khai hệ thống._Kiểm thử người dùng tạo cơ hội tốt để nhận biết các sai sót trong mã đã được xây dựng.', 'Kiểm thử người dùng nên chứng tỏ rằng hệ thống vận hành các yêu cầu đã được xác định.', '100', NULL, NULL, NULL, 1, NULL, '1s3.4.1'),
(9, 'assignment', 'Hãy cho biết thế nào là môi trường phát triển phần mềm? Việc chọn lựa môi trường phát triển phần mềm ảnh hưởng đến điều gì?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n<ul>\n<li>Trình bày được được môi trường phát triển phần mềm là gì (ví dụ như cung cấp cho người lập trình đầy đủ các tính năng cần thiết trong việc phát triển phần mềm từ việc tạo mới dự án, hình ảnh lập trình, màn hình debug, màn hình unit test,v.v.)</li>\n<li>Giải thích được việc chọn lựa môi trường phát triển phần mềm ảnh hưởng đến mục đích xây dựng phần mềm và chất lượng của phần mềm.</li>\n</ul>', '100', NULL, NULL, NULL, 1, NULL, '1s3.5.4'),
(10, 'assignment', '<p><em>Sandbox là môi trường thử nghiệm cô lập, cho phép người dùng chạy các chương trình hoặc file thực thi mà không gây hại, làm hỏng các ứng dụng, hệ thống hoặc nền tảng.</em></p>\n<p>Bạn hãy nêu vai trò, cách sử dụng và nêu ví dụ liên quan đến Sandbox.</p>', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n<ul>\n<li>Giải thích được vai trò và cách sử dụng Sandbox</li>\n<li>Nêu được một số ví dụ liên quan đến Sandbox như:\n<ul>\n<li>Chạy tr&igrave;nh duyệt web trong Sandbox để bảo mật, giảm thiểu nguy cơ bị tấn c&ocirc;ng.</li>\n  <li>Chạy c&aacute;c phần mềm kh&ocirc;ng tin tưởng trong Sandbox để bảo dữ liệu c&aacute; nh&acirc;n hoặc g&acirc;y hại cho hệ thống</li>\n </ul>\n</li>\n</ul>', '100', NULL, NULL, NULL, 1, NULL, '1s4.2.1'),
(11, 'singlechoice', 'Kiểm thử hộp đen được dùng để cố gắng tìm ra những lỗi gì?_Chức năng không đầy đủ hay không đúng_Những lỗi giao diện_Những lỗi thực thi_Tất cả mục trên', 'Tất cả mục trên', '100', NULL, NULL, NULL, 1, NULL, '1s4.3.1'),
(12, 'assignment', 'Hãy cho biết kiểm thử hồi quy là gì, chủ yêu liên quan đến việc kiểm thử nào? Hãy nêu ví dụ đề cập đến việc bạn dùng đến kiểm thử hồi quy?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n<ul>\n <li>Giải th&iacute;ch được kiểm thử hồi quy l&agrave; một h&igrave;nh thức kiểm thử phần mềm để xem c&aacute;c chức năng cũ v&agrave; mới của n&oacute; c&oacute; c&ograve;n hoạt động đ&uacute;ng sau khi thay đổi hệ thống hay kh&ocirc;ng.</li>\n <li>Kiểm thử hồi quy chủ yếu li&ecirc;n quan đến kiểm thử bảo tr&igrave;.</li>\n</ul>', '100', NULL, NULL, NULL, 1, NULL, '1s4.3.2'),
(13, 'assignment', 'Trong quá trình phát triển phần mềm không thể tránh khỏi phát sinh thứ gọi là lỗi phần mềm. Theo bạn, lỗi phần mềm xuất hiện khi nào? Hãy phân biệt rõ sự khác nhau của các thuật ngữ bug, defect, failure và error trong phần mềm?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n<ul>\n <li>Liệt k&ecirc; một số v&iacute; dụ v&agrave; trường hợp ph&aacute;t sinh lỗi phần mềm.</li>\n <li>Ph&acirc;n biệt r&otilde; &yacute; nghĩa, trường hợp sử dụng của c&aacute;c thuật ngữ bug, defect, failure v&agrave; error.</li>\n</ul>', '100', NULL, NULL, NULL, 1, NULL, '1s5.2.4'),
(14, 'assignment', '<p>Trong mô hình thác nước của quy trình phát triển phần mềm bao gồm 6 giai đoạn: phân tích yêu cầu, thiết kế, xây dựng, kiểm thử, triển khai và bảo trì hệ thống. </p>\n<p>Hãy cho biết bảo trì phần mềm là gì? Có nhiệm vụ gì trong phát triển phần mềm? Tại sao cần bảo trì phần mềm định kì?</p>', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>N&ecirc;u được kh&aacute;i niệm bảo tr&igrave; phần mềm l&agrave; điều chỉnh c&aacute;c lỗi m&agrave; chưa được ph&aacute;t hiện trong giai đoạn x&acirc;y dựng hoặc trong qu&aacute; tr&igrave;nh sử dụng phần mềm c&oacute; nhiều thay đổi, cần n&acirc;ng cấp t&iacute;nh năng sử dụng v&agrave; sự an to&agrave;n khi vận h&agrave;nh của phần mềm.</li>\n <li>N&ecirc;u được nhiệm vụ của bảo tr&igrave; trong ph&aacute;t triển phần mềm l&agrave; giữ cho phần mềm được cập nhật khi m&ocirc;i trường thay đổi v&agrave; y&ecirc;u cầu người sử dụng thay đổi.</li>\n <li>Liệt k&ecirc; một số l&iacute; do cần bảo tr&igrave; phần mềm:\n <ul>\n  <li>Sử dụng phần mềm kh&ocirc;ng bị gi&aacute;n đoạn.</li>\n  <li>R&uacute;t ngắn tối đa thời gian phần mềm hỏng h&oacute;c, ngưng hoạt động, đồng thời giảm thiểu chi ph&iacute; bảo tr&igrave;.</li>\n  <li>Duy tr&igrave; độ an to&agrave;n, bảo mật của phần mềm.</li>\n </ul>\n </li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, '1s5.3.2'),
(15, 'singlechoice', 'Hoạt động “phát hiện sớm và sửa sai các khuyết điểm vừa mới phát hiện trước khi chúng trở thành các khuyết điểm chính” thuộc loại bảo trì nào?_Bảo trì sửa lỗi (Corrective maintenance)_Bảo trì thích nghi (Adaptive maintenance)_Bảo trì hoàn chỉnh (Perfective maintenance)_Bảo trì phòng tránh (Preventive maintenance)', 'Bảo trì hoàn chỉnh (Perfective maintenance)', '100', NULL, NULL, NULL, 1, NULL, '1s5.3.2'),
(16, 'singlechoice', 'Hoạt động “làm cho hệ thống tốt hơn, nhanh hơn, nhỏ hơn, tài liệu đầy đủ hơn” thuộc loại bảo trì nào?_Bảo trì sửa lỗi (Corrective maintenance)_Bảo trì thích nghi (Adaptive maintenance)_Bảo trì hoàn chỉnh (Perfective maintenance)_Bảo trì phòng tránh (Preventive maintenance)', 'Bảo trì sửa lỗi (Corrective maintenance)', '100', NULL, NULL, NULL, 1, NULL, '1s5.3.2'),
(17, 'singlechoice', 'Khi nào thì các quyết định thiếu sót xảy ra trong vòng đời dự án?_Sau khi kiểm thử chấp thuận sản phẩm diễn ra._Ngay khi thiếu sót được phát hiện ra._Bất cứ thời điểm nào trong suốt vòng đời dự án trước khi chuyển giao như đã được xác định trong kế hoạch dự án.', 'Bất cứ thời điểm nào trong suốt vòng đời dự án trước khi chuyển giao như đã được xác định trong kế hoạch dự án.', '100', NULL, NULL, NULL, 1, NULL, '1s6.3.1'),
(18, 'assignment', 'Hãy kể tên ít nhất 3 mô hình phát triển phần mềm được áp dụng phổ biến. Với mỗi mô hình hãy mô tả và phân tích, đánh giá ưu điểm/ nhược điểm và ứng dụng trong thực tiễn.', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>M&ocirc; tả, ph&acirc;n t&iacute;ch m&ocirc; h&igrave;nh, đ&aacute;nh gi&aacute; ưu/nhược điẻm của một số m&ocirc; h&igrave;nh phổ biến như: M&ocirc; h&igrave;nh th&aacute;c nước, M&ocirc; h&igrave;nh xoắn ốc, M&ocirc; h&igrave;nh gia tăng, M&ocirc; h&igrave;nh Agile,...</li>\n <li>Cho thấy t&iacute;nh ứng dụng của c&aacute;c m&ocirc; h&igrave;nh trong thực tiễn.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, '1s7.1.1'),
(19, 'assignment', 'Trong mô hình phát triển phần mềm, hãy trình bày định nghĩa, các giai đoạn có trong mô hình thác nước và mô hình xoắn ốc. So sánh 2 mô hình đó với nhau để thấy rõ ưu điểm, nhược điểm, và ứng dụng trong dự án.', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Tr&igrave;nh b&agrave;y được định nghĩa, c&aacute;c giai đoạn c&oacute; trong m&ocirc; h&igrave;nh th&aacute;c nước v&agrave; m&ocirc; h&igrave;nh xoắn ốc.&nbsp;</li>\n <li>So s&aacute;nh ưu điểm, nhược điểm, ứng dụng của 2 m&ocirc; h&igrave;nh</li>\n</ul>', '100', NULL, NULL, NULL, 1, NULL, '1s7.1.1'),
(20, 'singlechoice', 'Mô hình phát triển ứng dụng nhanh (RAD Model) là?_Một cách gọi khác của mô hình phát triển dựa vào thành phần_Một cách hữu dụng khi khách hàng không xàc định yêu cầu rõ ràng_Sự ráp nối tốc độ cao của mô hình tuần tự tuyến tính', 'Sự ráp nối tốc độ cao của mô hình tuần tự tuyến tính', '100', NULL, NULL, NULL, 1, NULL, '1s7.1.1'),
(21, 'singlechoice', 'Mô hình phát triển phần mềm xoắn ốc là gì?_Kết thúc với việc xuất xưởng sản phẩm phần mềm_Nhiều hỗn độn hơn với mô hình gia tăng_Bao gồm việc đánh giá những rủi ro phần mềm trong mỗi vòng lặp', 'Bao gồm việc đánh giá những rủi ro phần mềm trong mỗi vòng lặp', '100', NULL, NULL, NULL, 1, NULL, '1s7.1.1'),
(22, 'singlechoice', 'Những kiểm tra nghiệm thu/chấp nhận thường được đưa ra bởi?_Người phát triển_Những người dùng cuối_Nhóm kiểm thử_Những kỹ sư hệ thống', 'Những người dùng cuối', '100', NULL, NULL, NULL, 1, NULL, '1s7.8.2'),
(23, 'singlechoice', 'Tiêu chuẩn ISO-14598 đưa ra quy trình đánh giá gì?_Tính an toàn cho sản phẩm phần mềm_Tính hiệu quả của phần mềm_Tính chất lượng cho sản phẩm phần mềm_Tính khả dụng cho sản phẩm phần mềm', 'Tính chất lượng cho sản phẩm phần mềm', '100', NULL, NULL, NULL, 1, NULL, '1s8.1.1'),
(24, 'singlechoice', 'Các kế hoạch bảo đảm chất lượng phải bao gồm?_Phân tích về kiến trúc hệ thống, thiết kế và đường triển khai cho từng yêu cầu._Quản lý về thay đổi trong các yêu cầu, kiến trúc, thiết kế và mã nguồn._Các hoạt động theo dõi lỗi, kiểm tra đơn vị, đánh giá kỹ thuật, kiểm tra tích hợp và kiểm tra hệ thống._Quyết định mở rộng và nới lỏng các phần của hệ thống có thể được sử dụng cho các hệ thống khác.', 'Các hoạt động theo dõi lỗi, kiểm tra đơn vị, đánh giá kỹ thuật, kiểm tra tích hợp và kiểm tra hệ thống.', '100', NULL, NULL, NULL, 1, NULL, '1s8.1.1'),
(25, 'assignment', 'Hãy cho biết thế nào là phân tích mã tĩnh? Liệt kê một số công cụ phân tích mã tĩnh và so sánh các công cụ đó.', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Định nghĩa ph&acirc;n t&iacute;ch m&atilde; tĩnh, v&iacute; như: Ph&acirc;n t&iacute;ch m&atilde; tĩnh l&agrave; một phương ph&aacute;p được thực hiện tr&ecirc;n m&atilde; nguồn &#39;tĩnh&#39; (kh&ocirc;ng chạy) của phần mềm với c&aacute;c c&ocirc;ng cụ ph&acirc;n t&iacute;ch m&atilde; tĩnh cố gắng l&agrave;m nổi bật c&aacute;c lỗ hổng tiềm ẩn. Bộ ph&acirc;n t&iacute;ch m&atilde; tĩnh kiểm tra m&atilde; nguồn để t&igrave;m c&aacute;c lỗ hổng cụ thể cũng như việc tu&acirc;n thủ c&aacute;c ti&ecirc;u chuẩn m&atilde; h&oacute;a kh&aacute;c nhau.</li>\n <li>Liệt k&ecirc; một số c&ocirc;ng cụ/trang web như DeepSource, SonarQube,... v&agrave; so s&aacute;nh, n&ecirc;u bật l&ecirc;n được ưu nhược điểm của c&aacute;c c&ocirc;ng cụ.</li>\n</ul>', '100', NULL, NULL, NULL, 1, NULL, '1s9.5.1'),
(26, 'singlechoice', 'Nhiều đo lường hữu dụng có thể thu thập khi quan sát những người dùng tương tác với hệ thống máy tính gồm?_Thời gian cho ứng dụng_Số khiếm khuyết (defect) phần mềm_Tính tin cậy của phần mềm_Thời gian đọc tài liệu trợ giúp', 'Thời gian đọc tài liệu trợ giúp', '100', NULL, NULL, NULL, 1, NULL, '1s12.2.1'),
(27, 'singlechoice', 'Những bản câu hỏi có ý nghĩa nhất đối với những người thiết kế giao diện khi được hoàn tất bởi ai?_Khách hàng_Những lập trình viên có kinh nghiệm_Người dùng sản phẩm_Người quản lý dự án', 'Người dùng sản phẩm', '100', NULL, NULL, NULL, 1, NULL, '1s13.2.4'),
(28, 'assignment', 'Bạn đã bao giờ gặp một vấn đề nghiêm trọng trong quá trình phát triển phần mềm chưa? Nếu có hãy chia sẻ câu chuyện và cách bạn đã dùng để giải quyết vấn đề?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>M&ocirc; tả t&igrave;nh huống r&otilde; r&agrave;ng, thể hiện được t&iacute;nh nghi&ecirc;m trọng của vấn đề</li>\n <li>Thể hiện được kĩ năng ứng biến, sự b&igrave;nh tĩnh</li>\n <li>N&ecirc;u được phương ph&aacute;p giải quyết ph&ugrave; hợp v&agrave; th&ocirc;ng minh</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's14.1.4'),
(29, 'assignment', 'Hãy kể về một tình huống cụ thể trong công việc làm bạn không thoải mái và cách bạn giải quyết nó?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Cho thấy c&aacute;ch tự giải quyết vấn đề của bản th&acirc;n m&igrave;nh v&agrave; c&aacute;ch giao tiếp với những người kh&aacute;c.</li>\n</ul>', '100', NULL, NULL, NULL, 1, NULL, 's14.2.1'),
(30, 'assignment', 'Hãy chọn một công nghệ web mà bạn yêu thích và mô tả nó. Bạn có nghĩ công nghệ đó có thể chiến thắng các công nghệ web khác và tồn tại trong nhiều năm tới không?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>C&acirc;u trả lời cần đ&aacute;nh gi&aacute; được niềm đam m&ecirc; của người trả lời đối với ph&aacute;t triển web, theo d&otilde;i c&aacute;c c&ocirc;ng nghệ mới nổi, cũng như tầm nh&igrave;n chiến lược về tương lai ph&aacute;t triển web.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's14.2.5'),
(31, 'assignment', 'Giả sử bạn đang tham gia vào một dự án lớn và bạn năm giữ vài trò trưởng nhóm của một bộ phận. Không may trong quá trình làm việc nhóm bạn đã xảy ra tranh chấp mâu thuẫn, bạn sẽ xử lí như thế nào?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Thể hiện được tr&aacute;ch nhiệm khi l&agrave; một người trưởng nh&oacute;m</li>\n <li>Giữ được c&aacute;i đầu &quot;lạnh&quot; v&agrave; c&ocirc;ng tư ph&acirc;n minh</li>\n <li>Ph&acirc;n t&iacute;ch được nguy&ecirc;n nh&acirc;n đến từ đ&acirc;u</li>\n <li>Từ bỏ c&aacute;i t&ocirc;i c&aacute; nh&acirc;n v&agrave; lắng nghe c&aacute;c th&agrave;nh vi&ecirc;n trong nh&oacute;m</li>\n <li>C&ugrave;ng những th&agrave;nh vi&ecirc;n đưa ra giải ph&aacute;p v&agrave; lựa chọn xử l&iacute;</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.1.8'),
(32, 'assignment', 'Có ý kiến cho rằng: \"Các kỹ sư phần mềm thường đưa ra các ước tính dự án hoàn toàn sai lệch.\". Bạn nghĩ thế nào về ý kiến vừa nêu? Hãy cho biết làm thế nào để bạn đưa ra ước tính trong dự án?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Đưa ra c&aacute;ch ước t&iacute;nh dự &aacute;n để biết mức độ ch&iacute;nh x&aacute;c của ch&uacute;ng.</li>\n <li>Cho thấy sự kỳ vọng v&agrave; tầm nh&igrave;n thực tế về những g&igrave; sẽ cần để ho&agrave;n th&agrave;nh một dự &aacute;n.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's14.4.3'),
(33, 'singlechoice', 'Điều gì sau đây cần để xây dựng một ước tính chi phí dự án chi tiết_Kế hoạch quản lý_Các yêu cầu nguồn lực_Quy định dự án_Kế hoạch chi phí', 'Các yêu cầu nguồn lực', '100', NULL, NULL, NULL, 1, NULL, 's14.4.3'),
(34, 'assignment', 'Bạn đã bao giờ phát hiện và giải quyết vấn đề ngay từ khi nó mới chớm phát triển chưa?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Đối với câu hỏi này, người trả lời cần biết xác định, đánh giá và phân tích các vấn đề hay tình huống phát sinh ngoài ý muốn trong công việc hoặc cuộc sống để đưa ra những giải pháp xử lý tối ưu nhất.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's14.2.1'),
(35, 'assignment', 'Theo bạn một kỹ sư phần mềm cần có những kĩ năng nào? Làm thế nào để người đó giữ cho các kỹ năng của mình luôn sắc bén và cập nhật?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Một kỹ sư phần mềm cần phải nắm bắt được những thay đổi xảy ra trong ngành và giữ cho các kỹ năng của họ luôn cập nhật các công nghệ mới và đang phát triển.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's14.5.4'),
(36, 'assignment', 'Hãy cho biết mục tiêu ngắn hạn và dài hạn về nghề nghiệp của bạn là gì? Làm thế nào để bạn đạt được mục tiêu đã đề ra?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Ch&uacute; &yacute; văn phong, c&acirc;u từ sử dụng</li>\n <li>Xem x&eacute;t c&aacute;c mục ti&ecirc;u, kế hoạch được đặt ra c&oacute; thực tế hay kh&ocirc;ng</li>\n <li>C&aacute;ch nh&igrave;n nhận t&iacute;ch cực hay ti&ecirc;u cực với mục ti&ecirc;u</li>\n <li>Thể hiện được quyết t&acirc;m, &yacute; ch&iacute; theo đuổi mục ti&ecirc;u</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's14.4.3'),
(37, 'assignment', 'Mô tả một lỗi khó mà bạn được giao nhiệm vụ sửa trong một ứng dụng lớn. Làm thế nào bạn gỡ lỗi vấn đề đó?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>X&aacute;c định đ&uacute;ng vấn đề</li>\n <li>Th&aacute;i độ b&igrave;nh tĩnh</li>\n <li>Học hỏi kinh nghiệm từ giải quyết lỗi</li>\n <li>T&igrave;m kiếm sự gi&uacute;p đỡ</li>\n <li>Xử l&iacute; căng thẳng v&agrave; &aacute;p lực tốt.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's14.2.1'),
(38, 'assignment', 'Bạn sẽ giải thích thuật ngữ API như thế nào với một người không phải là dân kỹ thuật?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Giải th&iacute;ch được định nghĩa v&agrave; c&aacute;ch hoạt động của API.</li>\n <li>Đưa ra một v&iacute; dụ về c&aacute;ch &aacute;p dụng quy tr&igrave;nh kỹ thuật, thuật ngữ hoặc hệ thống m&agrave; họ c&oacute; thể đ&atilde; quen thuộc hoặc hữu &iacute;ch.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.2.2'),
(39, 'assignment', 'Giả sử bạn đang tham gia một dự án phát triển. Tại một thời điểm, nhóm của bạn gặp lỗi ứng dụng là tình huống khẩn cấp \"diễn tập chữa cháy\". Bạn và nhóm của bạn sẽ làm việc cùng nhau hiệu quả như thế nào trong tình huống đó?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Cho thấy giao tiếp là một trong những yếu tố quan trọng nhất.</li>\n <li>Cho thấy thái độ nghiêm túc trong công việc.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.1.8'),
(40, 'assignment', 'Giả sử bạn là trưởng dự án trong một dự án phát triển. Theo bạn, làm cách nào để đảm bảo nhóm của mình làm việc cùng nhau để hoàn thành đúng thời hạn?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Cho thấy cách ứng xử khôn ngoan để vừa có thể thống nhất ý kiến, vừa không gây mất lòng đối phương.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.1.8'),
(41, 'assignment', 'Gặp đồng nghiệp có quan điểm trái ngược mình, bạn sẽ xử lý như thế nào?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Cho thấy giao tiếp là một trong những yếu tố quan trọng nhất để làm việc nhóm cùng nhau. Ngoài ra không thiếu những yếu tố khác như trung thực, có trách nhiệm,...</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.1.7'),
(42, 'assignment', 'Bạn sẽ làm gì nếu gặp vấn đề khó giải quyết trong công việc?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Thể hiện được kỹ năng giải quyết vấn đề (Problem solving) trong c&ocirc;ng việc.</li>\n <li>Thể hiện được mặt t&iacute;ch cực v&agrave; sự gan dạ/đối đầu với thử th&aacute;ch.</li>\n <li>Nhận thấy ưu điểm/nhược điểm v&agrave; b&agrave;i học của bản th&acirc;n.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.3.7'),
(43, 'assignment', 'Hãy cho biết bug là gì? Bạn sẽ phản ứng thế nào khi bạn là Developer và nhận được báo cáo những bug vô lí từ Tester?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Giải th&iacute;ch được bug l&agrave; lỗi phần mềm.</li>\n <li>Thể hiện mối quan hệ giữa Developer v&agrave; Tester</li>\n <li>Thể hiện được th&aacute;i độ b&igrave;nh tĩnh, kh&ocirc;ng th&ugrave; hằn</li>\n <li>Thể hiện tinh thần hợp t&aacute;c</li>\n <li>Ph&acirc;n t&iacute;ch v&agrave; l&agrave;m r&otilde; nguy&ecirc;n nh&acirc;n bug lỗi với Tester</li>\n <li>C&aacute;ch tiếp nhận/từ chối nhẹ nh&agrave;ng</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.2.4'),
(44, 'assignment', 'Hãy cho biết công việc hiện tại và các kỳ vọng thách thức sẽ đến với bạn trong công việc?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Thể hiện r&otilde; vị tr&iacute; v&agrave; khả năng trong c&ocirc;ng việc hiện tại.</li>\n <li>Cho thấy mong muốn th&aacute;ch thức đến với bản th&acirc;n sẽ cao hơn khả năng hiện tại.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.3.5'),
(45, 'assignment', 'Hãy chia sẻ về một bài thuyết trình thành công của bạn và lí do khiến bạn cảm thấy tự hào về việc đó?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Tr&igrave;nh b&agrave;y c&acirc;u chuyện r&otilde; r&agrave;ng</li>\n <li>Thể hiện được kĩ năng giao tiếp với người nghe</li>\n <li>Thể hiện kĩ năng khi n&oacute;i về một vấn đề</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.1.7'),
(46, 'assignment', 'Hãy kể về những thử thách hay khó khăn bạn từng đối mặt và cách bạn vượt qua? (Đưa ra một tình huống cụ thể và chỉ ra cách bạn đã tìm được giải pháp cho vấn đề)', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>T&igrave;nh huống r&otilde; r&agrave;ng (ngữ cảnh, nhiệm vụ, h&agrave;nh động, kết quả)&nbsp;</li>\n <li>C&aacute;ch phản ứng, đối mặt</li>\n <li>Th&aacute;i độ ki&ecirc;n cường v&agrave; vượt qua nghịch cảnh</li>\n <li>Kỹ năng giao tiếp, giải quyết vấn đề</li>\n <li>Kinh nghiệm v&agrave; b&agrave;i học đạt được</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.3.7'),
(47, 'assignment', 'Bạn đã bao giờ gặp nhiều khó khăn trong công việc và dẫn đến áp lực không? Hãy kể về nó và cho thấy cách bạn vượt qua nó.', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Giữ vững định hướng c&ocirc;ng việc v&agrave; nguồn động lực l&agrave;m việc</li>\n <li>Ki&ecirc;n tr&igrave; v&agrave; đưa ra c&aacute;c phương &aacute;n giải quyết c&ugrave;ng đồng đội</li>\n <li>Kh&ocirc;ng ngại h&agrave;nh động v&agrave; t&igrave;m kiếm sự gi&uacute;p đỡ</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.3.7'),
(48, 'assignment', 'Hãy cho biết cách bạn quản lý thời gian trong ngày để làm việc?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>C&aacute;ch quản l&yacute; thời gian cần được sắp xếp khoa học</li>\n <li>X&aacute;c định mức độ hiệu quả trong c&ocirc;ng việc</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.3.13'),
(49, 'assignment', 'Hãy kể về công việc hiện tại và cho biết cách bạn duy trì niềm đam mê trong công việc?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Tr&igrave;nh b&agrave;y vị tr&iacute; v&agrave; vai tr&ograve; trong c&ocirc;ng việc</li>\n <li>Tr&igrave;nh b&agrave;y được c&aacute;ch duy tr&igrave; ngọn lửa đam m&ecirc;</li>\n <li>Cho thấy sự ki&ecirc;n tr&igrave; v&agrave; theo đuổi đam m&ecirc;</li>\n <li>&nbsp;Giữ vững định hướng c&ocirc;ng việc v&agrave; nguồn động lực l&agrave;m việc</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.3.11'),
(50, 'assignment', '<p>Hãy kể về thành công lớn nhất và thất bại lớn nhất trong công việc của bạn?</p>\n\n<p><em>(Sự thành công sẽ cho thấy được đạo đức nghề nghiệp, tác phong cũng như cách bạn gặt hái thành công ra sao; Sự thất bại sẽ cho thấy được cách bạn đối diện và vượt qua những tình huống đầy thử thách như thế nào.)</em></p>', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Đối với c&acirc;u trả lời về sự th&agrave;nh c&ocirc;ng:\n <ul>\n  <li>Th&aacute;i độ thể hiện t&agrave;i năng tự tin/ki&ecirc;u căng/ngạo mạn/nh&uacute;n nhường/kh&uacute;m n&uacute;m,...</li>\n  <li>Sự tạo ra gi&aacute; trị trong c&ocirc;ng việc</li>\n  <li>Những th&agrave;nh tựu đạt được</li>\n  <li>Đạo đức nghề nghiệp, t&aacute;c phong gặt h&aacute;i</li>\n </ul>\n </li>\n <li>Đối với c&acirc;u trả lời về sự thất bại:\n <ul>\n  <li>Th&aacute;i độ thể hiện thật th&agrave;/tự tin/chuyển đổi ti&ecirc;u cực th&agrave;nh t&iacute;ch cực</li>\n  <li>Khả năng giải quyết c&ocirc;ng việc</li>\n </ul>\n </li>\n <li>Ngo&agrave;i ra cần c&acirc;n nhắc đến:\n <ul>\n  <li>Từ ngữ, giọng điệu diễn đạt</li>\n  <li>Kinh nghiệm v&agrave; b&agrave;i học r&uacute;t ra được</li>\n  <li>T&iacute;nh thực tiễn của c&acirc;u chuyện</li>\n </ul>\n </li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.3.2'),
(51, 'assignment', 'Hãy cho biết những điểm mạnh và điểm yếu trong công việc của bạn?', '<p><strong>Thời gian trả lời cho c&acirc;u n&agrave;y l&agrave;: </strong>tối đa 90 ph&uacute;t</p>\n\n<p><strong>Gợi &yacute; trả lời:</strong></p>\n\n<ul>\n <li>Đối với c&acirc;u trả lời về điểm mạnh, người trả lời cần n&ecirc;u được những điểm gắn liền với vị tr&iacute; m&agrave; họ mong muốn ứng tuyển v&agrave; thể hiện điểm mạnh ấy bằng c&aacute;ch n&ecirc;u v&iacute; dụ thực hiện ở c&ocirc;ng ty trước.</li>\n <li>Đối với c&acirc;u trả lời về điểm yếu, người trả lời kh&ocirc;ng n&ecirc;n liệt k&ecirc; c&aacute;c điểm yếu của m&igrave;nh m&agrave; n&ecirc;n n&ecirc;u một v&agrave;i điểm yếu nhưng tiềm ẩn trong đ&oacute; l&agrave; những điểm mạnh.</li>\n</ul>\n', '100', NULL, NULL, NULL, 1, NULL, 's15.3.2');

-- --------------------------------------------------------

--
-- Table structure for table `ratesolution`
--

CREATE TABLE `ratesolution` (
  `ratesolutionid` int(11) NOT NULL,
  `ifpshashcontent` varchar(250) DEFAULT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `editdate` datetime(6) DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `accountid_id` int(11) DEFAULT NULL,
  `solutionid_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `resultid` int(11) NOT NULL,
  `ifpshashcontent` varchar(250) DEFAULT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `editdate` datetime(6) DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `accountid_id` int(11) DEFAULT NULL,
  `solutionid_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skillid` int(11) NOT NULL,
  `keyname` varchar(250) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `editdate` datetime(6) DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `keynameskillarea_id` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`skillid`, `keyname`, `name`, `description`, `createdate`, `editdate`, `isenable`, `note`, `keynameskillarea_id`) VALUES
(1, 's1.1', 'Làm rõ yêu cầu phần mềm', NULL, NULL, NULL, 1, NULL, 's1'),
(2, 's1.2', 'Phân tích yêu cầu phần mềm', NULL, NULL, NULL, 1, NULL, 's1'),
(3, 's1.3', 'Đặc tả yêu cầu phần mềm', NULL, NULL, NULL, 1, NULL, 's1'),
(4, 's1.4', 'Xác minh và xác thực yêu cầu phần mềm', NULL, NULL, NULL, 1, NULL, 's1'),
(5, 's1.5', 'Quản lí qui trình và sản phẩm', NULL, NULL, NULL, 1, NULL, 's1'),
(6, 's2.1', 'Lập cơ sở thiết kế phần mềm', NULL, NULL, NULL, 1, NULL, 's2'),
(7, 's2.2', 'Lập chiến lược và phương pháp thiết kế phần mềm', NULL, NULL, NULL, 1, NULL, 's2'),
(8, 's2.3', 'Thiết kế kiến trúc phần mềm', NULL, NULL, NULL, 1, NULL, 's2'),
(9, 's2.4', 'Phân tích và đánh giá chất lượng thiết kế phần mềm', NULL, NULL, NULL, 1, NULL, 's2'),
(10, 's3.1', 'Lập kế hoạch xây dựng phần mềm', NULL, NULL, NULL, 1, NULL, 's3'),
(11, 's3.2', 'Quản lí xây dựng phần mềm', NULL, NULL, NULL, 1, NULL, 's3'),
(12, 's3.3', 'Thiết kế chi tiết và viết mã', NULL, NULL, NULL, 1, NULL, 's3'),
(13, 's3.4', 'Gỡ lỗi và kiểm thử', NULL, NULL, NULL, 1, NULL, 's3'),
(14, 's3.5', 'Tích hợp và cộng tác', NULL, NULL, NULL, 1, NULL, 's3'),
(15, 's4.1', 'Lập kế hoạch kiểm thử phần mềm', NULL, NULL, NULL, 1, NULL, 's4'),
(16, 's4.2', 'Lập cơ sở hạ tầng kiểm thử phần mềm', NULL, NULL, NULL, 1, NULL, 's4'),
(17, 's4.3', 'Thực hiện các kĩ thuật kiểm thử phần mềm', NULL, NULL, NULL, 1, NULL, 's4'),
(18, 's4.4', 'Đo lường và theo dõi lỗi trong kiểm thử phần mềm', NULL, NULL, NULL, 1, NULL, 's4'),
(19, 's5.1', 'Chuyển đổi phần mềm', NULL, NULL, NULL, 1, NULL, 's5'),
(20, 's5.2', 'Hỗ trợ phần mềm', NULL, NULL, NULL, 1, NULL, 's5'),
(21, 's5.3', 'Bảo trì phần mềm', NULL, NULL, NULL, 1, NULL, 's5'),
(22, 's6.1', 'Triển khai vòng đời phát triển phần mềm', NULL, NULL, NULL, 1, NULL, 's6'),
(23, 's6.2', 'Xác định và điều chỉnh phần mềm', NULL, NULL, NULL, 1, NULL, 's6'),
(24, 's6.3', 'Triển khai và quản lí qui trình', NULL, NULL, NULL, 1, NULL, 's6'),
(25, 's6.4', 'Đánh giá và cải tiến qui trình', NULL, NULL, NULL, 1, NULL, 's6'),
(26, 's7.1', 'Lập mô hình vòng đời phát triển hệ thống', NULL, NULL, NULL, 1, NULL, 's7'),
(27, 's7.2', 'Định nghĩa khái niệm', NULL, NULL, NULL, 1, NULL, 's7'),
(28, 's7.3', 'Lập các yêu cầu kĩ thuật hệ thống', NULL, NULL, NULL, 1, NULL, 's7'),
(29, 's7.4', 'Thiết kế hệ thống', NULL, NULL, NULL, 1, NULL, 's7'),
(30, 's7.5', 'Phân bổ yêu cầu', NULL, NULL, NULL, 1, NULL, 's7'),
(31, 's7.6', 'Kĩ thuật thành phần', NULL, NULL, NULL, 1, NULL, 's7'),
(32, 's7.7', 'Tích hợp và xác minh hệ thống', NULL, NULL, NULL, 1, NULL, 's7'),
(33, 's7.8', 'Xác thực và triển khai hệ thống', NULL, NULL, NULL, 1, NULL, 's7'),
(34, 's7.9', 'Lập kế hoạch duy trì hệ thống', NULL, NULL, NULL, 1, NULL, 's7'),
(35, 's8.1', 'Quản lí chất lượng phần mềm', NULL, NULL, NULL, 1, NULL, 's8'),
(36, 's8.2', 'Đánh giá', NULL, NULL, NULL, 1, NULL, 's8'),
(37, 's8.3', 'Kiểm tra độc lập', NULL, NULL, NULL, 1, NULL, 's8'),
(38, 's8.4', 'Kiểm soát thống kê', NULL, NULL, NULL, 1, NULL, 's8'),
(39, 's9.1', 'Yêu cầu', NULL, NULL, NULL, 1, NULL, 's9'),
(40, 's9.2', 'Thiết kế', NULL, NULL, NULL, 1, NULL, 's9'),
(41, 's9.3', 'Xây dựng', NULL, NULL, NULL, 1, NULL, 's9'),
(42, 's9.4', 'Qui trình', NULL, NULL, NULL, 1, NULL, 's9'),
(43, 's9.5', 'Chất lượng', NULL, NULL, NULL, 1, NULL, 's9'),
(44, 's10.1', 'Yêu cầu', NULL, NULL, NULL, 1, NULL, 's10'),
(45, 's10.2', 'Thiết kế', NULL, NULL, NULL, 1, NULL, 's10'),
(46, 's10.3', 'Xây dựng', NULL, NULL, NULL, 1, NULL, 's10'),
(47, 's10.4', 'Kiểm thử', NULL, NULL, NULL, 1, NULL, 's10'),
(48, 's10.5', 'qui trình', NULL, NULL, NULL, 1, NULL, 's10'),
(49, 's10.6', 'Chất lượng', NULL, NULL, NULL, 1, NULL, 's10'),
(50, 's11.1', 'Lập kế hoạch quản lí cấu hình phần mềm', NULL, NULL, NULL, 1, NULL, 's11'),
(51, 's11.2', 'Thực hiện quản lí cấu hình phần mềm', NULL, NULL, NULL, 1, NULL, 's11'),
(52, 's11.3', 'Quản lí các bản phát hành phần mềm', NULL, NULL, NULL, 1, NULL, 's11'),
(53, 's12.1', 'Lập kế hoạch về qui trình đo lường', NULL, NULL, NULL, 1, NULL, 's12'),
(54, 's12.2', 'Thực hiện qui trình đo lường', NULL, NULL, NULL, 1, NULL, 's12'),
(55, 's13.1', 'Yêu cầu', NULL, NULL, NULL, 1, NULL, 's13'),
(56, 's13.2', 'Thiết kế phong cách tương tác', NULL, NULL, NULL, 1, NULL, 's13'),
(57, 's13.3', 'Thiết kế trực quan', NULL, NULL, NULL, 1, NULL, 's13'),
(58, 's13.4', 'Kiểm tra và đánh giá khả năng sử dụng', NULL, NULL, NULL, 1, NULL, 's13'),
(59, 's13.5', 'Khả năng tiếp cận', NULL, NULL, NULL, 1, NULL, 's13'),
(60, 's14.1', 'Sáng tạo', 'Là tìm ra cái mới, cách giải quyết mới và có giá trị. Nó được đặc trưng bởi trí tưởng tượng, sau đó biến những suy nghĩ đó thành hiện thực. Bất kì sự sáng tạo nào cũng bị hạn chế bởi yêu cầu của sản phẩm. Sự sáng tạo nằm ở việc xác định quĩ đạo của chính sản phẩm.', NULL, NULL, 1, NULL, 's14'),
(61, 's14.2', 'Dám nghĩ dám làm/Sự gan dạ', 'Dám đưa ra quan điểm cũng như những ý kiến riêng của mình', NULL, NULL, 1, NULL, 's14'),
(62, 's14.3', 'Tích hợp các quan điểm', 'Việc tích hợp các quan điểm đa dạng cung cấp một cái nhìn thực tế chính xác và đầy đủ hơn, cho phép đưa ra các quyết định sáng suốt hơn và hướng đến mục đích phát triển tốt hơn.', NULL, NULL, 1, NULL, 's14'),
(63, 's14.4', 'Dự báo', 'Là hành động tính toán hoặc dự đoán trước một số sự kiện trong tương lai, thường là kết quả của việc phân tích dữ liệu có sẵn.', NULL, NULL, 1, NULL, 's14'),
(64, 's14.5', 'Quản lí sự thay đổi', 'Là khả năng thích ứng và làm việc hiệu quả với các tình huống khác nhau và đối mặt với sự thay đổi.', NULL, NULL, 1, NULL, 's14'),
(65, 's15.1', 'Các thuộc tính thuộc về tình cảm', 'Là khả năng quản lí cảm xúc của cá nhân, liên quan đến nhận thức của bản thân về giá trị của nhiệm vụ và cảm giác đạt được thành tựu khi hoàn thành nhiệm vụ.', NULL, NULL, 1, NULL, 's15'),
(66, 's15.2', 'Các năng lực thuộc về kĩ năng liên quan đến các mối quan hệ và giao tiếp giữa các cá nhân', 'Là khả năng của cá nhân trong việc ứng phó với người khác thông qua giao tiếp xã hội và tương tác trong những điều kiện thuận lợi, không thuận lợi.', NULL, NULL, 1, NULL, 's15'),
(67, 's15.3', 'Các năng lực cá nhân', 'Là tố chất hay những khả năng thiên phú của mỗi cá nhân có được. Các năng lực cá nhân này sẽ giúp cho mỗi cá nhân có được những kiến thức tốt hơn, thái độ tốt hơn và những kĩ năng hoàn thiện hơn trong giai đoạn học tập và làm việc sau này.', NULL, NULL, 1, NULL, 's15');

-- --------------------------------------------------------

--
-- Table structure for table `skillarea`
--

CREATE TABLE `skillarea` (
  `skillareaid` int(11) NOT NULL,
  `keyname` varchar(250) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `typeskill` varchar(250) DEFAULT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `editdate` datetime(6) DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `careerid_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `skillarea`
--

INSERT INTO `skillarea` (`skillareaid`, `keyname`, `name`, `description`, `typeskill`, `createdate`, `editdate`, `isenable`, `note`, `careerid_id`) VALUES
(1, 's1', 'Kĩ năng yêu cầu phần mềm', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(2, 's2', 'Kĩ năng thiết kế phần mềm', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(3, 's3', 'Kĩ năng xây dựng phần mềm ', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(4, 's4', 'Kĩ năng kiểm thử phần mềm ', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(5, 's5', 'Kĩ năng duy trì phần mềm ', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(6, 's6', 'Kĩ năng trong qui trình và vòng đời của phần mềm', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(7, 's7', 'Kĩ năng xây dựng và thiết kế hệ thống phần mềm', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(8, 's8', 'Kĩ năng chất lượng phần mềm', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(9, 's9', 'Kĩ năng bảo mật phần mềm ', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(10, 's10', 'Kĩ năng an toàn phần mềm ', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(11, 's11', 'Kĩ năng quản lí cấu hình phần mềm ', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(12, 's12', 'Kĩ năng đo lường phần mềm ', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(13, 's13', 'Kĩ năng tương tác giữa người và máy tính ', NULL, 'pro', NULL, NULL, 1, NULL, 1),
(14, 's14', 'Kĩ năng đổi mới', NULL, 'pot', NULL, NULL, 1, NULL, 1),
(15, 's15', 'Kĩ năng xã hội', NULL, 'pot', NULL, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `solution`
--

CREATE TABLE `solution` (
  `solutionid` int(11) NOT NULL,
  `typesolution` varchar(250) DEFAULT NULL,
  `ifpshashcontent` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `starttime` datetime(6) DEFAULT NULL,
  `endtime` datetime(6) DEFAULT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `editdate` datetime(6) DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `accountid_id` int(11) DEFAULT NULL,
  `questionandhintid_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountid`),
  ADD KEY `Account_userid_id_28fd44b9_fk_auth_user_id` (`userid_id`);

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activityid`),
  ADD UNIQUE KEY `keyname` (`keyname`),
  ADD KEY `Activity_competenceid_id_b5e50db0_fk_Competence_competenceid` (`competenceid_id`),
  ADD KEY `Activity_keynameskill_id_eceab14f_fk_Skill_keyname` (`keynameskill_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `career`
--
ALTER TABLE `career`
  ADD PRIMARY KEY (`careerid`);

--
-- Indexes for table `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`competenceid`),
  ADD KEY `Competence_careerid_id_df4dc94c_fk_Career_careerid` (`careerid_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `hintscale`
--
ALTER TABLE `hintscale`
  ADD PRIMARY KEY (`hintscaleid`);

--
-- Indexes for table `questionandhint`
--
ALTER TABLE `questionandhint`
  ADD PRIMARY KEY (`questionandhintid`),
  ADD KEY `QuestionAndHint_keynameactivity_id_7f27dd28_fk_Activity_keyname` (`keynameactivity_id`);

--
-- Indexes for table `ratesolution`
--
ALTER TABLE `ratesolution`
  ADD PRIMARY KEY (`ratesolutionid`),
  ADD KEY `RateSolution_accountid_id_c4c6ec2b_fk_Account_accountid` (`accountid_id`),
  ADD KEY `RateSolution_solutionid_id_bf1b569b_fk_Solution_solutionid` (`solutionid_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`resultid`),
  ADD KEY `Result_accountid_id_194bdbb1_fk_Account_accountid` (`accountid_id`),
  ADD KEY `Result_solutionid_id_a4910b80_fk_Solution_solutionid` (`solutionid_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skillid`),
  ADD UNIQUE KEY `keyname` (`keyname`),
  ADD KEY `Skill_keynameskillarea_id_40a09229_fk_SkillArea_keyname` (`keynameskillarea_id`);

--
-- Indexes for table `skillarea`
--
ALTER TABLE `skillarea`
  ADD PRIMARY KEY (`skillareaid`),
  ADD UNIQUE KEY `keyname` (`keyname`),
  ADD KEY `SkillArea_careerid_id_827fe88e_fk_Career_careerid` (`careerid_id`);

--
-- Indexes for table `solution`
--
ALTER TABLE `solution`
  ADD PRIMARY KEY (`solutionid`),
  ADD KEY `Solution_accountid_id_c05db572_fk_Account_accountid` (`accountid_id`),
  ADD KEY `Solution_questionandhintid_id_bd169334_fk_QuestionA` (`questionandhintid_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accountid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activityid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=812;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career`
--
ALTER TABLE `career`
  MODIFY `careerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `competence`
--
ALTER TABLE `competence`
  MODIFY `competenceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=952;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `hintscale`
--
ALTER TABLE `hintscale`
  MODIFY `hintscaleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questionandhint`
--
ALTER TABLE `questionandhint`
  MODIFY `questionandhintid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `ratesolution`
--
ALTER TABLE `ratesolution`
  MODIFY `ratesolutionid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `resultid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skillid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `skillarea`
--
ALTER TABLE `skillarea`
  MODIFY `skillareaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `solution`
--
ALTER TABLE `solution`
  MODIFY `solutionid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `Account_userid_id_28fd44b9_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `Activity_competenceid_id_b5e50db0_fk_Competence_competenceid` FOREIGN KEY (`competenceid_id`) REFERENCES `competence` (`competenceid`),
  ADD CONSTRAINT `Activity_keynameskill_id_eceab14f_fk_Skill_keyname` FOREIGN KEY (`keynameskill_id`) REFERENCES `skill` (`keyname`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `competence`
--
ALTER TABLE `competence`
  ADD CONSTRAINT `Competence_careerid_id_df4dc94c_fk_Career_careerid` FOREIGN KEY (`careerid_id`) REFERENCES `career` (`careerid`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `questionandhint`
--
ALTER TABLE `questionandhint`
  ADD CONSTRAINT `QuestionAndHint_keynameactivity_id_7f27dd28_fk_Activity_keyname` FOREIGN KEY (`keynameactivity_id`) REFERENCES `activity` (`keyname`);

--
-- Constraints for table `ratesolution`
--
ALTER TABLE `ratesolution`
  ADD CONSTRAINT `RateSolution_accountid_id_c4c6ec2b_fk_Account_accountid` FOREIGN KEY (`accountid_id`) REFERENCES `account` (`accountid`),
  ADD CONSTRAINT `RateSolution_solutionid_id_bf1b569b_fk_Solution_solutionid` FOREIGN KEY (`solutionid_id`) REFERENCES `solution` (`solutionid`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `Result_accountid_id_194bdbb1_fk_Account_accountid` FOREIGN KEY (`accountid_id`) REFERENCES `account` (`accountid`),
  ADD CONSTRAINT `Result_solutionid_id_a4910b80_fk_Solution_solutionid` FOREIGN KEY (`solutionid_id`) REFERENCES `solution` (`solutionid`);

--
-- Constraints for table `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `Skill_keynameskillarea_id_40a09229_fk_SkillArea_keyname` FOREIGN KEY (`keynameskillarea_id`) REFERENCES `skillarea` (`keyname`);

--
-- Constraints for table `skillarea`
--
ALTER TABLE `skillarea`
  ADD CONSTRAINT `SkillArea_careerid_id_827fe88e_fk_Career_careerid` FOREIGN KEY (`careerid_id`) REFERENCES `career` (`careerid`);

--
-- Constraints for table `solution`
--
ALTER TABLE `solution`
  ADD CONSTRAINT `Solution_accountid_id_c05db572_fk_Account_accountid` FOREIGN KEY (`accountid_id`) REFERENCES `account` (`accountid`),
  ADD CONSTRAINT `Solution_questionandhintid_id_bd169334_fk_QuestionA` FOREIGN KEY (`questionandhintid_id`) REFERENCES `questionandhint` (`questionandhintid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
