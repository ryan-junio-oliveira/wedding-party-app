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
INSERT INTO sessions VALUES('4aJjFEmpf6VKzadS276eQBykrFaHsLEnqB5G2dwf',NULL,'127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoibk01MlJHSGJ6bTdnUVVPUExmWkZqQ3hmc1cweGRIWjJTbDdPOWU5RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1729121429);
INSERT INTO sessions VALUES('bQHp2wiM8jr6Lv6ongElYkD6LDrHMMqfYYMzYKuq',NULL,'127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoicWM1UU9lelZCY2VYTXRQV1BjUmIzNWFSZWtvRlpiVVJsN0tIUlUxUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8yNTA5LTI4MDQtYjdjLTExNjYtZTcwMC0yZDc3LWUyMGMtNjViZS04MWUyLm5ncm9rLWZyZWUuYXBwL2JhY2t1cC1kYXRhYmFzZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1729122600);
INSERT INTO sessions VALUES('nRmLpeCBS0cr1badeXeMH8tNONFf6dqHVt3T7GRO',NULL,'127.0.0.1','WhatsApp/2.23.20.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3d3bnRQcjVJSHIxR3c4SVJZa2M2cG9nZDdxYjBOY2RHYWhVYjZQRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8yNTA5LTI4MDQtYjdjLTExNjYtZTcwMC0yZDc3LWUyMGMtNjViZS04MWUyLm5ncm9rLWZyZWUuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1729121517);
INSERT INTO sessions VALUES('2QvvEPjBnEQ5cGxbKUreWz2ie4M8idcXma2smX1A',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiemptNWlGSVlDem9ReXZEcmx6Wm5uRlZYVTRoeEdZWFFpUlExZm50MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8yNTA5LTI4MDQtYjdjLTExNjYtZTcwMC0yZDc3LWUyMGMtNjViZS04MWUyLm5ncm9rLWZyZWUuYXBwL2ZhbWlseS9jcmVhdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1729121662);
CREATE TABLE IF NOT EXISTS "cache" ("key" varchar not null, "value" text not null, "expiration" integer not null, primary key ("key"));
CREATE TABLE IF NOT EXISTS "cache_locks" ("key" varchar not null, "owner" varchar not null, "expiration" integer not null, primary key ("key"));
CREATE TABLE IF NOT EXISTS "jobs" ("id" integer primary key autoincrement not null, "queue" varchar not null, "payload" text not null, "attempts" integer not null, "reserved_at" integer, "available_at" integer not null, "created_at" integer not null);
CREATE TABLE IF NOT EXISTS "job_batches" ("id" varchar not null, "name" varchar not null, "total_jobs" integer not null, "pending_jobs" integer not null, "failed_jobs" integer not null, "failed_job_ids" text not null, "options" text, "cancelled_at" integer, "created_at" integer not null, "finished_at" integer, primary key ("id"));
CREATE TABLE IF NOT EXISTS "failed_jobs" ("id" integer primary key autoincrement not null, "uuid" varchar not null, "connection" text not null, "queue" text not null, "payload" text not null, "exception" text not null, "failed_at" datetime not null default CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS "families" ("id" integer primary key autoincrement not null, "name" varchar not null, "created_at" datetime, "updated_at" datetime);
INSERT INTO families VALUES(2,'Dona Milene','2024-10-16 23:32:49','2024-10-16 23:32:49');
INSERT INTO families VALUES(3,'Vitor Dangelo','2024-10-16 23:34:00','2024-10-16 23:34:00');
INSERT INTO families VALUES(4,'Lorraine Olegário','2024-10-16 23:34:20','2024-10-16 23:34:20');
CREATE TABLE IF NOT EXISTS "members" ("id" integer primary key autoincrement not null, "name" varchar not null, "family_id" integer not null, "created_at" datetime, "updated_at" datetime, foreign key("family_id") references "families"("id") on delete cascade);
INSERT INTO members VALUES(5,'Dona Milene',2,'2024-10-16 23:32:49','2024-10-16 23:32:49');
INSERT INTO members VALUES(6,'Vitor',3,'2024-10-16 23:34:00','2024-10-16 23:34:00');
INSERT INTO members VALUES(7,'Daniela',3,'2024-10-16 23:34:00','2024-10-16 23:34:00');
INSERT INTO members VALUES(8,'Lorraine Olegário',4,'2024-10-16 23:34:20','2024-10-16 23:34:20');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('migrations',5);
INSERT INTO sqlite_sequence VALUES('families',4);
INSERT INTO sqlite_sequence VALUES('members',8);
CREATE UNIQUE INDEX "users_email_unique" on "users" ("email");
CREATE INDEX "sessions_user_id_index" on "sessions" ("user_id");
CREATE INDEX "sessions_last_activity_index" on "sessions" ("last_activity");
CREATE INDEX "jobs_queue_index" on "jobs" ("queue");
CREATE UNIQUE INDEX "failed_jobs_uuid_unique" on "failed_jobs" ("uuid");
COMMIT;
