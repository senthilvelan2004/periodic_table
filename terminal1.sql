camper: /project$ psql --username=freecodecamp --dbname=periodic_tablepsql --username=freecodecamp --dbname=periodic_table
psql: error: connection to server at "127.0.0.1", port 5432 failed: FATAL:  database "periodic_table" does not exist
camper: /project$ psql --username=freecodecamp --dbname=periodic_table
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

periodic_table=> \d
             List of relations
 Schema |    Name    | Type  |    Owner     
--------+------------+-------+--------------
 public | elements   | table | freecodecamp
 public | properties | table | freecodecamp
(2 rows)

periodic_table=>  select * from elements;
periodic_table=> \d properties
                       Table "public.properties"
    Column     |         Type          | Collation | Nullable | Default 
---------------+-----------------------+-----------+----------+---------
 atomic_number | integer               |           | not null | 
 type          | character varying(30) |           |          | 
 weight        | numeric(9,6)          |           | not null | 
 melting_point | numeric               |           |          | 
 boiling_point | numeric               |           |          | 
Indexes:
    "properties_pkey" PRIMARY KEY, btree (atomic_number)
    "properties_atomic_number_key" UNIQUE CONSTRAINT, btree (atomic_number)

periodic_table=> \d elements
                        Table "public.elements"
    Column     |         Type          | Collation | Nullable | Default 
---------------+-----------------------+-----------+----------+---------
 atomic_number | integer               |           | not null | 
 symbol        | character varying(2)  |           |          | 
 name          | character varying(40) |           |          | 
Indexes:
    "elements_pkey" PRIMARY KEY, btree (atomic_number)
    "elements_atomic_number_key" UNIQUE CONSTRAINT, btree (atomic_number)

periodic_table=> ALTER TABLE properties RENAME weight TO atomic_mass;
ALTER TABLE
periodic_table=> \d properties
                       Table "public.properties"
    Column     |         Type          | Collation | Nullable | Default 
---------------+-----------------------+-----------+----------+---------
 atomic_number | integer               |           | not null | 
 type          | character varying(30) |           |          | 
 atomic_mass   | numeric(9,6)          |           | not null | 
 melting_point | numeric               |           |          | 
 boiling_point | numeric               |           |          | 
Indexes:
    "properties_pkey" PRIMARY KEY, btree (atomic_number)
    "properties_atomic_number_key" UNIQUE CONSTRAINT, btree (atomic_number)

periodic_table=>  ALTER TABLE properties RENAME melting_point TO melting_point_celsius;
ALTER TABLE
periodic_table=> ALTER TABLE properties RENAME boiling_point TO boilling_point_celsius;
ALTER TABLE
periodic_table=> 
periodic_table=>  \d properties
periodic_table=> ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE
periodic_table=> ALTER TABLE properties RENAME boilling_point_celsius TO boiling_point_celsius ;
ALTER TABLE
periodic_table=> ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
ALTER TABLE
periodic_table=> ALTER TABLE elements ADD UNIQUE(symbol);
ALTER TABLE
periodic_table=> ALTER TABLE elements ADD UNIQUE(name);
ALTER TABLE
periodic_table=> \d elements
                        Table "public.elements"
    Column     |         Type          | Collation | Nullable | Default 
---------------+-----------------------+-----------+----------+---------
 atomic_number | integer               |           | not null | 
 symbol        | character varying(2)  |           |          | 
 name          | character varying(40) |           |          | 
Indexes:
    "elements_pkey" PRIMARY KEY, btree (atomic_number)
    "elements_atomic_number_key" UNIQUE CONSTRAINT, btree (atomic_number)
    "elements_name_key" UNIQUE CONSTRAINT, btree (name)
    "elements_symbol_key" UNIQUE CONSTRAINT, btree (symbol)

periodic_table=> 
periodic_table=> ALTER TABLE elements ALTER COLUMN name SET NOT NULL;
ALTER TABLE
periodic_table=>  ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE
periodic_table=> ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);
ALTER TABLE
periodic_table=> CREATE TABLE types(types_id SERIAL NOT NULL);
CREATE TABLE
periodic_table=> \d types
periodic_table=> \d properties
periodic_table=> select * from properties;
periodic_table=> ALTER TABLE types ADD COLUMN type VARCHAR(20) NOT NULL;
ALTER TABLE
periodic_table=> INSERT INTO types(type) VALUES('nonmetal'),('metal'),('metalloid');
INSERT 0 3
periodic_table=> select * from types;
 types_id |   type    
----------+-----------
        1 | nonmetal
        2 | metal
        3 | metalloid
(3 rows)

periodic_table=> 
periodic_table=> ALTER TABLE types ADD PRIMARY KEY(type_id);
ERROR:  column "type_id" of relation "types" does not exist
periodic_table=> \d types
periodic_table=> ALTER TABLE types RENAME types_id TO type_id;
ALTER TABLE
periodic_table=> \d types
periodic_table=> ALTER TABLE types ADD PRIMARY KEY(type_id);
ALTER TABLE
periodic_table=> \d types
periodic_table=> ALTER TABLE properties ADD COLUMN type_id INT REFERENCES types(type_id);
ALTER TABLE
periodic_table=> select * from properties;
periodic_table=> UPDATE properties SET type_id=1 WHERE type='nonmetal';
UPDATE 5
periodic_table=> select * from properties;
periodic_table=> UPDATE properties SET type_id=2 WHERE type='metal';
UPDATE 2
periodic_table=>  UPDATE properties SET type_id=3 WHERE type='metalloid';
UPDATE 2
periodic_table=> select * from types;
 type_id |   type    
---------+-----------
       1 | nonmetal
       2 | metal
       3 | metalloid
(3 rows)

periodic_table=> select * from properties;
periodic_table=> ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL; 
ALTER TABLE
periodic_table=> 
periodic_table=> select * from elements;
periodic_table=> UPDATE elements SET symbol = 'He' WHERE symbol = 'he';
UPDATE 1
periodic_table=> UPDATE elements SET symbol = 'Li' WHERE symbol = 'li';
UPDATE 1
periodic_table=>  UPDATE elements SET symbol = 'Mt' WHERE symbol = 'mT';
UPDATE 1
periodic_table=> 
periodic_table=>  select * from properties;
periodic_table=> ALTER TABLE properties ALTER COLUMN atomic_mass SET DATA TYPE numeric(9,1);
ALTER TABLE
periodic_table=>  \d properties
periodic_table=> ALTER TABLE properties ALTER COLUMN atomic_mass SET DATA TYPE DECIMAL;
ALTER TABLE
periodic_table=> select * from properties;
periodic_table=>  ALTER TABLE properties ALTER COLUMN atomic_mass SET DATA TYPE DECIMAL(9,0);
ALTER TABLE
periodic_table=>  ALTER TABLE properties ALTER COLUMN atomic_mass SET DATA TYPE DECIMAL;
ALTER TABLE
periodic_table=>  select * from properties;
periodic_table=> UPDATE properties SET atomic_mass = 15 WHERE atomic_number = 8;
UPDATE 1
periodic_table=> INSERT INTO elements(atomic_number, symbol, name) VALUES(9, 'F', 'Fluorine');
INSERT 0 1
periodic_table=> INSERT INTO elements(atomic_number, symbol, name) VALUES(10, 'Ne', 'Neon');
INSERT 0 1
periodic_table=> INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(9, 'nonmetal', 18.998, -220, -188.1, 1);
INSERT 0 1
periodic_table=> INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(10, 'nonmetal', 20.18, -248.6, -246.1, 1);
INSERT 0 1
periodic_table=> ALTER TABLE properties DROP COLUMN type;
ALTER TABLE
periodic_table=>  select * from properties;
periodic_table=> UPDATE properties SET atomic_mass = 1.008 WHERE atomic_number=1;
UPDATE 1
periodic_table=>  select * from properties;
periodic_table=> DELETE FROM properties WHERE atomic_number=1000;
DELETE 1
periodic_table=> select * from elements;
 atomic_number | symbol |   name    
---------------+--------+-----------
             1 | H      | Hydrogen
             4 | Be     | Beryllium
             5 | B      | Boron
             6 | C      | Carbon
             7 | N      | Nitrogen
             8 | O      | Oxygen
             2 | He     | Helium
             3 | Li     | Lithium
          1000 | Mt     | moTanium
             9 | F      | Fluorine
            10 | Ne     | Neon
(11 rows)

periodic_table=> DELETE FROM elements WHERE atomic_number=1000;
DELETE 1
periodic_table=> select * from elements;
 atomic_number | symbol |   name    
---------------+--------+-----------
             1 | H      | Hydrogen
             4 | Be     | Beryllium
             5 | B      | Boron
             6 | C      | Carbon
             7 | N      | Nitrogen
             8 | O      | Oxygen
             2 | He     | Helium
             3 | Li     | Lithium
             9 | F      | Fluorine
            10 | Ne     | Neon
(10 rows)
