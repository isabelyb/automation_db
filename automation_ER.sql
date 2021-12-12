
-- -----------------------------------------------------
-- Table country
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "country" (
  "country_id" INT NOT NULL,
  "name" VARCHAR(45) NOT NULL,
  "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP NOT NULL,
  "user_id" INT NOT NULL,
  PRIMARY KEY ("country_id"));

-- -----------------------------------------------------
-- Table city
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "city" (
  "city_id" INT NOT NULL,
  "name" VARCHAR(45) NOT NULL,
  "updated_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "created_at" TIMESTAMP NOT NULL,
  "user_id" INT NOT NULL,
  PRIMARY KEY ("city_id"));


-- -----------------------------------------------------
-- Table address
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "address" (
  "address_id" INT NOT NULL,
  "address" VARCHAR(45) NULL,
  "postal_code" VARCHAR(45) NULL,
  "phone_number" VARCHAR(45) NULL,
  "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP NOT NULL,
  "user_id" INT NOT NULL,
  PRIMARY KEY ("address_id"));


-- -----------------------------------------------------
-- Table applicants
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "applicants" (
  "applicant_id" INT NOT NULL,
  "name" VARCHAR(45) NOT NULL,
  "last_name" VARCHAR(45) NOT NULL,
  "birthdate" VARCHAR(45) NOT NULL,
  "english_level" VARCHAR(45) NOT NULL,
  "flag_looking_job" boolean NULL,
  "location_preference" VARCHAR(45) NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "user_id" TIMESTAMP NOT NULL,
   PRIMARY KEY ("applicant_id"));


-- -----------------------------------------------------
-- Table "templates"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "templates" (
  "template_id" INT NOT NULL,
  "template_name" VARCHAR(45) NOT NULL,
  "template_type" VARCHAR(45) NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "user_id" INT NOT NULL,
  PRIMARY KEY ("template_id"));


-- -----------------------------------------------------
-- Table "roles"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "roles" (
  "idRole" INT NOT NULL,
  "role_name" VARCHAR(45) NULL,
  "role_description" VARCHAR(45) NULL,
  "role_is_deleted" boolean NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "user_id" INT NOT NULL,
  PRIMARY KEY ("idRole"));


-- -----------------------------------------------------
-- Table "users"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "users" (
  "user_id" INT NOT NULL,
  "user_name" VARCHAR(45) NOT NULL,
  "user_email" VARCHAR(45) NOT NULL,
  "user_password" VARCHAR(45) NOT NULL,
  "profile_picture" boolean NULL,
  "user_status" VARCHAR(45) NOT NULL,
  "user_is_deleted" boolean NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  PRIMARY KEY ("user_id"));


-- -----------------------------------------------------
-- Table "sessions"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "sessions" (
  "session_id" INT NOT NULL,
  "ip_address" VARCHAR(45) NOT NULL,
  "devices" VARCHAR(45) NOT NULL,
  "OS" VARCHAR(45) NOT NULL,
  "browser" VARCHAR(45) NOT NULL,
  "date_login" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "date_logout" TIMESTAMP NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "user_id" INT NOT NULL,
  PRIMARY KEY ("session_id"));


-- -----------------------------------------------------
-- Table "skills"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "skills" (
  "skill_id" INT NOT NULL,
  "skill_name" VARCHAR(45) NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "user_id" INT NOT NULL,
  PRIMARY KEY ("skill_id"));


-- -----------------------------------------------------
-- Table "education"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "education" (
  "education_id" INT NOT NULL,
  "education_level" VARCHAR(45) NULL,
  "education_area" VARCHAR(45) NULL,
  "profession" VARCHAR(45) NULL,
  "certifications" VARCHAR(45) NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "user_id" INT NOT NULL,
  PRIMARY KEY ("education_id"));


-- -----------------------------------------------------
-- Table "nr_components"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "nr_components" (
  "nr_components_id" INT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "user_id" INT NOT NULL,
  PRIMARY KEY ("nr_components_id"));


-- -----------------------------------------------------
-- Table "permissions"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "permissions" (
  "permission_id" INT NOT NULL,
  "permission_description" VARCHAR(45) NOT NULL,
  "permission_to_create" boolean NOT NULL,
  "permission_to_read" boolean NOT NULL,
  "permission_to_update" boolean NOT NULL,
  "permission_to_delete" boolean NOT NULL,
  "permission_is_deleted" boolean NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "user_id" INT NOT NULL,
  PRIMARY KEY ("permission_id"));


-- -----------------------------------------------------
-- Foreign Keys
-- -----------------------------------------------------

ALTER TABLE "city" 
ADD COLUMN "country" INT;

ALTER TABLE "city"
    ADD CONSTRAINT "city_country_id" 
    FOREIGN KEY ("country")
    REFERENCES "country"("country_id");


ALTER TABLE "roles"
RENAME COLUMN "idRole" TO "role_id";

ALTER TABLE "permissions" 
ADD COLUMN "role" INT;

ALTER TABLE "permissions"
    ADD CONSTRAINT "permissions_role_id" 
    FOREIGN KEY ("role")
    REFERENCES "roles"("role_id");



ALTER TABLE "users"
ADD COLUMN "role" INT;

ALTER TABLE "users"
    ADD CONSTRAINT "user_role_id" 
    FOREIGN KEY ("role")
    REFERENCES "roles"("role_id");



CREATE TABLE "users_templates" (
  "user" INT REFERENCES "users" ("user_id"),
  "template" INT REFERENCES "templates" ("template_id"),
  CONSTRAINT "users_templates_id" PRIMARY KEY ("user", "template"));


ALTER TABLE "nr_components"
ADD COLUMN "template" INT;

ALTER TABLE "nr_components"
    ADD CONSTRAINT "nr_components_template_id" 
    FOREIGN KEY ("template")
    REFERENCES "templates"("template_id");

