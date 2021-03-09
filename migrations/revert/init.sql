-- Revert potterworld:migrationPotterWorld from pg

BEGIN;

DROP TABLE IF EXISTS quiz_has_tag CASCADE;

DROP TABLE tag CASCADE;

DROP TABLE question CASCADE;

DROP TABLE quiz CASCADE;

DROP TABLE "user" CASCADE;

DROP TABLE answer CASCADE;

DROP TABLE "level" CASCADE;

DROP TABLE character_has_family CASCADE;

DROP TABLE school_has_maison CASCADE;

DROP TABLE character_has_friend CASCADE;

DROP TABLE character_has_organisation CASCADE;

DROP TABLE character_has_maison CASCADE;

DROP TABLE character_has_school CASCADE;

DROP TABLE "character" CASCADE;

DROP TABLE maison CASCADE;

DROP TABLE school CASCADE;

DROP TABLE spell CASCADE;

DROP TABLE family CASCADE;

DROP TABLE organisation CASCADE;

DROP TABLE blood CASCADE;

DROP TABLE friend CASCADE;

COMMIT;
