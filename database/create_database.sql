-- début de transaction
BEGIN;

--avant de créer les tables, par sécurité, on les supprime
DROP TABLE IF EXISTS "character", "organisation", "maison", "type", "family", "sort", "school", "character_has_school", "character_has_maison", "character_has_type", "character_has_organisation", "character_has_family", "character_has_friend", "friend", "blood";



-- -------------------------------
-- table friend
-- -------------------------------

CREATE TABLE IF NOT EXISTS "friend" (
     "id" SERIAL PRIMARY KEY,
    "character_name" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "blood" (
     "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- --------------------------------------------
-- table maison
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "maison" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "embleme" TEXT NULL,
	"director_list" TEXT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- --------------------------------------------
-- table organisation
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "organisation" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "description_courte" TEXT NOT NULL,
    "descritpion_longue" TEXT NULL,
    "image" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);


-- --------------------------------------------
-- table family
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "family" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);


-- --------------------------------------------
-- table type
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "type" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- --------------------------------------------
-- table sort
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "sort" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "description_courte" TEXT NOT NULL,
    "description_longue" TEXT NULL,
    "category" TEXT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- --------------------------------------------
-- table magic_school
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "school" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "descritpion_courte" TEXT NOT NULL,
    "description_longue" TEXT NOT NULL,
    "director_name" TEXT NOT NULL,
    "localisation" TEXT NOT NULL,
    "embleme" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);


-- --------------------------------------------
-- table character
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "character" (
    "id" SERIAL PRIMARY KEY,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "birthday" TIMESTAMP NOT NULL DEFAULT NOW(),
    "deaththday" TIMESTAMP,
    "surnom" TEXT NOT NULL,
    "patronus" TEXT NOT NULL,
    "maison" TEXT NOT NULL,
    "school_id" INTEGER NOT NULL REFERENCES "school"("id"),
    "blood_id" INTEGER NOT NULL REFERENCES "blood"("id"),
    "family_id" INTEGER NOT NULL REFERENCES "family"("id"),
    "father_id" INTEGER NOT NULL REFERENCES "character"("id"),
    "mother_id" INTEGER NOT NULL REFERENCES "character"("id"),
    "brother_sister" TEXT NOT NULL,
    "cousin" TEXT NOT NULL,
    "oncle_tante" TEXT NOT NULL,
    "married" TEXT NOT NULL,
    "child" TEXT NOT NULL,
    "neveu" TEXT NOT NULL,
    "beau_frere" TEXT NOT NULL,
    "animal" TEXT NOT NULL,
    "home" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "other_feature" TEXT NOT NULL, 
    "job" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);


-- --------------------------------------------
-- table character_has_school
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "character_has_school" (
    "character_id" INT REFERENCES "character"("id"),
    "school_id" INT REFERENCES "school"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("character_id", "school_id"),
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- --------------------------------------------
-- table character_has_maison
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "character_has_maison" (
    "character_id" INT REFERENCES "character"("id"),
    "school_id" INT REFERENCES "school"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("character_id", "school_id"),
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- -------------------------------
-- table character_has_type
-- -------------------------------

CREATE TABLE IF NOT EXISTS "character_has_type" (
    
    "type_id" INT REFERENCES "type"("id"),
    "character_id" INT REFERENCES "character"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("type_id", "character_id"),
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- -------------------------------
-- table character_has_organisation
-- -------------------------------

CREATE TABLE IF NOT EXISTS "character_has_organisation" (
    "character_id" INT REFERENCES "character"("id"),
    "organisation_id" INT REFERENCES "organisation"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("character_id", "organisation_id"),
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- -------------------------------
-- table character_has_family
-- -------------------------------

CREATE TABLE IF NOT EXISTS "character_has_family" (
    "character_id" INT REFERENCES "character"("id"),
    "family_id" INT REFERENCES "family"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("character_id", "family_id"),
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- -------------------------------
-- table character_has_friend
-- -------------------------------

CREATE TABLE IF NOT EXISTS "character_has_friend" (
    "character_id" INT REFERENCES "character"("id"),
    "friend_id" INT REFERENCES "friend"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("character_id", "friend_id"),
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- -------------------------------
-- table character_has_friend
-- -------------------------------

CREATE TABLE IF NOT EXISTS "school_has_maison" (
    "school_id" INT REFERENCES "school"("id"),
    "maison_id" INT REFERENCES "maison"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("school_id", "maison_id"),
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- -------------------------------
-- table character_has_family
-- -------------------------------

CREATE TABLE IF NOT EXISTS "character_has_family" (
    "character_id" INT REFERENCES "character"("id"),
    "family_id" INT REFERENCES "family"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("character_id", "family_id"),
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- -------------------------------
-- PARTIE QUIZ
-- -------------------------------






-- acune erreur, envoi, de la transaction sur le serveur PostgreSQL
COMMIT;