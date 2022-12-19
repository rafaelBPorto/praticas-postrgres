CREATE DATEBASE ecommerce;


CREATE TABLE "users"(
	"id" SERIAL PRIMARY KEY,
	"name" varchar(50),
	"email" TEXT UNIQUE,
	"password" TEXT
);



CREATE TABLE "products" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"price" INTEGER NOT NULL,
	"category-id" INTEGER NOT NULL REFERENCES "categories"("id"),
	"size-id" INTEGER NOT NULL REFERENCES "sizes"("id"),
	"available" BOOLEAN DEFAULT 'false'
);


CREATE TABLE "products-images"(
	"id" SERIAL PRIMARY KEY,
	"product-id" INTEGER NOT NULL REFERENCES "products"("id"),
	"url-image" TEXT NOT NULL,
	"is-main" BINARY UNIQUE DEFAULT 'false'
);


CREATE TABLE "categories" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id","name")
);


CREATE TABLE "size" (
	"id" SERIAL PRIMARY KEY,
	"size" VARCHAR(4) NOT NULL,
	CONSTRAINT "size_pk" PRIMARY KEY ("id")
);


CREATE TABLE "purchasing" (
	"id" SERIAL PRIMARY KEY,
	"user-id" INTEGER NOT NULL REFERENCES "users"("id"),
	"product-list-id" INTEGER NOT NULL REFERENCES "products-list"("id"),
	"date" DATE WITHOUT TIMEZONE NOT NULL DEFAULT NOW(),
	"deliveries-id" INTEGER NOT NULL REFERENCES "dekuveries"("id")
);


CREATE TABLE "deliveries" (
	"id" SERIAL PRIMARY KEY,
	"status-id" INTEGER NOT NULL REFERENCES "STATUS"("id"),
	"adress" TEXT NOT NULL
);


CREATE TABLE "products-list" (
	"id" SERIAL PRIMARY KEY,
	"product-id" INTEGER NOT NULL REFERENCES "products-list"("id")
);


CREATE TABLE "status" (
	"id" SERIAL PRIMARY KEY,
	"status" INTEGER NOT NULL REFERENCES "status"("id")
);



