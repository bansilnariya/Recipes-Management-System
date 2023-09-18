BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "home_student" (
	"id"	integer NOT NULL,
	"name"	varchar(100) NOT NULL,
	"age"	integer NOT NULL,
	"email"	varchar(254) NOT NULL,
	"address"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "home_car" (
	"id"	integer NOT NULL,
	"car_name"	varchar(500) NOT NULL,
	"speed"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "vege_receipe" (
	"id"	integer NOT NULL,
	"receipe_name"	varchar(100) NOT NULL,
	"receipe_description"	text NOT NULL,
	"receipe_image"	varchar(100) NOT NULL,
	"user_id"	integer,
	"receipe_view_count"	varchar(100) NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2023-08-17 17:27:37.463530');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2023-08-17 17:27:37.729197');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2023-08-17 17:27:37.916677');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2023-08-17 17:27:38.029414');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2023-08-17 17:27:38.115709');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2023-08-17 17:27:38.236183');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2023-08-17 17:27:38.348389');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2023-08-17 17:27:38.463289');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2023-08-17 17:27:38.583657');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2023-08-17 17:27:38.689300');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2023-08-17 17:27:38.785609');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2023-08-17 17:27:38.875787');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2023-08-17 17:27:38.971425');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2023-08-17 17:27:39.082066');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2023-08-17 17:27:39.210526');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2023-08-17 17:27:39.302101');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2023-08-17 17:27:39.405572');
INSERT INTO "django_migrations" VALUES (18,'home','0001_initial','2023-08-17 17:27:39.508755');
INSERT INTO "django_migrations" VALUES (19,'home','0002_product','2023-08-17 17:27:39.591756');
INSERT INTO "django_migrations" VALUES (20,'sessions','0001_initial','2023-08-17 17:27:39.760014');
INSERT INTO "django_migrations" VALUES (21,'home','0003_remove_student_file','2023-08-17 17:34:08.578733');
INSERT INTO "django_migrations" VALUES (22,'home','0004_car_delete_product','2023-08-18 11:22:52.437666');
INSERT INTO "django_migrations" VALUES (23,'vege','0001_initial','2023-08-18 12:27:18.756244');
INSERT INTO "django_migrations" VALUES (24,'vege','0002_receipe_user','2023-08-26 13:12:41.917533');
INSERT INTO "django_migrations" VALUES (25,'vege','0003_receipe_receipe_view_count','2023-08-30 15:26:42.107724');
INSERT INTO "django_migrations" VALUES (26,'vege','0004_remove_receipe_receipe_view_count','2023-08-30 15:37:03.533897');
INSERT INTO "django_migrations" VALUES (27,'vege','0005_receipe_receipe_view_count','2023-08-30 15:37:17.383245');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'home','student');
INSERT INTO "django_content_type" VALUES (8,'home','product');
INSERT INTO "django_content_type" VALUES (9,'home','car');
INSERT INTO "django_content_type" VALUES (10,'vege','receipe');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_student','Can add student');
INSERT INTO "auth_permission" VALUES (26,7,'change_student','Can change student');
INSERT INTO "auth_permission" VALUES (27,7,'delete_student','Can delete student');
INSERT INTO "auth_permission" VALUES (28,7,'view_student','Can view student');
INSERT INTO "auth_permission" VALUES (29,8,'add_product','Can add product');
INSERT INTO "auth_permission" VALUES (30,8,'change_product','Can change product');
INSERT INTO "auth_permission" VALUES (31,8,'delete_product','Can delete product');
INSERT INTO "auth_permission" VALUES (32,8,'view_product','Can view product');
INSERT INTO "auth_permission" VALUES (33,9,'add_car','Can add car');
INSERT INTO "auth_permission" VALUES (34,9,'change_car','Can change car');
INSERT INTO "auth_permission" VALUES (35,9,'delete_car','Can delete car');
INSERT INTO "auth_permission" VALUES (36,9,'view_car','Can view car');
INSERT INTO "auth_permission" VALUES (37,10,'add_receipe','Can add receipe');
INSERT INTO "auth_permission" VALUES (38,10,'change_receipe','Can change receipe');
INSERT INTO "auth_permission" VALUES (39,10,'delete_receipe','Can delete receipe');
INSERT INTO "auth_permission" VALUES (40,10,'view_receipe','Can view receipe');
INSERT INTO "auth_user" VALUES (0,'pbkdf2_sha256$600000$Pub0HN0VoWYBP8WM0DMStq$8C5tKV9vVhrIibZoBumBicJjd6+H8MB3/7mFsO3fc9o=',NULL,0,'nariya','nariya','',0,1,'2023-08-26 13:58:13.294341','bansil');
INSERT INTO "auth_user" VALUES (2,'','','','0001','','','','','','');
INSERT INTO "auth_user" VALUES (3,'','','','','','','','','','');
INSERT INTO "auth_user" VALUES (4,'','','','0506','','','','','','');
INSERT INTO "auth_user" VALUES (5,'','','','789','','','','','','');
INSERT INTO "auth_user" VALUES (6,'','','','78','','','','','','');
INSERT INTO "auth_user" VALUES (7,'','','','456','','','','','','');
INSERT INTO "auth_user" VALUES (8,'','','','123','','','','','','');
INSERT INTO "auth_user" VALUES (9,'','','','pqr','','','','','','');
INSERT INTO "auth_user" VALUES (10,'','','','abc','','','','','','');
INSERT INTO "auth_user" VALUES (11,'','','','xyz','','','','','','');
INSERT INTO "auth_user" VALUES (12,'pbkdf2_sha256$600000$yrVK1na1J09XdMtZmviUs8$Jpcnr3/2/Qjz4qwoRvNDCMTYzfpA22SxvSx1l6dCPF0=','2023-09-18 05:25:22.150385',0,'admin','admin','',0,1,'2023-09-18 05:11:08.912857','admin');
INSERT INTO "home_student" VALUES (1,'abc',21,'abc@gmail.com','xyz');
INSERT INTO "home_student" VALUES (2,'pqr',20,'pqr@tgmail.com','abc');
INSERT INTO "home_student" VALUES (3,'xyz',19,'xyz@gmail.com','abc');
INSERT INTO "django_session" VALUES ('7vyesjfzvm3vwwz19cifpgv3eekoq2s1','.eJxVjDsOwjAQBe_iGlneTfyjpOcM1q7t4ACypTipEHeHSCmgfTPzXiLQtpaw9byEOYmzABCn35EpPnLdSbpTvTUZW12XmeWuyIN2eW0pPy-H-3dQqJdvnXGMbNBNihgG7b1SZNE7pAzgvGarNEwejU-IrKLhUTtQA2ZjbAIj3h_hkjar:1qbNd6:mp0ghhHcwent-y8nnJtj3dfW8yIgYOZuUEx3FdGYoQc','2023-09-13 16:01:16.107044');
INSERT INTO "django_session" VALUES ('0ed0o79oay4cq0coazczkqb5sp4qzi25','.eJxVjDsOwjAQBe_iGlneTfyjpOcM1q7t4ACypTipEHeHSCmgfTPzXiLQtpaw9byEOYmzABCn35EpPnLdSbpTvTUZW12XmeWuyIN2eW0pPy-H-3dQqJdvnXGMbNBNihgG7b1SZNE7pAzgvGarNEwejU-IrKLhUTtQA2ZjbAIj3h_hkjar:1qcnR6:2GNUNUblp0ke9flt4AdcB6jAkEVV1e0ndh8q7f5UqiE','2023-09-17 13:46:44.481105');
INSERT INTO "home_car" VALUES (2,'BMW',50);
INSERT INTO "home_car" VALUES (3,'Nexon',120);
INSERT INTO "home_car" VALUES (4,'Xuv700',150);
INSERT INTO "home_car" VALUES (5,'Fourtuner',180);
INSERT INTO "home_car" VALUES (6,'Scorpio',130);
INSERT INTO "vege_receipe" VALUES (28,'SENWITCH','SENWITCH IS  A ONE TYPES OF A FAST FOOD IT TEST IS A BEST TEST...','receipe/senwitch.jpg',NULL,'1');
INSERT INTO "vege_receipe" VALUES (29,'PAV BHAJI','PAV BHAJI IS A BEST RECEIPES AND THIS TEST IS   A BETS....','receipe/pavbhaji.jpg',NULL,'1');
INSERT INTO "vege_receipe" VALUES (30,'SAMOSA','SMAOSA TEST IS A SO BEST TETS..','receipe/samosa.jpg',NULL,'1');
INSERT INTO "vege_receipe" VALUES (31,'KHAMAN','KHMAN IS A ONE KIND OF A GUJRATI ITEAMS AND IT TEST IS A GOOD...','receipe/images_EL8bNBv.jpg',NULL,'1');
INSERT INTO "vege_receipe" VALUES (32,'SURTI KHAMAN ','KHAMAN IS A BEST TEST AND GUJRATI PEOPLES FAVRITES ITEAMS....','receipe/61915645_NcTo6mC.cms',NULL,'1');
INSERT INTO "vege_receipe" VALUES (33,'FAFADA','FAFDA IS A GUJRATI FOOD','receipe/fafada_Gr0Dzjq.jpg',NULL,'1');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "vege_receipe_user_id_508ca9a4" ON "vege_receipe" (
	"user_id"
);
COMMIT;
