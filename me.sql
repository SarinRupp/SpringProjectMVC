/*
Navicat PGSQL Data Transfer

Source Server         : Spring
Source Server Version : 90303
Source Host           : localhost:5432
Source Database       : Student
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90303
File Encoding         : 65001

Date: 2015-11-03 16:13:11
*/


-- ----------------------------
-- Sequence structure for student_id_seq
-- ----------------------------
DROP SEQUENCE "student_id_seq" cascade;
CREATE SEQUENCE "student_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 100
 CACHE 1;
SELECT setval('"public"."student_id_seq"', 100, true);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS "student" cascade;
CREATE TABLE "student" (
"id" int4 DEFAULT nextval('student_id_seq'::regclass) NOT NULL,
"first_name" varchar(255) COLLATE "default" DEFAULT NULL::character varying,
"last_name" varchar(255) COLLATE "default" DEFAULT NULL::character varying,
"classroom" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO "student" VALUES ('2', 'James', 'Alexander', 'In Aliquet Associates');
INSERT INTO "student" VALUES ('3', 'Mannix', 'Xenos', 'Netus PC');
INSERT INTO "student" VALUES ('4', 'Boris', 'Rhiannon', 'Urna Suscipit Nonummy Industries');
INSERT INTO "student" VALUES ('5', 'Nasim', 'Shellie', 'Nulla Eget Consulting');
INSERT INTO "student" VALUES ('6', 'Lewis', 'Ocean', 'Pede Associates');
INSERT INTO "student" VALUES ('7', 'Valentine', 'Quail', 'Tincidunt Adipiscing Mauris Corporation');
INSERT INTO "student" VALUES ('8', 'Akeem', 'Tamara', 'Duis Mi Company');
INSERT INTO "student" VALUES ('9', 'Jonas', 'Liberty', 'Donec Vitae Erat Ltd');
INSERT INTO "student" VALUES ('10', 'Beck', 'Helen', 'Facilisis Vitae Orci Company');
INSERT INTO "student" VALUES ('11', 'Brady', 'Samson', 'Risus Odio Auctor Consulting');
INSERT INTO "student" VALUES ('12', 'Jelani', 'Jane', 'Proin Eget Odio Industries');
INSERT INTO "student" VALUES ('13', 'Guy', 'Iris', 'Ornare PC');
INSERT INTO "student" VALUES ('14', 'Reese', 'Orson', 'Sem Semper PC');
INSERT INTO "student" VALUES ('15', 'Warren', 'Levi', 'A LLP');
INSERT INTO "student" VALUES ('16', 'Daniel', 'Margaret', 'Arcu Vestibulum Ut LLC');
INSERT INTO "student" VALUES ('17', 'Fuller', 'Lois', 'Mauris LLP');
INSERT INTO "student" VALUES ('18', 'Timothy', 'Nicole', 'Est Ltd');
INSERT INTO "student" VALUES ('19', 'Todd', 'Mikayla', 'Nullam Scelerisque Inc.');
INSERT INTO "student" VALUES ('20', 'Caleb', 'Brandon', 'Sit Amet Risus Consulting');
INSERT INTO "student" VALUES ('21', 'Hamilton', 'Signe', 'Integer Associates');
INSERT INTO "student" VALUES ('22', 'Dean', 'Lael', 'Eros Turpis Associates');
INSERT INTO "student" VALUES ('23', 'Kibo', 'Dexter', 'Erat Vivamus LLC');
INSERT INTO "student" VALUES ('24', 'Troy', 'Bree', 'Lectus Inc.');
INSERT INTO "student" VALUES ('25', 'Kieran', 'Ciaran', 'Libero Incorporated');
INSERT INTO "student" VALUES ('26', 'Len', 'Charissa', 'Convallis Limited');
INSERT INTO "student" VALUES ('27', 'Alexander', 'Laurel', 'Tempus Eu Company');
INSERT INTO "student" VALUES ('28', 'Otto', 'Deborah', 'Fames Ac Turpis Inc.');
INSERT INTO "student" VALUES ('29', 'Quinlan', 'Abra', 'Arcu Vivamus Sit Consulting');
INSERT INTO "student" VALUES ('30', 'Isaac', 'Elliott', 'In Lobortis Inc.');
INSERT INTO "student" VALUES ('31', 'Amery', 'Jameson', 'Mauris Company');
INSERT INTO "student" VALUES ('32', 'Jonah', 'Jared', 'Luctus Ut Corporation');
INSERT INTO "student" VALUES ('33', 'Paki', 'Eugenia', 'Ut Molestie Inc.');
INSERT INTO "student" VALUES ('34', 'Wesley', 'Quin', 'Nunc Sollicitudin Commodo Incorporated');
INSERT INTO "student" VALUES ('35', 'Marshall', 'Roth', 'Fusce PC');
INSERT INTO "student" VALUES ('36', 'Asher', 'Mark', 'Accumsan Inc.');
INSERT INTO "student" VALUES ('37', 'Lyle', 'Kevyn', 'Sagittis LLP');
INSERT INTO "student" VALUES ('38', 'Jack', 'Amelia', 'Molestie Consulting');
INSERT INTO "student" VALUES ('39', 'Shad', 'Yasir', 'Vestibulum Institute');
INSERT INTO "student" VALUES ('40', 'Stewart', 'Aiko', 'Quam Vel Corporation');
INSERT INTO "student" VALUES ('41', 'Cade', 'Abigail', 'Nec Mauris Blandit LLP');
INSERT INTO "student" VALUES ('42', 'Derek', 'Idona', 'Eget Ipsum Consulting');
INSERT INTO "student" VALUES ('43', 'Emmanuel', 'Karly', 'Nonummy LLP');
INSERT INTO "student" VALUES ('44', 'Theodore', 'Wynter', 'Egestas A Incorporated');
INSERT INTO "student" VALUES ('45', 'Jerome', 'Miriam', 'Congue PC');
INSERT INTO "student" VALUES ('46', 'Noah', 'Sawyer', 'Purus Mauris A Incorporated');
INSERT INTO "student" VALUES ('47', 'Denton', 'Logan', 'Enim Condimentum Eget Associates');
INSERT INTO "student" VALUES ('48', 'Quentin', 'Rae', 'Enim Incorporated');
INSERT INTO "student" VALUES ('49', 'Solomon', 'Mark', 'Ultricies Limited');
INSERT INTO "student" VALUES ('50', 'Luke', 'Kadeem', 'Cum Limited');
INSERT INTO "student" VALUES ('51', 'Harper', 'Lucius', 'Dolor Tempus Non LLP');
INSERT INTO "student" VALUES ('52', 'Xavier', 'Merrill', 'Consequat Industries');
INSERT INTO "student" VALUES ('53', 'Demetrius', 'Ruth', 'Sit Foundation');
INSERT INTO "student" VALUES ('54', 'Cruz', 'Rogan', 'Magnis Dis Company');
INSERT INTO "student" VALUES ('55', 'Nigel', 'Sheila', 'Netus Et Malesuada Inc.');
INSERT INTO "student" VALUES ('56', 'Carter', 'Cally', 'Magna Ut Tincidunt Company');
INSERT INTO "student" VALUES ('57', 'Elvis', 'Sophia', 'Sit Inc.');
INSERT INTO "student" VALUES ('58', 'Clarke', 'Eve', 'Nec Ante Blandit Institute');
INSERT INTO "student" VALUES ('59', 'Bradley', 'Michael', 'Nonummy Ac Consulting');
INSERT INTO "student" VALUES ('60', 'Mufutau', 'Ori', 'Pellentesque Corporation');
INSERT INTO "student" VALUES ('61', 'Zachery', 'Kiara', 'At Pede Company');
INSERT INTO "student" VALUES ('62', 'Drew', 'Signe', 'Eleifend Nunc Risus PC');
INSERT INTO "student" VALUES ('63', 'Damian', 'Rashad', 'Aliquam Nec Enim Limited');
INSERT INTO "student" VALUES ('64', 'Damian', 'Vivian', 'Nulla Consulting');
INSERT INTO "student" VALUES ('65', 'Amos', 'Noah', 'Magna Sed PC');
INSERT INTO "student" VALUES ('66', 'Nash', 'Remedios', 'Nisl Sem PC');
INSERT INTO "student" VALUES ('67', 'Nigel', 'Timon', 'Metus Urna Corporation');
INSERT INTO "student" VALUES ('68', 'Leo', 'Shelby', 'In LLP');
INSERT INTO "student" VALUES ('69', 'Harrison', 'Idona', 'Tortor At Ltd');
INSERT INTO "student" VALUES ('70', 'Chancellor', 'Ramona', 'Purus Nullam LLC');
INSERT INTO "student" VALUES ('71', 'Phelan', 'Evangeline', 'Adipiscing Elit LLP');
INSERT INTO "student" VALUES ('72', 'Dean', 'Akeem', 'Nulla Integer Industries');
INSERT INTO "student" VALUES ('73', 'Perry', 'Anastasia', 'In Industries');
INSERT INTO "student" VALUES ('74', 'Ignatius', 'Brynn', 'Magna Tellus Faucibus LLC');
INSERT INTO "student" VALUES ('75', 'Wallace', 'Inga', 'Phasellus Libero Mauris Corporation');
INSERT INTO "student" VALUES ('76', 'Cullen', 'Kiara', 'Molestie Dapibus Ligula Company');
INSERT INTO "student" VALUES ('77', 'Boris', 'Cassandra', 'Tellus LLP');
INSERT INTO "student" VALUES ('78', 'Ivan', 'Arden', 'Imperdiet LLC');
INSERT INTO "student" VALUES ('79', 'Harrison', 'Silas', 'Sapien Cursus Industries');
INSERT INTO "student" VALUES ('80', 'Armand', 'Lydia', 'Lacus Varius PC');
INSERT INTO "student" VALUES ('81', 'Christian', 'Eric', 'Nam PC');
INSERT INTO "student" VALUES ('82', 'Chase', 'Olivia', 'Sed Company');
INSERT INTO "student" VALUES ('83', 'Hayden', 'Palmer', 'Aliquam Erat Inc.');
INSERT INTO "student" VALUES ('84', 'Warren', 'Gray', 'Ut LLC');
INSERT INTO "student" VALUES ('85', 'Daquan', 'Cassady', 'Amet Diam Eu LLP');
INSERT INTO "student" VALUES ('86', 'Jonas', 'Gavin', 'Dignissim Maecenas LLC');
INSERT INTO "student" VALUES ('87', 'Edan', 'Mallory', 'Aliquet Vel Vulputate Foundation');
INSERT INTO "student" VALUES ('88', 'Aidan', 'Renee', 'Euismod Ac Fermentum Ltd');
INSERT INTO "student" VALUES ('89', 'Kenneth', 'Kiayada', 'Non Corp.');
INSERT INTO "student" VALUES ('90', 'Chadwick', 'Keaton', 'Imperdiet Company');
INSERT INTO "student" VALUES ('91', 'Henry', 'Mariko', 'Sollicitudin Adipiscing Ligula Industries');
INSERT INTO "student" VALUES ('92', 'Yardley', 'Winter', 'Porta Elit A Industries');
INSERT INTO "student" VALUES ('93', 'Lars', 'Kirestin', 'Dui Nec PC');
INSERT INTO "student" VALUES ('94', 'Addison', 'Beatrice', 'Semper Pretium LLP');
INSERT INTO "student" VALUES ('95', 'Wayne', 'Rowan', 'Nunc Sollicitudin Commodo Corporation');
INSERT INTO "student" VALUES ('96', 'Garrett', 'Yen', 'Egestas Consulting');
INSERT INTO "student" VALUES ('97', 'Armando', 'Montana', 'Magnis Institute');
INSERT INTO "student" VALUES ('98', 'Asher', 'India', 'Quisque Corporation');
INSERT INTO "student" VALUES ('99', 'Reese', 'Miriam', 'Fringilla Ornare Placerat Foundation');
INSERT INTO "student" VALUES ('100', 'Oleg', 'Kristen', 'Quis Diam Company');
COMMIT;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS "test";
CREATE TABLE "test" (
"id" int4 NOT NULL,
"name" varchar COLLATE "default",
"add" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of test
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "student_id_seq" OWNED BY "student"."id";

-- ----------------------------
-- Primary Key structure for table student
-- ----------------------------
ALTER TABLE "student" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table test
-- ----------------------------
ALTER TABLE "test" ADD PRIMARY KEY ("id");
