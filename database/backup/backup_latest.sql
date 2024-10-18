PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "migrations" ("id" integer primary key autoincrement not null, "migration" varchar not null, "batch" integer not null);
INSERT INTO migrations VALUES(1,'0001_01_01_000000_create_users_table',1);
INSERT INTO migrations VALUES(2,'0001_01_01_000001_create_cache_table',1);
INSERT INTO migrations VALUES(3,'0001_01_01_000002_create_jobs_table',1);
INSERT INTO migrations VALUES(4,'2024_10_13_234838_create_families_table',1);
INSERT INTO migrations VALUES(5,'2024_10_13_235122_create_family_members_table',1);
CREATE TABLE IF NOT EXISTS "users" ("id" integer primary key autoincrement not null, "name" varchar not null, "email" varchar not null, "email_verified_at" datetime, "password" varchar not null, "remember_token" varchar, "created_at" datetime, "updated_at" datetime);
CREATE TABLE IF NOT EXISTS "password_reset_tokens" ("email" varchar not null, "token" varchar not null, "created_at" datetime, primary key ("email"));
CREATE TABLE IF NOT EXISTS "sessions" ("id" varchar not null, "user_id" integer, "ip_address" varchar, "user_agent" text, "payload" text not null, "last_activity" integer not null, primary key ("id"));
INSERT INTO sessions VALUES('81FMbjFPAJNlS2VXmVedb4T1LVoNpIJ7PkLrEhEG',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOFZRbnNNMXJIVWFKNFcwUGdaZzh6Z213V1d2eExHSFJkM0JVRG95NSI7czoxNToiYXV0aDBfdHJhbnNpZW50IjtzOjIzNDoieyJjb2RlX3ZlcmlmaWVyIjoiOXlWcEJwMUVFRzN1QXlHa1lNNFVWSnAwcVJBSlBFblZSRXBMRTI4dUo2YW15eEluNmc1ZjNXYW9qTG91WVNVUkZMeXJ6NGF5aFl0cWQzaWVISlZoV29jQ0dZeVRwdVVRbTRKNHRvT1NHbDNCWnM1YXZibjFoaDh2cnN4T3IwYXQiLCJzdGF0ZSI6IjNiMTc2NjBkYTgwYTljYTQ5NzU1MGYyYWRlNjM4MjU2Iiwibm9uY2UiOiJmODlhMzEzYWNhMDkzZmUzNjdmYmI1OThiNDZjYWMxYSJ9IjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1729214566);
INSERT INTO sessions VALUES('gxErr0FH0qKdL13dfcf5GsfZ7acfNCNv9wYkYgfh',NULL,'127.0.0.1','WhatsApp/2.23.20.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoib2hnQXRlcG9uV2dDV0R5MDI3SXIxNksybWRCRGJIMU56QWNDcnRwcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly84ZWY2LTI4MDQtYjdjLTExNjYtZTcwMC03MDQ1LTkwMjgtZDMzMS02YjNmLm5ncm9rLWZyZWUuYXBwL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1729215114);
INSERT INTO sessions VALUES('TxERN0DunWhsDAdFN20uuvpHHujODaTxl5ocswQe',NULL,'127.0.0.1','WhatsApp/2.23.20.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR21HUUd1TUhHeW5DSWlVZ2xrTDVVcGp5NGV3TldGYTNJRHVEMmFkZyI7czoxNToiYXV0aDBfdHJhbnNpZW50IjtzOjIzNDoieyJjb2RlX3ZlcmlmaWVyIjoiTkZ3Y1RsQXJ5UktBU2h3TzcwOW5uSmIzWVBmU2xJbGY3WHFsRUtkRmJGVTJONGhGbE5uNDRhQW1ZQmRKd3hyNlVjN2FnZWFkVVVpc3hKZEpTbVVJR3FmY1NmMklORDREWHNiYXNsRGRVekRUT1I4SkREZ0pKTGdaUHZvQUJibjAiLCJzdGF0ZSI6ImMwMjFkNTBlMzczNWQxNTI0NDY2Y2ViNmVlMmQwNDFkIiwibm9uY2UiOiI4Mzk2NzQzMDRiNjZkNjhkYzI4ZDVmMjU4NDE5MjA2YyJ9IjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo3MToiaHR0cDovLzhlZjYtMjgwNC1iN2MtMTE2Ni1lNzAwLTcwNDUtOTAyOC1kMzMxLTZiM2Yubmdyb2stZnJlZS5hcHAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1729215118);
INSERT INTO sessions VALUES('WwWNgVYewbyBqvLFJq8EmIDQbRzzfCC7chvPSIf7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiR2t1d3JZY2xzMUVkQXZkdWMwREFnbFJGQUd1TFRmeENoRFlRR0MzayI7czoxNToiYXV0aDBfdHJhbnNpZW50IjtzOjIzNDoieyJjb2RlX3ZlcmlmaWVyIjoiS1g3TUo0eXpXVlZWWEo5cUpaVkNFT1dPSjVWeDJNSTF6WFRoTVFNWkVrMUo4b2kyeENvTEh3dEVlMXB2eDh2UXJsY1lJZjhTQTE3MjR6WnhkOW53QTh4NUNMOXJBT1M0enVRZk43TlBZSHdpZTc3SUh2b1BNdldXc3F2SjBkQkUiLCJzdGF0ZSI6ImMxMDM0MWYxMmVlNDE3NGUwZDMyMDA5YmY3NmM3NzdjIiwibm9uY2UiOiJjNGYxNDAxOTM1NjUzMWQ2NWQyNDE5Y2ZjN2RhMWQ3YyJ9IjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo3NToiaHR0cDovLzhlZjYtMjgwNC1iN2MtMTE2Ni1lNzAwLTcwNDUtOTAyOC1kMzMxLTZiM2Yubmdyb2stZnJlZS5hcHAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNjU6Imh0dHA6Ly84ZWY2LTI4MDQtYjdjLTExNjYtZTcwMC03MDQ1LTkwMjgtZDMzMS02YjNmLm5ncm9rLWZyZWUuYXBwL2Rhc2hib2FyZD9jb2RlPU10SDR6T2JGNVM4Z3lrYVdXN1RValBNUFExdThEb3BOdmZOSTFieVZtYURFVSZzdGF0ZT00NzUwZjYyNjZlM2VmYjQzMGYxY2Y4NTYyZmQzZTMxMyI7fX0=',1729215582);
INSERT INTO sessions VALUES('Giq2Puk6gwgSHMRzXXcvslISeDYYSeHQ3kQcW7Yh',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTzVwZGFuSGR6T3hoOG4weEtBb3dPSlBUOTZRbUs1NzFkMnFrQVowciI7czoxNToiYXV0aDBfdHJhbnNpZW50IjtzOjIzNDoieyJjb2RlX3ZlcmlmaWVyIjoiT09LWk5qd1ljdWpDejB0TFRNWElObzhINmpOOTBwSU4zWExYSlV2Z2xacUhrUElkcE1NT2VSbHQ3VUdWRFFFS1R2Tk9jRDNxTXRwQW5JVVN2WkhLMlVrUkh3TDhBRm5EZ1NDNWJhMnVmaXVrRHBhMndXbUtLOWtTR1FobUpIVEYiLCJzdGF0ZSI6ImNlMzk2NTMzOGQ1NDgzMjQzNjM2ZDI5NmU0ZDIwNzhhIiwibm9uY2UiOiI0NjViM2MwOWZjZDk4Nzk1NzA3MDg2NmI1ZTIyMDhmYyJ9IjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoxNjU6Imh0dHA6Ly84ZWY2LTI4MDQtYjdjLTExNjYtZTcwMC03MDQ1LTkwMjgtZDMzMS02YjNmLm5ncm9rLWZyZWUuYXBwL2Rhc2hib2FyZD9jb2RlPUVWVnZZc0dua1RJM3NBejFNZVN6Q0t5NkloajQxdEtKblVyWlVwSXNjRkZfUCZzdGF0ZT1jZTM5NjUzMzhkNTQ4MzI0MzYzNmQyOTZlNGQyMDc4YSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1729215503);
INSERT INTO sessions VALUES('oJmtzWZhx6S6VAN7oVfy5U0iLyuzX0qmLz3NGwIg',NULL,'127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN2dEQjV1UlhBSExSYXlWSVNoUjdlc3NJbFVKa0Npb0FkaXd4QVZKdiI7czoxNToiYXV0aDBfdHJhbnNpZW50IjtzOjIzNDoieyJjb2RlX3ZlcmlmaWVyIjoia3ByVFVkajBnc0QwTmtWOGxOb0w0dnU1V2lWdkJKMUVIRE9EMEdnRnBHYUN5ZWc3emJNQmd1VEN3elFDSGFZQ2g3T1RCWk04YmlJWWNxVXZjVVdpY1dTM1FIUTNMUHE5SzRiY3RIMWxmVk45RlhWd0xQUnVWUnNWaXFQRG5ocEkiLCJzdGF0ZSI6IjIxM2RhYmMxZWM3YzkxZDExZWJmYzdkNjVmYjE3NmJkIiwibm9uY2UiOiJjMTI5NjJkMDMyNTA3OGJiMDYyNTBlMWYyNjZlMDFiMSJ9IjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxMjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXNoYm9hcmQ/Y29kZT1aNjllVHA3YXNFSUxSVHFRQzlPR0VCWEgyU1lXSmR6NlN0ZDdTWW1OSDhIRFomc3RhdGU9YmE5YjdiMTc4ZGQ0ZDYxMjNkNDE2Nzc3Y2U2ODdiYTIiO319',1729215578);
CREATE TABLE IF NOT EXISTS "cache" ("key" varchar not null, "value" text not null, "expiration" integer not null, primary key ("key"));
CREATE TABLE IF NOT EXISTS "cache_locks" ("key" varchar not null, "owner" varchar not null, "expiration" integer not null, primary key ("key"));
CREATE TABLE IF NOT EXISTS "jobs" ("id" integer primary key autoincrement not null, "queue" varchar not null, "payload" text not null, "attempts" integer not null, "reserved_at" integer, "available_at" integer not null, "created_at" integer not null);
CREATE TABLE IF NOT EXISTS "job_batches" ("id" varchar not null, "name" varchar not null, "total_jobs" integer not null, "pending_jobs" integer not null, "failed_jobs" integer not null, "failed_job_ids" text not null, "options" text, "cancelled_at" integer, "created_at" integer not null, "finished_at" integer, primary key ("id"));
CREATE TABLE IF NOT EXISTS "failed_jobs" ("id" integer primary key autoincrement not null, "uuid" varchar not null, "connection" text not null, "queue" text not null, "payload" text not null, "exception" text not null, "failed_at" datetime not null default CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS "families" ("id" integer primary key autoincrement not null, "name" varchar not null, "created_at" datetime, "updated_at" datetime);
INSERT INTO families VALUES(2,'Dona Milene - Ryan','2024-10-16 23:32:49','2024-10-17 00:21:46');
INSERT INTO families VALUES(3,'Vitor Dangelo - Ryan','2024-10-16 23:34:00','2024-10-17 00:21:59');
INSERT INTO families VALUES(4,'Lorraine Olegário - Ryan','2024-10-16 23:34:20','2024-10-17 00:22:09');
INSERT INTO families VALUES(5,'Felipe DOK - Ryan','2024-10-17 00:00:05','2024-10-17 00:32:43');
INSERT INTO families VALUES(6,'Tio Geraldo mangela - Ryan','2024-10-17 00:00:29','2024-10-17 00:32:51');
INSERT INTO families VALUES(7,'Sonia e Maguila - Ryan','2024-10-17 00:00:52','2024-10-17 00:32:59');
INSERT INTO families VALUES(8,'Maria do Ditinho - Ryan','2024-10-17 00:01:25','2024-10-17 00:32:35');
INSERT INTO families VALUES(9,'Lidiane - Letícia','2024-10-17 00:09:29','2024-10-17 00:24:58');
INSERT INTO families VALUES(10,'Família Dinho - Ryan','2024-10-17 00:18:09','2024-10-17 00:21:38');
INSERT INTO families VALUES(11,'Tia Fatinha - Ryan','2024-10-17 00:19:42','2024-10-17 00:19:42');
INSERT INTO families VALUES(12,'Joelma - Letícia','2024-10-17 00:26:29','2024-10-17 00:26:29');
INSERT INTO families VALUES(14,'Zezé - Letícia','2024-10-17 00:57:40','2024-10-17 00:57:55');
INSERT INTO families VALUES(16,'Luciana - Letícia','2024-10-17 00:58:37','2024-10-17 00:58:58');
INSERT INTO families VALUES(17,'João - Letícia','2024-10-17 00:59:58','2024-10-17 00:59:58');
INSERT INTO families VALUES(18,'Cléber - Letícia','2024-10-17 01:00:47','2024-10-17 01:00:47');
INSERT INTO families VALUES(19,'Wendel - Letícia','2024-10-17 01:01:50','2024-10-17 01:02:05');
CREATE TABLE IF NOT EXISTS "members" ("id" integer primary key autoincrement not null, "name" varchar not null, "family_id" integer not null, "created_at" datetime, "updated_at" datetime, foreign key("family_id") references "families"("id") on delete cascade);
INSERT INTO members VALUES(23,'Tia Fatinha',11,'2024-10-17 00:19:42','2024-10-17 00:19:42');
INSERT INTO members VALUES(24,'Tio Domingos',11,'2024-10-17 00:19:42','2024-10-17 00:19:42');
INSERT INTO members VALUES(25,'Kennedy',11,'2024-10-17 00:19:42','2024-10-17 00:19:42');
INSERT INTO members VALUES(26,'Namorada no Kennedy',11,'2024-10-17 00:19:42','2024-10-17 00:19:42');
INSERT INTO members VALUES(27,'Dinho',10,'2024-10-17 00:21:38','2024-10-17 00:21:38');
INSERT INTO members VALUES(28,'Branca',10,'2024-10-17 00:21:38','2024-10-17 00:21:38');
INSERT INTO members VALUES(29,'Davi',10,'2024-10-17 00:21:38','2024-10-17 00:21:38');
INSERT INTO members VALUES(30,'Dona Milene',2,'2024-10-17 00:21:46','2024-10-17 00:21:46');
INSERT INTO members VALUES(31,'Vitor',3,'2024-10-17 00:21:59','2024-10-17 00:21:59');
INSERT INTO members VALUES(32,'Daniela',3,'2024-10-17 00:21:59','2024-10-17 00:21:59');
INSERT INTO members VALUES(33,'Lorraine Olegário',4,'2024-10-17 00:22:09','2024-10-17 00:22:09');
INSERT INTO members VALUES(34,'Lidiane',9,'2024-10-17 00:24:58','2024-10-17 00:24:58');
INSERT INTO members VALUES(35,'Jefim',9,'2024-10-17 00:24:58','2024-10-17 00:24:58');
INSERT INTO members VALUES(36,'Kaique',9,'2024-10-17 00:24:58','2024-10-17 00:24:58');
INSERT INTO members VALUES(37,'Sophia',9,'2024-10-17 00:24:58','2024-10-17 00:24:58');
INSERT INTO members VALUES(38,'Joelma',12,'2024-10-17 00:26:29','2024-10-17 00:26:29');
INSERT INTO members VALUES(39,'Nei',12,'2024-10-17 00:26:29','2024-10-17 00:26:29');
INSERT INTO members VALUES(40,'Livea',12,'2024-10-17 00:26:29','2024-10-17 00:26:29');
INSERT INTO members VALUES(41,'Arthur',12,'2024-10-17 00:26:29','2024-10-17 00:26:29');
INSERT INTO members VALUES(42,'Alice',12,'2024-10-17 00:26:29','2024-10-17 00:26:29');
INSERT INTO members VALUES(43,'Maria do Ditinho',8,'2024-10-17 00:32:35','2024-10-17 00:32:35');
INSERT INTO members VALUES(44,'Ditinho',8,'2024-10-17 00:32:35','2024-10-17 00:32:35');
INSERT INTO members VALUES(45,'Felipe DOK',5,'2024-10-17 00:32:43','2024-10-17 00:32:43');
INSERT INTO members VALUES(46,'Tio Geraldo',6,'2024-10-17 00:32:51','2024-10-17 00:32:51');
INSERT INTO members VALUES(47,'Tia Conceição',6,'2024-10-17 00:32:51','2024-10-17 00:32:51');
INSERT INTO members VALUES(48,'Sonia',7,'2024-10-17 00:32:59','2024-10-17 00:32:59');
INSERT INTO members VALUES(49,'Maguila',7,'2024-10-17 00:32:59','2024-10-17 00:32:59');
INSERT INTO members VALUES(54,'Zezé',14,'2024-10-17 00:57:55','2024-10-17 00:57:55');
INSERT INTO members VALUES(55,'Ana',14,'2024-10-17 00:57:55','2024-10-17 00:57:55');
INSERT INTO members VALUES(56,'Gabriel',14,'2024-10-17 00:57:55','2024-10-17 00:57:55');
INSERT INTO members VALUES(60,'Luciana',16,'2024-10-17 00:58:58','2024-10-17 00:58:58');
INSERT INTO members VALUES(61,'Eliel',16,'2024-10-17 00:58:58','2024-10-17 00:58:58');
INSERT INTO members VALUES(62,'João',17,'2024-10-17 00:59:58','2024-10-17 00:59:58');
INSERT INTO members VALUES(63,'Larissa',17,'2024-10-17 00:59:58','2024-10-17 00:59:58');
INSERT INTO members VALUES(64,'Antony',17,'2024-10-17 00:59:58','2024-10-17 00:59:58');
INSERT INTO members VALUES(65,'Filha',17,'2024-10-17 00:59:58','2024-10-17 00:59:58');
INSERT INTO members VALUES(66,'Clebinho',18,'2024-10-17 01:00:47','2024-10-17 01:00:47');
INSERT INTO members VALUES(67,'Laureni',18,'2024-10-17 01:00:47','2024-10-17 01:00:47');
INSERT INTO members VALUES(70,'Dedel',19,'2024-10-17 01:02:05','2024-10-17 01:02:05');
INSERT INTO members VALUES(71,'Kássia',19,'2024-10-17 01:02:05','2024-10-17 01:02:05');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('migrations',5);
INSERT INTO sqlite_sequence VALUES('families',19);
INSERT INTO sqlite_sequence VALUES('members',71);
CREATE UNIQUE INDEX "users_email_unique" on "users" ("email");
CREATE INDEX "sessions_user_id_index" on "sessions" ("user_id");
CREATE INDEX "sessions_last_activity_index" on "sessions" ("last_activity");
CREATE INDEX "jobs_queue_index" on "jobs" ("queue");
CREATE UNIQUE INDEX "failed_jobs_uuid_unique" on "failed_jobs" ("uuid");
COMMIT;
