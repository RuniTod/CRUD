BEGIN;
--
-- Create model Personal
--
CREATE TABLE "base_personal" ("id" serial NOT NULL PRIMARY KEY, "fio" varchar(100) NOT NULL, "age" integer NOT NULL);
--
-- Create model TypePersonal
--
CREATE TABLE "base_typepersonal" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(100) NOT NULL, "slug" varchar(100) NOT NULL);
--
-- Create model TypeProduct
--
CREATE TABLE "base_typeproduct" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(100) NOT NULL);
--
-- Create model Product
--
CREATE TABLE "base_product" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(100) NOT NULL, "article" integer NOT NULL, "price" double precision NOT NULL, "description" text NOT NULL, "type_id" integer NOT NULL);
--
-- Create model PersonalProduct
--
CREATE TABLE "base_personalproduct" ("id" serial NOT NULL PRIMARY KEY, "person_id" integer NOT NULL, "type_product_id" integer NOT NULL);
--
-- Add field type to personal
--
ALTER TABLE "base_personal" ADD COLUMN "type_id" integer NOT NULL CONSTRAINT "base_personal_type_id_e6579cfb_fk_base_typepersonal_id" REFERENCES "base_typepersonal"("id") DEFERRABLE INITIALLY DEFERRED; SET CONSTRAINTS "base_personal_type_id_e6579cfb_fk_base_typepersonal_id" IMMEDIATE;
ALTER TABLE "base_product" ADD CONSTRAINT "base_product_type_id_a3caa5d4_fk_base_typeproduct_id" FOREIGN KEY ("type_id") REFERENCES "base_typeproduct" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "base_product_type_id_a3caa5d4" ON "base_product" ("type_id");
ALTER TABLE "base_personalproduct" ADD CONSTRAINT "base_personalproduct_person_id_24cdae3d_fk_base_personal_id" FOREIGN KEY ("person_id") REFERENCES "base_personal" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "base_personalproduct" ADD CONSTRAINT "base_personalproduct_type_product_id_b615abfe_fk_base_type" FOREIGN KEY ("type_product_id") REFERENCES "base_typeproduct" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "base_personalproduct_person_id_24cdae3d" ON "base_personalproduct" ("person_id");
CREATE INDEX "base_personalproduct_type_product_id_b615abfe" ON "base_personalproduct" ("type_product_id");
CREATE INDEX "base_personal_type_id_e6579cfb" ON "base_personal" ("type_id");
COMMIT;
