-- Revert potterworld:migrationPotterWorld from pg

BEGIN;

DROP TABLE quiz_has_tag;

DROP TABLE tag;

DROP TABLE question;

DROP TABLE quiz;

DROP TABLE user;

DROP TABLE answer;

DROP TABLE "level";

DROP TABLE character_has_family;

DROP TABLE school_has_maison;

DROP TABLE character_has_friend;

DROP TABLE character_has_organisation;

DROP TABLE character_has_maison;

DROP TABLE character_has_school;

DROP TABLE "character";

DROP TABLE school;

DROP TABLE spell;

DROP TABLE family;

DROP TABLE organisation;

DROP TABLE maison;

DROP TABLE blood;

DROP TABLE friend;

COMMIT;
