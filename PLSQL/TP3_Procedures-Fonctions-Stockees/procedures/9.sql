CREATE OR REPLACE PROCEDURE create_view_from_table
  (table_name IN VARCHAR2)
IS
  script VARCHAR2(255);
BEGIN
  script := 'CREATE OR REPLACE VIEW Vue_' || table_name ||
            ' AS SELECT * FROM ' || UPPER(table_name);
  EXECUTE IMMEDIATE script;
END;
/

ACCEPT table_name PROMPT 'Entrez le nom de la table : ';
EXECUTE create_view_from_table('&table_name');
