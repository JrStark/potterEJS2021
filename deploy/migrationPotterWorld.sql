-- Deploy potterworld:migrationPotterWorld to pg

BEGIN;


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
-- table spell
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "spell" (
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

-- CREATE TABLE IF NOT EXISTS "character" (
--     "id" SERIAL PRIMARY KEY,
--     "firstname" TEXT NOT NULL,
--     "lastname" TEXT NOT NULL,
--     "birthday" TIMESTAMP NOT NULL DEFAULT NOW(),
--     "deaththday" TIMESTAMP,
--     "surnom" TEXT NOT NULL,
--     "patronus" TEXT NOT NULL,
--     "maison" TEXT NOT NULL,
--     "school_id" INTEGER NOT NULL REFERENCES "school"("id"),
--     "blood_id" INTEGER NOT NULL REFERENCES "blood"("id"),
--     "family_id" INTEGER NOT NULL REFERENCES "family"("id"),
--     "father_name" INTEGER NOT NULL REFERENCES "character"("id"),
--     "mother_name" INTEGER NOT NULL REFERENCES "character"("id"),
--     "brother_sister" TEXT NOT NULL,
--     "cousin" TEXT NOT NULL,
--     "oncle_tante" TEXT NOT NULL,
--     "married" TEXT NOT NULL,
--     "child" TEXT NOT NULL,
--     "neveu" TEXT NOT NULL,
--     "beau_frere" TEXT NOT NULL,
--     "animal" TEXT NOT NULL,
--     "home" TEXT NOT NULL,
--     "url" TEXT NOT NULL,
--     "other_feature" TEXT NOT NULL, 
--     "job" TEXT NOT NULL,
--     "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
--     "updated_at" TIMESTAMP
-- );

CREATE TABLE public."character"
(
    id integer NOT NULL DEFAULT nextval('character_id_seq'::regclass),
    firstname text COLLATE pg_catalog."default" NOT NULL,
    lastname text COLLATE pg_catalog."default" NOT NULL,
    birthday timestamp without time zone NOT NULL DEFAULT now(),
    deaththday text COLLATE pg_catalog."default",
    surnom text COLLATE pg_catalog."default" NOT NULL,
    patronus text COLLATE pg_catalog."default" NOT NULL,
    maison text COLLATE pg_catalog."default" NOT NULL,
    school_id integer NOT NULL,
    blood_id integer NOT NULL,
    family_id integer NOT NULL,
    father_id integer NOT NULL,
    mother_id integer NOT NULL,
    brother_sister text COLLATE pg_catalog."default" NOT NULL,
    cousin text COLLATE pg_catalog."default" NOT NULL,
    oncle_tante text COLLATE pg_catalog."default" NOT NULL,
    married text COLLATE pg_catalog."default" NOT NULL,
    child text COLLATE pg_catalog."default" NOT NULL,
    neveu text COLLATE pg_catalog."default" NOT NULL,
    beau_frere text COLLATE pg_catalog."default" NOT NULL,
    animal text COLLATE pg_catalog."default" NOT NULL,
    home text COLLATE pg_catalog."default" NOT NULL,
    url text COLLATE pg_catalog."default" NOT NULL,
    other_feature text COLLATE pg_catalog."default" NOT NULL,
    job text COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone,
    lieu_naissance text COLLATE pg_catalog."default",
    why_this_name text COLLATE pg_catalog."default",
    cause_deces text COLLATE pg_catalog."default",
    other_family text COLLATE pg_catalog."default",
    father_name character varying(255) COLLATE pg_catalog."default",
    mother_name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT character_pkey PRIMARY KEY (id),
    CONSTRAINT character_blood_id_fkey FOREIGN KEY (blood_id)
        REFERENCES public.blood (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT character_family_id_fkey FOREIGN KEY (family_id)
        REFERENCES public.family (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT character_father_id_fkey FOREIGN KEY (father_id)
        REFERENCES public."character" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT character_mother_id_fkey FOREIGN KEY (mother_id)
        REFERENCES public."character" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT character_school_id_fkey FOREIGN KEY (school_id)
        REFERENCES public.school (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."character"
    OWNER to postgres;

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

COMMIT;
