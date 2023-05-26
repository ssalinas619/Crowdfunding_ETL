-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/dVPG3x
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "campaign" (
    "cf_id" int64   NOT NULL,
    "contact_id" int64   NOT NULL,
    "company_name" object   NOT NULL,
    "description" object   NOT NULL,
    "goal" float64   NOT NULL,
    "pledged" float64   NOT NULL,
    "outcome" object   NOT NULL,
    "backers_count" int64   NOT NULL,
    "country" object   NOT NULL,
    "currency" object   NOT NULL,
    "launched_date" datetime64[ns]   NOT NULL,
    "end_date" datetime64[ns]   NOT NULL,
    "category_id" object   NOT NULL,
    "subcategory_id" object   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "category" (
    "category_id" object   NOT NULL,
    "category" object   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" object   NOT NULL,
    "subcategory" object   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int64   NOT NULL,
    "first_name" object   NOT NULL,
    "last_name" object   NOT NULL,
    "email" object   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

