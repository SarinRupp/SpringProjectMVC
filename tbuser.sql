/*
Navicat PGSQL Data Transfer

Source Server         : Spring
Source Server Version : 90303
Source Host           : localhost:5432
Source Database       : user
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90303
File Encoding         : 65001

Date: 2015-11-23 14:22:51
*/


-- ----------------------------
-- Table structure for tbuser
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbuser";
CREATE TABLE "public"."tbuser" (
"id" int4 DEFAULT nextval('tbuser_id_seq'::regclass) NOT NULL,
"username" varchar(100) COLLATE "default",
"email" varchar(100) COLLATE "default",
"password" varchar(100) COLLATE "default",
"birthdate" timestamp(6),
"registerdate" timestamp(6),
"image" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbuser
-- ----------------------------
INSERT INTO "public"."tbuser" VALUES ('1', 'Isaac', 'parturient@adipiscinglobortisrisus.ca', '1169', '2015-07-10 04:20:22', '2015-04-28 00:24:12', 'Raymond Cotton');
INSERT INTO "public"."tbuser" VALUES ('2', 'Alec', 'Integer@consequat.edu', '70863', '2016-10-01 17:23:19', '2016-10-30 00:38:43', 'Edan Jacobson');
INSERT INTO "public"."tbuser" VALUES ('3', 'Bruno', 'mattis.semper@arcuvel.ca', 'D42 4MR', '2016-06-15 21:28:26', '2015-06-22 20:33:38', 'Nehru Campbell');
INSERT INTO "public"."tbuser" VALUES ('4', 'Sarin', 'hemsarin.rupp@gmail.com', '123', '2015-11-11 00:00:00', '2015-11-11 00:00:00', 'me.jpg');
INSERT INTO "public"."tbuser" VALUES ('5', 'dfsg', 'sarin@gmail.com', '12', '2015-11-18 00:00:00', '2015-11-18 00:00:00', 'dsfsdf');
INSERT INTO "public"."tbuser" VALUES ('6', 'dsfs', 'dsfsda2@dfsfsfsdsfsdf.com', 'dsfsdf', '2015-11-29 00:00:00', '2015-11-13 00:00:00', 'dsfdsf');
INSERT INTO "public"."tbuser" VALUES ('7', 'Carlos', 'erat.Etiam.vestibulum@Cumsociis.edu', '31-480', '2015-09-26 00:00:00', '2016-04-22 00:00:00', 'Wade Parker');
INSERT INTO "public"."tbuser" VALUES ('8', 'd', 'hemsarin.rupp@gmail.com', '12', '2015-11-18 00:00:00', '2015-11-04 00:00:00', 'dfdsf');
INSERT INTO "public"."tbuser" VALUES ('10', 'Sarin', 'hemsarin.rupp@gmail.com', '123', '2015-11-25 00:00:00', '2015-11-12 00:00:00', 'sarin.jpg');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
