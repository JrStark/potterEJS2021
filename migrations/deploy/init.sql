-- Deploy potterworld:migrationPotterWorld to pg

BEGIN;


-- -------------------------------
-- table friend
-- -------------------------------

CREATE TABLE IF NOT EXISTS "friend" (
     "id" SERIAL PRIMARY KEY,
    "character_name" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "blood" (
     "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);



-- --------------------------------------------
-- table organisation
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "organisation" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "description_courte" TEXT,
    "descritpion_longue" TEXT NULL,
    "image" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);


-- --------------------------------------------
-- table family
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "family" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);


-- --------------------------------------------
-- table sort
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "spell" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "description_courte" TEXT,
    "description_longue" TEXT NULL,
    "category" TEXT NULL,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- --------------------------------------------
-- table magic_school
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "school" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "descritpion_courte" TEXT,
    "description_longue" TEXT,
    "director_name" TEXT,
    "localisation" TEXT,
    "embleme" TEXT,
    "image" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- --------------------------------------------
-- table maison
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "maison" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "creator" TEXT,
    "embleme" TEXT NULL,
	"director_list" TEXT NULL,
    "school_id" int REFERENCES school(id),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);
-- --------------------------------------------
-- table character
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "character" (
    "id" SERIAL PRIMARY KEY,
    "firstname" TEXT,
    "lastname" TEXT,
    "birthday" TIMESTAMP DEFAULT NOW(),
    "deaththday" TIMESTAMP,
    "surnom" TEXT,
    "patronus" TEXT,
    "maison" TEXT,
    "school_id" INTEGER REFERENCES "school"("id"),
    "blood_id" INTEGER REFERENCES "blood"("id"),
    "family_id" INTEGER REFERENCES "family"("id"),
    "father_id" INTEGER REFERENCES "character"("id"),
    "mother_id" INTEGER REFERENCES "character"("id"),
    "brother_sister" TEXT,
    "cousin" TEXT,
    "oncle_tante" TEXT,
    "married" TEXT,
    "child" TEXT,
    "neveu" TEXT,
    "beau_frere" TEXT,
    "animal" TEXT,
    "home" TEXT,
    "url" TEXT,
    "other_feature" TEXT, 
    "job" TEXT,
    "lieu_naissance" TEXT,
    "why_this_name" TEXT,
    "cause_deces" TEXT,
    "other_family" TEXT,
    "father_name" TEXT,
    "mother_name" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
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
    "created_at" TIMESTAMP DEFAULT NOW(),
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
    "created_at" TIMESTAMP DEFAULT NOW(),
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
    "created_at" TIMESTAMP DEFAULT NOW(),
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
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- -------------------------------
-- table school_has_maison
-- -------------------------------

CREATE TABLE IF NOT EXISTS "school_has_maison" (
    "school_id" INT REFERENCES "school"("id"),
    "maison_id" INT REFERENCES "maison"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("school_id", "maison_id"),
    "created_at" TIMESTAMP DEFAULT NOW(),
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
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);



---------------------------------------------
-- PARTIE QUIZ ET USER ----------------------
---------------------------------------------


CREATE TABLE IF NOT EXISTS "level" (

  "id" serial PRIMARY KEY,
  "name" text NOT NULL
);

-- -----------------------------------------------------
-- Table "answer"
-- -----------------------------------------------------
-- On ne peut pas référencé le champ id de la table question ici, car la table n'existe pas encore. On fera une modification à la fin du script pour ajouter la référence.
CREATE TABLE IF NOT EXISTS "answer" (
  "id" serial PRIMARY KEY,
  "description" text NOT NULL,
  "question_id" integer NOT NULL
);

-- -----------------------------------------------------
-- Table "app_user"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "user" (
  "id" serial PRIMARY KEY,
  "email" text NOT NULL,
  "password" text NOT NULL,
  "firstname" text NULL,
  "lastname" text NULL
);

-- -----------------------------------------------------
-- Table "quiz"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "quiz" (
  "id" serial PRIMARY KEY,
  "title" text NOT NULL,
  "description" text NULL,
  "user_id" integer NOT NULL REFERENCES "user" ("id")
);

-- -----------------------------------------------------
-- Table "question"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "question" (
  "id" serial PRIMARY KEY,
  "question" text NOT NULL,
  "anecdote" text NULL,
  "wiki" text NULL,
  "level_id" integer NOT NULL REFERENCES "level" ("id"),
  -- 'Good answer',
  "answer_id" integer NOT NULL REFERENCES "answer" ("id"),
  "quiz_id" integer NOT NULL REFERENCES "quiz" ("id")
);

-- -----------------------------------------------------
-- Table "tag"
CREATE TABLE IF NOT EXISTS "tag" (
  "id" serial PRIMARY KEY,
  "name" text NOT NULL
);

-- -----------------------------------------------------
-- Table "quiz_has_tag"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "quiz_has_tag" (
  "quiz_id" integer REFERENCES "quiz"("id"),
  "tag_id" integer REFERENCES "tag" ("id"),
  PRIMARY KEY ("quiz_id", "tag_id")
);

-- Maintenant on peut créer la référence vers la table question pour le champ "question_id" dans la table "answer" afin de réprésenter notre clé étrangère.
-- On remarquera ici la présence de l'instruction FOREIGN KEY qui dit explicitement que ceette colonne sert de clé étrangère faisaint référence à la colonne question de la table question
-- Lors de la création d'une table ce détail est implicite
ALTER TABLE "answer"
  ADD FOREIGN KEY ("question_id") REFERENCES "question" ("id");

COMMIT;
