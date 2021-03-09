-- Revert potterworld:appschema from pg

BEGIN;

DROP SCHEMA potterworld;

COMMIT;
