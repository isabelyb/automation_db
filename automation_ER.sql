
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

ALTER TABLE "country"
RENAME COLUMN "user_id" TO "created_by";

ALTER TABLE "country" 
ADD COLUMN "updated_by" INT NOT NULL;


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

ALTER TABLE "address"
RENAME COLUMN "user_id" TO "created_by";

ALTER TABLE "address" 
ADD COLUMN "updated_by" INT NOT NULL;



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

ALTER TABLE "applicants"
RENAME COLUMN "user_id" TO "created_by";

ALTER TABLE "applicants"
ADD COLUMN "updated_by" INT NOT NULL;
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

ALTER TABLE "templates"
RENAME COLUMN "user_id" TO "created_by";

ALTER TABLE "templates"
ADD COLUMN "updated_by" INT NOT NULL;


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

ALTER TABLE "roles"
RENAME COLUMN "user_id" TO "created_by";

ALTER TABLE "roles"
ADD COLUMN "updated_by" INT NOT NULL;


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

ALTER TABLE "skills"
RENAME COLUMN "user_id" TO "created_by";

ALTER TABLE "skills"
ADD COLUMN "updated_by" INT NOT NULL;

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

ALTER TABLE "education"
RENAME COLUMN "user_id" TO "created_by";

ALTER TABLE "education"
ADD COLUMN "updated_by" INT NOT NULL;
-- -----------------------------------------------------
-- Table "nr_components"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "nr_components" (
  "nr_components_id" INT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "user_id" INT NOT NULL,
  PRIMARY KEY ("nr_components_id"));

ALTER TABLE "nr_components"
RENAME COLUMN "user_id" TO "created_by";

ALTER TABLE "nr_components"
ADD COLUMN "updated_by" INT NOT NULL;


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

ALTER TABLE "permissions"
RENAME COLUMN "user_id" TO "created_by";

ALTER TABLE "permissions"
ADD COLUMN "updated_by" INT NOT NULL;


-- -----------------------------------------------------
-- Foreign Keys
-- -----------------------------------------------------

ALTER TABLE "city"
RENAME COLUMN "user_id" TO "created_by";

ALTER TABLE "city" 
ADD COLUMN "updated_by" INT NOT NULL;

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
  "user_id" INT REFERENCES "users" ("user_id"),
  "template_id" INT REFERENCES "templates" ("template_id"),
  CONSTRAINT "users_templates_id" PRIMARY KEY ("user_id", "template_id"));


ALTER TABLE "nr_components"
ADD COLUMN "template" INT;

ALTER TABLE "nr_components"
    ADD CONSTRAINT "nr_components_template_id" 
    FOREIGN KEY ("template")
    REFERENCES "templates"("template_id");


ALTER TABLE "sessions"
ADD COLUMN "user" INT;

ALTER TABLE "sessions"
RENAME COLUMN "user_id" TO "created_by";

ALTER TABLE "sessions"
DROP COLUMN "created_by";

ALTER TABLE "sessions"
    ADD CONSTRAINT "sessions_users" 
    FOREIGN KEY ("user")
    REFERENCES "users"("user_id");


ALTER TABLE "applicants"
ADD COLUMN "address" INT NOT NULL;

ALTER TABLE "applicants"
    ADD CONSTRAINT "applicant_address" 
    FOREIGN KEY ("address")
    REFERENCES "address"("address_id");



ALTER TABLE "address"
ADD COLUMN "city" INT NOT NULL;

ALTER TABLE "address"
    ADD CONSTRAINT "address_city" 
    FOREIGN KEY ("city")
    REFERENCES "city"("city_id");



ALTER TABLE "applicants"
ADD COLUMN "user_id" INT NOT NULL;

ALTER TABLE "applicants"
    ADD CONSTRAINT "applicant_user"
    FOREIGN KEY ("user_id")
    REFERENCES "users"("user_id");



CREATE TABLE "education_applicant" (
  "applicant_id" INT REFERENCES "applicants" ("applicant_id"),
  "education_id" INT REFERENCES "education" ("education_id"),
  CONSTRAINT "education_applicant_id" PRIMARY KEY ("applicant_id", "education_id"));


CREATE TABLE "skills_applicant" (
  "applicant_id" INT REFERENCES "applicants" ("applicant_id"),
  "skill_id" INT REFERENCES "skills" ("skill_id"),
  CONSTRAINT "skills_applicant_id" PRIMARY KEY ("applicant_id", "skill_id"));


ALTER TABLE "city"
    DROP CONSTRAINT "city_country_id";

ALTER TABLE "address"
    DROP CONSTRAINT "address_city";

DROP TABLE "city";

DROP TABLE"country";

ALTER TABLE "address"
RENAME COLUMN "city" TO "country";


CREATE TABLE IF NOT EXISTS "country" (
  "country_id" INT NOT NULL,
  "name" VARCHAR(45) NOT NULL,
  "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("country_id"));


CREATE TABLE IF NOT EXISTS "city" (
  "city_id" INT NOT NULL,
  "name" VARCHAR(45) NOT NULL,
  "updated_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "created_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("city_id"));

ALTER TABLE "city" 
ADD COLUMN "country" INT;


ALTER TABLE "city"
    ADD CONSTRAINT "city_country_id" 
    FOREIGN KEY ("country")
    REFERENCES "country"("country_id");


ALTER TABLE "address"
    ADD CONSTRAINT "address_country" 
    FOREIGN KEY ("country")
    REFERENCES "country"("country_id");