CREATE TABLE "customers"(
	"id" SERIAL PRIMARY KEY, 
	"fullName" VARCHAR(50) NOT NULL,
	"cpf" VARCHAR(11) NOT NULL,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL
);

CREATE TYPE "type-phone" AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE "customerPhones"(
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL,
	"numer"	VARCHAR(11) NOT NULL,
	"type" "type-phone" NOT NULL
);

CREATE TABLE "customerAddresses"(
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL,
	"street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" TEXT NOT NULL,
	"cityId" INTEGER NOT NULL 
);

CREATE TABLE "cities"(
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"stateId" INTEGER NOT NULL
);

CREATE TABLE "states"(
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "bankAccount"(
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL,
	"accountNumber" INTEGER NOT NULL,
	"agency" INTEGER NOT NULL,
	"openDate" DATE NOT NULL DEFAULT NOW(),
	"closeDate" DATE
);

CREATE TYPE "type-transaction" AS ENUM ('deposit', 'withdraw');
CREATE TABLE "transactions"(
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL,
	"amount" INTEGER NOT NULL,
	"type" "type-transaction" NOT NULL,
	"time" TIMESTAMP NOT NULL DEFAULT NOW(),
	"description" TEXT NOT NULL,
	"cancelled" BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE "creditCards"(
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL,
	"name" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"securityCode" INTEGER NOT NULL,
	"expirationMonth" INTEGER NOT NULL,
	"expirationYear" INTEGER NOT NULL,
	"password" TEXT NOT NULL,
	"limit" INTEGER NOT NULL
);

ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAdresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAdresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "banckAccount_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id"); 

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");


