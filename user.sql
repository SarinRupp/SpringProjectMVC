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

Date: 2015-11-18 16:04:17
*/


-- ----------------------------
-- Sequence structure for tbuser_id_seq
-- ----------------------------
DROP SEQUENCE "tbuser_id_seq";
CREATE SEQUENCE "tbuser_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 112
 CACHE 1;
SELECT setval('"public"."tbuser_id_seq"', 112, true);

-- ----------------------------
-- Sequence structure for user_role_id_seq
-- ----------------------------

CREATE SEQUENCE "user_role_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 4
 CACHE 1;
SELECT setval('"public"."user_role_id_seq"', 4, true);

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------

CREATE SEQUENCE "users_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."users_id_seq"', 3, true);

-- ----------------------------
-- Table structure for tbuser
-- ----------------------------
DROP TABLE IF EXISTS "tbuser";
CREATE TABLE "tbuser" (
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
BEGIN;
INSERT INTO "tbuser" VALUES ('1', 'Carlos', 'erat.Etiam.vestibulum@Cumsociis.edu', '31-480', '2015-09-26 00:00:00', '2016-04-22 00:00:00', 'Wade Parker');
INSERT INTO "tbuser" VALUES ('2', 'Isaac', 'parturient@adipiscinglobortisrisus.ca', '1169', '2015-07-10 04:20:22', '2015-04-28 00:24:12', 'Raymond Cotton');
INSERT INTO "tbuser" VALUES ('3', 'Alec', 'Integer@consequat.edu', '70863', '2016-10-01 17:23:19', '2016-10-30 00:38:43', 'Edan Jacobson');
INSERT INTO "tbuser" VALUES ('4', 'Bruno', 'mattis.semper@arcuvel.ca', 'D42 4MR', '2016-06-15 21:28:26', '2015-06-22 20:33:38', 'Nehru Campbell');
INSERT INTO "tbuser" VALUES ('105', 'Sarin', 'hemsarin.rupp@gmail.com', '123', '2015-11-25 00:00:00', '2015-11-12 00:00:00', 'sarin.jpg');
INSERT INTO "tbuser" VALUES ('107', 'Sarin', 'hemsarin.rupp@gmail.com', '123', '2015-11-11 00:00:00', '2015-11-11 00:00:00', 'me.jpg');
INSERT INTO "tbuser" VALUES ('109', 'dfsg', 'sarin@gmail.com', '12', '2015-11-18 00:00:00', '2015-11-18 00:00:00', 'dsfsdf');
INSERT INTO "tbuser" VALUES ('110', 'd', 'hemsarin.rupp@gmail.com', '12', '2015-11-18 00:00:00', '2015-11-04 00:00:00', 'dfdsf');
INSERT INTO "tbuser" VALUES ('111', 'dsfs', 'dsfsda2@dfsfsfsdsfsdf.com', 'dsfsdf', '2015-11-29 00:00:00', '2015-11-13 00:00:00', 'dsfdsf');
INSERT INTO "tbuser" VALUES ('112', 'fsdfs', 'sdfasdafs@gfdgdfsgdsfg.gfdgdfg', 'fdsfsdaf', '2015-11-14 00:00:00', '2015-11-04 00:00:00', 'fsdafsdf');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS "user_role";
CREATE TABLE "user_role" (
"id" int4 DEFAULT nextval('user_role_id_seq'::regclass) NOT NULL,
"username" varchar(100) COLLATE "default" NOT NULL,
"rolename" varchar(100) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO "user_role" VALUES ('1', 'user', 'ROLE_USER');
INSERT INTO "user_role" VALUES ('2', 'admin', 'ROLE_ADMIN');
INSERT INTO "user_role" VALUES ('3', 'admin', 'ROLE_ADMIN');
INSERT INTO "user_role" VALUES ('4', 'dba', 'ROLE_DBA');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
"id" int4 DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
"username" varchar(100) COLLATE "default" NOT NULL,
"password" varchar(20) COLLATE "default" NOT NULL,
"enabled" int4 DEFAULT 1
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO "users" VALUES ('2', 'admin', '2', '1');
INSERT INTO "users" VALUES ('3', 'dba', '1', '1');
INSERT INTO "users" VALUES ('1', 'user', '1', '1');
COMMIT;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "tbuser_id_seq" OWNED BY "tbuser"."id";
ALTER SEQUENCE "user_role_id_seq" OWNED BY "user_role"."id";
ALTER SEQUENCE "users_id_seq" OWNED BY "users"."id";

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "users" ADD PRIMARY KEY ("username");
