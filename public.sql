/*
 Navicat Premium Data Transfer

 Source Server         : Posgres_Render
 Source Server Type    : PostgreSQL
 Source Server Version : 150004 (150004)
 Source Catalog        : db_cinema
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150004 (150004)
 File Encoding         : 65001

 Date: 25/11/2023 21:24:37
*/


-- ----------------------------
-- Sequence structure for seat_class_sequence
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seat_class_sequence";
CREATE SEQUENCE "public"."seat_class_sequence" 
INCREMENT 50
MINVALUE  1
MAXVALUE 9223372036854775807
START 50
CACHE 1;

-- ----------------------------
-- Sequence structure for the_sequence_name
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."the_sequence_name";
CREATE SEQUENCE "public"."the_sequence_name" 
INCREMENT 50
MINVALUE  1
MAXVALUE 9223372036854775807
START 50
CACHE 1;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer";
CREATE TABLE "public"."customer" (
  "customer_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "balance" float8,
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "fullname" varchar(255) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "phone_number" varchar(255) COLLATE "pg_catalog"."default",
  "username" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO "public"."customer" VALUES ('D16BD783-99F9-4A18-A5BE-57139FB0DEC4', 5000000, 'haclovo2190@gmail.com', 'Hoàng Long Vũ', '1', '0981241241', 'longvu');
INSERT INTO "public"."customer" VALUES ('11CE67FD-45CF-4F86-BA0A-6BC0FDB49FA2', 0, 'giauten28@gmail.com', 'quangtriu', '1', '0326565781', 'trieu');
INSERT INTO "public"."customer" VALUES ('2ED090E8-9B41-4AB3-B854-759E14609681', 1000000, 'quangtrieudeptraikobaogiosai2703@gmail.com', 'quangtrieudeptraikobaogiosai', '123', '0326565781', 'quangtrieu');

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS "public"."invoice";
CREATE TABLE "public"."invoice" (
  "invoice_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "boughtdate" date,
  "customer_id" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of invoice
-- ----------------------------

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS "public"."movie";
CREATE TABLE "public"."movie" (
  "movie_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "director" varchar(255) COLLATE "pg_catalog"."default",
  "duration" time(6),
  "genre" varchar(255) COLLATE "pg_catalog"."default",
  "img" varchar(255) COLLATE "pg_catalog"."default",
  "main_actor" varchar(255) COLLATE "pg_catalog"."default",
  "title" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO "public"."movie" VALUES ('EAECA91C-85AE-4EE3-977F-34FCB6A8C98E', 'A legendary hitman who comes out of retirement to seek revenge against the men who killed his puppy, a final gift from his recently deceased wife.', 'Derek Kolstad', '02:00:00', 'Action, Tragedy', 'johnwick1.png', 'Keanu Reeves', 'John Wick 1');
INSERT INTO "public"."movie" VALUES ('D8430069-7C50-4342-81E3-48E7EEE67391', 'After returning to the criminal underworld to repay a debt, John Wick discovers that a large bounty has been put on his life.', 'Derek Kolstad', '02:00:00', 'Action, Tragedy', 'johnwick2.png', 'Keanu Reeves', 'John Wick 2');
INSERT INTO "public"."movie" VALUES ('CDDEACE3-F679-4125-9702-9922EC8954CE', 'Skilled assassin John Wick (Keanu Reeves) returns with a $14 million price tag on his head and an army of bounty-hunting killers on his trail.', 'Derek Kolstad', '02:00:00', 'Action, Tragedy', 'johnwick3.png', 'Keanu Reeves', 'John Wick 3');
INSERT INTO "public"."movie" VALUES ('5C6FCEEA-2F25-4929-BF7F-5B2F843088CB', 'John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.', 'Derek Kolstad', '02:00:00', 'Action, Tragedy', 'johnwick4.png', 'Keanu Reeves', 'John Wick 4');
INSERT INTO "public"."movie" VALUES ('4B537AD4-4EE0-4DDD-B835-AA6201773CD2', 'It is set in a world where humanity is forced to live in cities surrounded by three enormous walls that protect them from gigantic man-eating humanoids referred to as Titans.', 'Isayama Hajime', '03:00:00', 'Anime, Action, Horror, Tragedy', 'aot.png', 'Eren Yeager', 'Attack on Titan: The final season');
INSERT INTO "public"."movie" VALUES ('A7ADE191-985B-451D-ABAA-60337F5F33FB', 'Nội dung “Bến Phà Xác Sống” xoay quanh cuộc chạy trốn của nhóm người của Công (Huỳnh Đông) khỏi sự bùng phát của dịch bệnh và cố gắng chạy đến chuyến phà cuối cùng ở vùng hạ lưu sông Mekong.', 'Nguyễn Thành Nam', '02:30:00', 'Horror, Comedy', 'benphaxacsong.png', 'Huỳnh Đông', 'Bến Phà Xác Sống');
INSERT INTO "public"."movie" VALUES ('CC58B3E0-CE47-4DA2-B324-74E4C02A3528', 'Phim nói về hành trình của Công - một thầy thuốc đông y cố gắng đưa cha và con gái thoát khỏi sự truy đuổi của xác sống khi đại dịch bùng nổ. Họ thất lạc nhau trên đường chạy trốn.', 'Nhất Trung', '02:20:00', 'Horror, Comedy', 'culaoxacsong.png', 'Ốc Thanh Vân', 'Cù Lao Xác Sống');
INSERT INTO "public"."movie" VALUES ('6C40B1C6-F992-4009-97FC-8FCADFB8E57B', 'A woman, Rose, goes in search for her adopted daughter within the confines of a strange, desolate town called Silent Hill.', 'Christophe Gans', '03:00:00', 'Horror, Tragedy', 'silenthill.png', 'Sean Bean', 'Silent Hill');
INSERT INTO "public"."movie" VALUES ('94BE4423-876E-416B-8BD3-A6D98A47E385', 'When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.', 'Top gun', '03:00:00', 'Action, Adventure, Romance', 'spiderman.png', 'Tom Holland', 'Spider Man: No Way Home');
INSERT INTO "public"."movie" VALUES ('05CC596D-7987-49C0-930C-43D33A27A26C', 'The two play characters who are of different social classes. They fall in love after meeting aboard the ship, but it was not good for a rich girl to fall in love with a poor boy in 1912.', 'James Cameron', '02:00:00', 'Comedy, Romance, Tragedy', 'titanic.png', 'Leonardo DiCaprio', 'Titanic');
INSERT INTO "public"."movie" VALUES ('C24E3587-B2DA-4518-9755-922DFC94793E', 'An là một cậu bé sinh sống ở đô thành của khu vực Nam Kỳ Lục tỉnh cùng với mẹ của mình vào những năm 1920 – 1930. Ba của An là Hai Thành, một người đi theo cách mạng với mong muốn đánh đuổi thực dân Pháp ra khỏi Việt Nam.', 'Nguyễn Quang Dũng', '02:00:00', 'Document', 'datrungphuongnam.png', 'Trấn Thành', 'Đất Rừng Phương Nam');
INSERT INTO "public"."movie" VALUES ('FE40B917-C5FB-485C-9055-8E96F24A0EE5', 'Nhóm của Conan, theo lời mời của Sonoko, cũng đến đảo Hachijo để xem cá voi. Tính mạng Haibara Ai (cựu thành viên Tổ chức với mật danh Sherry) bị đe dọa, rất có thể thân phận của Haibara bị bại lộ trước Gin… ', 'Aoyama Gōshō', '03:00:00', 'Anime, Action, Detective', 'conan26.png', 'Edogawa Conan', 'Conan Movie 26: Tàu Ngầm Sắt Màu Đen');
INSERT INTO "public"."movie" VALUES ('99FCE9F2-C692-442C-92A0-A8EC3B985904', 'Nobita được nghe Dekisugi tóm tắt về Utopia của Thomas More kể về vùng đất giả tưởng mà con người sống hạnh phúc, không phải chịu đau khổ và không có xung đột, sau giờ học, cậu nhờ Doraemon tìm giúp vùng đất lý tưởng đó.', 'Fujiko F. Fujio', '03:00:00', 'Anime, Adventure, Action', 'doraemon42.png', 'Nobi Nobita', 'Doraemon Movie 42: Nobita Và Vùng Đất Lý Tưởng Trên Bầu Trời');
INSERT INTO "public"."movie" VALUES ('5C2E4B6A-4C12-4AA2-9784-E9A5F437543A', '“Hào quang rực rỡ” (The King) tái hiện cuộc đời đa sắc màu của chính mình, trải dài qua nhiều giai đoạn của nền giải trí, âm nhạc Việt Nam từ thập niên 80-90 cho đến nay.', 'Đàm Vĩnh Hưng', '03:00:00', 'Document', 'haoquangrucro.png', 'Đàm Vĩnh Hưng', 'Hào Quang Rực Rỡ');
INSERT INTO "public"."movie" VALUES ('E8DABEC0-BA7E-428D-90CA-2F6DA6C286E7', 'Mắt biếc xoay quanh mối tình đơn phương của Ngạn với Hà Lan, cô bạn gái có cặp mắt hút hồn nhưng cá tính bướng bỉnh. Một chuyện tình nhiều cung bậc, từ ngộ nghĩnh trẻ con, rồi tình yêu thuở học trò trong sáng.', 'Victor Vũ', '03:00:00', 'Romance, Comedy', 'matbiec.png', 'Trần Nghĩa', 'Mắt Biếc');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS "public"."room";
CREATE TABLE "public"."room" (
  "room_number" int4 NOT NULL,
  "max_seats" int4,
  "screen_quality" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO "public"."room" VALUES (101, 100, 'Full HD');
INSERT INTO "public"."room" VALUES (102, 100, '2K');
INSERT INTO "public"."room" VALUES (103, 100, '4K');
INSERT INTO "public"."room" VALUES (104, 100, '8K');

-- ----------------------------
-- Table structure for seatclass
-- ----------------------------
DROP TABLE IF EXISTS "public"."seatclass";
CREATE TABLE "public"."seatclass" (
  "id" int4 NOT NULL,
  "category" varchar(255) COLLATE "pg_catalog"."default",
  "factor" float8
)
;

-- ----------------------------
-- Records of seatclass
-- ----------------------------
INSERT INTO "public"."seatclass" VALUES (2, 'Standard', 1);
INSERT INTO "public"."seatclass" VALUES (3, 'VIP', 1.2);

-- ----------------------------
-- Table structure for showtime
-- ----------------------------
DROP TABLE IF EXISTS "public"."showtime";
CREATE TABLE "public"."showtime" (
  "showtime_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "show_date" date,
  "price" int4,
  "start_time" time(6),
  "movie_id" varchar(255) COLLATE "pg_catalog"."default",
  "room_number" int4
)
;

-- ----------------------------
-- Records of showtime
-- ----------------------------
INSERT INTO "public"."showtime" VALUES ('3AAA72DB-040F-4ECC-B601-1636BE557EC7', '2023-11-29', 60000, '08:00:00', '6C40B1C6-F992-4009-97FC-8FCADFB8E57B', 101);
INSERT INTO "public"."showtime" VALUES ('3505BC73-727D-48DE-8A01-B69D085F129D', '2023-11-28', 70000, '09:00:00', 'EAECA91C-85AE-4EE3-977F-34FCB6A8C98E', 101);
INSERT INTO "public"."showtime" VALUES ('E2BD3441-2F55-4A89-A500-EC25FBDC9665', '2023-11-28', 60000, '22:15:00', 'D8430069-7C50-4342-81E3-48E7EEE67391', 102);
INSERT INTO "public"."showtime" VALUES ('78D16F70-6641-41EC-84FC-A2F72B254435', '2023-11-27', 80000, '20:20:00', 'CDDEACE3-F679-4125-9702-9922EC8954CE', 102);
INSERT INTO "public"."showtime" VALUES ('3453B99A-B925-4373-912F-1B1F1CF8CC3D', '2023-11-29', 80000, '19:00:00', '5C6FCEEA-2F25-4929-BF7F-5B2F843088CB', 103);

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS "public"."ticket";
CREATE TABLE "public"."ticket" (
  "ticket_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "seat_number" int4,
  "invoice_id" varchar(255) COLLATE "pg_catalog"."default",
  "seatclass_id" int4,
  "showtime_id" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ticket
-- ----------------------------

-- ----------------------------
-- Function structure for check_showtime
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."check_showtime"();
CREATE OR REPLACE FUNCTION "public"."check_showtime"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
DECLARE
    len INTERVAL;

BEGIN
		SELECT mv.duration::INTERVAL INTO len
		FROM showtime st inner join movie mv on st.movie_id = mv.movie_id
		WHERE mv.movie_id = NEW.movie_id;
		
    IF EXISTS (
        SELECT 1 
        FROM showtime st inner join movie mv on st.movie_id = mv.movie_id
				WHERE st.show_date = NEW.show_date and st.room_number = NEW.room_number 
				AND ((NEW.start_time BETWEEN st.start_time AND st.start_time + mv.duration::INTERVAL) AND (NEW.start_time + len > st.start_time)
				OR (NEW.start_time + len BETWEEN st.start_time AND st.start_time + mv.duration::INTERVAL))
        AND id <> NEW.id
    ) THEN
        RAISE EXCEPTION 'Duplicate showtime';
    END IF;
    RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."seat_class_sequence"', 5850, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."the_sequence_name"', 5900, true);

-- ----------------------------
-- Uniques structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_username_key" UNIQUE ("username");

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("customer_id");

-- ----------------------------
-- Primary Key structure for table invoice
-- ----------------------------
ALTER TABLE "public"."invoice" ADD CONSTRAINT "invoice_pkey" PRIMARY KEY ("invoice_id");

-- ----------------------------
-- Uniques structure for table movie
-- ----------------------------
ALTER TABLE "public"."movie" ADD CONSTRAINT "movie_title_key" UNIQUE ("title");

-- ----------------------------
-- Primary Key structure for table movie
-- ----------------------------
ALTER TABLE "public"."movie" ADD CONSTRAINT "movie_pkey" PRIMARY KEY ("movie_id");

-- ----------------------------
-- Primary Key structure for table room
-- ----------------------------
ALTER TABLE "public"."room" ADD CONSTRAINT "room_pkey" PRIMARY KEY ("room_number");

-- ----------------------------
-- Primary Key structure for table seatclass
-- ----------------------------
ALTER TABLE "public"."seatclass" ADD CONSTRAINT "seatclass_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table showtime
-- ----------------------------
ALTER TABLE "public"."showtime" ADD CONSTRAINT "showtime_pkey" PRIMARY KEY ("showtime_id");

-- ----------------------------
-- Primary Key structure for table ticket
-- ----------------------------
ALTER TABLE "public"."ticket" ADD CONSTRAINT "ticket_pkey" PRIMARY KEY ("ticket_id");

-- ----------------------------
-- Foreign Keys structure for table invoice
-- ----------------------------
ALTER TABLE "public"."invoice" ADD CONSTRAINT "fk_invoice_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("customer_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table showtime
-- ----------------------------
ALTER TABLE "public"."showtime" ADD CONSTRAINT "fk_showtime_movie_id" FOREIGN KEY ("movie_id") REFERENCES "public"."movie" ("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."showtime" ADD CONSTRAINT "fk_showtime_room_number" FOREIGN KEY ("room_number") REFERENCES "public"."room" ("room_number") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ticket
-- ----------------------------
ALTER TABLE "public"."ticket" ADD CONSTRAINT "fk_ticket_invoice_id" FOREIGN KEY ("invoice_id") REFERENCES "public"."invoice" ("invoice_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ticket" ADD CONSTRAINT "fk_ticket_seatclass_id" FOREIGN KEY ("seatclass_id") REFERENCES "public"."seatclass" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ticket" ADD CONSTRAINT "fk_ticket_showtime_id" FOREIGN KEY ("showtime_id") REFERENCES "public"."showtime" ("showtime_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
