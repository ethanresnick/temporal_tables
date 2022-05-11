SET client_min_messages TO error;

CREATE TABLE non_equality_types (json json, sys_period tstzrange);

CREATE TRIGGER versioning_trigger
BEFORE INSERT OR UPDATE OR DELETE ON non_equality_types
FOR EACH ROW EXECUTE PROCEDURE versioning('sys_period', 'non_equality_types', false);

INSERT INTO non_equality_types VALUES ('{"a":1}'::json);

UPDATE non_equality_types SET json = '{"a":2}'::json WHERE 1=1;
